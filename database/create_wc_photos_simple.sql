-- Create wc_photos table for storing user-uploaded photos of WC locations
CREATE TABLE IF NOT EXISTS wc_photos (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    wc_id UUID NOT NULL,
    user_id UUID NOT NULL,
    photo TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);

-- Add foreign key constraints (only if tables exist)
DO $$
BEGIN
    -- Add foreign key to wcs table if it exists
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'wcs') THEN
        ALTER TABLE wc_photos ADD CONSTRAINT fk_wc_photos_wc_id
        FOREIGN KEY (wc_id) REFERENCES wcs(id) ON DELETE CASCADE;
    END IF;

    -- Add foreign key to auth.users if it exists
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'auth' AND table_name = 'users') THEN
        ALTER TABLE wc_photos ADD CONSTRAINT fk_wc_photos_user_id
        FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;
    END IF;
END $$;

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_wc_photos_wc_id ON wc_photos(wc_id);
CREATE INDEX IF NOT EXISTS idx_wc_photos_user_id ON wc_photos(user_id);
CREATE INDEX IF NOT EXISTS idx_wc_photos_created_at ON wc_photos(created_at);

-- Enable Row Level Security
ALTER TABLE wc_photos ENABLE ROW LEVEL SECURITY;

-- Drop existing policies if they exist
DROP POLICY IF EXISTS "Users can view all wc photos" ON wc_photos;
DROP POLICY IF EXISTS "Authenticated users can insert wc photos" ON wc_photos;
DROP POLICY IF EXISTS "Users can update their own wc photos" ON wc_photos;
DROP POLICY IF EXISTS "Users can delete their own wc photos" ON wc_photos;

-- RLS Policy: Users can view all photos
CREATE POLICY "Users can view all wc photos" ON wc_photos
    FOR SELECT USING (true);

-- RLS Policy: Authenticated users can insert photos
CREATE POLICY "Authenticated users can insert wc photos" ON wc_photos
    FOR INSERT WITH CHECK (auth.uid() = user_id);

-- RLS Policy: Users can update their own photos
CREATE POLICY "Users can update their own wc photos" ON wc_photos
    FOR UPDATE USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);

-- RLS Policy: Users can delete their own photos
CREATE POLICY "Users can delete their own wc photos" ON wc_photos
    FOR DELETE USING (auth.uid() = user_id);

-- Create function to automatically update updated_at timestamp
CREATE OR REPLACE FUNCTION update_wc_photos_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = TIMEZONE('utc'::text, NOW());
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Drop existing trigger if it exists
DROP TRIGGER IF EXISTS update_wc_photos_updated_at_trigger ON wc_photos;

-- Create trigger to automatically update updated_at timestamp
CREATE TRIGGER update_wc_photos_updated_at_trigger
    BEFORE UPDATE ON wc_photos
    FOR EACH ROW
    EXECUTE FUNCTION update_wc_photos_updated_at();

-- Add comments to table and columns for documentation
COMMENT ON TABLE wc_photos IS 'Table for storing user-uploaded photos of WC locations';
COMMENT ON COLUMN wc_photos.id IS 'Unique identifier for the photo record';
COMMENT ON COLUMN wc_photos.wc_id IS 'Foreign key reference to the WC location';
COMMENT ON COLUMN wc_photos.user_id IS 'Foreign key reference to the user who uploaded the photo';
COMMENT ON COLUMN wc_photos.photo IS 'URL or path to the photo file in storage';
COMMENT ON COLUMN wc_photos.created_at IS 'Timestamp when the photo was uploaded';
COMMENT ON COLUMN wc_photos.updated_at IS 'Timestamp when the photo record was last updated';
