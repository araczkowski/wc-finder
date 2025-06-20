-- Create main wcs table for storing WC locations
-- This is the primary table that stores all WC location data

CREATE TABLE IF NOT EXISTS wcs (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    created_by TEXT NOT NULL,
    name TEXT NOT NULL,
    location TEXT,
    address TEXT,
    image_url TEXT,
    rating INTEGER CHECK (rating >= 1 AND rating <= 10),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_wcs_user_id ON wcs(user_id);
CREATE INDEX IF NOT EXISTS idx_wcs_name ON wcs(name);
CREATE INDEX IF NOT EXISTS idx_wcs_location ON wcs(location);
CREATE INDEX IF NOT EXISTS idx_wcs_created_at ON wcs(created_at);

-- Create index on address column for faster text searches
CREATE INDEX IF NOT EXISTS idx_wcs_address ON wcs USING gin(to_tsvector('english', address));

-- Add comments to document the purpose of columns
COMMENT ON TABLE wcs IS 'Main table storing WC location data submitted by users';
COMMENT ON COLUMN wcs.user_id IS 'Reference to the user who created this WC entry';
COMMENT ON COLUMN wcs.created_by IS 'Email of the user who created this WC entry';
COMMENT ON COLUMN wcs.name IS 'Name or title of the WC location';
COMMENT ON COLUMN wcs.location IS 'Geographic coordinates in format "latitude,longitude" (e.g., "52.2297,21.0122")';
COMMENT ON COLUMN wcs.address IS 'Human-readable address (e.g., "ul. Marszałkowska 1, Warszawa")';
COMMENT ON COLUMN wcs.image_url IS 'URL to the main image of the WC location';
COMMENT ON COLUMN wcs.rating IS 'Initial rating provided by the user who added the WC (1-10 scale)';

-- Enable Row Level Security
ALTER TABLE wcs ENABLE ROW LEVEL SECURITY;

-- Create RLS Policies
-- Public read access for all users
CREATE POLICY "public_read_wcs" ON wcs FOR SELECT USING (true);

-- Authenticated users can insert new WCs
CREATE POLICY "auth_insert_wcs" ON wcs FOR INSERT WITH CHECK (auth.uid() IS NOT NULL);

-- Users can update their own WCs
CREATE POLICY "auth_update_wcs" ON wcs FOR UPDATE USING (auth.uid() = user_id);

-- Users can delete their own WCs
CREATE POLICY "auth_delete_wcs" ON wcs FOR DELETE USING (auth.uid() = user_id);

-- Create function to automatically update updated_at timestamp
CREATE OR REPLACE FUNCTION update_wcs_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = TIMEZONE('utc'::text, NOW());
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Create trigger to automatically update updated_at timestamp
DROP TRIGGER IF EXISTS update_wcs_updated_at_trigger ON wcs;
CREATE TRIGGER update_wcs_updated_at_trigger
    BEFORE UPDATE ON wcs
    FOR EACH ROW
    EXECUTE FUNCTION update_wcs_updated_at();

-- Grant permissions to roles
GRANT SELECT ON wcs TO anon;
GRANT ALL ON wcs TO authenticated;
GRANT ALL ON wcs TO service_role;
