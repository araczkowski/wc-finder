-- Cleanup script for temporary user IDs in WC Finder database
-- This script removes all records with temp_ user_id values that were created
-- due to OAuth Google login issues before the fix was implemented

-- WARNING: This script will DELETE data. Make sure to backup your database first!
-- Run this script in Supabase SQL Editor

\echo 'Starting cleanup of temporary user IDs...'
\echo ''

-- First, let's see what we're dealing with
\echo '1. ANALYZING TEMPORARY USER ID RECORDS...'

SELECT
    'wcs' as table_name,
    COUNT(*) as temp_records,
    MIN(created_at) as oldest_temp_record,
    MAX(created_at) as newest_temp_record
FROM wcs
WHERE user_id ~ '^temp_[0-9]+$'

UNION ALL

SELECT
    'wc_rating' as table_name,
    COUNT(*) as temp_records,
    MIN(created_at) as oldest_temp_record,
    MAX(created_at) as newest_temp_record
FROM wc_rating
WHERE user_id ~ '^temp_[0-9]+$'

UNION ALL

SELECT
    'wc_photos' as table_name,
    COUNT(*) as temp_records,
    MIN(created_at) as oldest_temp_record,
    MAX(created_at) as newest_temp_record
FROM wc_photos
WHERE user_id ~ '^temp_[0-9]+$';

\echo ''
\echo '2. SHOWING SAMPLE TEMPORARY RECORDS...'

-- Show sample records that will be deleted (first 5 from each table)
SELECT 'SAMPLE WCS RECORDS TO BE DELETED:' as info;
SELECT id, user_id, name, created_by, created_at
FROM wcs
WHERE user_id ~ '^temp_[0-9]+$'
ORDER BY created_at DESC
LIMIT 5;

SELECT 'SAMPLE WC_RATING RECORDS TO BE DELETED:' as info;
SELECT id, user_id, wc_id, rating, created_at
FROM wc_rating
WHERE user_id ~ '^temp_[0-9]+$'
ORDER BY created_at DESC
LIMIT 5;

SELECT 'SAMPLE WC_PHOTOS RECORDS TO BE DELETED:' as info;
SELECT id, user_id, wc_id, created_at
FROM wc_photos
WHERE user_id ~ '^temp_[0-9]+$'
ORDER BY created_at DESC
LIMIT 5;

\echo ''
\echo '3. STARTING CLEANUP PROCESS...'

-- Start transaction for safety
BEGIN;

-- Delete from dependent tables first (foreign key constraints)
\echo 'Deleting temporary records from wc_photos...'
DELETE FROM wc_photos WHERE user_id ~ '^temp_[0-9]+$';
\echo 'Deleted ' || ROW_COUNT() || ' records from wc_photos';

\echo 'Deleting temporary records from wc_rating...'
DELETE FROM wc_rating WHERE user_id ~ '^temp_[0-9]+$';
\echo 'Deleted ' || ROW_COUNT() || ' records from wc_rating';

-- Delete from main table
\echo 'Deleting temporary records from wcs...'
DELETE FROM wcs WHERE user_id ~ '^temp_[0-9]+$';
\echo 'Deleted ' || ROW_COUNT() || ' records from wcs';

-- Verify cleanup
\echo ''
\echo '4. VERIFYING CLEANUP...'

SELECT
    'wcs' as table_name,
    COUNT(*) as remaining_temp_records
FROM wcs
WHERE user_id ~ '^temp_[0-9]+$'

UNION ALL

SELECT
    'wc_rating' as table_name,
    COUNT(*) as remaining_temp_records
FROM wc_rating
WHERE user_id ~ '^temp_[0-9]+$'

UNION ALL

SELECT
    'wc_photos' as table_name,
    COUNT(*) as remaining_temp_records
FROM wc_photos
WHERE user_id ~ '^temp_[0-9]+$';

-- If everything looks good, commit the transaction
-- UNCOMMENT THE NEXT LINE TO ACTUALLY PERFORM THE CLEANUP:
-- COMMIT;

-- If you want to rollback instead (for testing), uncomment this:
ROLLBACK;

\echo ''
\echo '5. CLEANUP SUMMARY:'
\echo '✅ Temporary user_id records have been identified'
\echo '⚠️  Transaction was ROLLED BACK (for safety)'
\echo ''
\echo 'TO ACTUALLY PERFORM THE CLEANUP:'
\echo '1. Review the sample records shown above'
\echo '2. Make sure you have a database backup'
\echo '3. Comment out the ROLLBACK line'
\echo '4. Uncomment the COMMIT line'
\echo '5. Run this script again'
\echo ''
\echo 'AFTER CLEANUP:'
\echo '- All temp_ user_id records will be permanently deleted'
\echo '- OAuth Google login should work properly'
\echo '- No more UUID validation errors'
\echo ''
\echo 'NOTE: Users who created these records will need to log in again'
\echo 'and recreate their WC entries with proper OAuth authentication.'

-- Optional: Show statistics after cleanup would be performed
\echo ''
\echo '6. DATABASE STATISTICS (after cleanup would be performed):'

SELECT
    'wcs' as table_name,
    COUNT(*) as total_records,
    COUNT(CASE WHEN user_id ~ '^[0-9a-f-]{36}$' THEN 1 END) as valid_uuid_records,
    COUNT(CASE WHEN user_id ~ '^temp_[0-9]+$' THEN 1 END) as temp_id_records
FROM wcs

UNION ALL

SELECT
    'wc_rating' as table_name,
    COUNT(*) as total_records,
    COUNT(CASE WHEN user_id ~ '^[0-9a-f-]{36}$' THEN 1 END) as valid_uuid_records,
    COUNT(CASE WHEN user_id ~ '^temp_[0-9]+$' THEN 1 END) as temp_id_records
FROM wc_rating

UNION ALL

SELECT
    'wc_photos' as table_name,
    COUNT(*) as total_records,
    COUNT(CASE WHEN user_id ~ '^[0-9a-f-]{36}$' THEN 1 END) as valid_uuid_records,
    COUNT(CASE WHEN user_id ~ '^temp_[0-9]+$' THEN 1 END) as temp_id_records
FROM wc_photos;

\echo ''
\echo 'Cleanup script completed. Review results above.'
