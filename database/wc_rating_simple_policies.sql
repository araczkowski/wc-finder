-- Simple and working RLS policies for wc_rating table
-- This approach uses minimal policies that work reliably on Vercel

-- Enable RLS on wc_rating table
ALTER TABLE wc_rating ENABLE ROW LEVEL SECURITY;

-- Drop all existing policies to start fresh
DO $$
DECLARE
    pol record;
BEGIN
    FOR pol IN SELECT policyname FROM pg_policies WHERE tablename = 'wc_rating'
    LOOP
        EXECUTE 'DROP POLICY IF EXISTS ' || quote_ident(pol.policyname) || ' ON wc_rating';
    END LOOP;
END $$;

-- Policy 1: Allow anyone to view ratings (SELECT)
-- Simple public read access
CREATE POLICY "wc_rating_select_policy" ON wc_rating
    FOR SELECT
    USING (true);

-- Policy 2: Allow authenticated users to insert ratings (INSERT)
-- Users can insert ratings for any WC if they are authenticated
CREATE POLICY "wc_rating_insert_policy" ON wc_rating
    FOR INSERT
    WITH CHECK (auth.uid() IS NOT NULL AND auth.uid() = user_id);

-- Policy 3: Allow users to update their own ratings (UPDATE)
CREATE POLICY "wc_rating_update_policy" ON wc_rating
    FOR UPDATE
    USING (auth.uid() = user_id)
    WITH CHECK (auth.uid() = user_id);

-- Policy 4: Allow users to delete their own ratings (DELETE)
CREATE POLICY "wc_rating_delete_policy" ON wc_rating
    FOR DELETE
    USING (auth.uid() = user_id);

-- Alternative: Disable RLS entirely for wc_rating (if policies don't work)
-- Uncomment the line below if you continue having issues:
-- ALTER TABLE wc_rating DISABLE ROW LEVEL SECURITY;

-- Grant explicit permissions to roles
GRANT SELECT, INSERT, UPDATE, DELETE ON wc_rating TO authenticated;
GRANT ALL PRIVILEGES ON wc_rating TO service_role;
GRANT ALL PRIVILEGES ON wc_rating TO postgres;

-- Grant sequence usage permissions
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO authenticated;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO service_role;

-- Test query to verify policies work:
-- SELECT * FROM wc_rating LIMIT 1;
