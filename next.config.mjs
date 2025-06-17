/** @type {import('next').NextConfig} */
const nextConfig = {
  // For Next.js 13.4.8+ up to some point in v14,
  // allowedDevOrigins was typically placed under devIndicators.
  // If you are using a very recent version of Next.js (e.g., later v14 or v15+),
  // and this specific structure doesn't work,
  // please consult your specific Next.js version's documentation for `allowedDevOrigins`.
  devIndicators: {
    allowedDevOrigins: [
      "http://localhost:3000", // Common for local development
      "http://127.0.0.1:3000", // Also common for local development
      "http://192.168.0.57:3000", // The specific IP you are accessing from
      // You can add other development origins if needed, e.g.,
      // 'http://<your-computer-name>.local:3000',
    ],
  },
  images: {
    remotePatterns: [
      {
        protocol: "https",
        hostname: "hzkvqzhvgdwlbienjgjx.supabase.co", // Your Supabase project hostname
        port: "", // Default for https is 443, so empty string is fine
        // You can make the pathname more specific if all your images
        // are under a certain path within the bucket.
        // This example allows any image from the 'wc-images' bucket.
        pathname: "/storage/v1/object/public/wc-images/**",
      },
      // Add other remote patterns here if you use images from other domains
      // Example:
      // {
      //   protocol: 'https',
      //   hostname: 'lh3.googleusercontent.com', // For Google User Avatars
      //   port: '',
      //   pathname: '/a/**',
      // },
    ],
  },
  // If you have other Next.js configurations, they would go here, for example:
  // reactStrictMode: true,
};

export default nextConfig;
