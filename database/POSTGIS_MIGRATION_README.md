# PostGIS Migration Guide for WC Finder

This guide explains how to migrate the WC Finder application from text-based location storage to PostGIS geography types for proper distance-based sorting.

## Overview

The migration involves:
1. Converting the `wcs.location` column from `TEXT` to `GEOGRAPHY(POINT)`
2. Creating spatial indexes for performance
3. Adding PostGIS functions for distance calculations
4. Updating API endpoints to use PostGIS features

## Prerequisites

- PostgreSQL database with Supabase
- Administrative access to the database
- Backup of existing data (recommended)

## Migration Steps

### 1. Backup Your Database

Before starting the migration, create a backup of your database:

```sql
-- This will be done automatically by the migration script
-- but it's recommended to create a full backup first
```

### 2. Run the PostGIS Migration

Execute the complete migration script:

```bash
# In Supabase SQL Editor, run:
psql -f database/setup_postgis_complete.sql
```

Or copy and paste the contents of `setup_postgis_complete.sql` into the Supabase SQL Editor.

### 3. Verify the Migration

The script will automatically verify the migration, but you can also run these queries manually:

```sql
-- Check PostGIS extension
SELECT name, default_version, installed_version
FROM pg_available_extensions
WHERE name = 'postgis';

-- Verify location column type
SELECT column_name, data_type, udt_name
FROM information_schema.columns
WHERE table_name = 'wcs' AND column_name = 'location';

-- Check spatial index
SELECT indexname, indexdef
FROM pg_indexes
WHERE tablename = 'wcs' AND indexname LIKE '%geo%';

-- Test distance function
SELECT name, address, distance_km
FROM get_wcs_by_distance(52.2297, 21.0122, 0, 10);
```

## What the Migration Does

### Database Changes

1. **Enables PostGIS Extension**
   ```sql
   CREATE EXTENSION IF NOT EXISTS postgis;
   ```

2. **Converts Location Column**
   - Old: `location TEXT` (format: "latitude,longitude")
   - New: `location GEOGRAPHY(POINT, 4326)`

3. **Creates Spatial Index**
   ```sql
   CREATE INDEX wcs_geo_index ON wcs USING GIST (location);
   ```

4. **Adds PostGIS Functions**
   - `get_wcs_by_distance()` - Returns WCs sorted by distance
   - `insert_wc_with_location()` - Inserts WC with PostGIS location
   - `update_wc_with_location()` - Updates WC with PostGIS location
   - `get_wcs_within_radius()` - Finds WCs within specified radius

### API Changes

1. **WC List Endpoint** (`/api/wcs`)
   - Now accepts `lat` and `lng` parameters
   - Returns data sorted by distance when location provided
   - Includes `distance_km` field in response

2. **WC Create Endpoint** (`/api/wcs`)
   - Uses `insert_wc_with_location()` for PostGIS storage
   - Accepts coordinates in "latitude,longitude" format

3. **WC Update Endpoint** (`/api/wcs/[id]`)
   - Uses `update_wc_with_location()` for PostGIS updates
   - Handles location updates properly

### Frontend Changes

1. **Distance Display**
   - Shows distance in meters or kilometers
   - Updates automatically when user location changes

2. **Automatic Sorting**
   - WCs are sorted by distance from user location
   - Visual indicators show sorting status

3. **Real-time Updates**
   - List refreshes when address is manually changed
   - Coordinates update when address changes

## Performance Benefits

The PostGIS migration provides significant performance improvements:

1. **Spatial Indexing**: GIST indexes enable fast spatial queries
2. **Native Distance Calculations**: PostGIS handles distance calculations efficiently
3. **Optimized Sorting**: Database-level sorting using spatial operators
4. **Reduced Network Traffic**: Server-side distance calculations

## Example Queries

### Find Nearest WCs
```sql
SELECT name, address, distance_km
FROM get_wcs_by_distance(52.2297, 21.0122, 0, 10)
ORDER BY distance_km;
```

### Find WCs Within 5km
```sql
SELECT name, address, distance_km
FROM get_wcs_within_radius(52.2297, 21.0122, 5.0, 0, 20);
```

### Insert New WC with Location
```sql
SELECT * FROM insert_wc_with_location(
    'user-uuid',
    'user@example.com',
    'New WC Location',
    'Sample Address',
    null,
    8,
    21.0122,  -- longitude
    52.2297   -- latitude
);
```

## Troubleshooting

### Common Issues

1. **PostGIS Extension Not Available**
   - Contact Supabase support to enable PostGIS
   - Ensure you have proper permissions

2. **Migration Fails on Existing Data**
   - Check for invalid coordinate formats in existing data
   - The script handles most common issues automatically

3. **Function Permission Errors**
   - Ensure proper RLS policies are in place
   - Grant necessary permissions to authenticated users

### Rollback Procedure

If you need to rollback the migration:

```sql
-- Restore from backup table
ALTER TABLE wcs ADD COLUMN location_text TEXT;

UPDATE wcs
SET location_text = ST_Y(location::geometry) || ',' || ST_X(location::geometry)
WHERE location IS NOT NULL;

ALTER TABLE wcs DROP COLUMN location;
ALTER TABLE wcs RENAME COLUMN location_text TO location;

-- Drop PostGIS functions
DROP FUNCTION IF EXISTS get_wcs_by_distance;
DROP FUNCTION IF EXISTS insert_wc_with_location;
DROP FUNCTION IF EXISTS update_wc_with_location;
DROP FUNCTION IF EXISTS get_wcs_within_radius;
```

## Testing

After migration, test these features:

1. **Distance Sorting**: Change user address and verify WC list reorders
2. **New WC Creation**: Add a new WC and verify location storage
3. **WC Editing**: Update an existing WC's location
4. **Distance Display**: Verify distance values are accurate

## Support

For issues with the migration:

1. Check the Supabase logs for error messages
2. Verify PostGIS extension is properly installed
3. Ensure all functions have proper permissions
4. Test with sample data first

## Next Steps

After successful migration:

1. Monitor performance improvements
2. Consider adding more spatial features (radius search, etc.)
3. Implement caching for frequently accessed areas
4. Add more detailed location analytics