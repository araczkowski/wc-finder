-- Create wc_tags table for storing WC tags
-- This table stores tags that users can assign to WC locations

CREATE TABLE IF NOT EXISTS wc_tags (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    wc_id UUID NOT NULL REFERENCES wcs(id) ON DELETE CASCADE,
    tag TEXT NOT NULL,
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_wc_tags_wc_id ON wc_tags(wc_id);
CREATE INDEX IF NOT EXISTS idx_wc_tags_tag ON wc_tags(tag);
CREATE INDEX IF NOT EXISTS idx_wc_tags_user_id ON wc_tags(user_id);
CREATE INDEX IF NOT EXISTS idx_wc_tags_created_at ON wc_tags(created_at);

-- Create unique constraint to prevent duplicate tags for the same WC by the same user
CREATE UNIQUE INDEX IF NOT EXISTS idx_wc_tags_unique_user_wc_tag ON wc_tags(wc_id, tag, user_id);

-- Add comments to document the purpose of columns
COMMENT ON TABLE wc_tags IS 'Table storing tags assigned to WC locations by users';
COMMENT ON COLUMN wc_tags.wc_id IS 'Reference to the WC that this tag belongs to';
COMMENT ON COLUMN wc_tags.tag IS 'The tag text (e.g., "płatna", "darmowa", "przewijak", "dostępnaDlaNiepełnosprawnych")';
COMMENT ON COLUMN wc_tags.user_id IS 'Reference to the user who added this tag';

-- Enable Row Level Security
ALTER TABLE wc_tags ENABLE ROW LEVEL SECURITY;

-- Create RLS Policies
-- Public read access for all users (anyone can see tags)
CREATE POLICY "public_read_wc_tags" ON wc_tags FOR SELECT USING (true);

-- Authenticated users can insert new tags
CREATE POLICY "auth_insert_wc_tags" ON wc_tags FOR INSERT WITH CHECK (auth.uid() IS NOT NULL AND auth.uid() = user_id);

-- Users can delete their own tags
CREATE POLICY "auth_delete_wc_tags" ON wc_tags FOR DELETE USING (auth.uid() = user_id);

-- Grant permissions to roles
GRANT SELECT ON wc_tags TO anon;
GRANT ALL ON wc_tags TO authenticated;
GRANT ALL ON wc_tags TO service_role;
