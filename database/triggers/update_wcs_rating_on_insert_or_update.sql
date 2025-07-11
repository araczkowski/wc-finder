-- Trigger function to update WCs rating based on wcs_rating table
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
CREATE OR REPLACE TRIGGER update_wcs_rating_on_insert_or_update
    AFTER INSERT OR UPDATE ON wcs_rating
    FOR EACH ROW
    EXECUTE FUNCTION update_wcs_rating();

-- Create trigger for DELETE operations to handle rating updates when ratings are removed
CREATE OR REPLACE TRIGGER update_wcs_rating_on_delete
    AFTER DELETE ON wcs_rating
    FOR EACH ROW
    EXECUTE FUNCTION update_wcs_rating();
