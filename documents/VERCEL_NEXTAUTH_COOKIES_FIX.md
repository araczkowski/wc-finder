# Fix for NextAuth Cookies Issues on Vercel - Complete Solution

## Problem Description
API endpoints work perfectly on localhost but fail on Vercel production with missing NextAuth cookies:
- `GET /api/wc-ratings` - Works locally, fails on Vercel
- `GET /api/wc-photos` - Works locally, fails on Vercel
- Missing `next-auth.session-token` cookies in requests on Vercel

## Root Cause Analysis
1. **NextAuth cookies configuration** - Default settings may not work properly on Vercel
2. **Secure cookies enforcement** - Production environment has different cookie requirements
3. **Session validation** - `getServerSession()` fails when cookies aren't properly transmitted
4. **NEXTAUTH_URL mismatch** - URL configuration issues between development and production

## Complete Solution

### Step 1: Fix NextAuth Configuration

Update `app/api/auth/[...nextauth]/route.js`:

```javascript
export const authOptions = {
  // ... existing configuration ...
  
  // Add explicit cookies configuration for Vercel
  cookies: {
    sessionToken: {
      name: `next-auth.session-token`,
      options: {
        httpOnly: true,
        sameSite: "lax",
        path: "/",
        secure: process.env.NODE_ENV === "production",
        domain: process.env.NODE_ENV === "production" ? ".vercel.app" : undefined,
      },
    },
    callbackUrl: {
      name: `next-auth.callback-url`,
      options: {
        sameSite: "lax",
        path: "/",
        secure: process.env.NODE_ENV === "production",
        domain: process.env.NODE_ENV === "production" ? ".vercel.app" : undefined,
      },
    },
    csrfToken: {
      name: `next-auth.csrf-token`,
      options: {
        httpOnly: true,
        sameSite: "lax",
        path: "/",
        secure: process.env.NODE_ENV === "production",
        domain: process.env.NODE_ENV === "production" ? ".vercel.app" : undefined,
      },
    },
  },
  
  // Ensure secure cookies are used in production
  useSecureCookies: process.env.NODE_ENV === "production",
  
  // Enable debug logging for troubleshooting
  debug: process.env.NODE_ENV === "development",
  
  // Explicitly set secret
  secret: process.env.NEXTAUTH_SECRET,
};
```

### Step 2: Update Environment Variables on Vercel

Ensure these environment variables are correctly set in Vercel Dashboard:

**Required Variables:**
- `NEXTAUTH_SECRET` - Generate with: `openssl rand -base64 32`
- `NEXTAUTH_URL` - Set to: `https://your-app-name.vercel.app`
- `GOOGLE_CLIENT_ID` - Your Google OAuth client ID
- `GOOGLE_CLIENT_SECRET` - Your Google OAuth client secret
- `SUPABASE_URL` or `NEXT_PUBLIC_SUPABASE_URL`
- `SUPABASE_SERVICE_ROLE_KEY`
- `NEXT_PUBLIC_SUPABASE_ANON_KEY`

**Critical: NEXTAUTH_URL Configuration**
```
For Vercel deployment named "wc-finder":
NEXTAUTH_URL=https://wc-finder.vercel.app

For custom domain:
NEXTAUTH_URL=https://yourdomain.com
```

### Step 3: Alternative Solution - Remove Session Requirement for GET Endpoints

If cookies still don't work, modify API routes to not require authentication for reading data:

**Update `app/api/wc-ratings/route.js`:**
```javascript
// GET /api/wc-ratings - Remove authentication requirement
export async function GET(request) {
  try {
    const { searchParams } = new URL(request.url);
    const wcId = searchParams.get("wc_id");

    if (!wcId) {
      return NextResponse.json(
        { error: "wc_id parameter is required" },
        { status: 400 },
      );
    }

    // Fetch ratings without session requirement
    const { data: ratings, error } = await supabase
      .from("wc_rating")
      .select("id, rating, comment, created_at, updated_at, user_id")
      .eq("wc_id", wcId)
      .order("created_at", { ascending: false });

    if (error) {
      return NextResponse.json(
        { error: `Failed to fetch ratings: ${error.message}` },
        { status: 500 },
      );
    }

    return NextResponse.json({
      success: true,
      ratings: ratings || [],
    });
  } catch (error) {
    return NextResponse.json(
      { error: `Internal server error: ${error.message}` },
      { status: 500 },
    );
  }
}

// Keep POST endpoint with authentication for creating ratings
export async function POST(request) {
  const session = await getServerSession(authOptions);
  if (!session?.user?.id) {
    return NextResponse.json(
      { error: "Authentication required" },
      { status: 401 },
    );
  }
  // ... rest of POST logic
}
```

**Update `app/api/wc-photos/route.js`:**
```javascript
// GET /api/wc-photos - Remove authentication requirement
export async function GET(request) {
  try {
    const { searchParams } = new URL(request.url);
    const wcId = searchParams.get("wc_id");

    if (!wcId) {
      return NextResponse.json(
        { error: "wc_id parameter is required" },
        { status: 400 },
      );
    }

    // Fetch photos without session requirement
    const { data: photos, error } = await supabase
      .from("wc_photos")
      .select("id, wc_id, user_id, photo, created_at, updated_at")
      .eq("wc_id", wcId)
      .order("created_at", { ascending: false });

    if (error) {
      return NextResponse.json(
        { error: `Failed to fetch photos: ${error.message}` },
        { status: 500 },
      );
    }

    return NextResponse.json({
      success: true,
      photos: photos || [],
    });
  } catch (error) {
    return NextResponse.json(
      { error: `Internal server error: ${error.message}` },
      { status: 500 },
    );
  }
}
```

### Step 4: Ensure RLS Policies Allow Access

Make sure Supabase RLS policies allow public read access:

```sql
-- Allow public read access to ratings
CREATE POLICY "Public can view wc ratings" ON wc_rating
    FOR SELECT
    USING (true);

-- Allow public read access to photos
CREATE POLICY "Public can view wc photos" ON wc_photos
    FOR SELECT
    USING (true);

-- Grant necessary permissions
GRANT SELECT ON wc_rating TO anon;
GRANT SELECT ON wc_photos TO anon;
GRANT ALL PRIVILEGES ON wc_rating TO service_role;
GRANT ALL PRIVILEGES ON wc_photos TO service_role;
```

### Step 5: Debug NextAuth on Vercel

Add debugging to see what's happening:

**Create `middleware.js` in project root:**
```javascript
import { withAuth } from "next-auth/middleware";

export default withAuth(
  function middleware(req) {
    console.log("Middleware - Token:", req.nextauth.token);
    console.log("Middleware - URL:", req.url);
  },
  {
    callbacks: {
      authorized: ({ token }) => {
        console.log("Auth check - Token:", token);
        return true; // Allow all requests
      },
    },
  }
);

export const config = {
  matcher: ["/api/wc-ratings/:path*", "/api/wc-photos/:path*"]
};
```

**Add logging to API routes:**
```javascript
export async function GET(request) {
  console.log("API - Headers:", Object.fromEntries(request.headers.entries()));
  console.log("API - Cookies:", request.headers.get('cookie'));
  
  const session = await getServerSession(authOptions);
  console.log("API - Session:", session);
  
  // ... rest of logic
}
```

### Step 6: Test and Verify

**Local Testing:**
1. Run `npm run build && npm run start`
2. Check browser dev tools → Application → Cookies
3. Verify `next-auth.session-token` exists

**Vercel Testing:**
1. Deploy to Vercel
2. Check browser dev tools → Network tab
3. Look for API requests and their headers
4. Verify cookies are being sent

### Step 7: Rollback Strategy

If issues persist, implement a temporary workaround:

```javascript
// Temporary: Skip authentication for specific endpoints
export async function GET(request) {
  // Skip session check entirely
  const { searchParams } = new URL(request.url);
  const wcId = searchParams.get("wc_id");
  
  // Directly fetch from Supabase using service role
  const { data, error } = await supabase
    .from("wc_rating")
    .select("*")
    .eq("wc_id", wcId);
    
  return NextResponse.json({ success: true, data });
}
```

## Common Issues and Solutions

### Issue 1: NEXTAUTH_URL mismatch
**Solution:** Ensure `NEXTAUTH_URL` matches your Vercel deployment URL exactly

### Issue 2: Secure cookies not working
**Solution:** Use the cookies configuration provided in Step 1

### Issue 3: Domain issues
**Solution:** Set domain to `.vercel.app` for Vercel deployments

### Issue 4: Session not persisting
**Solution:** Check that `NEXTAUTH_SECRET` is the same across all deployments

## Success Verification

After implementing the fix:
- ✅ NextAuth cookies appear in browser dev tools on Vercel
- ✅ API endpoints return data instead of 401 errors
- ✅ Session is properly maintained across requests
- ✅ User can edit WCs without authentication errors

## Additional Debugging

If problems persist, enable full NextAuth debugging:

```javascript
// In authOptions
debug: true,
logger: {
  error(code, metadata) {
    console.error("NextAuth Error:", code, metadata);
  },
  warn(code) {
    console.warn("NextAuth Warning:", code);
  },
  debug(code, metadata) {
    console.log("NextAuth Debug:", code, metadata);
  },
},
```

This comprehensive solution should resolve NextAuth cookies issues on Vercel and restore proper API functionality.