# Google Maps API Setup Guide

## Overview

This guide explains how to set up Google Maps API for the WC Finder application's address autocomplete, geocoding features, and admin import functionality. The API integration provides enhanced address suggestions, automatic GPS coordinate retrieval, and improved geocoding for bulk place imports.

## Prerequisites

- Google Cloud Platform account
- Credit card for billing setup (required even for free tier)
- Basic understanding of API keys and restrictions

## Step-by-Step Setup

### 1. Create Google Cloud Project

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Click "Select a project" → "New Project"
3. Enter project name: `wc-finder-maps`
4. Select billing account or create new one
5. Click "Create"

### 2. Enable Required APIs

Navigate to "APIs & Services" → "Library" and enable:

#### Required APIs:
- **Places API** - For address autocomplete
- **Geocoding API** - For address to coordinates conversion and admin import geocoding
- **Maps JavaScript API** - For map functionality

#### Steps to enable each API:
1. Search for the API name
2. Click on the API
3. Click "Enable"
4. Repeat for all three APIs

### 3. Create API Credentials

1. Go to "APIs & Services" → "Credentials"
2. Click "Create Credentials" → "API Key"
3. Copy the generated API key
4. Click "Restrict Key" for security

### 4. Configure API Key Restrictions

#### Application Restrictions:
- Select "HTTP referrers (web sites)"
- Add your domains:
  ```
  localhost:3000/*
  *.vercel.app/*
  yourdomain.com/*
  *.yourdomain.com/*
  ```

#### API Restrictions:
- Select "Restrict key"
- Choose only the APIs you enabled:
  - Places API
  - Geocoding API
  - Maps JavaScript API

### 5. Set Up Billing

1. Go to "Billing" in Google Cloud Console
2. Link a billing account to your project
3. Set up budget alerts (recommended: $50/month)
4. Enable billing for the project

**Important**: Even with free tier credits, billing must be enabled.

## Environment Configuration

### Add API Key to Environment Variables

Create or update `.env.local` in your project root:

```bash
# Google Maps API Configuration
NEXT_PUBLIC_GOOGLE_MAPS_API_KEY=your_api_key_here

# Server-side Google Maps API (for admin import geocoding)
GOOGLE_MAPS_API_KEY=your_api_key_here
```

**Note**: You need both keys:
- `NEXT_PUBLIC_GOOGLE_MAPS_API_KEY` - For client-side features (address autocomplete)
- `GOOGLE_MAPS_API_KEY` - For server-side features (admin import geocoding)

### Production Environment

For production deployments (Vercel, Netlify, etc.):

1. Go to your deployment platform settings
2. Add environment variables:
   - Name: `NEXT_PUBLIC_GOOGLE_MAPS_API_KEY`, Value: Your API key
   - Name: `GOOGLE_MAPS_API_KEY`, Value: Your API key (same key, different variable)

## API Usage and Quotas

### Free Tier Limits (Monthly)

| API | Free Tier | Additional Cost |
|-----|-----------|-----------------|
| Places Autocomplete | $200 credit (~11,700 requests) | $0.017 per request |
| Geocoding | $200 credit (~40,000 requests) | $0.005 per request |
| Maps JavaScript | $200 credit (~28,500 loads) | $0.007 per load |

### Quota Management

1. Go to "APIs & Services" → "Quotas"
2. Set daily limits to prevent overuse:
   - Places API: 1,000 requests/day
   - Geocoding API: 2,000 requests/day
   - Maps JavaScript API: 1,000 loads/day

## Security Best Practices

### 1. API Key Security

```bash
# ✅ Correct - Environment variable
NEXT_PUBLIC_GOOGLE_MAPS_API_KEY=AIza...

# ❌ Never do this - Hardcoded in source
const API_KEY = "AIzaSyC...";
```

### 2. Domain Restrictions

Always restrict your API key to specific domains:
- Development: `localhost:3000/*`
- Staging: `staging.yourdomain.com/*`
- Production: `yourdomain.com/*`, `*.yourdomain.com/*`

### 3. API Restrictions

Only enable APIs you actually use:
- Remove unused API permissions
- Regularly audit API access
- Monitor usage patterns

### 4. Regular Key Rotation

- Rotate API keys every 6-12 months
- Use separate keys for different environments
- Keep backup keys for seamless rotation

## Monitoring and Alerts

### 1. Usage Monitoring

Set up monitoring for:
- Daily API usage
- Cost tracking
- Error rates
- Quota approaching limits

### 2. Budget Alerts

Create budget alerts at:
- 50% of monthly budget
- 80% of monthly budget
- 100% of monthly budget

### 3. Error Monitoring

Monitor for:
- API key errors (403 responses)
- Quota exceeded errors
- Service unavailable errors

## Testing the Integration

### 1. Verify API Key Works

Test in browser console:
```javascript
fetch(`https://maps.googleapis.com/maps/api/geocode/json?address=Warsaw&key=YOUR_API_KEY`)
  .then(response => response.json())
  .then(data => console.log(data));
```

### 2. Test Application Features

1. **Address Autocomplete**:
   - Type "Warszawa" in address field
   - Verify suggestions appear
   - Select suggestion and check coordinates

2. **Geocoding**:
   - Enter complete address manually
   - Press Enter
   - Verify coordinates are retrieved

3. **Admin Import Geocoding**:
   - Go to admin import page
   - Import places without addresses
   - Verify geocoding works without rate limits

4. **Error Handling**:
   - Test with invalid API key
   - Test with no internet connection
   - Verify fallback to Nominatim works

## Common Issues and Solutions

### Issue 1: "This API project is not authorized"

**Solution**: Enable required APIs in Google Cloud Console
1. Go to APIs & Services → Library
2. Enable Places API, Geocoding API, Maps JavaScript API

### Issue 2: "API key not valid"

**Solution**: Check API key configuration
1. Verify key is correctly set in environment variables
2. Check domain restrictions
3. Ensure billing is enabled

### Issue 3: "You have exceeded your rate-limit"

**Solution**: Manage API quotas
1. Check current usage in Google Cloud Console
2. Adjust quotas or upgrade billing plan
3. Implement request caching in application

### Issue 4: "REQUEST_DENIED"

**Solution**: Check API restrictions
1. Verify referrer restrictions match your domain
2. Check API restrictions include required services
3. Ensure billing account is active

## Cost Optimization Tips

### 1. Implement Caching

```javascript
// Cache geocoding results
const geocodeCache = new Map();

const cachedGeocode = async (address) => {
  if (geocodeCache.has(address)) {
    return geocodeCache.get(address);
  }
  
  const result = await geocodeAddress(address);
  geocodeCache.set(address, result);
  return result;
};
```

### 2. Debounce API Calls

Already implemented in AddressAutocomplete component:
- 300ms delay before making API calls
- Cancels previous requests when new input received

### 3. Use Session Tokens

For Places Autocomplete, implement session tokens to reduce costs:
```javascript
const sessionToken = new google.maps.places.AutocompleteSessionToken();
```

### 4. Set Usage Limits

- Implement daily/monthly usage caps in your application
- Alert users when approaching limits
- Gracefully degrade to fallback services

## Alternative Solutions

### For Development/Testing

If you don't want to use Google Maps API:

1. **OpenStreetMap/Nominatim Only**:
   - Remove Google Maps API key
   - Application automatically uses Nominatim
   - Free but rate-limited (max 1 request/second)
   - Admin import will be slower due to required delays

2. **Mock Data for Testing**:
   ```javascript
   // In development environment
   const MOCK_SUGGESTIONS = [
     { description: "Warszawa, Polska" },
     { description: "Kraków, Polska" }
   ];
   ```

### For Production

Consider alternatives if costs become prohibitive:
- **MapBox** - Similar features, competitive pricing
- **Here Maps** - Enterprise-focused solution
- **OpenCage** - Geocoding API with generous free tier

## Support and Resources

### Official Documentation
- [Google Maps Platform Documentation](https://developers.google.com/maps/documentation)
- [Places API Guide](https://developers.google.com/maps/documentation/places/web-service)
- [Geocoding API Guide](https://developers.google.com/maps/documentation/geocoding)

### Pricing Information
- [Google Maps Platform Pricing](https://developers.google.com/maps/billing-and-pricing/pricing)
- [Pricing Calculator](https://developers.google.com/maps/billing-and-pricing/pricing-calculator)

### Community Support
- [Stack Overflow - Google Maps](https://stackoverflow.com/questions/tagged/google-maps)
- [Google Maps Platform Community](https://developers.google.com/maps/support)

## Conclusion

Setting up Google Maps API enhances the WC Finder application with:
- Professional address autocomplete
- Accurate GPS coordinate retrieval
- Better user experience
- Reliable geocoding services
- Faster admin import functionality without rate limits

The fallback to OpenStreetMap ensures the application works even without Google Maps API, making this enhancement optional but highly recommended for production use.

Remember to:
- Monitor usage and costs regularly
- Keep API keys secure and restricted
- Test thoroughly in all environments
- Set up proper alerts and monitoring