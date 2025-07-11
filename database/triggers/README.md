# Database Triggers Documentation

## Rating Update Trigger

### Overview
The `update_wcs_rating_on_insert_or_update` trigger automatically maintains the `rating` field in the `wcs` table by calculating the average rating from the `wcs_rating` table whenever ratings are added, updated, or deleted.

### Files
- `update_wcs_rating_on_insert_or_update.sql` - Main trigger definition
- `../scripts/install-rating-trigger.sql` - Installation script
- `../scripts/test-rating-trigger.sql` - Test script

### Functionality
The trigger consists of:
1. **Function**: `update_wcs_rating()` - Calculates and updates the average rating
2. **Triggers**: 
   - `update_wcs_rating_on_insert_or_update` - Fires on INSERT/UPDATE operations
   - `update_wcs_rating_on_delete` - Fires on DELETE operations

### How it Works
- When a rating is inserted, updated, or deleted in `wcs_rating` table
- The trigger calculates the average rating for the affected WC
- Updates the `rating` field in the `wcs` table with the rounded average (2 decimal places)
- If no ratings exist, sets rating to 0

### Installation
```sql
-- Run the installation script
\i scripts/install-rating-trigger.sql
```

### Testing
```sql
-- Run the test script to verify functionality
\i scripts/test-rating-trigger.sql
```

### Example Usage
```sql
-- Insert a rating (this will automatically update wcs.rating)
INSERT INTO wcs_rating (wc_id, user_id, rating) 
VALUES ('some-wc-id', 'some-user-id', 5);

-- Update a rating (this will recalculate and update wcs.rating)
UPDATE wcs_rating 
SET rating = 3 
WHERE wc_id = 'some-wc-id' AND user_id = 'some-user-id';

-- Delete a rating (this will recalculate and update wcs.rating)
DELETE FROM wcs_rating 
WHERE wc_id = 'some-wc-id' AND user_id = 'some-user-id';
```

### Technical Details
- **Language**: PL/pgSQL
- **Trigger Type**: AFTER trigger (fires after the operation completes)
- **Return Value**: Uses `COALESCE(NEW, OLD)` to handle all operation types
- **Performance**: Efficient - only updates the specific WC that was affected
- **Precision**: Rounds to 2 decimal places using `ROUND(AVG(rating)::numeric, 2)`

### Database Schema Requirements
The trigger assumes the following table structure:

#### wcs table
- `id` (UUID) - Primary key
- `rating` (DECIMAL/NUMERIC) - Average rating field to be updated

#### wcs_rating table  
- `wc_id` (UUID) - Foreign key to wcs.id
- `user_id` (UUID) - User who gave the rating
- `rating` (INTEGER) - Rating value (typically 1-5)

### Maintenance
- The trigger is automatically maintained by PostgreSQL
- No manual intervention required
- To recalculate all ratings manually, run the optional UPDATE query in the installation script

### Troubleshooting
- If ratings don't update, check that the trigger is installed: `\dt wcs_rating`
- Verify trigger function exists: `\df update_wcs_rating`
- Check for any constraint violations in the rating values
- Ensure proper permissions for the trigger function