-- Add place_type column to wcs table
-- This column will store the type of place where the WC is located

-- Add the place_type column with enum constraint
ALTER TABLE wcs ADD COLUMN place_type TEXT;

-- Add constraint to ensure only valid place types are allowed
ALTER TABLE wcs ADD CONSTRAINT place_type_valid CHECK (
    place_type IN (
        'toilet',
        'public_toilet',
        'tourist_attraction',
        'shopping_mall',
        'restaurant',
        'cafe',
        'bar',
        'park',
        'train_station',
        'subway_station',
        'bus_station',
        'airport',
        'gas_station',
        'library',
        'museum',
        'movie_theater',
        'city_hall',
        'supermarket',
        'department_store'
    )
);

-- Set default value for existing records (can be changed later)
UPDATE wcs SET place_type = 'toilet' WHERE place_type IS NULL;

-- Make the column NOT NULL after setting default values
ALTER TABLE wcs ALTER COLUMN place_type SET NOT NULL;

-- Add index for better performance when filtering by place_type
CREATE INDEX IF NOT EXISTS idx_wcs_place_type ON wcs(place_type);

-- Add comment to document the purpose of the column
COMMENT ON COLUMN wcs.place_type IS 'Type of place where the WC is located (e.g., restaurant, park, shopping_mall, etc.)';
