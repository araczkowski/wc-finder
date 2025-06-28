-- Fix PostGIS function to include google_place_id column
-- This script updates the get_wcs_by_distance function to return google_place_id

-- Drop and recreate the function to include google_place_id
DROP FUNCTION IF EXISTS get_wcs_by_distance(DOUBLE PRECISION, DOUBLE PRECISION, INTEGER, INTEGER);

-- Recreate the function with google_place_id included
CREATE OR REPLACE FUNCTION get_wcs_by_distance(
    user_lat DOUBLE PRECISION,
    user_lng DOUBLE PRECISION,
    page_offset INTEGER DEFAULT 0,
    page_limit INTEGER DEFAULT 5
)
RETURNS TABLE (
    id UUID,
    user_id UUID,
    created_by TEXT,
    name TEXT,
    location GEOGRAPHY,
    address TEXT,
    image_url TEXT,
    rating INTEGER,
    place_type TEXT,
    google_place_id TEXT,
    created_at TIMESTAMPTZ,
    updated_at TIMESTAMPTZ,
    distance_km DOUBLE PRECISION
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT
        w.id,
        w.user_id,
        w.created_by,
        w.name,
        w.location,
        w.address,
        w.image_url,
        w.rating,
        COALESCE(w.place_type, 'toilet'::TEXT) as place_type,
        w.google_place_id,
        w.created_at,
        w.updated_at,
        -- Calculate distance in kilometers
        ST_Distance(w.location, ST_Point(user_lng, user_lat)::GEOGRAPHY) / 1000.0 as distance_km
    FROM wcs w
    WHERE w.location IS NOT NULL
    ORDER BY w.location <-> ST_Point(user_lng, user_lat)::GEOGRAPHY
    LIMIT page_limit
    OFFSET page_offset;
END;
$$;

-- Update get_wcs_within_radius function to include google_place_id
DROP FUNCTION IF EXISTS get_wcs_within_radius(DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, INTEGER, INTEGER);

CREATE OR REPLACE FUNCTION get_wcs_within_radius(
    user_lat DOUBLE PRECISION,
    user_lng DOUBLE PRECISION,
    radius_km DOUBLE PRECISION DEFAULT 10.0,
    page_offset INTEGER DEFAULT 0,
    page_limit INTEGER DEFAULT 10
)
RETURNS TABLE (
    id UUID,
    user_id UUID,
    created_by TEXT,
    name TEXT,
    location GEOGRAPHY,
    address TEXT,
    image_url TEXT,
    rating INTEGER,
    place_type TEXT,
    google_place_id TEXT,
    created_at TIMESTAMPTZ,
    updated_at TIMESTAMPTZ,
    distance_km DOUBLE PRECISION
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT
        w.id,
        w.user_id,
        w.created_by,
        w.name,
        w.location,
        w.address,
        w.image_url,
        w.rating,
        COALESCE(w.place_type, 'toilet'::TEXT) as place_type,
        w.google_place_id,
        w.created_at,
        w.updated_at,
        ST_Distance(w.location, ST_Point(user_lng, user_lat)::GEOGRAPHY) / 1000.0 as distance_km
    FROM wcs w
    WHERE w.location IS NOT NULL
      AND ST_DWithin(w.location, ST_Point(user_lng, user_lat)::GEOGRAPHY, radius_km * 1000)
    ORDER BY w.location <-> ST_Point(user_lng, user_lat)::GEOGRAPHY
    LIMIT page_limit
    OFFSET page_offset;
END;
$$;

-- Update insert_wc_with_location function to include google_place_id
DROP FUNCTION IF EXISTS insert_wc_with_location(UUID, TEXT, TEXT, TEXT, TEXT, INTEGER, TEXT, DOUBLE PRECISION, DOUBLE PRECISION);

CREATE OR REPLACE FUNCTION insert_wc_with_location(
    p_user_id UUID,
    p_created_by TEXT,
    p_name TEXT,
    p_address TEXT DEFAULT NULL,
    p_image_url TEXT DEFAULT NULL,
    p_rating INTEGER DEFAULT NULL,
    p_place_type TEXT DEFAULT 'toilet',
    p_google_place_id TEXT DEFAULT NULL,
    p_longitude DOUBLE PRECISION,
    p_latitude DOUBLE PRECISION
)
RETURNS TABLE (
    id UUID,
    user_id UUID,
    created_by TEXT,
    name TEXT,
    location GEOGRAPHY,
    address TEXT,
    image_url TEXT,
    rating INTEGER,
    place_type TEXT,
    google_place_id TEXT,
    created_at TIMESTAMPTZ,
    updated_at TIMESTAMPTZ
)
LANGUAGE plpgsql
AS $$
DECLARE
    new_id UUID;
BEGIN
    INSERT INTO wcs (
        user_id,
        created_by,
        name,
        location,
        address,
        image_url,
        rating,
        place_type,
        google_place_id
    )
    VALUES (
        p_user_id,
        p_created_by,
        p_name,
        ST_Point(p_longitude, p_latitude)::GEOGRAPHY,
        p_address,
        p_image_url,
        p_rating,
        COALESCE(p_place_type, 'toilet'::TEXT),
        p_google_place_id
    )
    RETURNING wcs.id INTO new_id;

    RETURN QUERY
    SELECT
        w.id,
        w.user_id,
        w.created_by,
        w.name,
        w.location,
        w.address,
        w.image_url,
        w.rating,
        COALESCE(w.place_type, 'toilet'::TEXT) as place_type,
        w.google_place_id,
        w.created_at,
        w.updated_at
    FROM wcs w
    WHERE w.id = new_id;
END;
$$;

-- Update update_wc_with_location function to include google_place_id
DROP FUNCTION IF EXISTS update_wc_with_location(UUID, TEXT, TEXT, TEXT, INTEGER, TEXT, DOUBLE PRECISION, DOUBLE PRECISION);

CREATE OR REPLACE FUNCTION update_wc_with_location(
    p_wc_id UUID,
    p_name TEXT,
    p_address TEXT DEFAULT NULL,
    p_image_url TEXT DEFAULT NULL,
    p_rating INTEGER DEFAULT NULL,
    p_place_type TEXT DEFAULT NULL,
    p_google_place_id TEXT DEFAULT NULL,
    p_longitude DOUBLE PRECISION,
    p_latitude DOUBLE PRECISION
)
RETURNS TABLE (
    id UUID,
    user_id UUID,
    created_by TEXT,
    name TEXT,
    location GEOGRAPHY,
    address TEXT,
    image_url TEXT,
    rating INTEGER,
    place_type TEXT,
    google_place_id TEXT,
    created_at TIMESTAMPTZ,
    updated_at TIMESTAMPTZ
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE wcs
    SET
        name = p_name,
        location = ST_Point(p_longitude, p_latitude)::GEOGRAPHY,
        address = p_address,
        image_url = p_image_url,
        rating = p_rating,
        place_type = COALESCE(p_place_type, place_type, 'toilet'::TEXT),
        google_place_id = COALESCE(p_google_place_id, google_place_id),
        updated_at = TIMEZONE('utc'::text, NOW())
    WHERE wcs.id = p_wc_id;

    RETURN QUERY
    SELECT
        w.id,
        w.user_id,
        w.created_by,
        w.name,
        w.location,
        w.address,
        w.image_url,
        w.rating,
        COALESCE(w.place_type, 'toilet'::TEXT) as place_type,
        w.google_place_id,
        w.created_at,
        w.updated_at
    FROM wcs w
    WHERE w.id = p_wc_id;
END;
$$;

-- Grant permissions to all functions
GRANT EXECUTE ON FUNCTION get_wcs_by_distance TO anon, authenticated, service_role;
GRANT EXECUTE ON FUNCTION get_wcs_within_radius TO anon, authenticated, service_role;
GRANT EXECUTE ON FUNCTION insert_wc_with_location TO authenticated, service_role;
GRANT EXECUTE ON FUNCTION update_wc_with_location TO authenticated, service_role;

-- Add helpful comments
COMMENT ON FUNCTION get_wcs_by_distance IS 'Returns WCs sorted by distance from specified coordinates - includes google_place_id';
COMMENT ON FUNCTION get_wcs_within_radius IS 'Returns WCs within specified radius from user location - includes google_place_id';
COMMENT ON FUNCTION insert_wc_with_location IS 'Inserts a new WC with PostGIS geography location - includes google_place_id';
COMMENT ON FUNCTION update_wc_with_location IS 'Updates WC with PostGIS location and all fields - includes google_place_id';

-- Verify that google_place_id column exists
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns
        WHERE table_name = 'wcs' AND column_name = 'google_place_id'
    ) THEN
        RAISE NOTICE 'WARNING: google_place_id column does not exist in wcs table!';
        RAISE NOTICE 'Please run the add_google_place_id_column.sql script first.';
    ELSE
        RAISE NOTICE 'SUCCESS: google_place_id column exists in wcs table.';
    END IF;
END $$;

-- Test the updated function (optional debug query)
-- SELECT id, name, place_type, google_place_id, distance_km
-- FROM get_wcs_by_distance(52.2297, 21.0122, 0, 5);
