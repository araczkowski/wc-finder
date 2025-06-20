-- Verification script for WC Finder database setup
-- Run this in Supabase SQL Editor to verify all tables and configurations

\echo '=== WC FINDER DATABASE VERIFICATION ==='
\echo ''

-- Check if all required tables exist
\echo '1. CHECKING TABLES...'
SELECT
    table_name,
    CASE
        WHEN table_name IN ('wcs', 'wc_rating', 'wc_photos') THEN '✅ REQUIRED'
        ELSE '📋 OTHER'
    END as status
FROM information_schema.tables
WHERE table_schema = 'public'
AND table_name IN ('wcs', 'wc_rating', 'wc_photos', 'accounts', 'sessions', 'users', 'verification_tokens')
ORDER BY
    CASE
        WHEN table_name = 'wcs' THEN 1
        WHEN table_name = 'wc_rating' THEN 2
        WHEN table_name = 'wc_photos' THEN 3
        ELSE 4
    END;

\echo ''
\echo '2. CHECKING WCS TABLE STRUCTURE...'
SELECT
    column_name,
    data_type,
    is_nullable,
    column_default,
    CASE
        WHEN column_name IN ('id', 'user_id', 'created_by', 'name') THEN '✅ REQUIRED'
        WHEN column_name IN ('address', 'location', 'image_url', 'rating') THEN '📋 OPTIONAL'
        ELSE '🔧 SYSTEM'
    END as importance
FROM information_schema.columns
WHERE table_name = 'wcs'
ORDER BY ordinal_position;

\echo ''
\echo '3. CHECKING FOREIGN KEY CONSTRAINTS...'
SELECT
    tc.table_name,
    tc.constraint_name,
    kcu.column_name,
    ccu.table_name AS foreign_table_name,
    ccu.column_name AS foreign_column_name,
    '✅ OK' as status
FROM information_schema.table_constraints AS tc
JOIN information_schema.key_column_usage AS kcu
    ON tc.constraint_name = kcu.constraint_name
    AND tc.table_schema = kcu.table_schema
JOIN information_schema.constraint_column_usage AS ccu
    ON ccu.constraint_name = tc.constraint_name
    AND ccu.table_schema = tc.table_schema
WHERE tc.constraint_type = 'FOREIGN KEY'
AND tc.table_name IN ('wcs', 'wc_rating', 'wc_photos')
ORDER BY tc.table_name;

\echo ''
\echo '4. CHECKING ROW LEVEL SECURITY...'
SELECT
    tablename,
    rowsecurity,
    CASE
        WHEN rowsecurity THEN '✅ ENABLED'
        ELSE '❌ DISABLED'
    END as rls_status
FROM pg_tables
WHERE schemaname = 'public'
AND tablename IN ('wcs', 'wc_rating', 'wc_photos')
ORDER BY tablename;

\echo ''
\echo '5. CHECKING RLS POLICIES...'
SELECT
    tablename,
    policyname,
    cmd as operation,
    CASE
        WHEN cmd = 'SELECT' AND policyname LIKE '%read%' THEN '✅ PUBLIC READ'
        WHEN cmd IN ('INSERT', 'UPDATE', 'DELETE') AND policyname LIKE '%auth%' THEN '✅ AUTH WRITE'
        ELSE '📋 OTHER'
    END as policy_type
FROM pg_policies
WHERE tablename IN ('wcs', 'wc_rating', 'wc_photos')
ORDER BY tablename, cmd, policyname;

\echo ''
\echo '6. CHECKING INDEXES...'
SELECT
    schemaname,
    tablename,
    indexname,
    indexdef,
    CASE
        WHEN indexname LIKE '%_pkey' THEN '🔑 PRIMARY KEY'
        WHEN indexname LIKE '%user_id%' THEN '✅ USER INDEX'
        WHEN indexname LIKE '%wc_id%' THEN '✅ WC INDEX'
        WHEN indexname LIKE '%address%' THEN '🔍 SEARCH INDEX'
        ELSE '📋 OTHER'
    END as index_type
FROM pg_indexes
WHERE schemaname = 'public'
AND tablename IN ('wcs', 'wc_rating', 'wc_photos')
ORDER BY tablename, indexname;

\echo ''
\echo '7. CHECKING TRIGGERS...'
SELECT
    event_object_table as table_name,
    trigger_name,
    action_timing,
    event_manipulation,
    '✅ ACTIVE' as status
FROM information_schema.triggers
WHERE event_object_schema = 'public'
AND event_object_table IN ('wcs', 'wc_rating', 'wc_photos')
ORDER BY event_object_table, trigger_name;

\echo ''
\echo '8. CHECKING AUTH.USERS STRUCTURE (for user_id references)...'
SELECT
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'auth'
AND table_name = 'users'
AND column_name IN ('id', 'email', 'email_confirmed_at', 'created_at')
ORDER BY ordinal_position;

\echo ''
\echo '9. SAMPLE DATA CHECK...'
SELECT
    'wcs' as table_name,
    COUNT(*) as record_count,
    COUNT(CASE WHEN user_id ~ '^[0-9a-f-]{36}$' THEN 1 END) as valid_uuid_count,
    COUNT(CASE WHEN user_id LIKE 'temp_%' THEN 1 END) as temp_id_count
FROM wcs
UNION ALL
SELECT
    'wc_rating' as table_name,
    COUNT(*) as record_count,
    COUNT(CASE WHEN user_id ~ '^[0-9a-f-]{36}$' THEN 1 END) as valid_uuid_count,
    COUNT(CASE WHEN user_id LIKE 'temp_%' THEN 1 END) as temp_id_count
FROM wc_rating
UNION ALL
SELECT
    'wc_photos' as table_name,
    COUNT(*) as record_count,
    COUNT(CASE WHEN user_id ~ '^[0-9a-f-]{36}$' THEN 1 END) as valid_uuid_count,
    COUNT(CASE WHEN user_id LIKE 'temp_%' THEN 1 END) as temp_id_count
FROM wc_photos;

\echo ''
\echo '10. PERMISSIONS CHECK...'
SELECT
    table_name,
    grantee,
    privilege_type,
    CASE
        WHEN grantee = 'anon' AND privilege_type = 'SELECT' THEN '✅ PUBLIC READ'
        WHEN grantee = 'authenticated' THEN '✅ AUTH ACCESS'
        WHEN grantee = 'service_role' THEN '✅ ADMIN ACCESS'
        ELSE '📋 OTHER'
    END as permission_type
FROM information_schema.role_table_grants
WHERE table_schema = 'public'
AND table_name IN ('wcs', 'wc_rating', 'wc_photos')
AND grantee IN ('anon', 'authenticated', 'service_role')
ORDER BY table_name, grantee, privilege_type;

\echo ''
\echo '=== VERIFICATION COMPLETE ==='
\echo ''
\echo 'EXPECTED RESULTS:'
\echo '✅ All 3 main tables (wcs, wc_rating, wc_photos) should exist'
\echo '✅ All tables should have RLS enabled'
\echo '✅ Each table should have read policies for anon and write policies for authenticated'
\echo '✅ Foreign key constraints should reference auth.users(id)'
\echo '✅ No temp_ user_id values should exist'
\echo '✅ Proper indexes should be in place'
\echo ''
\echo 'IF ANY ISSUES FOUND:'
\echo '1. Run create_wcs_table.sql first'
\echo '2. Run other table creation scripts'
\echo '3. Check SUPABASE_SERVICE_ROLE_KEY in environment variables'
\echo '4. Clean up any temp_ user_id records'
