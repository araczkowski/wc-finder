# Installing Cheerio for Web Scraping

## Install Cheerio

Run the following command in the wc-finder directory:

```bash
npm install cheerio
```

Or if using yarn:

```bash
yarn add cheerio
```

## Verify Installation

Check that cheerio was added to your package.json:

```json
{
  "dependencies": {
    "cheerio": "^1.0.0-rc.12",
    ...
  }
}
```

## Usage in the Project

Cheerio is now used in `/app/api/admin/import-places/route.js` for:

1. **Web Scraping**: Parsing HTML from Google Maps and other sources
2. **DOM Manipulation**: Extracting place data from scraped HTML
3. **Data Extraction**: Finding place names, addresses, and other information

## Alternative Installation

If you prefer a specific version:

```bash
npm install cheerio@^1.0.0-rc.12
```

## What Cheerio Does

- Server-side jQuery-like HTML parsing
- No browser required
- Fast and lightweight
- Perfect for scraping web data

The import feature now uses free data sources instead of paid Google Places API:
- OpenStreetMap Overpass API (free)
- Web scraping of public data (free)
- No API keys required for basic functionality