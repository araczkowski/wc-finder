-- Make Supabase tables publicly readable (for GET API endpoints)
-- This script allows anonymous users to read data while keeping writes secure

-- Disable RLS temporarily to avoid policy conflicts
ALTER TABLE wc_rating DISABLE ROW LEVEL SECURITY;
ALTER TABLE wc_photos DISABLE ROW LEVEL SECURITY;
ALTER TABLE wcs DISABLE ROW LEVEL SECURITY;

-- Re-enable RLS with proper policies
ALTER TABLE wc_rating ENABLE ROW LEVEL SECURITY;
ALTER TABLE wc_photos ENABLE ROW LEVEL SECURITY;
ALTER TABLE wcs ENABLE ROW LEVEL SECURITY;

-- Drop all existing policies to start fresh
DO $$
DECLARE
    pol record;
BEGIN
    -- Drop wc_rating policies
    FOR pol IN SELECT policyname FROM pg_policies WHERE tablename = 'wc_rating'
    LOOP
        EXECUTE 'DROP POLICY IF EXISTS ' || quote_ident(pol.policyname) || ' ON wc_rating';
    END LOOP;

    -- Drop wc_photos policies
    FOR pol IN SELECT policyname FROM pg_policies WHERE tablename = 'wc_photos'
    LOOP
        EXECUTE 'DROP POLICY IF EXISTS ' || quote_ident(pol.policyname) || ' ON wc_photos';
    END LOOP;

    -- Drop wcs policies
    FOR pol IN SELECT policyname FROM pg_policies WHERE tablename = 'wcs'
    LOOP
        EXECUTE 'DROP POLICY IF EXISTS ' || quote_ident(pol.policyname) || ' ON wcs';
    END LOOP;
END $$;

-- Create public read policies for all tables
CREATE POLICY "public_read_wc_rating" ON wc_rating FOR SELECT USING (true);
CREATE POLICY "public_read_wc_photos" ON wc_photos FOR SELECT USING (true);
CREATE POLICY "public_read_wcs" ON wcs FOR SELECT USING (true);

-- Create authenticated write policies
CREATE POLICY "auth_insert_wc_rating" ON wc_rating FOR INSERT WITH CHECK (auth.uid() IS NOT NULL);
CREATE POLICY "auth_update_wc_rating" ON wc_rating FOR UPDATE USING (auth.uid() = user_id);
CREATE POLICY "auth_delete_wc_rating" ON wc_rating FOR DELETE USING (auth.uid() = user_id);

CREATE POLICY "auth_insert_wc_photos" ON wc_photos FOR INSERT WITH CHECK (auth.uid() IS NOT NULL);
CREATE POLICY "auth_update_wc_photos" ON wc_photos FOR UPDATE USING (auth.uid() = user_id);
CREATE POLICY "auth_delete_wc_photos" ON wc_photos FOR DELETE USING (auth.uid() = user_id);

CREATE POLICY "auth_insert_wcs" ON wcs FOR INSERT WITH CHECK (auth.uid() IS NOT NULL);
CREATE POLICY "auth_update_wcs" ON wcs FOR UPDATE USING (auth.uid() = user_id);
CREATE POLICY "auth_delete_wcs" ON wcs FOR DELETE USING (auth.uid() = user_id);

-- Grant permissions to roles
GRANT SELECT ON wc_rating TO anon;
GRANT SELECT ON wc_photos TO anon;
GRANT SELECT ON wcs TO anon;

GRANT ALL ON wc_rating TO authenticated;
GRANT ALL ON wc_photos TO authenticated;
GRANT ALL ON wcs TO authenticated;

GRANT ALL ON wc_rating TO service_role;
GRANT ALL ON wc_photos TO service_role;
GRANT ALL ON wcs TO service_role;

-- Grant sequence permissions
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO anon;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO authenticated;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO service_role;

-- Verify the setup
SELECT 'Setup completed successfully!' as status;

-- Show created policies
SELECT tablename, policyname, cmd as operation
FROM pg_policies
WHERE tablename IN ('wc_rating', 'wc_photos', 'wcs')
ORDER BY tablename, policyname;
