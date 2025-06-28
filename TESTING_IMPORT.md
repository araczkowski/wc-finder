# Testing Web Scraping Import Feature - Development Guide

## Quick Start Testing

### 1. Environment Setup

Install required dependencies:

```bash
npm install cheerio
```

Ensure you have the following in your `.env.local`:

```bash
SUPABASE_URL=your_supabase_url
SUPABASE_SERVICE_ROLE_KEY=your_supabase_service_role_key
```

**Note: No Google Maps API key required - completely free!**

### 2. Database Migration

Run the SQL migration in Supabase SQL Editor:

```sql
-- Add google_place_id column
ALTER TABLE wcs ADD COLUMN IF NOT EXISTS google_place_id TEXT;
CREATE INDEX IF NOT EXISTS idx_wcs_google_place_id ON wcs(google_place_id);
COMMENT ON COLUMN wcs.google_place_id IS 'Unique identifier for places imported from web scraping (OSM/Google Maps)';
ALTER TABLE wcs ADD CONSTRAINT unique_google_place_id UNIQUE (google_place_id);
```

### 3. Test Admin Access

1. Login as `admin@sviete.pl`
2. Check if "📥 Pobieranie WC" appears in user dropdown menu
3. Navigate to `/admin/import-wc`

### 4. Test Coordinates

Use these test coordinates for different cities:

#### Warsaw, Poland
```
52.2297,21.0122
```

#### Krakow, Poland
```
50.0647,19.9450
```

#### Gdansk, Poland
```
54.3520,18.6466
```

## Test Cases

### Test Case 1: Valid Import - Restaurants
- **Coordinates**: `52.2297,21.0122` (Warsaw)
- **Radius**: `1` (km)
- **Type**: `restaurant`
- **Expected**: Should find restaurants from OpenStreetMap + scraping

### Test Case 2: Small Radius - Cafes
- **Coordinates**: `52.2297,21.0122`
- **Radius**: `0.5` (km)
- **Type**: `cafe`
- **Expected**: Should find fewer results due to small radius

### Test Case 3: Large Radius - Tourist Attractions
- **Coordinates**: `50.0647,19.9450` (Krakow)
- **Radius**: `5` (km)
- **Type**: `tourist_attraction`
- **Expected**: Should find many tourist attractions

### Test Case 4: Toilet Search
- **Coordinates**: `52.2297,21.0122`
- **Radius**: `2` (km)
- **Type**: `toilet`
- **Expected**: Should find toilets from OpenStreetMap (amenity=toilets)

### Test Case 5: Mixed Sources
- **Coordinates**: `54.3520,18.6466` (Gdansk)
- **Radius**: `3` (km)
- **Type**: `museum`
- **Expected**: Should combine OSM + scraping results

### Test Case 6: All Types Import (Admin Only)
- **Coordinates**: `52.2297,21.0122` (Warsaw)
- **Radius**: `1` (km)
- **Type**: `*` (All types)
- **Expected**: Should import all place types with correct place_type for each

## Error Testing

### Test Invalid Coordinates
- `invalid,coords` → Should show validation error
- `52.2297` → Should show validation error
- `52.2297,` → Should show validation error

### Test Invalid Radius
- `0` → Should show validation error
- `-100` → Should show validation error
- `abc` → Should show validation error
- `51` → Should show validation error (over 50km limit)

### Test Network Issues
- Disconnect internet temporarily
- Try import → Should show connection errors
- Test with slow connection → Should handle timeouts gracefully

### Test Rate Limiting
- Perform multiple rapid imports
- Should see delays between requests
- No blocking should occur

## Development Console Logs

Monitor browser console and server logs for:

```
Import Places API (Scraping): Starting request
Import Places API: Request data { coordinates, radius, placeType }
Trying OpenStreetMap data...
Querying OpenStreetMap Overpass API...
OSM results insufficient, trying Google Maps scraping...
Scraping Google Maps for: [search term]
Found X unique places after deduplication
Added WC: [Place Name]
Import Places API: Results { found, added, skipped, photos, ratings, tags }
```

## Database Verification

After successful import, check Supabase tables:

### wcs table
```sql
SELECT name, address, google_place_id, place_type, rating 
FROM wcs 
WHERE google_place_id IS NOT NULL 
ORDER BY created_at DESC 
LIMIT 10;
```

### Check data sources
```sql
SELECT 
  CASE 
    WHEN google_place_id LIKE 'osm_%' THEN 'OpenStreetMap'
    WHEN google_place_id LIKE 'scraped_%' THEN 'Web Scraping'
    ELSE 'Other'
  END as source,
  COUNT(*) as count
FROM wcs 
WHERE google_place_id IS NOT NULL
GROUP BY 1;
```

### wc_photos table (note: photos not implemented in scraping version)
```sql
SELECT wc_id, photo, created_at 
FROM wc_photos 
WHERE wc_id IN (
  SELECT id FROM wcs WHERE google_place_id IS NOT NULL
) 
ORDER BY created_at DESC 
LIMIT 5;
```

### wc_ratings table
```sql
SELECT wc_id, rating, comment 
FROM wc_ratings 
WHERE wc_id IN (
  SELECT id FROM wcs WHERE google_place_id IS NOT NULL
) 
ORDER BY created_at DESC 
LIMIT 5;
```

### wc_tags table
```sql
SELECT wc_id, tag 
FROM wc_tags 
WHERE wc_id IN (
  SELECT id FROM wcs WHERE google_place_id IS NOT NULL
) 
ORDER BY created_at DESC 
LIMIT 10;
```

## Expected Results Format

```json
{
  "success": true,
  "message": "Successfully imported X places via web scraping",
  "results": {
    "found": 20,
    "added": 15,
    "skipped": 5,
    "photos": 0,
    "ratings": 15,
    "tags": 25
  },
  "source": "OpenStreetMap + Web Scraping"
}
```

## Common Issues & Solutions

### Issue: No results found
- **Cause**: Area not well covered in OpenStreetMap or scraping failed
- **Solution**: Try different coordinates, larger radius, or different place type

### Issue: All places skipped
- **Cause**: Places already imported (duplicate detection)
- **Solution**: Use different coordinates or clear test data

### Issue: "OpenStreetMap API error"
- **Cause**: Overpass API temporarily unavailable
- **Solution**: Wait and retry, check https://overpass-api.de/

### Issue: No photos imported
- **Cause**: Photos not implemented in scraping version (by design)
- **Solution**: Expected behavior - saves API costs

### Issue: Tags not added
- **Cause**: Place names/descriptions don't contain trigger words
- **Solution**: Normal behavior, add manual tags later if needed

### Issue: Scraping blocked
- **Cause**: IP temporarily blocked due to rate limiting
- **Solution**: Wait 10-15 minutes and retry with delays

## Cleanup Test Data

To remove test data from database:

```sql
-- Remove imported WCs and related data
DELETE FROM wc_tags WHERE wc_id IN (
  SELECT id FROM wcs WHERE google_place_id IS NOT NULL
);

DELETE FROM wc_ratings WHERE wc_id IN (
  SELECT id FROM wcs WHERE google_place_id IS NOT NULL
);

DELETE FROM wc_photos WHERE wc_id IN (
  SELECT id FROM wcs WHERE google_place_id IS NOT NULL
);

DELETE FROM wcs WHERE google_place_id IS NOT NULL;
```

## Performance Testing

For performance testing with larger datasets:

1. Use coordinates in dense urban areas
2. Set large radius (20+ km)
3. Use common place types (restaurant, cafe) or "*" for all types
4. Monitor import time and success rates for multiple types
5. Test "all types" import for comprehensive coverage

## Rate Limits and Best Practices

**OpenStreetMap Overpass API:**
- No hard limits but fair use policy
- Built-in delays prevent overloading
- Generally very reliable

**Web Scraping:**
- Built-in delays (2-5 seconds between requests)
- May get temporarily blocked if too aggressive
- Should work fine for reasonable usage

**Testing Tips:**
- Start with small radius (0.5-1 km)
- Test different place types including "*" for all types
- Don't run imports too frequently
- Monitor console logs for errors
- For admin testing, verify all place types are imported correctly

**Cost Savings:**
- 100% free vs Google Places API ($50-100 per 1000 places)
- No API keys to manage
- No monthly billing surprises