-- Create policy: "Anon and Auth can view all wc_photos"
-- This policy allows both anonymous (not logged in) and authenticated users to view all photos

-- First, ensure RLS is enabled on wc_photos table
ALTER TABLE wc_photos ENABLE ROW LEVEL SECURITY;

-- Drop the policy if it already exists
DROP POLICY IF EXISTS "Anon and Auth can view all wc_photos" ON wc_photos;

-- Create the policy for SELECT operations
-- This allows both anonymous users (anon role) and authenticated users to view all photos
CREATE POLICY "Anon and Auth can view all wc_photos" ON wc_photos
    FOR SELECT
    USING (
        -- Allow if user is authenticated OR if using anon key
        auth.uid() IS NOT NULL
        OR
        auth.role() = 'anon'
        OR
        current_setting('request.jwt.claims', true)::json->>'role' = 'anon'
        OR
        true  -- This makes it accessible to everyone (anon + auth)
    );

-- Alternative simpler version (recommended):
-- DROP POLICY IF EXISTS "Anon and Auth can view all wc_photos" ON wc_photos;
-- CREATE POLICY "Anon and Auth can view all wc_photos" ON wc_photos
--     FOR SELECT
--     USING (true);

-- Grant necessary permissions to both roles
GRANT SELECT ON wc_photos TO anon;
GRANT SELECT ON wc_photos TO authenticated;
GRANT ALL PRIVILEGES ON wc_photos TO service_role;

-- Verify the policy was created
SELECT schemaname, tablename, policyname, permissive, roles, cmd, qual
FROM pg_policies
WHERE tablename = 'wc_photos'
AND policyname = 'Anon and Auth can view all wc_photos';
