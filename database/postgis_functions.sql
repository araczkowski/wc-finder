-- PostGIS functions for WC location operations
-- This file contains all database functions needed for geographic operations

-- Function to get WCs sorted by distance from user location
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
        w.place_type,
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

-- Function to insert WC with PostGIS location
CREATE OR REPLACE FUNCTION insert_wc_with_location(
    p_user_id UUID,
    p_created_by TEXT,
    p_name TEXT,
    p_address TEXT DEFAULT NULL,
    p_image_url TEXT DEFAULT NULL,
    p_rating INTEGER DEFAULT NULL,
    p_place_type TEXT DEFAULT 'toilet',
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
        place_type
    )
    VALUES (
        p_user_id,
        p_created_by,
        p_name,
        ST_Point(p_longitude, p_latitude)::GEOGRAPHY,
        p_address,
        p_image_url,
        p_rating,
        p_place_type
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
        w.place_type,
        w.created_at,
        w.updated_at
    FROM wcs w
    WHERE w.id = new_id;
END;
$$;

-- Function to update WC location
CREATE OR REPLACE FUNCTION update_wc_location(
    p_wc_id UUID,
    p_longitude DOUBLE PRECISION,
    p_latitude DOUBLE PRECISION
)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE wcs
    SET
        location = ST_Point(p_longitude, p_latitude)::GEOGRAPHY,
        updated_at = TIMEZONE('utc'::text, NOW())
    WHERE id = p_wc_id;

    RETURN FOUND;
END;
$$;

-- Function to get coordinates from geography point
CREATE OR REPLACE FUNCTION get_wc_coordinates(p_wc_id UUID)
RETURNS TABLE (
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT
        ST_Y(location::geometry) as latitude,
        ST_X(location::geometry) as longitude
    FROM wcs
    WHERE id = p_wc_id AND location IS NOT NULL;
END;
$$;

-- Function to find WCs within a radius (in kilometers)
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
        w.place_type,
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

-- Function to update WC with PostGIS location and other fields
CREATE OR REPLACE FUNCTION update_wc_with_location(
    p_wc_id UUID,
    p_name TEXT,
    p_address TEXT DEFAULT NULL,
    p_image_url TEXT DEFAULT NULL,
    p_rating INTEGER DEFAULT NULL,
    p_place_type TEXT DEFAULT NULL,
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
        place_type = COALESCE(p_place_type, place_type),
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
        w.place_type,
        w.created_at,
        w.updated_at
    FROM wcs w
    WHERE w.id = p_wc_id;
END;
$$;

-- Grant permissions to the functions
GRANT EXECUTE ON FUNCTION get_wcs_by_distance TO anon, authenticated, service_role;
GRANT EXECUTE ON FUNCTION insert_wc_with_location TO authenticated, service_role;
GRANT EXECUTE ON FUNCTION update_wc_location TO authenticated, service_role;
GRANT EXECUTE ON FUNCTION update_wc_with_location TO authenticated, service_role;
GRANT EXECUTE ON FUNCTION get_wc_coordinates TO anon, authenticated, service_role;
GRANT EXECUTE ON FUNCTION get_wcs_within_radius TO anon, authenticated, service_role;

-- Create indexes for optimal performance
CREATE INDEX IF NOT EXISTS wcs_location_gist_idx ON wcs USING GIST (location);
CREATE INDEX IF NOT EXISTS wcs_created_at_idx ON wcs (created_at DESC);
CREATE INDEX IF NOT EXISTS wcs_user_id_idx ON wcs (user_id);

-- Add helpful comments
COMMENT ON FUNCTION get_wcs_by_distance IS 'Returns WCs sorted by distance from specified coordinates';
COMMENT ON FUNCTION insert_wc_with_location IS 'Inserts a new WC with PostGIS geography location';
COMMENT ON FUNCTION update_wc_location IS 'Updates WC location using PostGIS geography';
COMMENT ON FUNCTION get_wc_coordinates IS 'Extracts latitude and longitude from WC geography location';
COMMENT ON FUNCTION get_wcs_within_radius IS 'Returns WCs within specified radius from user location';
