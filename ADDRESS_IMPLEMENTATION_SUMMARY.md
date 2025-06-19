# Address Column Implementation Summary

## Overview
Successfully implemented a new `address` column in the `wcs` table to separate human-readable addresses from coordinate data. The `location` column now stores coordinates while `address` stores readable addresses.

## Database Changes

### 1. New Column Added
- **Column**: `address` (TEXT)
- **Purpose**: Store human-readable addresses (e.g., "ul. Marszałkowska 1, Warszawa")
- **Location column**: Now stores coordinates in format "latitude,longitude" (e.g., "52.2297,21.0122")

### 2. SQL Script
File: `database/add_address_column.sql`
```sql
ALTER TABLE wcs ADD COLUMN address TEXT;
COMMENT ON COLUMN wcs.address IS 'Human-readable address (e.g., "ul. Marszałkowska 1, Warszawa")';
COMMENT ON COLUMN wcs.location IS 'Geographic coordinates in format "latitude,longitude" (e.g., "52.2297,21.0122")';
CREATE INDEX idx_wcs_address ON wcs USING gin(to_tsvector('english', address));
```

## API Changes

### 1. POST /api/wcs (Create WC)
- Added `address` field validation
- Accepts both `address` and `location` in request body
- Stores address text in `address` column
- Stores coordinates in `location` column

### 2. PUT /api/wcs/[id] (Update WC)
- Added `address` field support
- Updates both address and location fields independently

## Frontend Changes

### 1. Add WC Form (`/wc/add`)
**New Features:**
- **Address field**: Required field for entering readable address
- **Geocoding**: Automatically converts address to coordinates using Nominatim API
- **Coordinates field**: Optional field, auto-filled from address
- **Loading states**: Shows "Pobieranie lokalizacji..." during geocoding

**Form Fields:**
- Name* (required)
- Address* (required) - e.g., "ul. Marszałkowska 1, Warszawa"
- Coordinates (optional) - auto-filled from address
- Image (optional)
- Rating (1-10)

### 2. Edit WC Form (`/wc/edit/[id]`)
**Updated:**
- Added `address` field
- Separated address from coordinates
- Both fields are editable

### 3. Main Page (`/`)
**Changes:**
- Search now searches by address instead of coordinates
- Display shows address instead of coordinates
- "My Location" button text changed to "Dokładna lokalizacja"
- Enhanced reverse geocoding for detailed address with street and house number

## Geocoding Features

### 1. Address to Coordinates (Add WC)
```javascript
const geocodeAddress = async (addressText) => {
  const response = await fetch(
    `https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(addressText)}&limit=1&addressdetails=1`
  );
  // Returns coordinates in "lat,lon" format
};
```

### 2. Coordinates to Address (My Location)
Enhanced reverse geocoding that extracts:
- House number and street name
- Neighborhood/suburb/district
- City/town/village
- Builds detailed address: "ul. Marszałkowska 1, Śródmieście, Warszawa"

## Usage Flow

### Adding New WC:
1. User enters readable address (e.g., "ul. Marszałkowska 1, Warszawa")
2. System automatically geocodes to coordinates
3. Address stored in `address` column
4. Coordinates stored in `location` column

### Using "My Location":
1. User clicks "Dokładna lokalizacja"
2. System gets GPS coordinates
3. Reverse geocodes to detailed address with street and house number
4. Address displayed in search field

### Searching:
- Search now works on readable addresses
- Users can search by street name, district, or city
- More intuitive than searching coordinates

## Database Migration Required

**IMPORTANT**: Run this SQL command in your Supabase dashboard:

```sql
ALTER TABLE wcs ADD COLUMN address TEXT;
COMMENT ON COLUMN wcs.address IS 'Human-readable address (e.g., "ul. Marszałkowska 1, Warszawa")';
COMMENT ON COLUMN wcs.location IS 'Geographic coordinates in format "latitude,longitude" (e.g., "52.2297,21.0122")';
CREATE INDEX idx_wcs_address ON wcs USING gin(to_tsvector('english', address));
```

## Files Modified

### Database:
- `database/add_address_column.sql` (new)

### API Routes:
- `app/api/wcs/route.js`
- `app/api/wcs/[id]/route.js`

### Frontend Pages:
- `app/page.js` (main page)
- `app/wc/add/page.js` (add form)
- `app/wc/edit/[id]/page.js` (edit form)

## Features Added

### 1. Smart Geocoding
- Automatic address to coordinates conversion
- Error handling for failed geocoding
- Fallback to coordinates if geocoding fails

### 2. Enhanced Location Detection
- Detailed reverse geocoding with street and house numbers
- Polish language support
- Better address formatting

### 3. Improved UX
- Required address field for better data quality
- Loading states during geocoding
- Clear separation between address and coordinates
- Search by readable addresses

## Next Steps

1. **Run the database migration** in Supabase
2. **Deploy the updated code** to Vercel
3. **Test the new functionality**:
   - Add new WC with address
   - Use "My Location" button
   - Search by address
   - Edit existing WC

## Benefits

- **Better User Experience**: Users enter and see readable addresses
- **Improved Search**: Search by street names instead of coordinates  
- **More Accurate Location**: Street-level precision with house numbers
- **Data Quality**: Structured address data for future features
- **Geocoding Integration**: Automatic coordinate generation from addresses