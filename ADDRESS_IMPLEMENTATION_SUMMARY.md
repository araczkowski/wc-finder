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
- **Automatic location detection**: Automatically gets user's current location when page loads
- **Address field**: Required field, auto-filled with current address or manually editable
- **Geocoding**: Automatically converts address to coordinates using Nominatim API
- **Coordinates field**: Optional field, auto-filled from current location or address
- **Loading states**: Shows status during location detection and geocoding
- **Refresh button**: Allows user to update location manually

**Form Fields:**
- Name* (required)
- Address* (required) - auto-filled from GPS or manually entered
- Coordinates (optional) - auto-filled from current location or address
- Image (optional)
- Rating (1-10)

**User Flow:**
1. Page loads → automatically detects current GPS location
2. Reverse geocodes GPS coordinates to readable address
3. Both address and coordinates fields are pre-filled
4. User can edit address if needed or refresh location
5. Manual address changes trigger geocoding to update coordinates

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
Enhanced reverse geocoding that uses full address from Nominatim:
- Uses complete `display_name` from reverse geocoding API
- Cleans up by removing postal codes and country names
- Provides full detailed address: "ul. Marszałkowska 1, Śródmieście, Warszawa, województwo mazowieckie"

## Usage Flow

### Adding New WC:
1. User navigates to Add WC page while physically at the WC location
2. System automatically detects user's current GPS coordinates
3. System reverse geocodes coordinates to full readable address (complete address from Nominatim)
4. Both full address and coordinates are pre-filled in the form
5. User can edit address if needed or click refresh to re-detect location
6. If address is manually changed, system geocodes it to update coordinates
7. Full address stored in `address` column, coordinates stored in `location` column

### Using "My Location":
1. User clicks "Dokładna lokalizacja"
2. System gets GPS coordinates
3. Reverse geocodes to full detailed address (complete address from Nominatim)
4. Full address displayed in search field

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
- Uses full address from Nominatim API for maximum detail
- Error handling for failed geocoding
- Fallback to coordinates if geocoding fails

### 2. Enhanced Location Detection
- Full address reverse geocoding using complete Nominatim display_name
- Automatic cleanup of postal codes and country information
- Polish language support
- Complete address formatting with all available details

### 3. Improved UX
- Automatic location detection when adding WC (user is assumed to be at the location)
- Pre-filled address and coordinates from current GPS position
- Manual refresh option for location updates
- Required address field for better data quality
- Loading states during location detection and geocoding
- Clear separation between address and coordinates
- Search by readable addresses
- Visual feedback for successful location detection

## Next Steps

1. **Run the database migration** in Supabase
2. **Deploy the updated code** to Vercel
3. **Test the new functionality**:
   - Add new WC with address
   - Use "My Location" button
   - Search by address
   - Edit existing WC

## Benefits

- **Seamless UX**: Location automatically detected when user is at the WC
- **No Manual Entry**: Full address and coordinates pre-filled from GPS
- **Complete Address Data**: Uses full Nominatim address including all available details
- **Better User Experience**: Users see complete, detailed addresses
- **Improved Search**: Search by full addresses instead of coordinates  
- **Maximum Location Detail**: Complete address with street, house number, district, and city
- **Data Quality**: Complete structured address data for future features
- **Geocoding Integration**: Bi-directional conversion between full addresses and coordinates
- **Real-world Usage**: Reflects actual usage pattern (user adds WC while being there)