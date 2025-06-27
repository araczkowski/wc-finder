# PostGIS place_type Fix Documentation

## Problem Description

The `place_type` field was always showing as "Toaleta" (toilet) in the main WC report page, even though individual WC details showed correct types like "Bar", "Restaurant", etc.

## Root Cause Analysis

The issue was identified in the PostGIS function `get_wcs_by_distance` used for location-based WC sorting. While the fallback queries (non-PostGIS) were correctly returning the `place_type` field, the PostGIS function was returning `undefined` for this field.

### Debug Evidence

**Before Fix:**
```
[DEBUG WCS API] PostGIS query used, place_type in first record: undefined
[DEBUG WCS API] WC 0: place_type=undefined, typeof place_type=undefined
```

**After Fix:**
```  
[DEBUG WCS API] Successfully supplemented place_type data, first record: bar
[DEBUG WCS API] WC 0: place_type=bar, typeof place_type=string
```

## Solution Implemented

Instead of attempting to fix the PostGIS function directly in the database (which would require admin access), we implemented a **runtime fallback solution** in the API layer:

### Implementation Details

1. **Detection**: Check if PostGIS results have `place_type` as `undefined`
2. **Fallback Query**: When detected, perform an additional query to fetch `place_type` data for the same WCs
3. **Data Merge**: Combine the PostGIS spatial results with the place_type data
4. **Fallback Default**: If the supplementary query fails, default to "toilet"

### Code Location

File: `wc-finder/app/api/wcs/route.js`

```javascript
// Check if PostGIS function is missing place_type and fallback to supplement it
if (wcs && wcs.length > 0 && wcs[0].place_type === undefined) {
  try {
    // Get WC IDs from PostGIS result
    const wcIds = wcs.map((wc) => wc.id);

    // Fetch place_type data for these WCs using regular query
    const { data: placeTypeData, error: placeTypeError } =
      await supabase
        .from("wcs")
        .select("id, place_type")
        .in("id", wcIds);

    if (!placeTypeError && placeTypeData) {
      // Create a map of id -> place_type
      const placeTypeMap = {};
      placeTypeData.forEach((wc) => {
        placeTypeMap[wc.id] = wc.place_type || "toilet";
      });

      // Add place_type to PostGIS results
      wcs = wcs.map((wc) => ({
        ...wc,
        place_type: placeTypeMap[wc.id] || "toilet",
      }));
    } else {
      // Set default place_type for all records
      wcs = wcs.map((wc) => ({
        ...wc,
        place_type: "toilet",
      }));
    }
  } catch (supplementErr) {
    // Set default place_type for all records on error
    wcs = wcs.map((wc) => ({
      ...wc,
      place_type: "toilet",
    }));
  }
}
```

## Benefits of This Solution

1. **Non-Invasive**: No database schema changes required
2. **Backward Compatible**: Works regardless of PostGIS function state
3. **Performance Optimized**: Only executes supplementary query when needed
4. **Fault Tolerant**: Graceful fallback to default values on any error
5. **Maintainable**: Solution is contained within the API layer

## Alternative Solutions Considered

### Option 1: Fix PostGIS Function Directly
- **Pros**: Clean, fixes root cause
- **Cons**: Requires database admin access, deployment complexity
- **Status**: Rejected due to access limitations

### Option 2: Always Use Fallback Query
- **Pros**: Simple, guaranteed consistency
- **Cons**: Loses PostGIS distance sorting benefits
- **Status**: Rejected due to performance impact

### Option 3: Runtime Detection + Supplement (Chosen)
- **Pros**: Best of both worlds - keeps PostGIS benefits while fixing data
- **Cons**: Slightly more complex logic
- **Status**: **Implemented**

## Performance Impact

- **When PostGIS works correctly**: No additional queries (0 performance impact)
- **When PostGIS missing place_type**: One additional lightweight query per page load
- **Query optimization**: Uses `select("id, place_type")` and `in("id", wcIds)` for efficiency

## Testing Results

The fix has been tested and confirmed working:

✅ **KFC Koluszki**: Now shows "Bar" instead of "Toaleta"  
✅ **Sklep**: Now shows "Supermarket" instead of "Toaleta"  
✅ **Przychodnia Środa Śląska**: Now shows "Train Station" instead of "Toaleta"  
✅ **Przejazd**: Now shows "Bar" instead of "Toaleta"  

## Future Improvements

If database admin access becomes available, the PostGIS function should be updated using:

```sql
-- File: database/fix_postgis_place_type.sql
CREATE OR REPLACE FUNCTION get_wcs_by_distance(...)
RETURNS TABLE (..., place_type TEXT, ...)
AS $$
BEGIN
    RETURN QUERY
    SELECT
        ...
        COALESCE(w.place_type, 'toilet'::TEXT) as place_type,
        ...
    FROM wcs w
    ...
END;
$$;
```

This would eliminate the need for the runtime fallback solution.

## Conclusion

The issue has been successfully resolved with a robust, production-ready solution that maintains all existing functionality while correctly displaying place types in the WC report.