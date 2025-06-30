# Address Autocomplete and GPS Coordinates Feature

## Overview

This feature adds intelligent address autocomplete with automatic GPS coordinate retrieval to the WC Finder application. It uses Google Places API as the primary service with OpenStreetMap/Nominatim as a fallback, ensuring reliable functionality even if Google services are unavailable.

## Features

### 🎯 Core Functionality

1. **Smart Address Autocomplete**
   - Real-time address suggestions as user types
   - Prioritizes Polish addresses with country restriction
   - Supports both Google Places API and Nominatim fallback
   - Keyboard navigation (arrow keys, Enter, Escape)
   - Click-to-select suggestions

2. **Automatic GPS Coordinate Retrieval**
   - Automatically geocodes selected addresses to GPS coordinates
   - Updates coordinates in real-time when address is selected
   - Visual feedback for geocoding status
   - Handles both successful and failed geocoding attempts

3. **Dual API Support**
   - **Primary**: Google Places Autocomplete + Geocoding API
   - **Fallback**: OpenStreetMap Nominatim API
   - Seamless switching between services if one fails

4. **Enhanced User Experience**
   - Loading indicators during API calls
   - Status messages for geocoding operations
   - Error handling with user-friendly messages
   - Debounced input to prevent excessive API calls

## Implementation Details

### Components Created

#### 1. `AddressAutocomplete.js`
Main component providing address autocomplete functionality:

```javascript
<AddressAutocomplete
  value={address}
  onChange={setAddress}
  onCoordinatesChange={handleCoordinatesChange}
  placeholder="Wpisz adres, np. ul. Marszałkowska 1, Warszawa"
  disabled={loading}
  required
/>
```

**Props:**
- `value`: Current address string
- `onChange`: Function called when address changes
- `onCoordinatesChange`: Function called when coordinates are retrieved
- `placeholder`: Input placeholder text
- `disabled`: Whether input is disabled
- `required`: Whether field is required
- `style`: Custom styles for the input
- `className`: Custom CSS class

**Features:**
- Debounced suggestions (300ms delay)
- Keyboard navigation support
- Visual loading indicators
- Status messages for geocoding operations

#### 2. `useGoogleMaps.js` Hook
Custom hooks for Google Maps API management:

```javascript
const { isLoaded, isLoading, error } = useGoogleMaps();
const { geocodeAddress, reverseGeocode } = useGeocoding();
const { getPlacePredictions } = usePlacesAutocomplete();
```

**Hooks provided:**
- `useGoogleMaps`: Manages Google Maps script loading
- `useGeocoding`: Provides geocoding and reverse geocoding functions
- `usePlacesAutocomplete`: Provides address prediction functionality

### Integration Points

#### 1. Add WC Form (`/wc/add/page.js`)
- Replaced basic input with `AddressAutocomplete` component
- Added coordinate state management
- Enhanced GPS location detection
- Improved user feedback for location operations

#### 2. Edit WC Form (`/wc/edit/[id]/page.js`)
- Integrated `AddressAutocomplete` component
- Added coordinate parsing for existing WC data
- Maintained backward compatibility with existing data

### API Configuration

#### Required Environment Variables

```bash
# Google Maps API Key (optional - fallback to Nominatim if missing)
NEXT_PUBLIC_GOOGLE_MAPS_API_KEY=your_google_maps_api_key_here
```

#### Google Maps API Requirements

If using Google Maps API, ensure the following APIs are enabled:
- **Places API** (for address autocomplete)
- **Geocoding API** (for coordinate retrieval)
- **JavaScript API** (for script loading)

#### API Restrictions (Recommended)
- Restrict API key to specific domains
- Set usage quotas to prevent abuse
- Enable only required APIs

### Fallback System

The system gracefully falls back to OpenStreetMap/Nominatim when:
- Google Maps API key is not provided
- Google Maps script fails to load
- Google APIs return errors or no results
- Network issues with Google services

**Nominatim Configuration:**
- Limited to Polish addresses (`countrycodes=pl`)
- Maximum 5 suggestions per query
- Respects Nominatim usage policies
- No API key required

## User Experience Flow

### 1. Address Input
1. User starts typing an address
2. After 300ms delay, suggestions appear
3. User can navigate with keyboard or mouse
4. Loading indicator shows during API calls

### 2. Address Selection
1. User selects suggestion or presses Enter
2. Address field is populated
3. Automatic geocoding begins
4. Status message shows geocoding progress
5. Coordinates are retrieved and stored
6. Success message confirms GPS coordinates

### 3. Manual Address Entry
1. User types complete address without selecting suggestions
2. Presses Enter or moves to next field
3. System attempts to geocode the entered address
4. Coordinates retrieved if address is valid
5. Warning shown if geocoding fails

## Technical Benefits

### 🚀 Performance
- Debounced API calls reduce server load
- Efficient caching of Google Maps services
- Lazy loading of Google Maps script
- Minimal re-renders with proper state management

### 🛡️ Reliability
- Dual API system ensures high availability
- Graceful error handling and recovery
- Fallback to manual coordinate entry if needed
- No breaking changes to existing functionality

### 🌍 Localization
- Polish language interface
- Poland-focused address suggestions
- Regional API configurations
- Proper handling of Polish characters

### 📱 Accessibility
- Keyboard navigation support
- Screen reader friendly
- Clear visual feedback
- Error states properly communicated

## Usage Examples

### Basic Implementation
```javascript
import AddressAutocomplete from '../components/AddressAutocomplete';

const [address, setAddress] = useState('');
const [coordinates, setCoordinates] = useState(null);

const handleCoordinatesChange = (coords) => {
  setCoordinates(coords);
  console.log(`GPS: ${coords.lat}, ${coords.lng}`);
};

<AddressAutocomplete
  value={address}
  onChange={setAddress}
  onCoordinatesChange={handleCoordinatesChange}
  placeholder="Enter address..."
  required
/>
```

### Advanced Configuration
```javascript
<AddressAutocomplete
  value={address}
  onChange={setAddress}
  onCoordinatesChange={handleCoordinatesChange}
  placeholder="Wpisz adres..."
  disabled={isSubmitting}
  required
  style={{ borderColor: hasError ? 'red' : '#ddd' }}
  className="custom-address-input"
/>
```

## API Usage and Costs

### Google Maps API
- **Places Autocomplete**: ~$0.017 per request
- **Geocoding**: ~$0.005 per request
- **Free tier**: $200 monthly credit

### Nominatim (OpenStreetMap)
- **Free service** with usage limitations
- Rate limited to ~1 request per second
- No API key required
- Suitable for development and low-traffic applications

## Testing Scenarios

### 1. Normal Operation
- Type "Warszawa" → Should show Warsaw suggestions
- Select suggestion → Should populate address and coordinates
- Verify coordinates are reasonable for selected location

### 2. Fallback Testing
- Disable internet → Should show appropriate error messages
- Invalid API key → Should fall back to Nominatim
- Test with Polish characters (ł, ą, ś, etc.)

### 3. Edge Cases
- Empty input → Should clear suggestions
- Very short input (1-2 chars) → Should not trigger API calls
- Network errors → Should handle gracefully
- Invalid addresses → Should show appropriate warnings

## Future Enhancements

### Planned Features
- **Current location detection** with reverse geocoding
- **Map integration** for visual address selection
- **Address validation** with postal code verification
- **Favorite addresses** for frequent users
- **Offline support** with cached addresses

### Performance Optimizations
- **Request caching** to reduce API calls
- **Service worker** for offline functionality
- **Bundle optimization** for Google Maps loading
- **CDN integration** for faster script loading

## Troubleshooting

### Common Issues

#### 1. No Suggestions Appearing
- Check if Google Maps API key is valid
- Verify internet connection
- Check browser console for errors
- Ensure Nominatim fallback is working

#### 2. Coordinates Not Retrieved
- Check geocoding API permissions
- Verify address format is valid
- Test with simpler address formats
- Check API quota limits

#### 3. Slow Performance
- Check network connectivity
- Verify API response times
- Consider increasing debounce delay
- Monitor API usage quotas

### Debug Information
Enable console logging by adding to browser console:
```javascript
localStorage.setItem('debug-address-autocomplete', 'true');
```

## Security Considerations

### API Key Protection
- Use domain restrictions for Google Maps API key
- Set usage quotas and alerts
- Monitor API usage regularly
- Rotate keys periodically

### Data Privacy
- Address data is not stored permanently
- Only coordinates are saved to database
- User location data handled according to privacy policy
- GDPR compliance maintained

## Conclusion

The Address Autocomplete and GPS feature significantly enhances the user experience of WC Finder by:
- Reducing manual typing errors
- Providing accurate GPS coordinates automatically
- Supporting Polish addresses with proper character handling
- Ensuring reliable operation with fallback systems
- Maintaining high performance with optimized API usage

This implementation provides a solid foundation for location-based features while maintaining the application's reliability and user-friendly interface.