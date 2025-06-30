# Fix for Vercel Database Errors - Complete Solution

## Problem Summary
Multiple 500 errors on Vercel production:
1. `GET /api/wc-ratings` - 500 Internal Server Error
2. `GET /api/wc-photos` - 500 Internal Server Error ("Invalid API key")
3. `PUT /api/wcs` - 500 Internal Server Error ("WC not found or error fetching existing data")

## Root Cause
Missing database tables and migrations on Vercel/Supabase production environment. Local development works because all tables exist locally, but production is missing:
- `address` column in `wcs` table
- `wc_rating` table
- `wc_photos` table

## Complete Fix - Database Migrations

### Step 1: Run All Missing Migrations in Supabase

Go to your Supabase project dashboard → SQL Editor and run these SQL scripts **in order**:

#### 1.1 Add address column to wcs table
```sql
-- Add address column to wcs table
ALTER TABLE wcs ADD COLUMN IF NOT EXISTS address TEXT;

-- Add comments to document the purpose of columns
COMMENT ON COLUMN wcs.address IS 'Human-readable address (e.g., "ul. Marszałkowska 1, Warszawa")';
COMMENT ON COLUMN wcs.location IS 'Geographic coordinates in format "latitude,longitude" (e.g., "52.2297,21.0122")';

-- Create index on address column for faster text searches
CREATE INDEX IF NOT EXISTS idx_wcs_address ON wcs USING gin(to_tsvector('english', address));
```

#### 1.2 Create wc_rating table
```sql
-- Create wc_rating table for storing ratings and comments
CREATE TABLE IF NOT EXISTS wc_rating (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    wc_id UUID NOT NULL REFERENCES wcs(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 10),
    comment TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);

-- Create unique constraint to ensure one rating per user per WC
DO $$ 
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'unique_user_wc_rating') THEN
        ALTER TABLE wc_rating ADD CONSTRAINT unique_user_wc_rating UNIQUE (wc_id, user_id);
    END IF;
END $$;

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_wc_rating_wc_id ON wc_rating(wc_id);
CREATE INDEX IF NOT EXISTS idx_wc_rating_user_id ON wc_rating(user_id);
CREATE INDEX IF NOT EXISTS idx_wc_rating_created_at ON wc_rating(created_at);

-- Enable Row Level Security
ALTER TABLE wc_rating ENABLE ROW LEVEL SECURITY;

-- RLS Policies (drop if exist, then create)
DROP POLICY IF EXISTS "Users can view all wc ratings" ON wc_rating;
DROP POLICY IF EXISTS "Users can insert their own wc ratings" ON wc_rating;
DROP POLICY IF EXISTS "Users can update their own wc ratings" ON wc_rating;
DROP POLICY IF EXISTS "Users can delete their own wc ratings" ON wc_rating;

CREATE POLICY "Users can view all wc ratings" ON wc_rating FOR SELECT USING (true);
CREATE POLICY "Users can insert their own wc ratings" ON wc_rating FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can update their own wc ratings" ON wc_rating FOR UPDATE USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can delete their own wc ratings" ON wc_rating FOR DELETE USING (auth.uid() = user_id);

-- Create function to automatically update updated_at timestamp
CREATE OR REPLACE FUNCTION update_wc_rating_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = TIMEZONE('utc'::text, NOW());
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Create trigger to automatically update updated_at timestamp
DROP TRIGGER IF EXISTS update_wc_rating_updated_at_trigger ON wc_rating;
CREATE TRIGGER update_wc_rating_updated_at_trigger
    BEFORE UPDATE ON wc_rating
    FOR EACH ROW
    EXECUTE FUNCTION update_wc_rating_updated_at();
```

#### 1.3 Create wc_photos table
```sql
-- Create wc_photos table for storing user-uploaded photos of WC locations
CREATE TABLE IF NOT EXISTS wc_photos (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    wc_id UUID NOT NULL REFERENCES wcs(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    photo TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_wc_photos_wc_id ON wc_photos(wc_id);
CREATE INDEX IF NOT EXISTS idx_wc_photos_user_id ON wc_photos(user_id);
CREATE INDEX IF NOT EXISTS idx_wc_photos_created_at ON wc_photos(created_at);

-- Enable Row Level Security
ALTER TABLE wc_photos ENABLE ROW LEVEL SECURITY;

-- RLS Policies (drop if exist, then create)
DROP POLICY IF EXISTS "Users can view all wc photos" ON wc_photos;
DROP POLICY IF EXISTS "Users can insert wc photos" ON wc_photos;
DROP POLICY IF EXISTS "Users can update their own wc photos" ON wc_photos;
DROP POLICY IF EXISTS "Users can delete their own wc photos" ON wc_photos;

CREATE POLICY "Users can view all wc photos" ON wc_photos FOR SELECT USING (true);
CREATE POLICY "Authenticated users can insert wc photos" ON wc_photos FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can update their own wc photos" ON wc_photos FOR UPDATE USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can delete their own wc photos" ON wc_photos FOR DELETE USING (auth.uid() = user_id);

-- Create function to automatically update updated_at timestamp
CREATE OR REPLACE FUNCTION update_wc_photos_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = TIMEZONE('utc'::text, NOW());
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Create trigger to automatically update updated_at timestamp
DROP TRIGGER IF EXISTS update_wc_photos_updated_at_trigger ON wc_photos;
CREATE TRIGGER update_wc_photos_updated_at_trigger
    BEFORE UPDATE ON wc_photos
    FOR EACH ROW
    EXECUTE FUNCTION update_wc_photos_updated_at();
```

### Step 2: Verify Migration Success

After running all migrations, verify tables exist:

```sql
-- Check if all tables exist
SELECT table_name, table_type 
FROM information_schema.tables 
WHERE table_schema = 'public' 
AND table_name IN ('wcs', 'wc_rating', 'wc_photos')
ORDER BY table_name;

-- Check wcs table structure (should include address column)
SELECT column_name, data_type, is_nullable 
FROM information_schema.columns 
WHERE table_name = 'wcs' 
ORDER BY ordinal_position;

-- Check wc_rating table structure
SELECT column_name, data_type, is_nullable 
FROM information_schema.columns 
WHERE table_name = 'wc_rating' 
ORDER BY ordinal_position;

-- Check wc_photos table structure
SELECT column_name, data_type, is_nullable 
FROM information_schema.columns 
WHERE table_name = 'wc_photos' 
ORDER BY ordinal_position;
```

Expected results:
- `wcs` table should have `address` column
- `wc_rating` table should exist with all columns
- `wc_photos` table should exist with all columns

### Step 3: Check Environment Variables on Vercel

Ensure all required environment variables are set on Vercel:

**Required Variables:**
- `NEXTAUTH_SECRET`
- `NEXTAUTH_URL` (should be auto-set by Vercel)
- `GOOGLE_CLIENT_ID`
- `GOOGLE_CLIENT_SECRET`
- `SUPABASE_URL` (or `NEXT_PUBLIC_SUPABASE_URL`)
- `SUPABASE_SERVICE_ROLE_KEY`
- `NEXT_PUBLIC_SUPABASE_ANON_KEY`

**To check/add environment variables:**
1. Go to Vercel Dashboard → Your Project
2. Go to Settings → Environment Variables
3. Verify all variables above are present
4. If missing, add them with correct values from your Supabase project

### Step 4: Deploy Fixed Code

The latest code includes fixes for these issues. Deploy by pushing to your repository:

```bash
git add .
git commit -m "Fix database errors - add missing tables and address column"
git push
```

This will trigger automatic deployment on Vercel.

## Error-Specific Solutions

### Error 1: wc-ratings API (500 error)
**Cause:** Missing `wc_rating` table
**Solution:** Create `wc_rating` table (Step 1.2 above)

### Error 2: wc-photos API ("Invalid API key")
**Cause:** Missing `wc_photos` table or incorrect Supabase environment variables
**Solutions:** 
- Create `wc_photos` table (Step 1.3 above)
- Verify `SUPABASE_SERVICE_ROLE_KEY` on Vercel

### Error 3: PUT wcs API ("WC not found")
**Cause:** Missing `address` column causing SQL errors
**Solution:** Add `address` column to `wcs` table (Step 1.1 above)

## Testing After Fix

### Test Sequence:
1. **Test WC editing:** Try editing an existing WC
2. **Test ratings:** Try adding/viewing ratings
3. **Test photos:** Try adding/viewing photos
4. **Test new WC creation:** Try adding a new WC with address auto-detection

### Expected Results:
- No more 500 errors in browser console
- WC editing works without errors
- Ratings and photos load correctly
- Location-based features work properly

## Rollback Plan (Emergency)

If issues persist, you can temporarily disable problematic features:

```sql
-- Emergency: Remove address column if causing critical issues
-- (NOT RECOMMENDED - will break add WC functionality)
ALTER TABLE wcs DROP COLUMN IF EXISTS address;

-- Emergency: Drop rating/photo tables if needed
-- (NOT RECOMMENDED - will lose all ratings/photos data)
DROP TABLE IF EXISTS wc_rating CASCADE;
DROP TABLE IF EXISTS wc_photos CASCADE;
```

## Prevention for Future

1. **Always run migrations before code deployment**
2. **Test on staging environment that mirrors production**
3. **Use proper database migration tools**
4. **Maintain migration scripts in version control**
5. **Document all schema changes**

## Success Verification

After completing all steps, you should see:
- ✅ No 500 errors in browser console
- ✅ WC editing works smoothly
- ✅ Location detection and distance sorting works
- ✅ Ratings and photos functionality works
- ✅ All API endpoints return 200 OK responses

The application should work exactly like it does locally!