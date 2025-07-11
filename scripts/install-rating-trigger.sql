-- Install script for WCs rating trigger
-- This script creates the trigger function and triggers to automatically update
-- the rating field in wcs table based on the average of wcs_rating entries

-- Drop existing triggers and function if they exist
DROP TRIGGER IF EXISTS update_wcs_rating_on_insert_or_update ON wcs_rating;
DROP TRIGGER IF EXISTS update_wcs_rating_on_delete ON wcs_rating;
DROP FUNCTION IF EXISTS update_wcs_rating();

-- Create the trigger function
CREATE OR REPLACE FUNCTION update_wcs_rating()
RETURNS TRIGGER AS $$
BEGIN
    -- Update the rating in wcs table by calculating average from wcs_rating
    UPDATE wcs
    SET rating = (
        SELECT COALESCE(ROUND(AVG(rating)::numeric, 2), 0)
        FROM wcs_rating
        WHERE wc_id = COALESCE(NEW.wc_id, OLD.wc_id)
    )
    WHERE id = COALESCE(NEW.wc_id, OLD.wc_id);

    RETURN COALESCE(NEW, OLD);
END;
$$ LANGUAGE plpgsql;

-- Create trigger for INSERT and UPDATE operations
CREATE TRIGGER update_wcs_rating_on_insert_or_update
    AFTER INSERT OR UPDATE ON wcs_rating
    FOR EACH ROW
    EXECUTE FUNCTION update_wcs_rating();

-- Create trigger for DELETE operations to handle rating updates when ratings are removed
CREATE TRIGGER update_wcs_rating_on_delete
    AFTER DELETE ON wcs_rating
    FOR EACH ROW
    EXECUTE FUNCTION update_wcs_rating();

-- Optional: Update all existing WCs ratings based on current wcs_rating data
-- Uncomment the following lines if you want to recalculate all ratings immediately

-- UPDATE wcs
-- SET rating = (
--     SELECT COALESCE(ROUND(AVG(r.rating)::numeric, 2), 0)
--     FROM wcs_rating r
--     WHERE r.wc_id = wcs.id
-- );

-- Confirm installation
SELECT 'Rating trigger installed successfully!' as status;
