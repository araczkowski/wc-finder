# WC Tags Implementation Guide

This document describes the implementation of the WC tags feature for the WC Finder application.

## Overview

The WC tags feature allows logged-in users to add tags to WC locations to help categorize and describe them. Tags are displayed as chips with icons and can be added/removed by users.

## Available Tags

The system supports the following predefined tags:

- **#płatna** - Paid toilet (Coins icon, red color)
- **#darmowa** - Free toilet (Heart icon, green color)  
- **#przewijak** - Baby changing facilities (Baby icon, blue color)
- **#dostępnaDlaNiepełnosprawnych** - Wheelchair accessible (Wheelchair icon, purple color)

## Database Schema

### wc_tags Table

```sql
CREATE TABLE wc_tags (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    wc_id UUID NOT NULL REFERENCES wcs(id) ON DELETE CASCADE,
    tag TEXT NOT NULL,
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);
```

### Indexes

- `idx_wc_tags_wc_id` - For efficient WC lookups
- `idx_wc_tags_tag` - For tag filtering
- `idx_wc_tags_user_id` - For user-specific queries
- `idx_wc_tags_unique_user_wc_tag` - Prevents duplicate tags from same user

## API Endpoints

### GET /api/wc-tags

Get tags for a specific WC.

**Parameters:**
- `wc_id` (required) - UUID of the WC

**Response:**
```json
{
  "tags": [
    {
      "tag": "płatna",
      "count": 2,
      "users": ["user-uuid-1", "user-uuid-2"]
    }
  ],
  "availableTags": ["płatna", "darmowa", "przewijak", "dostępnaDlaNiepełnosprawnych"]
}
```

### POST /api/wc-tags

Add a new tag to a WC (requires authentication).

**Body:**
```json
{
  "wc_id": "wc-uuid",
  "tag": "płatna"
}
```

**Response:**
```json
{
  "message": "Tag added successfully",
  "tag": { ... }
}
```

### DELETE /api/wc-tags

Remove a tag from a WC (only your own tags).

**Parameters:**
- `wc_id` (required) - UUID of the WC
- `tag` (required) - Tag name to remove

## Frontend Components

### WCTags Component

The main component for displaying and managing tags.

**Props:**
- `wcId` (string, required) - WC ID
- `isEditable` (boolean, default: false) - Whether user can add/remove tags
- `onTagsChange` (function, optional) - Callback when tags change

**Usage:**
```jsx
<WCTags wcId={wcId} isEditable={true} />
```

### Features

1. **Display Tags**: Shows existing tags as chips with icons
2. **Add Tags**: Authenticated users can add predefined tags
3. **Remove Tags**: Users can remove their own tags
4. **Tag Counts**: Shows how many users added each tag
5. **Responsive Design**: Works on mobile and desktop

## Integration Points

### WC List (Home Page)

Tags are displayed in the WC list table as a new column:

```jsx
<div className="table-cell sixth-cell">
  <WCTags wcId={wc.id} isEditable={false} />
</div>
```

### WC View Page

Tags are displayed with editing capabilities:

```jsx
<WCTags wcId={wcId} isEditable={true} />
```

### WC Edit Page

Tags can be managed during WC editing:

```jsx
<WCTags wcId={wcId} isEditable={true} />
```

## API Integration

### Enhanced WC List API

The `/api/wcs` endpoint now includes tags in the response:

```json
{
  "data": [
    {
      "id": "wc-uuid",
      "name": "WC Name",
      "tags": [
        {
          "tag": "płatna",
          "count": 1,
          "users": ["user-uuid"]
        }
      ]
    }
  ]
}
```

## Setup Instructions

### 1. Database Setup

Run the complete setup script in Supabase SQL Editor:

```sql
-- Copy and paste the contents of database/setup_wc_tags_complete.sql
```

### 2. Verify Installation

Check that the tables and functions were created:

```sql
-- Verify tables exist
SELECT table_name FROM information_schema.tables 
WHERE table_name IN ('wcs', 'wc_tags', 'wc_photos', 'wc_ratings');

-- Check RLS policies
SELECT tablename, policyname FROM pg_policies 
WHERE tablename = 'wc_tags';
```

### 3. Test API Endpoints

1. Create a test WC
2. Add tags via POST /api/wc-tags
3. Retrieve tags via GET /api/wc-tags
4. Remove tags via DELETE /api/wc-tags

## Styling

Tags use a chip-based design with:

- **Colors**: Each tag type has its own color scheme
- **Icons**: Lucide React icons for visual representation
- **Responsive**: Adapts to different screen sizes
- **Interactive**: Hover effects and click animations

### CSS Classes

- `.sixth-cell` - Table cell for tags column
- Custom styles are defined inline in the WCTags component

## Security

- **Authentication Required**: Only logged-in users can add/remove tags
- **User Ownership**: Users can only remove their own tags
- **Tag Validation**: Only predefined tags are allowed
- **RLS Policies**: Database-level security with Row Level Security

## Performance Considerations

- **Indexes**: Efficient database queries with proper indexing
- **Caching**: Tags are fetched when component mounts
- **Batch Operations**: Multiple tag operations are handled efficiently
- **Debouncing**: Rapid user interactions are debounced

## Future Enhancements

1. **Custom Tags**: Allow users to create custom tags
2. **Tag Categories**: Group tags by category (accessibility, cost, etc.)
3. **Tag Analytics**: Show popular tags and statistics
4. **Tag Search**: Filter WCs by tags
5. **Tag Suggestions**: AI-powered tag suggestions based on description

## Troubleshooting

### Common Issues

1. **Tags not showing**: Check if wc_tags table exists and has data
2. **Cannot add tags**: Verify user is authenticated and WC exists
3. **Permission errors**: Check RLS policies are correctly set up
4. **API errors**: Check Supabase URL and keys in environment variables

### Debug Queries

```sql
-- Check tags for specific WC
SELECT * FROM wc_tags WHERE wc_id = 'your-wc-id';

-- Check user permissions
SELECT auth.uid(), auth.role();

-- Verify RLS policies
SELECT * FROM pg_policies WHERE tablename = 'wc_tags';
```

## Testing

### Manual Testing Checklist

- [ ] Tags display correctly in WC list
- [ ] Tags display correctly in WC view
- [ ] Can add tags when logged in
- [ ] Cannot add duplicate tags
- [ ] Can remove own tags
- [ ] Cannot remove other users' tags
- [ ] Tag counts update correctly
- [ ] Works on mobile devices

### Test Data

```sql
-- Insert test WC
INSERT INTO wcs (user_id, created_by, name, address, location, rating)
VALUES (auth.uid(), 'test@example.com', 'Test WC', 'Test Address', ST_Point(21.0122, 52.2297)::GEOGRAPHY, 8);

-- Insert test tags
INSERT INTO wc_tags (wc_id, tag, user_id)
VALUES 
  ('your-wc-id', 'płatna', auth.uid()),
  ('your-wc-id', 'przewijak', auth.uid());
```

## Support

For issues with the tags implementation:

1. Check the browser console for JavaScript errors
2. Verify API responses in Network tab
3. Check Supabase logs for database errors
4. Ensure all environment variables are properly set