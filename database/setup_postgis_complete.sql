-- Complete PostGIS Setup Script for WC Finder
-- This script converts the existing location system to use PostGIS geography types
-- Run this script after backing up your database

BEGIN;

-- Step 1: Enable PostGIS extension
CREATE EXTENSION IF NOT EXISTS postgis;

-- Step 2: Create backup of existing data
CREATE TABLE IF NOT EXISTS wcs_location_backup AS
SELECT id, location FROM wcs WHERE location IS NOT NULL;

-- Step 3: Add new geography column
ALTER TABLE wcs ADD COLUMN IF NOT EXISTS location_geo GEOGRAPHY(POINT, 4326);

-- Step 4: Migrate existing data from TEXT to GEOGRAPHY
-- Parse existing "lat,lng" format and convert to ST_Point
UPDATE wcs
SET location_geo = ST_Point(
    CAST(SPLIT_PART(location, ',', 2) AS DOUBLE PRECISION), -- longitude
    CAST(SPLIT_PART(location, ',', 1) AS DOUBLE PRECISION)  -- latitude
)::GEOGRAPHY
WHERE location IS NOT NULL
  AND location != ''
  AND SPLIT_PART(location, ',', 1) != ''
  AND SPLIT_PART(location, ',', 2) != ''
  AND SPLIT_PART(location, ',', 1) ~ '^-?[0-9]+\.?[0-9]*$'
  AND SPLIT_PART(location, ',', 2) ~ '^-?[0-9]+\.?[0-9]*$';

-- Step 5: Drop old location column and rename new one
ALTER TABLE wcs DROP COLUMN IF EXISTS location;
ALTER TABLE wcs RENAME COLUMN location_geo TO location;

-- Step 6: Create spatial index for performance
DROP INDEX IF EXISTS idx_wcs_location;
CREATE INDEX wcs_geo_index ON wcs USING GIST (location);

-- Step 7: Create additional indexes for optimal performance
CREATE INDEX IF NOT EXISTS wcs_location_gist_idx ON wcs USING GIST (location);
CREATE INDEX IF NOT EXISTS wcs_created_at_idx ON wcs (created_at DESC);
CREATE INDEX IF NOT EXISTS wcs_user_id_idx ON wcs (user_id);

-- Step 8: Update column comment
COMMENT ON COLUMN wcs.location IS 'Geographic coordinates stored as PostGIS GEOGRAPHY(POINT) for efficient distance calculations';

-- Step 9: Create PostGIS functions

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
        rating
    )
    VALUES (
        p_user_id,
        p_created_by,
        p_name,
        ST_Point(p_longitude, p_latitude)::GEOGRAPHY,
        p_address,
        p_image_url,
        p_rating
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
        w.created_at,
        w.updated_at
    FROM wcs w
    WHERE w.id = new_id;
END;
$$;

-- Function to update WC with PostGIS location and other fields
CREATE OR REPLACE FUNCTION update_wc_with_location(
    p_wc_id UUID,
    p_name TEXT,
    p_address TEXT DEFAULT NULL,
    p_image_url TEXT DEFAULT NULL,
    p_rating INTEGER DEFAULT NULL,
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
        w.created_at,
        w.updated_at
    FROM wcs w
    WHERE w.id = p_wc_id;
END;
$$;

-- Function to update WC location only
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

-- Step 10: Grant permissions to the functions
GRANT EXECUTE ON FUNCTION get_wcs_by_distance TO anon, authenticated, service_role;
GRANT EXECUTE ON FUNCTION insert_wc_with_location TO authenticated, service_role;
GRANT EXECUTE ON FUNCTION update_wc_location TO authenticated, service_role;
GRANT EXECUTE ON FUNCTION update_wc_with_location TO authenticated, service_role;
GRANT EXECUTE ON FUNCTION get_wc_coordinates TO anon, authenticated, service_role;
GRANT EXECUTE ON FUNCTION get_wcs_within_radius TO anon, authenticated, service_role;

-- Step 11: Add helpful comments
COMMENT ON FUNCTION get_wcs_by_distance IS 'Returns WCs sorted by distance from specified coordinates';
COMMENT ON FUNCTION insert_wc_with_location IS 'Inserts a new WC with PostGIS geography location';
COMMENT ON FUNCTION update_wc_location IS 'Updates WC location using PostGIS geography';
COMMENT ON FUNCTION update_wc_with_location IS 'Updates WC with location and other fields using PostGIS geography';
COMMENT ON FUNCTION get_wc_coordinates IS 'Extracts latitude and longitude from WC geography location';
COMMENT ON FUNCTION get_wcs_within_radius IS 'Returns WCs within specified radius from user location';

-- Step 12: Verify the migration
-- Show migration results
DO $$
DECLARE
    total_records INTEGER;
    records_with_location INTEGER;
    records_without_location INTEGER;
BEGIN
    SELECT COUNT(*) INTO total_records FROM wcs;
    SELECT COUNT(*) INTO records_with_location FROM wcs WHERE location IS NOT NULL;
    records_without_location := total_records - records_with_location;

    RAISE NOTICE 'Migration Summary:';
    RAISE NOTICE 'Total records: %', total_records;
    RAISE NOTICE 'Records with PostGIS location: %', records_with_location;
    RAISE NOTICE 'Records without location: %', records_without_location;

    IF records_with_location > 0 THEN
        RAISE NOTICE 'PostGIS migration completed successfully!';
    ELSE
        RAISE NOTICE 'No location data found to migrate.';
    END IF;
END;
$$;

-- Step 13: Test distance query (example for Warsaw center)
-- This demonstrates the new functionality
DO $$
DECLARE
    test_record RECORD;
BEGIN
    RAISE NOTICE 'Testing distance query from Warsaw center (52.2297, 21.0122):';

    FOR test_record IN
        SELECT
            name,
            address,
            distance_km
        FROM get_wcs_by_distance(52.2297, 21.0122, 0, 5)
    LOOP
        RAISE NOTICE 'WC: % at % - Distance: %.2f km',
            test_record.name,
            COALESCE(test_record.address, 'No address'),
            test_record.distance_km;
    END LOOP;
END;
$$;

COMMIT;

-- Final verification queries you can run manually:
/*
-- 1. Check PostGIS extension is enabled
SELECT name, default_version, installed_version
FROM pg_available_extensions
WHERE name = 'postgis';

-- 2. Verify location column type
SELECT column_name, data_type, udt_name
FROM information_schema.columns
WHERE table_name = 'wcs' AND column_name = 'location';

-- 3. Check spatial index exists
SELECT indexname, indexdef
FROM pg_indexes
WHERE tablename = 'wcs' AND indexname LIKE '%geo%';

-- 4. Test distance function
SELECT name, address, distance_km
FROM get_wcs_by_distance(52.2297, 21.0122, 0, 10);

-- 5. Count records with valid geography data
SELECT
    COUNT(*) as total_records,
    COUNT(location) as records_with_location,
    COUNT(*) - COUNT(location) as records_without_location
FROM wcs;
*/
