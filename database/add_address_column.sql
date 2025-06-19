-- Add address column to wcs table
-- This script adds a new 'address' column to store human-readable addresses
-- while keeping the existing 'location' column for coordinates

ALTER TABLE wcs
ADD COLUMN address TEXT;

-- Add comment to document the purpose of the new column
COMMENT ON COLUMN wcs.address IS 'Human-readable address (e.g., "ul. Marszałkowska 1, Warszawa")';

-- Update existing comment for location column to clarify its new purpose
COMMENT ON COLUMN wcs.location IS 'Geographic coordinates in format "latitude,longitude" (e.g., "52.2297,21.0122")';

-- Optional: Create an index on address column for faster text searches
CREATE INDEX idx_wcs_address ON wcs USING gin(to_tsvector('english', address));
