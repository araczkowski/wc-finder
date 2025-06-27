-- Complete Database Setup Script for WC Finder with Tags
-- This script creates all necessary tables and functions for the WC Finder application
-- Run this script in your Supabase SQL Editor

BEGIN;

-- Step 1: Enable PostGIS extension (if not already enabled)
CREATE EXTENSION IF NOT EXISTS postgis;

-- Step 2: Create or update main wcs table
CREATE TABLE IF NOT EXISTS wcs (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    created_by TEXT NOT NULL,
    name TEXT NOT NULL,
    location GEOGRAPHY(POINT, 4326),
    address TEXT,
    place_type TEXT DEFAULT 'toilet',
    image_url TEXT,
    rating INTEGER CHECK (rating >= 1 AND rating <= 10),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);

-- Step 3: Create indexes for wcs table
CREATE INDEX IF NOT EXISTS idx_wcs_user_id ON wcs(user_id);
CREATE INDEX IF NOT EXISTS idx_wcs_name ON wcs(name);
CREATE INDEX IF NOT EXISTS idx_wcs_created_at ON wcs(created_at);
CREATE INDEX IF NOT EXISTS idx_wcs_address ON wcs USING gin(to_tsvector('english', address));
CREATE INDEX IF NOT EXISTS wcs_geo_index ON wcs USING GIST (location);

-- Step 4: Create wc_tags table
CREATE TABLE IF NOT EXISTS wc_tags (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    wc_id UUID NOT NULL REFERENCES wcs(id) ON DELETE CASCADE,
    tag TEXT NOT NULL,
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);

-- Step 5: Create indexes for wc_tags table
CREATE INDEX IF NOT EXISTS idx_wc_tags_wc_id ON wc_tags(wc_id);
CREATE INDEX IF NOT EXISTS idx_wc_tags_tag ON wc_tags(tag);
CREATE INDEX IF NOT EXISTS idx_wc_tags_user_id ON wc_tags(user_id);
CREATE INDEX IF NOT EXISTS idx_wc_tags_created_at ON wc_tags(created_at);

-- Create unique constraint to prevent duplicate tags for the same WC by the same user
CREATE UNIQUE INDEX IF NOT EXISTS idx_wc_tags_unique_user_wc_tag ON wc_tags(wc_id, tag, user_id);

-- Step 6: Create wc_photos table (if not exists)
CREATE TABLE IF NOT EXISTS wc_photos (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    wc_id UUID NOT NULL REFERENCES wcs(id) ON DELETE CASCADE,
    photo TEXT NOT NULL,
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);

-- Step 7: Create indexes for wc_photos table
CREATE INDEX IF NOT EXISTS idx_wc_photos_wc_id ON wc_photos(wc_id);
CREATE INDEX IF NOT EXISTS idx_wc_photos_user_id ON wc_photos(user_id);
CREATE INDEX IF NOT EXISTS idx_wc_photos_created_at ON wc_photos(created_at);

-- Step 8: Create wc_ratings table (if not exists)
CREATE TABLE IF NOT EXISTS wc_ratings (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    wc_id UUID NOT NULL REFERENCES wcs(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 10),
    comment TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);

-- Step 9: Create indexes for wc_ratings table
CREATE INDEX IF NOT EXISTS idx_wc_ratings_wc_id ON wc_ratings(wc_id);
CREATE INDEX IF NOT EXISTS idx_wc_ratings_user_id ON wc_ratings(user_id);
CREATE INDEX IF NOT EXISTS idx_wc_ratings_created_at ON wc_ratings(created_at);

-- Create unique constraint to ensure one rating per user per WC
CREATE UNIQUE INDEX IF NOT EXISTS idx_wc_ratings_unique_user_wc ON wc_ratings(wc_id, user_id);

-- Step 10: Add table comments
COMMENT ON TABLE wcs IS 'Main table storing WC location data submitted by users';
COMMENT ON TABLE wc_tags IS 'Table storing tags assigned to WC locations by users';
COMMENT ON TABLE wc_photos IS 'Table storing photos for WC locations';
COMMENT ON TABLE wc_ratings IS 'Table storing user ratings and comments for WC locations';

-- Step 11: Add column comments
COMMENT ON COLUMN wcs.user_id IS 'Reference to the user who created this WC entry';
COMMENT ON COLUMN wcs.created_by IS 'Email of the user who created this WC entry';
COMMENT ON COLUMN wcs.name IS 'Name or title of the WC location';
COMMENT ON COLUMN wcs.location IS 'Geographic coordinates stored as PostGIS GEOGRAPHY(POINT) for efficient distance calculations';
COMMENT ON COLUMN wcs.address IS 'Human-readable address (e.g., "ul. Marszałkowska 1, Warszawa")';
COMMENT ON COLUMN wcs.place_type IS 'Type of place (toilet, restaurant, gas_station, etc.)';
COMMENT ON COLUMN wcs.image_url IS 'URL to the main image of the WC location';
COMMENT ON COLUMN wcs.rating IS 'Initial rating provided by the user who added the WC (1-10 scale)';

COMMENT ON COLUMN wc_tags.wc_id IS 'Reference to the WC that this tag belongs to';
COMMENT ON COLUMN wc_tags.tag IS 'The tag text (e.g., "płatna", "darmowa", "przewijak", "dostępnaDlaNiepełnosprawnych")';
COMMENT ON COLUMN wc_tags.user_id IS 'Reference to the user who added this tag';

-- Step 12: Enable Row Level Security
ALTER TABLE wcs ENABLE ROW LEVEL SECURITY;
ALTER TABLE wc_tags ENABLE ROW LEVEL SECURITY;
ALTER TABLE wc_photos ENABLE ROW LEVEL SECURITY;
ALTER TABLE wc_ratings ENABLE ROW LEVEL SECURITY;

-- Step 13: Create RLS Policies for wcs table
DROP POLICY IF EXISTS "public_read_wcs" ON wcs;
DROP POLICY IF EXISTS "auth_insert_wcs" ON wcs;
DROP POLICY IF EXISTS "auth_update_wcs" ON wcs;
DROP POLICY IF EXISTS "auth_delete_wcs" ON wcs;

CREATE POLICY "public_read_wcs" ON wcs FOR SELECT USING (true);
CREATE POLICY "auth_insert_wcs" ON wcs FOR INSERT WITH CHECK (auth.uid() IS NOT NULL);
CREATE POLICY "auth_update_wcs" ON wcs FOR UPDATE USING (auth.uid() = user_id);
CREATE POLICY "auth_delete_wcs" ON wcs FOR DELETE USING (auth.uid() = user_id);

-- Step 14: Create RLS Policies for wc_tags table
DROP POLICY IF EXISTS "public_read_wc_tags" ON wc_tags;
DROP POLICY IF EXISTS "auth_insert_wc_tags" ON wc_tags;
DROP POLICY IF EXISTS "auth_delete_wc_tags" ON wc_tags;

CREATE POLICY "public_read_wc_tags" ON wc_tags FOR SELECT USING (true);
CREATE POLICY "auth_insert_wc_tags" ON wc_tags FOR INSERT WITH CHECK (auth.uid() IS NOT NULL AND auth.uid() = user_id);
CREATE POLICY "auth_delete_wc_tags" ON wc_tags FOR DELETE USING (auth.uid() = user_id);

-- Step 15: Create RLS Policies for wc_photos table
DROP POLICY IF EXISTS "public_read_wc_photos" ON wc_photos;
DROP POLICY IF EXISTS "auth_insert_wc_photos" ON wc_photos;
DROP POLICY IF EXISTS "auth_delete_wc_photos" ON wc_photos;

CREATE POLICY "public_read_wc_photos" ON wc_photos FOR SELECT USING (true);
CREATE POLICY "auth_insert_wc_photos" ON wc_photos FOR INSERT WITH CHECK (auth.uid() IS NOT NULL);
CREATE POLICY "auth_delete_wc_photos" ON wc_photos FOR DELETE USING (auth.uid() = user_id);

-- Step 16: Create RLS Policies for wc_ratings table
DROP POLICY IF EXISTS "public_read_wc_ratings" ON wc_ratings;
DROP POLICY IF EXISTS "auth_insert_wc_ratings" ON wc_ratings;
DROP POLICY IF EXISTS "auth_update_wc_ratings" ON wc_ratings;
DROP POLICY IF EXISTS "auth_delete_wc_ratings" ON wc_ratings;

CREATE POLICY "public_read_wc_ratings" ON wc_ratings FOR SELECT USING (true);
CREATE POLICY "auth_insert_wc_ratings" ON wc_ratings FOR INSERT WITH CHECK (auth.uid() IS NOT NULL);
CREATE POLICY "auth_update_wc_ratings" ON wc_ratings FOR UPDATE USING (auth.uid() = user_id);
CREATE POLICY "auth_delete_wc_ratings" ON wc_ratings FOR DELETE USING (auth.uid() = user_id);

-- Step 17: Create trigger functions
CREATE OR REPLACE FUNCTION update_wcs_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = TIMEZONE('utc'::text, NOW());
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE OR REPLACE FUNCTION update_wc_ratings_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = TIMEZONE('utc'::text, NOW());
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Step 18: Create triggers
DROP TRIGGER IF EXISTS update_wcs_updated_at_trigger ON wcs;
CREATE TRIGGER update_wcs_updated_at_trigger
    BEFORE UPDATE ON wcs
    FOR EACH ROW
    EXECUTE FUNCTION update_wcs_updated_at();

DROP TRIGGER IF EXISTS update_wc_ratings_updated_at_trigger ON wc_ratings;
CREATE TRIGGER update_wc_ratings_updated_at_trigger
    BEFORE UPDATE ON wc_ratings
    FOR EACH ROW
    EXECUTE FUNCTION update_wc_ratings_updated_at();

-- Step 19: Create PostGIS helper functions
CREATE OR REPLACE FUNCTION get_wcs_by_distance(
    user_lat DOUBLE PRECISION,
    user_lng DOUBLE PRECISION,
    page_offset INTEGER DEFAULT 0,
    page_limit INTEGER DEFAULT 10
)
RETURNS TABLE (
    id UUID,
    user_id UUID,
    created_by TEXT,
    name TEXT,
    location GEOGRAPHY,
    address TEXT,
    place_type TEXT,
    image_url TEXT,
    rating INTEGER,
    created_at TIMESTAMPTZ,
    updated_at TIMESTAMPTZ,
    distance_km DOUBLE PRECISION
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        w.id,
        w.user_id,
        w.created_by,
        w.name,
        w.location,
        w.address,
        w.place_type,
        w.image_url,
        w.rating,
        w.created_at,
        w.updated_at,
        ROUND(
            (ST_Distance(
                w.location,
                ST_Point(user_lng, user_lat)::GEOGRAPHY
            ) / 1000)::NUMERIC,
            2
        )::DOUBLE PRECISION AS distance_km
    FROM wcs w
    WHERE w.location IS NOT NULL
    ORDER BY w.location <-> ST_Point(user_lng, user_lat)::GEOGRAPHY
    LIMIT page_limit
    OFFSET page_offset;
END;
$$ LANGUAGE plpgsql;

-- Step 20: Grant permissions
GRANT SELECT ON wcs TO anon;
GRANT ALL ON wcs TO authenticated;
GRANT ALL ON wcs TO service_role;

GRANT SELECT ON wc_tags TO anon;
GRANT ALL ON wc_tags TO authenticated;
GRANT ALL ON wc_tags TO service_role;

GRANT SELECT ON wc_photos TO anon;
GRANT ALL ON wc_photos TO authenticated;
GRANT ALL ON wc_photos TO service_role;

GRANT SELECT ON wc_ratings TO anon;
GRANT ALL ON wc_ratings TO authenticated;
GRANT ALL ON wc_ratings TO service_role;

-- Step 21: Grant function execution permissions
GRANT EXECUTE ON FUNCTION get_wcs_by_distance TO authenticated;
GRANT EXECUTE ON FUNCTION get_wcs_by_distance TO service_role;

COMMIT;

-- Step 22: Verification queries
SELECT 'wcs table' as table_name, count(*) as record_count FROM wcs
UNION ALL
SELECT 'wc_tags table' as table_name, count(*) as record_count FROM wc_tags
UNION ALL
SELECT 'wc_photos table' as table_name, count(*) as record_count FROM wc_photos
UNION ALL
SELECT 'wc_ratings table' as table_name, count(*) as record_count FROM wc_ratings;

-- Show PostGIS extension status
SELECT name, default_version, installed_version
FROM pg_available_extensions
WHERE name = 'postgis';

-- Show available tag types (you can add more predefined tags here)
SELECT 'Available tags:' as info, 'płatna, darmowa, przewijak, dostępnaDlaNiepełnosprawnych' as available_tags;
