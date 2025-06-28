# Import Fix Migration Guide

## Problem
The import feature fails with error: "Could not find the 'latitude' column of 'wcs' in the schema cache"

## Root Cause
The import code tries to insert `latitude` and `longitude` as separate columns, but the `wcs` table uses:
- `location` column in PostGIS POINT format
- OR `location` as TEXT in "lat,lng" format (depending on migration state)

## Required Migrations

### 1. Check Current Table Structure
Run in Supabase SQL Editor:

```sql
-- Check current columns
SELECT column_name, data_type, udt_name 
FROM information_schema.columns 
WHERE table_name = 'wcs' AND table_schema = 'public'
ORDER BY ordinal_position;

-- Check sample data format
SELECT id, name, location, place_type, created_by 
FROM wcs 
LIMIT 3;
```

### 2. Ensure Required Columns Exist

```sql
-- Add missing columns if they don't exist
ALTER TABLE wcs ADD COLUMN IF NOT EXISTS place_type TEXT;
ALTER TABLE wcs ADD COLUMN IF NOT EXISTS google_place_id TEXT;
ALTER TABLE wcs ADD COLUMN IF NOT EXISTS created_by TEXT;

-- Add constraint for place_type if not exists
DO $$ 
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.table_constraints 
        WHERE constraint_name = 'place_type_valid' 
        AND table_name = 'wcs'
    ) THEN
        ALTER TABLE wcs ADD CONSTRAINT place_type_valid CHECK (
            place_type IN (
                'toilet', 'public_toilet', 'tourist_attraction', 'shopping_mall',
                'restaurant', 'cafe', 'bar', 'park', 'train_station', 
                'subway_station', 'bus_station', 'airport', 'gas_station',
                'library', 'museum', 'movie_theater', 'city_hall',
                'supermarket', 'department_store'
            )
        );
    END IF;
END $$;

-- Add unique constraint for google_place_id
ALTER TABLE wcs ADD CONSTRAINT IF NOT EXISTS unique_google_place_id 
UNIQUE (google_place_id);

-- Create indexes
CREATE INDEX IF NOT EXISTS idx_wcs_place_type ON wcs(place_type);
CREATE INDEX IF NOT EXISTS idx_wcs_google_place_id ON wcs(google_place_id);
```

### 3. PostGIS Setup (if using geography)

```sql
-- Enable PostGIS extension
CREATE EXTENSION IF NOT EXISTS postgis;

-- Check if location is already geography type
SELECT column_name, udt_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'wcs' AND column_name = 'location';

-- If location is TEXT, migrate to PostGIS (CAREFUL - backup first!)
-- Only run if location column is TEXT type:
/*
-- Add new geography column
ALTER TABLE wcs ADD COLUMN IF NOT EXISTS location_geo GEOGRAPHY(POINT, 4326);

-- Migrate existing data
UPDATE wcs 
SET location_geo = ST_Point(
    CAST(SPLIT_PART(location, ',', 2) AS DOUBLE PRECISION), -- longitude
    CAST(SPLIT_PART(location, ',', 1) AS DOUBLE PRECISION)  -- latitude
)::GEOGRAPHY 
WHERE location IS NOT NULL AND location_geo IS NULL;

-- Backup old column and replace
ALTER TABLE wcs RENAME COLUMN location TO location_old;
ALTER TABLE wcs RENAME COLUMN location_geo TO location;

-- Create spatial index
CREATE INDEX IF NOT EXISTS idx_wcs_location_geo ON wcs USING GIST(location);
*/
```

### 4. Verify Fix

After migrations, test the import format:

```sql
-- Test POINT insertion (should work)
INSERT INTO wcs (
    user_id, 
    created_by, 
    name, 
    location, 
    place_type, 
    google_place_id
) VALUES (
    (SELECT id FROM auth.users LIMIT 1),
    'test@example.com',
    'Test Location', 
    'POINT(16.592739184016388 51.164381946325875)',
    'restaurant',
    'test_place_123'
);

-- Clean up test
DELETE FROM wcs WHERE google_place_id = 'test_place_123';
```

## Code Fix Applied

The import code has been updated to use the correct format:

```javascript
// OLD (wrong)
{
  latitude: place.geometry.location.lat,
  longitude: place.geometry.location.lng,
}

// NEW (correct)
{
  location: `POINT(${place.geometry.location.lng} ${place.geometry.location.lat})`,
  created_by: session.user.email,
}
```

## Verification Steps

1. Run the migration SQL above
2. Test import with coordinates: `51.164381946325875, 16.592739184016388`
3. Check that data is inserted correctly:

```sql
SELECT 
    name, 
    ST_AsText(location) as location_wkt,
    place_type,
    google_place_id 
FROM wcs 
WHERE google_place_id LIKE 'osm_%' OR google_place_id LIKE 'scraped_%'
ORDER BY created_at DESC 
LIMIT 5;
```

## Troubleshooting

### If still getting "latitude column not found":
- Restart Next.js application
- Clear any schema cache
- Verify column names in Supabase dashboard

### If POINT format fails:
- Check if PostGIS extension is enabled
- Verify location column type (should be geography or geometry)
- Fall back to TEXT format: `"${lat},${lng}"`

### If place_type constraint fails:
- Check allowed values in constraint
- Add new place types to constraint if needed

## Success Indicators

✅ Import completes without column errors
✅ Data appears in wcs table with correct location format  
✅ place_type is correctly set for each imported item
✅ google_place_id is unique and tracks import source