# Fix for Vercel PUT WC Error (500 Internal Server Error)

## Problem Description
When trying to update a WC on Vercel production, getting:
```
PUT https://wc-finder.vercel.app/api/wcs/[id] 500 (Internal Server Error)
Client-side error updating WC: Error: WC not found or error fetching existing data.
```

## Root Cause
The error occurs because the `address` column was added to the code but not to the production database on Supabase. The API tries to select and update the `address` field, but it doesn't exist in the production table.

## Solution Steps

### 1. **Run Database Migration on Supabase Production**

Go to your Supabase project dashboard → SQL Editor and run:

```sql
-- Add address column to wcs table
ALTER TABLE wcs ADD COLUMN address TEXT;

-- Add comment to document the purpose of the new column
COMMENT ON COLUMN wcs.address IS 'Human-readable address (e.g., "ul. Marszałkowska 1, Warszawa")';

-- Update existing comment for location column to clarify its new purpose
COMMENT ON COLUMN wcs.location IS 'Geographic coordinates in format "latitude,longitude" (e.g., "52.2297,21.0122")';

-- Optional: Create an index on address column for faster text searches
CREATE INDEX idx_wcs_address ON wcs USING gin(to_tsvector('english', address));
```

### 2. **Verify Migration Success**

After running the migration, verify the column was added:

```sql
-- Check table structure
SELECT column_name, data_type, is_nullable 
FROM information_schema.columns 
WHERE table_name = 'wcs' 
ORDER BY ordinal_position;
```

You should see the `address` column listed.

### 3. **Deploy Fixed Code**

The code has been updated with:
- Better error logging for debugging
- Proper handling of undefined `address` fields
- Extended SELECT query to include all necessary fields

Push the latest code to trigger Vercel deployment:

```bash
git add .
git commit -m "Fix PUT WC error - add address column support"
git push
```

### 4. **Test the Fix**

1. Try editing an existing WC on Vercel
2. Check if the update works without 500 error
3. Verify that both old WCs (without address) and new WCs work correctly

## What Was Fixed in Code

### API Route Changes (`app/api/wcs/[id]/route.js`):

1. **Extended SELECT query**:
   ```javascript
   // Before:
   .select("user_id, image_url")
   
   // After:
   .select("user_id, image_url, name, location, address, rating")
   ```

2. **Better error handling**:
   ```javascript
   // Added detailed error logging
   console.error("API WCS PUT: Supabase error code:", fetchError.code);
   console.error("API WCS PUT: Supabase error message:", fetchError.message);
   ```

3. **Graceful handling of undefined address**:
   ```javascript
   // Handles case where existing WC doesn't have address field
   address: jsonData.address !== undefined 
     ? (jsonData.address ? jsonData.address.trim() : null)
     : (existingWc.address || null)
   ```

## Prevention for Future

1. Always run database migrations in production before deploying code changes
2. Use proper database migration tools or scripts
3. Test API endpoints on production after schema changes
4. Consider using environment-specific migration checks

## Verification Commands

After fix deployment, you can verify using browser dev tools:

1. Open Network tab in browser dev tools
2. Try editing a WC
3. Check the PUT request response - should be 200 OK instead of 500
4. Verify the WC update actually saves in the database

## Rollback Plan (if needed)

If issues persist, you can temporarily remove address field handling:

```sql
-- Remove address column (ONLY if absolutely necessary)
ALTER TABLE wcs DROP COLUMN IF EXISTS address;
```

But this is not recommended as it would break the add WC functionality.