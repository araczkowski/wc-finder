# WC Finder

A modern web application for finding and managing public restrooms with advanced location features.

## Features

- 🚽 **WC Management**: Add, edit, and delete public restroom locations
- 🔍 **Smart Address Search**: Intelligent address autocomplete with GPS coordinates
- 📍 **Location Services**: Automatic GPS detection and reverse geocoding
- ⭐ **Rating System**: Rate and review restrooms (1-10 stars)
- 🖼️ **Photo Gallery**: Upload and view multiple photos for each location
- 👤 **User Authentication**: Secure login with Google OAuth or email/password
- 📱 **Responsive Design**: Works perfectly on mobile, tablet, and desktop
- 🌍 **Polish Localization**: Optimized for Polish addresses and language

## Address Autocomplete & GPS Features

The application includes advanced address input with:

- **Smart Autocomplete**: Real-time address suggestions as you type
- **Automatic GPS Coordinates**: Coordinates retrieved automatically from addresses
- **Dual API Support**: Google Places API with OpenStreetMap fallback
- **Polish Address Support**: Optimized for Polish addresses and special characters
- **Keyboard Navigation**: Full keyboard support for accessibility

### Optional Google Maps Integration

For enhanced address autocomplete, you can configure Google Maps API:

```bash
# Optional - Add to .env.local for enhanced address features
NEXT_PUBLIC_GOOGLE_MAPS_API_KEY=your_google_maps_api_key
```

Without Google Maps API, the application automatically uses OpenStreetMap (Nominatim) as a fallback.

## Getting Started

First, run the development server:

```bash
npm run dev
# or
yarn dev
# or
pnpm dev
# or
bun dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

## Environment Configuration

Create a `.env.local` file in the root directory with your configuration:

```bash
# Supabase Configuration (Required)
NEXT_PUBLIC_SUPABASE_URL=your_supabase_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
SUPABASE_SERVICE_ROLE_KEY=your_supabase_service_role_key

# NextAuth Configuration (Required)
NEXTAUTH_URL=http://localhost:3000
NEXTAUTH_SECRET=your_nextauth_secret

# Google OAuth (Optional)
GOOGLE_CLIENT_ID=your_google_client_id
GOOGLE_CLIENT_SECRET=your_google_client_secret

# Google Maps API (Optional - for enhanced address features)
NEXT_PUBLIC_GOOGLE_MAPS_API_KEY=your_google_maps_api_key
```

## Documentation

- [`ADDRESS_AUTOCOMPLETE_GPS_FEATURE.md`](./ADDRESS_AUTOCOMPLETE_GPS_FEATURE.md) - Detailed address autocomplete documentation
- [`GOOGLE_MAPS_API_SETUP.md`](./GOOGLE_MAPS_API_SETUP.md) - Google Maps API configuration guide
- [`POLISH_FILENAME_FIX.md`](./POLISH_FILENAME_FIX.md) - Polish character handling in file uploads

This project uses [`next/font`](https://nextjs.org/docs/app/building-your-application/optimizing/fonts) to automatically optimize and load [Geist](https://vercel.com/font), a new font family for Vercel.

## Learn More

To learn more about Next.js, take a look at the following resources:

- [Next.js Documentation](https://nextjs.org/docs) - learn about Next.js features and API.
- [Learn Next.js](https://nextjs.org/learn) - an interactive Next.js tutorial.

You can check out [the Next.js GitHub repository](https://github.com/vercel/next.js) - your feedback and contributions are welcome!

## Deploy on Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out our [Next.js deployment documentation](https://nextjs.org/docs/app/building-your-application/deploying) for more details.
