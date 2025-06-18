# WC Rating System Documentation

## Overview
This document describes the WC Rating system that allows users to rate and comment on WC locations in the WC Finder application.

## Database Schema

### Table: `wc_rating`

```sql
CREATE TABLE wc_rating (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    wc_id UUID NOT NULL REFERENCES wcs(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 10),
    comment TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);
```

#### Columns:
- **id**: Unique identifier for each rating (UUID, Primary Key)
- **wc_id**: Foreign key reference to the WC being rated
- **user_id**: Foreign key reference to the user who created the rating
- **rating**: Numeric rating from 1 to 10 stars (INTEGER, Required)
- **comment**: Optional text comment about the WC experience
- **created_at**: Timestamp when the rating was created
- **updated_at**: Timestamp when the rating was last updated

#### Constraints:
- **Unique Constraint**: `unique_user_wc_rating` - One rating per user per WC
- **Check Constraint**: Rating must be between 1 and 10
- **Foreign Keys**: Cascade delete when WC or User is deleted

#### Indexes:
- `idx_wc_rating_wc_id` - For efficient WC-based queries
- `idx_wc_rating_user_id` - For efficient user-based queries
- `idx_wc_rating_created_at` - For time-ordered queries

## Row Level Security (RLS)

### Policies:
1. **View Policy**: All authenticated users can view all ratings
2. **Insert Policy**: Users can only insert ratings for themselves
3. **Update Policy**: Users can only update their own ratings
4. **Delete Policy**: Users can only delete their own ratings

## API Endpoints

### GET `/api/wc-ratings?wc_id={uuid}`
Retrieve all ratings for a specific WC.

**Parameters:**
- `wc_id` (required): UUID of the WC to get ratings for

**Response:**
```json
{
  "ratings": [
    {
      "id": "uuid",
      "rating": 8,
      "comment": "Very clean and well-maintained",
      "created_at": "2024-01-01T12:00:00Z",
      "updated_at": "2024-01-01T12:00:00Z",
      "user_id": "uuid",
      "users": {
        "email": "user@example.com"
      }
    }
  ],
  "averageRating": 8.5,
  "totalRatings": 10
}
```

### POST `/api/wc-ratings`
Create or update a rating for a WC.

**Body:**
```json
{
  "wc_id": "uuid",
  "rating": 8,
  "comment": "Optional comment"
}
```

**Response:**
```json
{
  "data": {
    "id": "uuid",
    "wc_id": "uuid",
    "user_id": "uuid",
    "rating": 8,
    "comment": "Optional comment",
    "created_at": "2024-01-01T12:00:00Z",
    "updated_at": "2024-01-01T12:00:00Z"
  },
  "message": "Rating created successfully"
}
```

### PUT `/api/wc-ratings/[id]`
Update a specific rating (only by the rating owner).

### DELETE `/api/wc-ratings/[id]`
Delete a specific rating (only by the rating owner).

## Features

### User Interface
1. **Rating Section**: Each WC edit/view page includes a rating section
2. **Star Rating**: 10-star rating system with hover effects
3. **Comment Field**: Optional textarea for detailed feedback
4. **All Ratings Display**: Shows all user ratings with average
5. **Responsive Design**: Optimized for mobile and desktop

### User Experience
- **One Rating Per User**: Each user can only rate a WC once (update existing)
- **Real-time Updates**: Ratings update immediately after submission
- **Average Calculation**: Automatic calculation of average rating
- **User Attribution**: Shows which user left each rating
- **Chronological Order**: Ratings displayed newest first

## Business Rules

1. **Authentication Required**: Only logged-in users can rate WCs
2. **Rating Range**: Ratings must be between 1-10 stars
3. **One Per User**: Users can only have one rating per WC
4. **Optional Comments**: Comments are not required but encouraged
5. **Owner Rights**: Only rating owners can edit/delete their ratings
6. **Public Visibility**: All ratings are visible to all users

## Installation

1. **Create Table**: Execute the SQL script in `create_wc_rating_table.sql`
2. **Set Permissions**: Ensure RLS policies are active
3. **Test API**: Verify endpoints work with authentication
4. **Deploy UI**: Update frontend components to use rating system

## Technical Considerations

### Performance
- Indexed queries for efficient data retrieval
- Pagination can be added for large rating sets
- Caching strategies for average ratings

### Security
- RLS policies prevent unauthorized access
- Input validation on rating values
- SQL injection protection via parameterized queries

### Scalability
- UUID primary keys for distributed systems
- Timestamp-based sorting for chronological display
- Cascade delete maintains data integrity

## Future Enhancements

1. **Rating Analytics**: Trending WCs, rating statistics
2. **Moderation**: Admin tools for managing inappropriate comments
3. **Voting System**: Helpful/unhelpful votes on comments
4. **Rich Text**: Support for formatted comments
5. **Image Attachments**: Allow photos with ratings
6. **Rating Categories**: Cleanliness, accessibility, etc.
7. **Push Notifications**: Notify WC owners of new ratings

## Troubleshooting

### Common Issues:
1. **403 Forbidden**: Check RLS policies and user authentication
2. **Duplicate Rating**: User already has a rating for this WC
3. **Invalid Rating**: Rating must be 1-10 integer
4. **Missing WC**: Verify WC exists before rating
5. **API Errors**: Check Supabase configuration and environment variables

### Debug Steps:
1. Verify user authentication status
2. Check Supabase table permissions
3. Validate API endpoint responses
4. Test with different user accounts
5. Monitor browser console for errors