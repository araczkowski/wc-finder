-- Simple and working RLS policies for wc_photos table
-- This approach uses minimal policies that work reliably on Vercel

-- Enable RLS on wc_photos table
ALTER TABLE wc_photos ENABLE ROW LEVEL SECURITY;

-- Drop all existing policies to start fresh
DO $$
DECLARE
    pol record;
BEGIN
    FOR pol IN SELECT policyname FROM pg_policies WHERE tablename = 'wc_photos'
    LOOP
        EXECUTE 'DROP POLICY IF EXISTS ' || quote_ident(pol.policyname) || ' ON wc_photos';
    END LOOP;
END $$;

-- Policy 1: Allow anyone to view photos (SELECT)
-- Simple public read access
CREATE POLICY "wc_photos_select_policy" ON wc_photos
    FOR SELECT
    USING (true);

-- Policy 2: Allow authenticated users to insert photos (INSERT)
-- Users can insert photos for any WC if they are authenticated
CREATE POLICY "wc_photos_insert_policy" ON wc_photos
    FOR INSERT
    WITH CHECK (auth.uid() IS NOT NULL);

-- Policy 3: Allow users to update their own photos (UPDATE)
CREATE POLICY "wc_photos_update_policy" ON wc_photos
    FOR UPDATE
    USING (auth.uid() = user_id);

-- Policy 4: Allow users to delete their own photos (DELETE)
CREATE POLICY "wc_photos_delete_policy" ON wc_photos
    FOR DELETE
    USING (auth.uid() = user_id);

-- Alternative: Disable RLS entirely for wc_photos (if policies don't work)
-- Uncomment the line below if you continue having issues:
-- ALTER TABLE wc_photos DISABLE ROW LEVEL SECURITY;

-- Grant explicit permissions to roles
GRANT SELECT, INSERT, UPDATE, DELETE ON wc_photos TO authenticated;
GRANT ALL PRIVILEGES ON wc_photos TO service_role;
GRANT ALL PRIVILEGES ON wc_photos TO postgres;

-- Grant sequence usage permissions
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO authenticated;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO service_role;

-- Test query to verify policies work:
-- SELECT * FROM wc_photos LIMIT 1;
