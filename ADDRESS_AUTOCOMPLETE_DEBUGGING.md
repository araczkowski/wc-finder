# Address Autocomplete Debugging Guide

## Common Issues and Solutions

### 1. Autocomplete Not Working in Edit Form

**Symptoms:**
- Suggestions don't appear when typing in edit form
- Component works in add form but not edit form

**Debugging Steps:**

1. **Check Console for Errors:**
   ```javascript
   // Open browser console (F12) and look for:
   [AddressAutocomplete] Google Maps services initialized
   [AddressAutocomplete] Geocoding: [address]
   [EditWC] Coordinates changed: {lat: X, lng: Y}
   ```

2. **Verify Component Integration:**
   ```javascript
   // In edit form, ensure proper props:
   <AddressAutocomplete
     value={address}                    // ✅ Must be connected to state
     onChange={setAddress}              // ✅ Must update address state
     onCoordinatesChange={handleCoordinatesChange} // ✅ Must handle coordinates
     disabled={formLoading}             // ✅ Should be disabled during loading
   />
   ```

3. **Check handleCoordinatesChange Function:**
   ```javascript
   const handleCoordinatesChange = (coords) => {
     console.log("[EditWC] Coordinates changed:", coords); // Add this line
     if (coords && coords.lat && coords.lng) {
       setCoordinates(coords);
       setLocation(`${coords.lat},${coords.lng}`);
     }
   };
   ```

### 2. Coordinates Not Updating

**Symptoms:**
- Address autocomplete works but coordinates field remains empty
- Console shows geocoding success but coordinates don't appear

**Solutions:**

1. **Verify Coordinates State:**
   ```javascript
   // Check if coordinates state is properly managed:
   const [coordinates, setCoordinates] = useState(null);
   const [location, setLocation] = useState("");
   
   // Ensure handleCoordinatesChange updates both:
   const handleCoordinatesChange = (coords) => {
     if (coords && coords.lat && coords.lng) {
       setCoordinates(coords);
       setLocation(`${coords.lat},${coords.lng}`); // ✅ Update location field
     }
   };
   ```

2. **Check Input Field Binding:**
   ```javascript
   <input
     id="location"
     name="location"
     type="text"
     value={location}                    // ✅ Must be bound to location state
     onChange={(e) => setLocation(e.target.value)}
     style={styles.formInput}
     placeholder="e.g., 52.2297,21.0122"
   />
   ```

### 3. Google Maps API Issues

**Symptoms:**
- "API key not valid" errors
- Fallback to Nominatim always occurs
- No suggestions appear

**Solutions:**

1. **Verify API Key:**
   ```bash
   # Check .env.local file:
   NEXT_PUBLIC_GOOGLE_MAPS_API_KEY=your_actual_api_key_here
   ```

2. **Test API Key Manually:**
   ```javascript
   // In browser console:
   fetch(`https://maps.googleapis.com/maps/api/geocode/json?address=Warsaw&key=${process.env.NEXT_PUBLIC_GOOGLE_MAPS_API_KEY}`)
     .then(response => response.json())
     .then(data => console.log(data));
   ```

3. **Check API Restrictions:**
   - Verify domain restrictions in Google Cloud Console
   - Ensure APIs are enabled: Places API, Geocoding API, Maps JavaScript API

### 4. Suggestions Not Appearing

**Symptoms:**
- No dropdown appears when typing
- Component seems unresponsive

**Debugging Steps:**

1. **Enable Debug Mode:**
   ```javascript
   // Add to component props for temporary debugging:
   <AddressAutocomplete
     value={address}
     onChange={setAddress}
     onCoordinatesChange={handleCoordinatesChange}
     // Add this for debugging:
     style={{ border: "2px solid red" }} // Visual confirmation
   />
   ```

2. **Check Minimum Character Length:**
   ```javascript
   // Suggestions only appear after 3+ characters
   // Try typing "War" instead of "W"
   ```

3. **Verify Event Handlers:**
   ```javascript
   // In AddressAutocomplete component, check if getSuggestions is called:
   const getSuggestions = useCallback(async (input) => {
     console.log("[AddressAutocomplete] Getting suggestions for:", input); // Add this
     // ... rest of function
   }, []);
   ```

### 5. Fallback to Nominatim Not Working

**Symptoms:**
- Google API fails but no fallback occurs
- No suggestions from any service

**Solutions:**

1. **Test Nominatim Directly:**
   ```javascript
   // Test in browser console:
   fetch('https://nominatim.openstreetmap.org/search?format=json&q=Warsaw&limit=5&countrycodes=pl')
     .then(response => response.json())
     .then(data => console.log(data));
   ```

2. **Check Network Connectivity:**
   - Verify no corporate firewall blocks nominatim.openstreetmap.org
   - Test from different network if possible

### 6. Component State Issues

**Symptoms:**
- Component loses state when parent re-renders
- Suggestions disappear unexpectedly

**Solutions:**

1. **Verify Parent Component Stability:**
   ```javascript
   // Ensure AddressAutocomplete doesn't remount:
   // ❌ Don't do this:
   {showAddressField && <AddressAutocomplete ... />}
   
   // ✅ Do this instead:
   <AddressAutocomplete
     style={{ display: showAddressField ? 'block' : 'none' }}
     ...
   />
   ```

2. **Check useEffect Dependencies:**
   ```javascript
   // In AddressAutocomplete, ensure proper dependencies:
   useEffect(() => {
     // initialization code
   }, []); // Empty dependency array for one-time init
   ```

## Debugging Tools

### 1. Browser Console Commands

```javascript
// Check if Google Maps loaded:
console.log(window.google?.maps ? "Google Maps loaded" : "Google Maps not loaded");

// Check environment variables:
console.log("API Key configured:", !!process.env.NEXT_PUBLIC_GOOGLE_MAPS_API_KEY);

// Monitor component re-renders:
console.count("AddressAutocomplete render");
```

### 2. Network Tab Debugging

1. Open Developer Tools → Network tab
2. Filter by "maps.googleapis.com" and "nominatim.openstreetmap.org"
3. Type in address field and watch for API calls
4. Check response status codes and content

### 3. React Developer Tools

1. Install React Developer Tools browser extension
2. Find AddressAutocomplete component in component tree
3. Watch state changes: `suggestions`, `isLoading`, `geocodingStatus`
4. Verify props are passed correctly from parent

## Testing Scenarios

### Basic Functionality Test

1. **Type "War" in address field**
   - Expected: Loading indicator appears
   - Expected: Suggestions dropdown appears after ~300ms

2. **Select "Warszawa, Polska" from suggestions**
   - Expected: Address field fills with full address
   - Expected: Coordinates appear in coordinates field
   - Expected: Console shows geocoding success

3. **Type full address manually and press Enter**
   - Expected: Geocoding occurs
   - Expected: Coordinates appear

### API Fallback Test

1. **Temporarily break Google API**
   ```javascript
   // In .env.local, set invalid key:
   NEXT_PUBLIC_GOOGLE_MAPS_API_KEY=invalid_key
   ```

2. **Test address autocomplete**
   - Expected: Fallback to Nominatim
   - Expected: Suggestions still appear (fewer, different format)
   - Expected: Geocoding still works

### Performance Test

1. **Type rapidly in address field**
   - Expected: Previous requests cancelled
   - Expected: Only final request processed
   - Expected: No API spam in Network tab

## Production Issues

### 1. HTTPS Requirements

- Google Maps API requires HTTPS in production
- Ensure deployment uses HTTPS

### 2. Domain Restrictions

- Update Google Cloud Console with production domain
- Include all subdomains (www, staging, etc.)

### 3. Rate Limiting

- Monitor API usage in Google Cloud Console
- Set up billing alerts
- Implement client-side rate limiting if needed

## Getting Help

### Error Reporting Template

When reporting issues, include:

1. **Environment:**
   - Browser and version
   - Development/Production
   - Google Maps API configured? (Yes/No)

2. **Steps to reproduce:**
   - Specific address typed
   - Expected vs actual behavior

3. **Console output:**
   - Copy relevant console messages
   - Include any error messages

4. **Network information:**
   - API response status codes
   - Any failed requests

### Quick Fix Checklist

- [ ] API key in .env.local file
- [ ] Required APIs enabled in Google Cloud
- [ ] Domain restrictions configured correctly
- [ ] Component props passed correctly
- [ ] handleCoordinatesChange function implemented
- [ ] Coordinates state properly managed
- [ ] No JavaScript errors in console
- [ ] Network requests completing successfully

### Contact Information

For additional support:
- Check project documentation
- Review GitHub issues
- Test with the `/test-address` page for isolated debugging