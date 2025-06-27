# WC Tags Debugging Instructions

## Problem Description

When editing a WC and trying to expand the tags selector (clicking the + button), the form is being submitted and the user is redirected to the home page with a status message. This prevents users from adding or removing tags during WC editing.

## Root Cause

The issue occurs because buttons inside forms have a default `type="submit"` in HTML. When clicking buttons in the WCTags component that don't explicitly specify `type="button"`, they trigger form submission.

## Fix Applied

Added `type="button"` and proper event handling to all buttons in the WCTags component:

1. **Add Tag Button (+)** - The button that expands/collapses the tag selector
2. **Remove Tag Buttons (×)** - Buttons that remove individual tags
3. **Available Tag Buttons** - Buttons that add specific tags

## Testing Instructions

### Test Environment Setup

1. Navigate to the test page: `http://localhost:3000/test-tags`
2. This page contains two sections:
   - **Outside Form**: Should work fine (baseline test)
   - **Inside Form**: Should NOT submit the form when clicking tag buttons

### Manual Testing Steps

1. **Open the application** in a browser
2. **Navigate to WC edit page** for any existing WC (e.g., `/wc/edit/[wc-id]`)
3. **Try the following actions**:
   - Click the **+** button next to "Tagi" to expand tag selector
   - If tags exist, try clicking the **×** button to remove a tag
   - If tag selector is open, try clicking on available tag buttons

### Expected Behavior

- ✅ **Tag selector should expand/collapse** without form submission
- ✅ **Tags should be added/removed** without form submission
- ✅ **Form should only submit** when clicking the main "Update" button
- ✅ **Console should show debug messages** for each button click

### Browser Console Debugging

Open browser developer tools (F12) and check the console for debug messages:

```javascript
// Expected console output when clicking tag buttons:
WCTags: Add button clicked { wcId: "...", showTagSelector: false }
WCTags: addTag function called { wcId: "...", tagName: "płatna", hasEvent: true }
WCTags: Remove tag button clicked { wcId: "...", tag: "darmowa" }
WCTags: removeTag function called { wcId: "...", tagName: "darmowa", hasEvent: true }
```

### Error Indicators

If the problem persists, you'll see:
- ❌ **Form submission** when clicking tag buttons
- ❌ **Redirect to home page** with status message
- ❌ **No debug messages** in console (indicates event handlers not firing)

## Alternative Testing Method

Use the dedicated test page at `/test-tags`:

1. **Test outside form first** - Should work without issues
2. **Test inside form** - Should NOT submit the form
3. **Compare behavior** between both sections

## Code Changes Made

### 1. Button Type Specification

```javascript
// Before (problematic)
<button onClick={handleClick}>

// After (fixed)
<button type="button" onClick={handleClick}>
```

### 2. Event Prevention

```javascript
// Added to all click handlers
onClick={(e) => {
  console.log("Debug: Button clicked");
  e.preventDefault();
  e.stopPropagation();
  handleAction();
}}
```

### 3. Function Signatures Updated

```javascript
// Before
const addTag = async (tagName) => { ... }

// After
const addTag = async (tagName, event) => {
  if (event) {
    event.preventDefault();
    event.stopPropagation();
  }
  // ... rest of function
}
```

## Files Modified

1. `app/components/WCTags.js` - Main component with button fixes
2. `app/test-tags/page.js` - Test page for isolated testing

## Database Requirements

Ensure the `wc_tags` table exists in your database:

```sql
-- Run this in Supabase SQL Editor if not already done
-- See: database/setup_wc_tags_complete.sql
CREATE TABLE IF NOT EXISTS wc_tags (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    wc_id UUID NOT NULL REFERENCES wcs(id) ON DELETE CASCADE,
    tag TEXT NOT NULL,
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

## Additional Debugging

If the issue persists after applying the fixes:

1. **Check for JavaScript errors** in browser console
2. **Verify all buttons have `type="button"`** in the rendered HTML
3. **Test with different browsers** (Chrome, Firefox, Safari)
4. **Check for conflicting event listeners** on parent elements
5. **Verify the form's `onSubmit` handler** isn't being triggered unexpectedly

## Success Criteria

The fix is successful when:
- ✅ Tag selector expands/collapses without form submission
- ✅ Tags can be added and removed without page redirect
- ✅ Form only submits when clicking the main submit button
- ✅ Debug messages appear in console for tag interactions
- ✅ No unexpected page redirects occur during tag management

## Contact

If issues persist after following these instructions, check:
1. Browser developer tools for JavaScript errors
2. Network tab for unexpected API calls
3. Console for debug messages
4. HTML source to verify button types are correctly applied