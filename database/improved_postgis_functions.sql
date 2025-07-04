-- Improved PostGIS functions that return coordinates directly
-- This script creates optimized functions for better performance

-- Drop existing function and create improved version
DROP FUNCTION IF EXISTS get_wcs_by_distance(DOUBLE PRECISION, DOUBLE PRECISION, INTEGER, INTEGER);

-- Create improved function that returns coordinates directly
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
    distance_km DOUBLE PRECISION,
    lat DOUBLE PRECISION,
    lng DOUBLE PRECISION
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
        ST_Distance(w.location, ST_Point(user_lng, user_lat)::GEOGRAPHY) / 1000.0 as distance_km,
        -- Extract coordinates directly
        ST_Y(w.location::geometry) as lat,
        ST_X(w.location::geometry) as lng
    FROM wcs w
    WHERE w.location IS NOT NULL
    ORDER BY w.location <-> ST_Point(user_lng, user_lat)::GEOGRAPHY
    LIMIT page_limit
    OFFSET page_offset;
END;
$$;

-- Create function to get all WCs with coordinates (for non-location based queries)
CREATE OR REPLACE FUNCTION get_wcs_with_coordinates(
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
    lat DOUBLE PRECISION,
    lng DOUBLE PRECISION
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
        -- Extract coordinates directly
        ST_Y(w.location::geometry) as lat,
        ST_X(w.location::geometry) as lng
    FROM wcs w
    WHERE w.location IS NOT NULL
    ORDER BY w.created_at DESC
    LIMIT page_limit
    OFFSET page_offset;
END;
$$;

-- Grant permissions
GRANT EXECUTE ON FUNCTION get_wcs_by_distance TO anon, authenticated, service_role;
GRANT EXECUTE ON FUNCTION get_wcs_with_coordinates TO anon, authenticated, service_role;

-- Add helpful comments
COMMENT ON FUNCTION get_wcs_by_distance IS 'Returns WCs sorted by distance with coordinates already extracted';
COMMENT ON FUNCTION get_wcs_with_coordinates IS 'Returns WCs with coordinates for non-location based queries';

-- Test the functions (optional)
-- SELECT id, name, lat, lng, distance_km FROM get_wcs_by_distance(52.2297, 21.0122, 0, 5);
-- SELECT id, name, lat, lng FROM get_wcs_with_coordinates(0, 5);
