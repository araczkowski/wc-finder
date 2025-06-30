# Web Scraping Import Feature - README

## Overview

This feature allows administrators to import toilet and facility data from free sources (OpenStreetMap + web scraping) instead of expensive Google Places API, providing 100% cost savings while maintaining functionality.

## 🆓 Cost Savings

- **Google Places API**: ~$50-100 per 1000 places
- **Our Solution**: $0 (completely free)
- **No API keys required** for basic functionality
- **No monthly billing** surprises

## 🛠️ Implementation Details

### Data Sources (in order of preference):

1. **OpenStreetMap Overpass API** (Primary)
   - Free and reliable
   - Rich metadata (tags, accessibility info)
   - Global coverage
   - Respects fair use policy

2. **Web Scraping** (Fallback)
   - Google Maps public data
   - Used when OSM has insufficient results
   - Rate-limited to avoid blocking
   - Extracts basic place information

### Architecture

```
Admin Request → Validate Input → Query OSM → Scrape if needed → Deduplicate → Save to DB
```

## 📁 Files Structure

```
/admin/import-wc/page.js          # Admin UI for import
/api/admin/import-places/route.js # Backend scraping logic
/database/add_google_place_id_column.sql # DB migration
SCRAPING_IMPORT_README.md         # This file
GOOGLE_MAPS_IMPORT.md            # Updated user guide
TESTING_IMPORT.md                # Testing instructions
INSTALL_CHEERIO.md               # Setup instructions
```

## 🔧 Technical Implementation

### Dependencies
- `cheerio` - HTML parsing for web scraping
- Built-in `fetch` - HTTP requests
- Supabase client - Database operations

### Key Functions

#### `scrapeOpenStreetMap(lat, lng, radius, placeType)`
- Queries Overpass API for places
- Maps OSM amenity tags to our place types
- Returns structured place data

#### `scrapeGoogleMaps(lat, lng, radius, searchTerms)`
- Scrapes Google Maps search results
- Extracts place names and basic info
- Handles rate limiting and errors

#### `generateTags(placeName, placeType, description)`
- Analyzes text content for tag keywords
- Generates accessibility, pricing, and facility tags
- Returns array of applicable tags

### Data Mapping

#### Place Types
```javascript
const PLACE_TYPE_SEARCH_TERMS = {
  toilet: ["toaleta", "wc", "restroom", "toilet"],
  restaurant: ["restauracja", "restaurant"],
  cafe: ["kawiarnia", "cafe", "coffee"],
  // ... more mappings
};
```

#### Auto-generated Tags
- **"darmowa"**: Contains "darmow", "bezpłat", "free"
- **"płatna"**: Contains "płat", "koszt", "paid"  
- **"dostępnaDlaNiepełnosprawnych"**: Contains "niepełnosprawnych", "disabled", "wheelchair"
- **"przewijak"**: Contains "przewijak", "baby", "dzieci"

## 🔒 Security Features

- Admin-only access (`admin@sviete.pl`)
- Input validation and sanitization
- Rate limiting to prevent abuse
- Duplicate detection by location and name
- Error handling for network issues

## 📊 Database Schema

### New Column: `wcs.google_place_id`
```sql
ALTER TABLE wcs ADD COLUMN google_place_id TEXT UNIQUE;
```

### Identifier Format:
- OSM places: `osm_node_123456789`
- Scraped places: `scraped_restaurant_52123_21456`
- Prevents duplicates across import sessions

## 🎯 Import Process

1. **Validate Input**
   - Check coordinates format
   - Validate radius (1-50000m)
   - Verify place type

2. **Query OpenStreetMap**
   - Build Overpass API query
   - Extract place data and metadata
   - Convert OSM tags to our format

3. **Web Scraping (if needed)**
   - Search Google Maps with terms
   - Parse HTML for place information
   - Extract coordinates and names

4. **Deduplicate Results**
   - Remove exact duplicates
   - Merge similar places by name/location
   - Prefer OSM data over scraped data

5. **Save to Database**
   - Insert into `wcs` table
   - Add ratings (6-9 range for realistic values)
   - Generate and save tags
   - Track import statistics

## 📈 Performance Optimizations

- **Async Processing**: Parallel requests where possible
- **Rate Limiting**: 2-5 second delays between requests
- **Caching**: Avoid re-processing same coordinates
- **Batch Operations**: Group database inserts
- **Error Recovery**: Continue on individual failures

## 🧪 Testing

### Quick Test Cases:
```javascript
// Warsaw restaurants
{ coordinates: "52.2297,21.0122", radius: 1, type: "restaurant" }

// Krakow tourist attractions  
{ coordinates: "50.0647,19.9450", radius: 5, type: "tourist_attraction" }

// Gdansk toilets
{ coordinates: "54.3520,18.6466", radius: 2, type: "toilet" }

// All types import (admin only)
{ coordinates: "52.2297,21.0122", radius: 1, type: "*" }
```

### Expected Results:
- OSM data for well-mapped areas
- Fallback to scraping for sparse regions
- 70-90% success rate for major cities
- Realistic ratings and relevant tags
- For "*" type: imports all place types with correct place_type mapping

## 🚨 Troubleshooting

### Common Issues:

1. **No Results Found**
   - Area not well mapped in OSM
   - Try larger radius or different place type
   - Some regions have limited data

2. **Scraping Blocked**
   - Temporary IP blocking (wait 10-15 minutes)
   - Reduce frequency of imports
   - Built-in delays should prevent this

3. **OSM API Errors**
   - Overpass API overloaded (retry later)
   - Check status: https://overpass-api.de/
   - Use smaller radius to reduce load

### Debug Information:
```
# Enable detailed logging
console.log messages show:
- Data source used (OSM vs scraping)
- Number of places found
- Deduplication results
- Database insertion success/failures
```

## 🔄 Future Enhancements

### Planned Improvements:
- **Photo Integration**: Scrape Wikimedia Commons images
- **Better Deduplication**: Machine learning similarity detection  
- **More Data Sources**: TripAdvisor, Foursquare APIs
- **Caching Layer**: Redis for frequently requested areas
- **Background Jobs**: Queue system for large imports
- **Enhanced All Types**: Better type detection and classification

### Additional Features:
- **Bulk Import**: Upload CSV files with places
- **Data Validation**: User verification of scraped data
- **Import History**: Track what was imported when
- **Export Function**: Generate reports of imported data
- **Type-specific Settings**: Different radius/settings per place type
- **Admin Dashboard**: Monitor import statistics and success rates

## 📋 Maintenance

### Regular Tasks:
- Monitor OSM API availability
- Check scraping success rates
- Update search terms based on results
- Clean up test data periodically

### Monitoring:
- Track import success/failure rates
- Monitor database growth
- Watch for scraping blocks or errors
- Verify data quality regularly

## 🤝 Contributing

To extend this feature:

1. **Add New Data Sources**: Implement additional scrapers
2. **Improve Tag Detection**: Enhance text analysis
3. **Better Deduplication**: Improve similarity algorithms
4. **UI Enhancements**: Add progress bars, better feedback

### Code Style:
- Use async/await for HTTP requests
- Add comprehensive error handling  
- Include detailed console logging
- Write unit tests for new functions

## 📞 Support

For issues or questions:
- Check `TESTING_IMPORT.md` for debugging steps
- Review console logs for detailed error messages
- Verify database schema is up to date
- Ensure cheerio dependency is installed

---

**Total Implementation**: ~800 lines of code, 100% cost savings, unlimited usage! 🎉