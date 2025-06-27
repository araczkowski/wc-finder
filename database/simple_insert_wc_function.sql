-- Simple insert function for WC with location that works with current schema
-- This function handles the insertion of WC with PostGIS location in a simpler way

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

-- Grant permissions to the function
GRANT EXECUTE ON FUNCTION insert_wc_with_location TO authenticated, service_role;

-- Add helpful comment
COMMENT ON FUNCTION insert_wc_with_location IS 'Inserts a new WC with PostGIS geography location';
