# WC Photos Table Documentation

## Overview
The `wc_photos` table stores user-uploaded photos of WC (toilet) locations. This table allows users to share visual information about WCs to help others find and evaluate facilities.

## Table Structure

### Columns
- `id` (UUID, Primary Key): Unique identifier for each photo record
- `wc_id` (UUID, Foreign Key): References the WC location in the `wcs` table
- `user_id` (UUID, Foreign Key): References the user who uploaded the photo in `auth.users`
- `photo` (TEXT): URL or path to the photo file stored in Supabase Storage
- `created_at` (TIMESTAMP): When the photo was uploaded
- `updated_at` (TIMESTAMP): When the photo record was last modified

### Constraints
- `wc_id` references `wcs(id)` with CASCADE DELETE
- `user_id` references `auth.users(id)` with CASCADE DELETE
- `photo` field is required (NOT NULL)

### Indexes
- `idx_wc_photos_wc_id`: Index on wc_id for fast lookups by WC location
- `idx_wc_photos_user_id`: Index on user_id for fast lookups by user
- `idx_wc_photos_created_at`: Index on created_at for chronological sorting

## Row Level Security (RLS) Policies

### View Policy
- **"Users can view all wc photos"**: All authenticated users can view photos from any WC location

### Insert Policy
- **"Authenticated users can insert wc photos"**: Only authenticated users can upload new photos

### Update Policy
- **"Users can update their own wc photos"**: Users can only modify photos they uploaded

### Delete Policy
- **"Users can delete their own wc photos"**: Users can only delete photos they uploaded

## Usage Examples

### Insert a new photo
```sql
INSERT INTO wc_photos (wc_id, user_id, photo)
VALUES (
    'wc-uuid-here',
    auth.uid(),
    'https://supabase-storage-url/bucket/photo-filename.jpg'
);
```

### Get all photos for a specific WC
```sql
SELECT wp.*, u.email as uploader_email
FROM wc_photos wp
JOIN auth.users u ON wp.user_id = u.id
WHERE wp.wc_id = 'wc-uuid-here'
ORDER BY wp.created_at DESC;
```

### Get photos uploaded by a specific user
```sql
SELECT wp.*, w.name as wc_name, w.location as wc_location
FROM wc_photos wp
JOIN wcs w ON wp.wc_id = w.id
WHERE wp.user_id = 'user-uuid-here'
ORDER BY wp.created_at DESC;
```

### Delete a photo (only by owner)
```sql
DELETE FROM wc_photos 
WHERE id = 'photo-uuid-here' 
AND user_id = auth.uid();
```

## API Integration

### Expected API Endpoints
- `GET /api/wc-photos?wc_id={id}` - Get all photos for a WC
- `POST /api/wc-photos` - Upload a new photo
- `DELETE /api/wc-photos/{id}` - Delete a photo (owner only)

### Photo Storage
Photos should be stored in Supabase Storage with:
- Organized folder structure: `wc-photos/{wc_id}/{photo_id}.jpg`
- Proper file naming to avoid conflicts
- Image optimization for web display
- Secure public access URLs

## Triggers

### Auto-update timestamp
The `update_wc_photos_updated_at_trigger` automatically updates the `updated_at` field when a record is modified.

## Installation

To create this table in your Supabase database:

1. Run the SQL script: `create_wc_photos_table.sql`
2. Verify the table was created successfully
3. Test the RLS policies with different user roles
4. Set up Supabase Storage bucket for photo files

## Security Considerations

- Photos are publicly viewable but only owners can modify/delete
- File uploads should be validated for:
  - File type (images only)
  - File size limits
  - Content scanning for inappropriate material
- Consider implementing photo moderation workflows
- Monitor storage usage and implement cleanup for deleted WCs

## Performance Notes

- Index on `wc_id` enables fast photo retrieval for WC detail pages
- Index on `created_at` supports chronological ordering
- Consider pagination for WCs with many photos
- Implement image thumbnails for better performance in galleries