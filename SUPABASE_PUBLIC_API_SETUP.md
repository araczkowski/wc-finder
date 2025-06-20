# Supabase Public API Setup - Complete Guide

## Problem Summary
API calls on Vercel are failing with 500 errors and "Failed to fetch ratings/photos" because of RLS (Row Level Security) restrictions. We need to make GET endpoints public while keeping write operations secure.

## Solution: Configure Public Access in Supabase

### Step 1: Disable RLS (Temporary Quick Fix)

If you need immediate fix, run this in Supabase SQL Editor:

```sql
-- Temporarily disable RLS to make tables publicly readable
ALTER TABLE wc_rating DISABLE ROW LEVEL SECURITY;
ALTER TABLE wc_photos DISABLE ROW LEVEL SECURITY;
ALTER TABLE wcs DISABLE ROW LEVEL SECURITY;
```

**⚠️ Warning:** This removes all security restrictions. Use only for testing.

### Step 2: Proper Public RLS Policies (Recommended)

For production-ready setup, enable RLS with public read policies:

#### 2.1 Setup for wc_rating table
```sql
-- Enable RLS
ALTER TABLE wc_rating ENABLE ROW LEVEL SECURITY;

-- Remove all existing policies
DROP POLICY IF EXISTS "wc_rating_select_policy" ON wc_rating;
DROP POLICY IF EXISTS "wc_rating_insert_policy" ON wc_rating;
DROP POLICY IF EXISTS "wc_rating_update_policy" ON wc_rating;
DROP POLICY IF EXISTS "wc_rating_delete_policy" ON wc_rating;

-- Create public read policy
CREATE POLICY "Enable read access for all users" ON wc_rating
    FOR SELECT USING (true);

-- Create authenticated write policies
CREATE POLICY "Enable insert for authenticated users only" ON wc_rating
    FOR INSERT WITH CHECK (auth.uid() IS NOT NULL);

CREATE POLICY "Enable update for users based on user_id" ON wc_rating
    FOR UPDATE USING (auth.uid() = user_id);

CREATE POLICY "Enable delete for users based on user_id" ON wc_rating
    FOR DELETE USING (auth.uid() = user_id);
```

#### 2.2 Setup for wc_photos table
```sql
-- Enable RLS
ALTER TABLE wc_photos ENABLE ROW LEVEL SECURITY;

-- Remove all existing policies
DROP POLICY IF EXISTS "wc_photos_select_policy" ON wc_photos;
DROP POLICY IF EXISTS "wc_photos_insert_policy" ON wc_photos;
DROP POLICY IF EXISTS "wc_photos_update_policy" ON wc_photos;
DROP POLICY IF EXISTS "wc_photos_delete_policy" ON wc_photos;

-- Create public read policy
CREATE POLICY "Enable read access for all users" ON wc_photos
    FOR SELECT USING (true);

-- Create authenticated write policies
CREATE POLICY "Enable insert for authenticated users only" ON wc_photos
    FOR INSERT WITH CHECK (auth.uid() IS NOT NULL);

CREATE POLICY "Enable update for users based on user_id" ON wc_photos
    FOR UPDATE USING (auth.uid() = user_id);

CREATE POLICY "Enable delete for users based on user_id" ON wc_photos
    FOR DELETE USING (auth.uid() = user_id);
```

#### 2.3 Setup for wcs table
```sql
-- Enable RLS
ALTER TABLE wcs ENABLE ROW LEVEL SECURITY;

-- Remove all existing policies
DROP POLICY IF EXISTS "Enable read access for all users" ON wcs;
DROP POLICY IF EXISTS "Enable insert for authenticated users only" ON wcs;
DROP POLICY IF EXISTS "Enable update for users based on user_id" ON wcs;
DROP POLICY IF EXISTS "Enable delete for users based on user_id" ON wcs;

-- Create public read policy
CREATE POLICY "Enable read access for all users" ON wcs
    FOR SELECT USING (true);

-- Create authenticated write policies
CREATE POLICY "Enable insert for authenticated users only" ON wcs
    FOR INSERT WITH CHECK (auth.uid() IS NOT NULL);

CREATE POLICY "Enable update for users based on user_id" ON wcs
    FOR UPDATE USING (auth.uid() = user_id);

CREATE POLICY "Enable delete for users based on user_id" ON wcs
    FOR DELETE USING (auth.uid() = user_id);
```

### Step 3: Grant Permissions to Roles

```sql
-- Grant read permissions to anonymous users
GRANT SELECT ON wc_rating TO anon;
GRANT SELECT ON wc_photos TO anon;
GRANT SELECT ON wcs TO anon;

-- Grant full permissions to authenticated users
GRANT ALL ON wc_rating TO authenticated;
GRANT ALL ON wc_photos TO authenticated;
GRANT ALL ON wcs TO authenticated;

-- Grant full permissions to service_role (for API operations)
GRANT ALL ON wc_rating TO service_role;
GRANT ALL ON wc_photos TO service_role;
GRANT ALL ON wcs TO service_role;

-- Grant sequence permissions
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO anon;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO authenticated;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO service_role;
```

### Step 4: Verify Configuration

Run these queries to verify everything is set up correctly:

```sql
-- Check if policies exist
SELECT schemaname, tablename, policyname, permissive, roles, cmd
FROM pg_policies 
WHERE tablename IN ('wc_rating', 'wc_photos', 'wcs')
ORDER BY tablename, policyname;

-- Check permissions
SELECT table_name, privilege_type, grantee
FROM information_schema.table_privileges 
WHERE table_name IN ('wc_rating', 'wc_photos', 'wcs')
AND grantee IN ('anon', 'authenticated', 'service_role')
ORDER BY table_name, grantee;

-- Test public read access
SELECT COUNT(*) FROM wc_rating;
SELECT COUNT(*) FROM wc_photos;
SELECT COUNT(*) FROM wcs;
```

### Step 5: Update API Environment Variables

Ensure these are set in Vercel:

```
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJ0eXAiOiJKV1QiLCJhbGc...
SUPABASE_SERVICE_ROLE_KEY=eyJ0eXAiOiJKV1QiLCJhbGc...
```

### Step 6: Test API Endpoints

After configuration, test these URLs directly in browser:

```
https://wc-finder.vercel.app/api/wc-ratings?wc_id=b5d15912-f193-4e70-b687-932359840357
https://wc-finder.vercel.app/api/wc-photos?wc_id=b5d15912-f193-4e70-b687-932359840357
```

They should return JSON data instead of 500 errors.

## Alternative: Use Supabase Client Directly

If API routes still cause issues, you can call Supabase directly from the frontend:

### Frontend Implementation Example:

```javascript
import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
);

// Fetch ratings directly from Supabase
const fetchRatings = async (wcId) => {
  const { data, error } = await supabase
    .from('wc_rating')
    .select('*')
    .eq('wc_id', wcId);
  
  if (error) {
    console.error('Error fetching ratings:', error);
    return [];
  }
  
  return data;
};

// Fetch photos directly from Supabase
const fetchPhotos = async (wcId) => {
  const { data, error } = await supabase
    .from('wc_photos')
    .select('*')
    .eq('wc_id', wcId);
  
  if (error) {
    console.error('Error fetching photos:', error);
    return [];
  }
  
  return data;
};
```

## Security Considerations

### What This Setup Allows:
- ✅ Anyone can read WC data, ratings, and photos
- ✅ Only authenticated users can create/edit content
- ✅ Users can only edit their own ratings/photos
- ✅ API endpoints work without authentication for reads

### What This Setup Protects:
- 🔒 Anonymous users cannot create/edit/delete data
- 🔒 Users cannot edit other users' content
- 🔒 Service role operations are protected

## Troubleshooting

### If you still get 500 errors:

1. **Check Supabase logs:**
   - Go to Supabase Dashboard → Logs
   - Look for API errors

2. **Verify tables exist:**
   ```sql
   SELECT table_name FROM information_schema.tables 
   WHERE table_schema = 'public' 
   AND table_name IN ('wc_rating', 'wc_photos', 'wcs');
   ```

3. **Test with curl:**
   ```bash
   curl "https://your-project.supabase.co/rest/v1/wc_rating?select=*" \
   -H "apikey: YOUR_ANON_KEY" \
   -H "Authorization: Bearer YOUR_ANON_KEY"
   ```

### Emergency Fallback:

If nothing works, temporarily disable all RLS:

```sql
-- EMERGENCY: Disable all RLS (removes all security)
ALTER TABLE wc_rating DISABLE ROW LEVEL SECURITY;
ALTER TABLE wc_photos DISABLE ROW LEVEL SECURITY;
ALTER TABLE wcs DISABLE ROW LEVEL SECURITY;
```

## Success Verification

After implementing this setup:
- ✅ API endpoints return 200 OK instead of 500 errors
- ✅ WC editing page loads without errors
- ✅ Ratings and photos display correctly
- ✅ Application works the same as localhost

This configuration makes your Supabase tables publicly readable while maintaining security for write operations, which should resolve all the API issues on Vercel.