-- WC Photos Table RLS Policies
-- This file contains all Row Level Security policies for the wc_photos table

-- First, ensure RLS is enabled on wc_photos table
ALTER TABLE wc_photos ENABLE ROW LEVEL SECURITY;

-- Drop existing policies if they exist to avoid conflicts
DROP POLICY IF EXISTS "Users can view all wc photos" ON wc_photos;
DROP POLICY IF EXISTS "Authenticated users can insert wc photos" ON wc_photos;
DROP POLICY IF EXISTS "Users can update their own wc photos" ON wc_photos;
DROP POLICY IF EXISTS "Users can delete their own wc photos" ON wc_photos;
DROP POLICY IF EXISTS "Service role can manage all wc photos" ON wc_photos;
DROP POLICY IF EXISTS "Public can view wc photos" ON wc_photos;
DROP POLICY IF EXISTS "Authenticated users can upload wc photos" ON wc_photos;

-- Policy 1: Allow public read access to all WC photos
-- This allows anyone (authenticated or not) to view photos
CREATE POLICY "Public can view wc photos" ON wc_photos
    FOR SELECT
    USING (true);

-- Policy 2: Allow authenticated users to insert photos
-- Users can only insert photos with their own user_id
CREATE POLICY "Authenticated users can upload wc photos" ON wc_photos
    FOR INSERT
    WITH CHECK (
        auth.uid() IS NOT NULL
        AND auth.uid() = user_id
    );

-- Policy 3: Allow users to update their own photos
-- Users can only update photos they uploaded
CREATE POLICY "Users can update their own wc photos" ON wc_photos
    FOR UPDATE
    USING (auth.uid() = user_id)
    WITH CHECK (auth.uid() = user_id);

-- Policy 4: Allow users to delete their own photos
-- Users can only delete photos they uploaded
CREATE POLICY "Users can delete their own wc photos" ON wc_photos
    FOR DELETE
    USING (auth.uid() = user_id);

-- Policy 5: Allow service role full access (for API operations)
-- This is crucial for server-side operations using service role key
CREATE POLICY "Service role can manage all wc photos" ON wc_photos
    FOR ALL
    USING (
        auth.jwt() ->> 'role' = 'service_role'
        OR auth.role() = 'service_role'
    )
    WITH CHECK (
        auth.jwt() ->> 'role' = 'service_role'
        OR auth.role() = 'service_role'
    );

-- Alternative approach: Bypass RLS for service role entirely
-- Uncomment this if the above service role policy doesn't work
-- ALTER TABLE wc_photos FORCE ROW LEVEL SECURITY;

-- Grant necessary permissions to authenticated users
GRANT SELECT ON wc_photos TO authenticated;
GRANT INSERT ON wc_photos TO authenticated;
GRANT UPDATE ON wc_photos TO authenticated;
GRANT DELETE ON wc_photos TO authenticated;

-- Grant full permissions to service role
GRANT ALL ON wc_photos TO service_role;

-- Grant usage on the sequence (for ID generation)
GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO authenticated;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO service_role;

-- Verify policies are created correctly
-- Run this to check if policies exist:
-- SELECT schemaname, tablename, policyname, permissive, roles, cmd, qual
-- FROM pg_policies
-- WHERE tablename = 'wc_photos';

-- Test the policies with sample queries:
-- As authenticated user: SELECT * FROM wc_photos;
-- As service role: SELECT * FROM wc_photos;
-- INSERT test: INSERT INTO wc_photos (wc_id, user_id, photo) VALUES (...);
