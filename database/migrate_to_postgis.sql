-- Migration script to convert wcs.location from TEXT to PostGIS GEOGRAPHY(POINT)
-- This script enables proper distance-based sorting of WC locations

-- Step 1: Enable PostGIS extension if not already enabled
CREATE EXTENSION IF NOT EXISTS postgis;

-- Step 2: Add new geography column
ALTER TABLE wcs ADD COLUMN location_geo GEOGRAPHY(POINT, 4326);

-- Step 3: Migrate existing data from TEXT to GEOGRAPHY
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

-- Step 4: Drop old location column and rename new one
ALTER TABLE wcs DROP COLUMN location;
ALTER TABLE wcs RENAME COLUMN location_geo TO location;

-- Step 5: Create spatial index for performance
CREATE INDEX wcs_geo_index ON wcs USING GIST (location);

-- Step 6: Update existing regular indexes
DROP INDEX IF EXISTS idx_wcs_location;

-- Step 7: Add comment to document the new column
COMMENT ON COLUMN wcs.location IS 'Geographic coordinates stored as PostGIS GEOGRAPHY(POINT) for efficient distance calculations';

-- Step 8: Verify the migration
-- This query should show the count of records with valid geography data
SELECT
    COUNT(*) as total_records,
    COUNT(location) as records_with_location,
    COUNT(*) - COUNT(location) as records_without_location
FROM wcs;

-- Step 9: Test distance query (example)
-- This query demonstrates how to use the new geography column for distance sorting
-- SELECT
--     name,
--     address,
--     ST_Distance(location, ST_Point(21.0122, 52.2297)::GEOGRAPHY) as distance_meters
-- FROM wcs
-- WHERE location IS NOT NULL
-- ORDER BY location <-> ST_Point(21.0122, 52.2297)::GEOGRAPHY
-- LIMIT 10;

COMMIT;
