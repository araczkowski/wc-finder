# Fix for Vercel RLS Policies Issues - Complete Solution

## Problem Description
Getting "Invalid API key" errors on Vercel production for:
- `GET /api/wc-photos` - Failed to fetch photos: Invalid API key
- `GET /api/wc-ratings` - Failed to fetch ratings

This happens because Row Level Security (RLS) policies are blocking API access when using Supabase Service Role Key on Vercel.

## Root Cause
The issue is with Row Level Security policies in Supabase that are too restrictive or incorrectly configured for server-side API operations using the service role key.

## Solution: Fix RLS Policies

### Step 1: Run Simple Policies for wc_photos

Go to Supabase SQL Editor and run:

```sql
-- Fix wc_photos RLS policies
ALTER TABLE wc_photos ENABLE ROW LEVEL SECURITY;

-- Drop all existing policies
DO $$
DECLARE
    pol record;
BEGIN
    FOR pol IN SELECT policyname FROM pg_policies WHERE tablename = 'wc_photos'
    LOOP
        EXECUTE 'DROP POLICY IF EXISTS ' || quote_ident(pol.policyname) || ' ON wc_photos';
    END LOOP;
END $$;

-- Policy 1: Allow anyone to view photos
CREATE POLICY "wc_photos_select_policy" ON wc_photos
    FOR SELECT
    USING (true);

-- Policy 2: Allow authenticated users to insert photos
CREATE POLICY "wc_photos_insert_policy" ON wc_photos
    FOR INSERT
    WITH CHECK (auth.uid() IS NOT NULL);

-- Policy 3: Allow users to update their own photos
CREATE POLICY "wc_photos_update_policy" ON wc_photos
    FOR UPDATE
    USING (auth.uid() = user_id);

-- Policy 4: Allow users to delete their own photos
CREATE POLICY "wc_photos_delete_policy" ON wc_photos
    FOR DELETE
    USING (auth.uid() = user_id);

-- Grant permissions
GRANT SELECT, INSERT, UPDATE, DELETE ON wc_photos TO authenticated;
GRANT ALL PRIVILEGES ON wc_photos TO service_role;
GRANT ALL PRIVILEGES ON wc_photos TO postgres;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO authenticated;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO service_role;
```

### Step 2: Run Simple Policies for wc_rating

```sql
-- Fix wc_rating RLS policies
ALTER TABLE wc_rating ENABLE ROW LEVEL SECURITY;

-- Drop all existing policies
DO $$
DECLARE
    pol record;
BEGIN
    FOR pol IN SELECT policyname FROM pg_policies WHERE tablename = 'wc_rating'
    LOOP
        EXECUTE 'DROP POLICY IF EXISTS ' || quote_ident(pol.policyname) || ' ON wc_rating';
    END LOOP;
END $$;

-- Policy 1: Allow anyone to view ratings
CREATE POLICY "wc_rating_select_policy" ON wc_rating
    FOR SELECT
    USING (true);

-- Policy 2: Allow authenticated users to insert ratings
CREATE POLICY "wc_rating_insert_policy" ON wc_rating
    FOR INSERT
    WITH CHECK (auth.uid() IS NOT NULL AND auth.uid() = user_id);

-- Policy 3: Allow users to update their own ratings
CREATE POLICY "wc_rating_update_policy" ON wc_rating
    FOR UPDATE
    USING (auth.uid() = user_id)
    WITH CHECK (auth.uid() = user_id);

-- Policy 4: Allow users to delete their own ratings
CREATE POLICY "wc_rating_delete_policy" ON wc_rating
    FOR DELETE
    USING (auth.uid() = user_id);

-- Grant permissions
GRANT SELECT, INSERT, UPDATE, DELETE ON wc_rating TO authenticated;
GRANT ALL PRIVILEGES ON wc_rating TO service_role;
GRANT ALL PRIVILEGES ON wc_rating TO postgres;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO authenticated;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO service_role;
```

### Step 3: Verify Environment Variables on Vercel

Make sure these are correctly set in Vercel Dashboard → Settings → Environment Variables:

**Critical Variables:**
- `SUPABASE_SERVICE_ROLE_KEY` - Must be the **service_role** key, not anon key
- `NEXT_PUBLIC_SUPABASE_URL` - Your Supabase project URL
- `NEXT_PUBLIC_SUPABASE_ANON_KEY` - Anon public key

**How to find the correct keys:**
1. Go to Supabase Dashboard → Settings → API
2. **Service Role Key** = `service_role` key (secret, never expose to client)
3. **Anon Key** = `anon` key (public, safe for client use)

### Step 4: Alternative Solution (If Policies Still Don't Work)

If you still get "Invalid API key" errors, temporarily disable RLS entirely:

```sql
-- TEMPORARY SOLUTION: Disable RLS (use with caution)
ALTER TABLE wc_photos DISABLE ROW LEVEL SECURITY;
ALTER TABLE wc_rating DISABLE ROW LEVEL SECURITY;

-- Re-enable when you fix the policies:
-- ALTER TABLE wc_photos ENABLE ROW LEVEL SECURITY;
-- ALTER TABLE wc_rating ENABLE ROW LEVEL SECURITY;
```

**⚠️ Warning:** Disabling RLS removes security restrictions. Only use temporarily for testing.

### Step 5: Test the Fix

After running the policies:

1. **Test photos API:** Go to browser dev tools, try editing a WC
2. **Check network tab:** Look for `GET /api/wc-photos` - should return 200 OK
3. **Test ratings API:** Look for `GET /api/wc-ratings` - should return 200 OK
4. **Verify functionality:** Photos and ratings should load without errors

## Common Issues and Solutions

### Issue 1: Still getting "Invalid API key"
**Solution:** Check that `SUPABASE_SERVICE_ROLE_KEY` on Vercel is the **service_role** key, not the anon key.

### Issue 2: Policies exist but still not working
**Solution:** Run the DROP policies script and recreate them.

### Issue 3: Service role doesn't have permissions
**Solution:** Make sure you granted privileges to `service_role`:
```sql
GRANT ALL PRIVILEGES ON wc_photos TO service_role;
GRANT ALL PRIVILEGES ON wc_rating TO service_role;
```

### Issue 4: Sequence permissions missing
**Solution:** Grant sequence usage:
```sql
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO service_role;
```

## Verification Commands

Run these in Supabase SQL Editor to verify everything is working:

```sql
-- Check if policies exist
SELECT schemaname, tablename, policyname, permissive, roles, cmd
FROM pg_policies 
WHERE tablename IN ('wc_photos', 'wc_rating')
ORDER BY tablename, policyname;

-- Check table permissions
SELECT table_name, privilege_type, grantee
FROM information_schema.table_privileges 
WHERE table_name IN ('wc_photos', 'wc_rating')
ORDER BY table_name, grantee;

-- Test queries as service role (should work)
SELECT COUNT(*) FROM wc_photos;
SELECT COUNT(*) FROM wc_rating;
```

## Success Indicators

After implementing the fix, you should see:
- ✅ No "Invalid API key" errors in browser console
- ✅ `GET /api/wc-photos` returns 200 OK with photo data
- ✅ `GET /api/wc-ratings` returns 200 OK with rating data
- ✅ WC editing page loads photos and ratings correctly
- ✅ No 500 errors in API endpoints

## Emergency Rollback

If you need to quickly restore functionality:

```sql
-- Emergency: Disable all RLS temporarily
ALTER TABLE wc_photos DISABLE ROW LEVEL SECURITY;
ALTER TABLE wc_rating DISABLE ROW LEVEL SECURITY;
ALTER TABLE wcs DISABLE ROW LEVEL SECURITY;
```

This will remove all security restrictions but restore API functionality.

## Why This Happens

The "Invalid API key" error is misleading. It's actually:
1. RLS policies blocking the service role from accessing data
2. Missing or incorrect permissions for the service role
3. Policies that are too restrictive for server-side operations

The solution ensures that:
- Service role has full access for API operations
- Authenticated users can perform appropriate actions
- Public users can read data where needed
- All necessary permissions are granted

After applying these fixes, your Vercel deployment should work exactly like your local environment!