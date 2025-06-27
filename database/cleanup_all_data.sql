-- ============================================================================
-- COMPLETE DATA CLEANUP SCRIPT FOR WC FINDER
-- ============================================================================
--
-- WARNING: This script will DELETE ALL DATA from the WC Finder database!
-- This operation is IRREVERSIBLE. Make sure you have a backup before running.
--
-- This script will remove:
-- - All WC records from 'wcs' table
-- - All photos from 'wc_photos' table
-- - All ratings from 'wc_ratings' table
-- - All tags from 'wc_tags' table
-- - All images from 'wc-images' storage bucket
-- - All photos from 'wc-photos' storage bucket (if exists)
--
-- Run this in Supabase SQL Editor
-- ============================================================================

BEGIN;

-- Step 1: Show current data counts BEFORE deletion
SELECT 'BEFORE CLEANUP - Current data counts:' as info;

SELECT
    'wcs' as table_name,
    count(*) as record_count
FROM wcs
UNION ALL
SELECT
    'wc_tags' as table_name,
    count(*) as record_count
FROM wc_tags
UNION ALL
SELECT
    'wc_photos' as table_name,
    count(*) as record_count
FROM wc_photos
UNION ALL
SELECT
    'wc_ratings' as table_name,
    count(*) as record_count
FROM wc_ratings;

-- Step 2: Delete data in correct order (respecting foreign key constraints)
-- Delete in reverse order of dependencies

-- Delete tags first (references wcs)
DELETE FROM wc_tags;

-- Delete photos (references wcs)
DELETE FROM wc_photos;

-- Delete ratings (references wcs)
DELETE FROM wc_ratings;

-- Delete main WC records last
DELETE FROM wcs;

-- Step 3: Reset sequences (if any auto-increment columns exist)
-- Note: UUIDs don't need sequence reset, but this is here for completeness
-- ALTER SEQUENCE IF EXISTS wcs_id_seq RESTART WITH 1;
-- ALTER SEQUENCE IF EXISTS wc_tags_id_seq RESTART WITH 1;
-- ALTER SEQUENCE IF EXISTS wc_photos_id_seq RESTART WITH 1;
-- ALTER SEQUENCE IF EXISTS wc_ratings_id_seq RESTART WITH 1;

-- Step 4: Verify deletion
SELECT 'AFTER CLEANUP - Remaining data counts:' as info;

SELECT
    'wcs' as table_name,
    count(*) as record_count
FROM wcs
UNION ALL
SELECT
    'wc_tags' as table_name,
    count(*) as record_count
FROM wc_tags
UNION ALL
SELECT
    'wc_photos' as table_name,
    count(*) as record_count
FROM wc_photos
UNION ALL
SELECT
    'wc_ratings' as table_name,
    count(*) as record_count
FROM wc_ratings;

-- Step 5: Show cleanup summary
SELECT
    'DATA CLEANUP COMPLETED' as status,
    'All WC data has been deleted from database tables' as message,
    'Storage buckets need to be cleaned manually (see instructions below)' as note;

COMMIT;

-- ============================================================================
-- STORAGE CLEANUP INSTRUCTIONS
-- ============================================================================
--
-- After running this SQL script, you need to manually clean storage buckets:
--
-- Option 1: Using Supabase Dashboard
-- 1. Go to Storage > Buckets in Supabase Dashboard
-- 2. Select 'wc-images' bucket
-- 3. Select all files and delete them
-- 4. Repeat for 'wc-photos' bucket (if exists)
--
-- Option 2: Using Supabase CLI (if you have it set up)
-- supabase storage rm --bucket wc-images --recursive .
-- supabase storage rm --bucket wc-photos --recursive .
--
-- Option 3: Using SQL (Advanced - be careful!)
-- This requires storage admin privileges:
--
-- DELETE FROM storage.objects
-- WHERE bucket_id = 'wc-images';
--
-- DELETE FROM storage.objects
-- WHERE bucket_id = 'wc-photos';
--
-- ============================================================================
-- VERIFICATION QUERIES
-- ============================================================================
--
-- Run these queries after cleanup to verify everything is clean:
--
-- -- Check database tables
-- SELECT count(*) as wcs_count FROM wcs;
-- SELECT count(*) as tags_count FROM wc_tags;
-- SELECT count(*) as photos_count FROM wc_photos;
-- SELECT count(*) as ratings_count FROM wc_ratings;
--
-- -- Check storage buckets
-- SELECT count(*) as storage_files
-- FROM storage.objects
-- WHERE bucket_id IN ('wc-images', 'wc-photos');
--
-- ============================================================================
-- RECOVERY INSTRUCTIONS
-- ============================================================================
--
-- If you need to restore data after cleanup:
-- 1. Restore from your database backup
-- 2. Re-upload images to storage buckets
-- 3. Run database/setup_wc_tags_complete.sql to ensure proper setup
--
-- ============================================================================
