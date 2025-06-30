# WC Finder Database Cleanup Guide

This guide provides comprehensive instructions for safely cleaning up all data from the WC Finder application, including database tables and storage buckets.

## ⚠️ CRITICAL WARNING

**This process will permanently delete ALL data from your WC Finder application:**
- All WC records
- All user tags
- All photos and ratings
- All images from storage

**This operation is IRREVERSIBLE. Make sure you have backups before proceeding.**

## 📋 What Gets Deleted

### Database Tables
- `wcs` - All WC location records
- `wc_tags` - All user-generated tags
- `wc_photos` - All photo records
- `wc_ratings` - All user ratings and comments

### Storage Buckets
- `wc-images` - All WC main images
- `wc-photos` - All additional WC photos

## 🚀 Cleanup Methods

### Method 1: Interactive Cleanup (Recommended)

The safest and most user-friendly approach with step-by-step guidance:

```bash
npm run cleanup:interactive
```

This script will:
- ✅ Show detailed warnings and confirmations
- ✅ Guide you through each step
- ✅ Clean storage automatically
- ✅ Provide database cleanup instructions
- ✅ Include verification steps

### Method 2: Storage-Only Cleanup

If you only need to clean storage buckets:

```bash
npm run cleanup:storage
```

This will automatically delete all files from `wc-images` and `wc-photos` buckets.

### Method 3: Manual SQL Cleanup

For database cleanup only, run this SQL script in Supabase SQL Editor:

```sql
-- Copy and paste content from: database/cleanup_all_data.sql
```

## 📖 Step-by-Step Instructions

### Prerequisites

1. **Environment Setup**
   ```bash
   # Ensure .env.local exists with:
   SUPABASE_URL=your_supabase_url
   SUPABASE_SERVICE_ROLE_KEY=your_service_role_key
   ```

2. **Backup Your Data (IMPORTANT!)**
   - Export database from Supabase Dashboard
   - Download any important images manually
   - Note down critical configuration settings

### Step 1: Storage Cleanup

Choose one of these options:

**Option A: Automatic (Recommended)**
```bash
npm run cleanup:storage
```

**Option B: Manual via Supabase Dashboard**
1. Go to Storage > Buckets in Supabase Dashboard
2. Select `wc-images` bucket
3. Select all files (Ctrl+A / Cmd+A)
4. Click Delete
5. Repeat for `wc-photos` bucket

**Option C: Manual via SQL**
```sql
-- CAREFUL: Only run if you know what you're doing
DELETE FROM storage.objects WHERE bucket_id = 'wc-images';
DELETE FROM storage.objects WHERE bucket_id = 'wc-photos';
```

### Step 2: Database Cleanup

1. **Open Supabase SQL Editor**
   - Go to your Supabase project dashboard
   - Navigate to SQL Editor
   - Create a new query

2. **Run the Cleanup Script**
   ```sql
   -- Copy the entire content from: database/cleanup_all_data.sql
   -- Paste it into the SQL Editor
   -- Review the script carefully
   -- Click "Run" to execute
   ```

3. **Verify Results**
   The script will show before/after counts. All should be 0 after cleanup.

## 🔍 Verification

After cleanup, run these queries to verify everything is clean:

```sql
-- Check database tables (should all return 0)
SELECT count(*) as wcs_count FROM wcs;
SELECT count(*) as tags_count FROM wc_tags;
SELECT count(*) as photos_count FROM wc_photos;
SELECT count(*) as ratings_count FROM wc_ratings;

-- Check storage buckets (should return 0)
SELECT count(*) as storage_files 
FROM storage.objects 
WHERE bucket_id IN ('wc-images', 'wc-photos');
```

## 🛠️ Troubleshooting

### Common Issues

**"Permission denied" errors**
- Ensure you're using the service role key, not the anon key
- Check that your user has admin permissions

**"Bucket not found" errors**
- This is normal if buckets were already empty or don't exist
- The script will skip non-existent buckets

**"Foreign key constraint" errors**
- The SQL script deletes in the correct order to avoid this
- If you get this error, run the script in smaller chunks

**Storage cleanup fails**
- Try manual cleanup via Supabase Dashboard
- Check your internet connection
- Verify your Supabase credentials

### Manual Fallback

If automated scripts fail, you can manually clean up:

1. **Database**: Use Supabase Dashboard > Table Editor
   - Delete all rows from each table manually
   - Start with child tables (tags, photos, ratings) then parent (wcs)

2. **Storage**: Use Supabase Dashboard > Storage
   - Browse each bucket and delete files individually

## 🔄 Recovery Options

### If You Need to Restore Data

**Database Recovery:**
```sql
-- Restore from backup file
-- Then run setup script
\i database/setup_wc_tags_complete.sql
```

**Storage Recovery:**
- Re-upload images to appropriate buckets
- Update database records with new image URLs
- Ensure proper bucket policies are in place

### Fresh Start Setup

After cleanup, to set up fresh tables:

```sql
-- Run the complete setup script
\i database/setup_wc_tags_complete.sql
```

This will create all necessary tables, indexes, and policies.

## 📁 File Reference

### Cleanup Scripts
- `scripts/interactive-cleanup.js` - Interactive guided cleanup
- `scripts/cleanup-storage.js` - Automated storage cleanup
- `database/cleanup_all_data.sql` - Database cleanup SQL script

### Setup Scripts
- `database/setup_wc_tags_complete.sql` - Complete database setup
- `database/create_wc_tags_table.sql` - Tags table only

### Package.json Commands
```bash
npm run cleanup:interactive    # Interactive guided cleanup
npm run cleanup:storage       # Storage-only cleanup
npm run cleanup:all          # Instructions for complete cleanup
```

## 🔒 Security Notes

- Scripts use service role key for elevated permissions
- All operations respect RLS policies where applicable
- Cleanup scripts include safety checks and confirmations
- Environment variables are loaded securely from .env.local

## 📞 Support

If you encounter issues:

1. **Check the console output** for specific error messages
2. **Verify your environment variables** are correctly set
3. **Ensure you have admin permissions** in Supabase
4. **Try manual cleanup** if automated scripts fail
5. **Check Supabase status** if you suspect service issues

Remember: **Always backup your data before running cleanup operations!**