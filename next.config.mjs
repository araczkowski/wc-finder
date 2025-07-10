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
      "https://get-iot.com:8443", // The specific IP you are accessing from
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
      {
        protocol: "https",
        hostname: "hzkvqzhvgdwlbienjgjx.supabase.co", // Your Supabase project hostname
        port: "", // Default for https is 443, so empty string is fine
        pathname: "/storage/v1/object/public/wc-photos/**",
      },
      {
        protocol: "https",
        hostname: "get-iot.com",
        port: "8443",
        pathname: "/storage/v1/object/public/wc-images/**",
      },
      {
        protocol: "https",
        hostname: "get-iot.com",
        port: "8443",
        pathname: "/storage/v1/object/public/wc-photos/**",
      },
      // Add other remote patterns here if you use images from other domains
      // Example:
      {
        protocol: "https",
        hostname: "lh3.googleusercontent.com", // For Google User Avatars
        port: "",
        pathname: "/a/**",
      },
      {
        protocol: "https",
        hostname: "images.unsplash.com", // For placeholder images
        port: "",
        pathname: "/**",
      },
      {
        protocol: "https",
        hostname: "via.placeholder.com", // For fallback placeholder images
        port: "",
        pathname: "/**",
      },
      {
        protocol: "https",
        hostname: "picsum.photos", // For alternative placeholder images
        port: "",
        pathname: "/**",
      },
      {
        protocol: "https",
        hostname: "www.bing.com", // For Bing image search
        port: "",
        pathname: "/**",
      },
      {
        protocol: "https",
        hostname: "tse1.mm.bing.net", // For Bing image thumbnails
        port: "",
        pathname: "/**",
      },
      {
        protocol: "https",
        hostname: "tse2.mm.bing.net", // For Bing image thumbnails
        port: "",
        pathname: "/**",
      },
      {
        protocol: "https",
        hostname: "tse3.mm.bing.net", // For Bing image thumbnails
        port: "",
        pathname: "/**",
      },
      {
        protocol: "https",
        hostname: "tse4.mm.bing.net", // For Bing image thumbnails
        port: "",
        pathname: "/**",
      },
      {
        protocol: "https",
        hostname: "external-content.duckduckgo.com", // For DuckDuckGo images
        port: "",
        pathname: "/**",
      },
      {
        protocol: "https",
        hostname: "*.wikimedia.org", // For Wikimedia images
        port: "",
        pathname: "/**",
      },
      {
        protocol: "https",
        hostname: "upload.wikimedia.org", // For Wikipedia images
        port: "",
        pathname: "/**",
      },
      {
        protocol: "https",
        hostname: "*.githubusercontent.com", // For GitHub hosted images
        port: "",
        pathname: "/**",
      },
      {
        protocol: "https",
        hostname: "raw.githubusercontent.com", // For GitHub raw images
        port: "",
        pathname: "/**",
      },
      {
        protocol: "https",
        hostname: "*.imgur.com", // For Imgur images
        port: "",
        pathname: "/**",
      },
      {
        protocol: "https",
        hostname: "i.imgur.com", // For Imgur images
        port: "",
        pathname: "/**",
      },
      {
        protocol: "https",
        hostname: "*.flickr.com", // For Flickr images
        port: "",
        pathname: "/**",
      },
      {
        protocol: "https",
        hostname: "live.staticflickr.com", // For Flickr images
        port: "",
        pathname: "/**",
      },
      {
        protocol: "https",
        hostname: "get-iot.com",
        port: "8443",
        pathname: "/**",
      },
      {
        protocol: "https",
        hostname: "*", // For Flickr images
        port: "",
        pathname: "/**",
      },
    ],
  },
  // If you have other Next.js configurations, they would go here, for example:
  // reactStrictMode: true,
};

export default nextConfig;
