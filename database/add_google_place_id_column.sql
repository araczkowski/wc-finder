-- Add google_place_id column to wcs table for storing Google Maps place references
-- This column will help us track which WCs were imported from Google Maps and prevent duplicates

ALTER TABLE wcs ADD COLUMN IF NOT EXISTS google_place_id TEXT;

-- Add index for faster lookups when checking for existing places
CREATE INDEX IF NOT EXISTS idx_wcs_google_place_id ON wcs(google_place_id);

-- Add comment to document the purpose of the column
COMMENT ON COLUMN wcs.google_place_id IS 'Google Maps place ID for places imported from Google Maps API';

-- Add constraint to ensure google_place_id is unique when not null
ALTER TABLE wcs ADD CONSTRAINT unique_google_place_id UNIQUE (google_place_id);
