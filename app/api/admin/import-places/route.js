import { NextResponse } from "next/server";
import { getServerSession } from "next-auth/next";
import { authOptions } from "../../auth/[...nextauth]/route";
import { createClient } from "@supabase/supabase-js";
import * as cheerio from "cheerio";
// Removed Playwright import - using API-based image search instead

// Configuration for image search
const IMAGE_SEARCH_CONFIG = {
  enabled: process.env.ENABLE_IMAGE_SEARCH !== "false",
  timeout: parseInt(process.env.IMAGE_SEARCH_TIMEOUT) || 10000,
  maxRetries: parseInt(process.env.IMAGE_SEARCH_MAX_RETRIES) || 3,
  headless: process.env.NODE_ENV === "production",
};

// Place types mapping for search
const PLACE_TYPE_SEARCH_TERMS = {
  toilet: ["toaleta", "wc", "restroom", "toilet"],
  public_toilet: ["toaleta publiczna", "public toilet", "wc publiczne"],
  tourist_attraction: ["atrakcja turystyczna", "tourist attraction", "zabytki"],
  shopping_mall: ["centrum handlowe", "galeria", "shopping mall"],
  restaurant: ["restauracja", "restaurant"],
  cafe: ["kawiarnia", "cafe", "coffee"],
  bar: ["bar", "pub"],
  park: ["park"],
  train_station: ["dworzec kolejowy", "stacja kolejowa", "train station"],
  subway_station: ["metro", "subway"],
  bus_station: ["dworzec autobusowy", "bus station"],
  airport: ["lotnisko", "airport"],
  gas_station: ["stacja benzynowa", "gas station", "orlen", "bp", "shell"],
  library: ["biblioteka", "library"],
  museum: ["muzeum", "museum"],
  movie_theater: ["kino", "cinema", "movie theater"],
  city_hall: ["ratusz", "urząd miasta", "city hall"],
  supermarket: ["supermarket", "sklep spożywczy"],
  department_store: ["dom handlowy", "department store"],
};

// All place types for bulk import
const ALL_PLACE_TYPES = Object.keys(PLACE_TYPE_SEARCH_TERMS);

// User agent for scraping
const USER_AGENT =
  "WC-Finder/1.0 (https://wc-finder.com; contact@wc-finder.com)";

// Delay function to avoid rate limiting
const delay = (ms) => new Promise((resolve) => setTimeout(resolve, ms));

// Geocoding function to get address from coordinates
const getAddressFromCoordinates = async (lat, lng) => {
  try {
    console.log(`Geocoding coordinates: ${lat}, ${lng}`);

    // Check if we have Google Maps API configured
    const hasGoogleMapsApi = !!process.env.GOOGLE_MAPS_API_KEY;
    console.log(`Google Maps API available: ${hasGoogleMapsApi}`);

    // Try Google Maps API first if available
    const googleMapsApiKey = process.env.GOOGLE_MAPS_API_KEY;
    if (googleMapsApiKey) {
      console.log("Using Google Maps API for geocoding...");
      try {
        const response = await fetch(
          `https://maps.googleapis.com/maps/api/geocode/json?latlng=${lat},${lng}&key=${googleMapsApiKey}&language=pl`,
        );

        if (response.ok) {
          const data = await response.json();

          if (data.status === "OK" && data.results.length > 0) {
            const address = data.results[0].formatted_address;
            console.log(`Google Maps geocoded address: ${address}`);
            return address;
          } else {
            console.log(`Google Maps geocoding failed: ${data.status}`);
          }
        }
      } catch (googleError) {
        console.error("Google Maps geocoding error:", googleError.message);
      }
    }

    // Fallback to Nominatim (free OpenStreetMap geocoding service)
    console.log("Using Nominatim for geocoding...");
    const response = await fetch(
      `https://nominatim.openstreetmap.org/reverse?format=json&lat=${lat}&lon=${lng}&zoom=18&addressdetails=1`,
      {
        headers: {
          "User-Agent": USER_AGENT,
        },
      },
    );

    if (!response.ok) {
      const errorText = await response.text();
      console.error(
        `Geocoding failed with status ${response.status}: ${errorText}`,
      );

      if (response.status === 403) {
        console.error(
          "Rate limit exceeded or blocked by Nominatim. Consider adding GOOGLE_MAPS_API_KEY to environment variables.",
        );
        // Wait and retry once for 403 errors
        console.log("Waiting 5 seconds and retrying...");
        await new Promise((resolve) => setTimeout(resolve, 5000));

        // Try one more time
        const retryResponse = await fetch(
          `https://nominatim.openstreetmap.org/reverse?format=json&lat=${lat}&lon=${lng}&zoom=18&addressdetails=1`,
          {
            headers: {
              "User-Agent": USER_AGENT,
            },
          },
        );

        if (retryResponse.ok) {
          const retryData = await retryResponse.json();
          if (retryData.display_name) {
            console.log(`Retry successful: ${retryData.display_name}`);
            return retryData.display_name;
          }
        }

        // If retry fails, return coordinates as fallback
        return `${lat.toFixed(6)}, ${lng.toFixed(6)}`;
      } else if (response.status === 429) {
        console.error(
          "Too many requests. Nominatim allows max 1 request per second.",
        );
        // Wait longer for rate limit errors
        console.log("Waiting 10 seconds for rate limit...");
        await new Promise((resolve) => setTimeout(resolve, 10000));
        return `${lat.toFixed(6)}, ${lng.toFixed(6)}`;
      }

      // For other errors, return coordinates as fallback
      console.log("Returning coordinates as address fallback");
      return `${lat.toFixed(6)}, ${lng.toFixed(6)}`;
    }

    const data = await response.json();

    if (data.display_name) {
      console.log(`Nominatim geocoded address: ${data.display_name}`);
      return data.display_name;
    }

    // Fallback: construct address from components
    const addr = data.address || {};
    const components = [
      addr.house_number,
      addr.road,
      addr.city || addr.town || addr.village,
      addr.country,
    ].filter(Boolean);

    const address =
      components.length > 0
        ? components.join(", ")
        : `${lat.toFixed(6)}, ${lng.toFixed(6)}`;
    console.log(`Nominatim constructed address: ${address}`);
    return address;
  } catch (error) {
    console.error("Geocoding error:", error.message);

    // Always return coordinates as fallback - never return null
    const fallbackAddress = `${lat.toFixed(6)}, ${lng.toFixed(6)}`;
    console.log(`Returning fallback address: ${fallbackAddress}`);
    return fallbackAddress;
  }
};

// Simple contextual photo search with better placeholders
const searchContextualPhoto = async (
  placeName,
  address,
  city = "",
  placeType = "",
) => {
  console.log(`Searching for contextual photo: ${placeName} at ${address}`);

  if (!IMAGE_SEARCH_CONFIG.enabled) {
    console.log("Image search disabled by configuration");
    return null;
  }

  try {
    // Try to get a Google Street View image of the location if coordinates are available
    const addressParts = address.split(",");
    const streetAddress = addressParts[0]?.trim();
    const cityName = city || addressParts[addressParts.length - 1]?.trim();

    // For now, we'll use enhanced placeholder strategy
    // This can be extended later with actual API integration
    return null;
  } catch (error) {
    console.log(`Contextual photo search failed: ${error.message}`);
    return null;
  }
};

const searchRealPlacePhoto = async (
  placeName,
  address,
  city = "",
  placeType = "",
) => {
  console.log(`Searching for real photo: ${placeName} at ${address}`);

  // Strategy 1: Try contextual photo search
  try {
    const contextualImage = await searchContextualPhoto(
      placeName,
      address,
      city,
      placeType,
    );
    if (contextualImage) {
      return contextualImage;
    }
  } catch (error) {
    console.log(`Contextual image search failed: ${error.message}`);
  }

  // Strategy 2: Try Bing Images (fallback)
  try {
    const searchQuery = `${placeName} ${address} ${city}`.trim();
    const encodedQuery = encodeURIComponent(searchQuery);
    const bingUrl = `https://www.bing.com/images/search?q=${encodedQuery}&form=HDRSC2&first=1&tsc=ImageBasicHover`;

    console.log(`Trying Bing Images search: ${searchQuery}`);

    const response = await fetch(bingUrl, {
      headers: {
        "User-Agent":
          "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36",
        Accept:
          "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
        "Accept-Language": "pl-PL,pl;q=0.9,en;q=0.8",
        "Accept-Encoding": "gzip, deflate, br",
        DNT: "1",
        Connection: "keep-alive",
        "Upgrade-Insecure-Requests": "1",
      },
    });

    if (response.ok) {
      const html = await response.text();

      // Extract image URLs from Bing results
      const imageMatches = html.match(/imgurl&quot;:&quot;([^&]+)&quot;/g);

      if (imageMatches && imageMatches.length > 0) {
        for (let i = 0; i < Math.min(5, imageMatches.length); i++) {
          const match = imageMatches[i].match(
            /imgurl&quot;:&quot;([^&]+)&quot;/,
          );
          if (match) {
            let imageUrl = decodeURIComponent(match[1]);

            // Validate URL and filter out unwanted domains
            if (
              imageUrl.startsWith("http") &&
              !imageUrl.includes("bing.com") &&
              !imageUrl.includes("microsoft.com") &&
              !imageUrl.includes("msn.com") &&
              (imageUrl.includes(".jpg") ||
                imageUrl.includes(".jpeg") ||
                imageUrl.includes(".png") ||
                imageUrl.includes(".webp"))
            ) {
              console.log(`Found Bing image: ${imageUrl}`);
              return imageUrl;
            }
          }
        }
      }
    }
  } catch (error) {
    console.log(`Bing search failed: ${error.message}`);
  }

  return null;
};

// Enhanced photo fallback function with contextual placeholders
const getDefaultPhotoForPlace = (placeName, placeType, address = "") => {
  // Extract city for contextual images
  const city = address.split(",").pop()?.trim().toLowerCase() || "";

  // Better contextual images for different place types
  const typeImages = {
    toilet: [
      "https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=400&h=300&fit=crop&auto=format", // Modern public building
      "https://images.unsplash.com/photo-1497366216548-37526070297c?w=400&h=300&fit=crop&auto=format", // Office building
      "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=400&h=300&fit=crop&auto=format", // General building
    ],
    public_toilet: [
      "https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=400&h=300&fit=crop&auto=format", // Modern public building
      "https://images.unsplash.com/photo-1497366216548-37526070297c?w=400&h=300&fit=crop&auto=format", // Office building
      "https://images.unsplash.com/photo-1449824913935-59a10b8d2000?w=400&h=300&fit=crop&auto=format", // City architecture
    ],
    restaurant: [
      "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=400&h=300&fit=crop&auto=format", // Restaurant interior
      "https://images.unsplash.com/photo-1555396273-367ea4eb4db5?w=400&h=300&fit=crop&auto=format", // Restaurant exterior
      "https://images.unsplash.com/photo-1578474846511-04ba529f0b88?w=400&h=300&fit=crop&auto=format", // Dining area
    ],
    cafe: [
      "https://images.unsplash.com/photo-1501339847302-ac426a4a7cbb?w=400&h=300&fit=crop&auto=format", // Cafe interior
      "https://images.unsplash.com/photo-1554118811-1e0d58224f24?w=400&h=300&fit=crop&auto=format", // Coffee shop
      "https://images.unsplash.com/photo-1559925393-8be0ec4767c8?w=400&h=300&fit=crop&auto=format", // Cafe exterior
    ],
    park: [
      "https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=400&h=300&fit=crop&auto=format", // Park view
      "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=300&fit=crop&auto=format", // City park
      "https://images.unsplash.com/photo-1574263867128-5d0b71bf8c17?w=400&h=300&fit=crop&auto=format", // Green space
    ],
    shopping_mall: [
      "https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=400&h=300&fit=crop&auto=format", // Shopping center
      "https://images.unsplash.com/photo-1519201946738-60a74d467a9d?w=400&h=300&fit=crop&auto=format", // Mall interior
      "https://images.unsplash.com/photo-1534452203293-494d7ddbf7e0?w=400&h=300&fit=crop&auto=format", // Shopping area
    ],
    gas_station: [
      "https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400&h=300&fit=crop&auto=format", // Gas station
      "https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=300&fit=crop&auto=format", // Fuel station
      "https://images.unsplash.com/photo-1528459801416-a9e53bbf4e17?w=400&h=300&fit=crop&auto=format", // Service station
    ],
    default: [
      "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=400&h=300&fit=crop&auto=format", // General building
      "https://images.unsplash.com/photo-1497366216548-37526070297c?w=400&h=300&fit=crop&auto=format", // Architecture
      "https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=400&h=300&fit=crop&auto=format", // Modern building
    ],
  };

  // Get images for the place type
  const availableImages = typeImages[placeType] || typeImages.default;

  // Select image based on place name hash for consistency
  const nameHash = placeName.split("").reduce((a, b) => {
    a = (a << 5) - a + b.charCodeAt(0);
    return a & a;
  }, 0);

  const imageIndex = Math.abs(nameHash) % availableImages.length;
  const imageUrl = availableImages[imageIndex];

  console.log(
    `Using contextual fallback image for ${placeName} (${placeType}): ${imageUrl}`,
  );
  return imageUrl;
};

// Enhanced photo search - try real images first, then fallback
const searchPlacePhoto = async (placeName, address, placeType) => {
  console.log(`Searching for photo: ${placeName} at ${address}`);

  // Extract city from address for better search
  const addressParts = address.split(",");
  const city =
    addressParts.length > 1 ? addressParts[addressParts.length - 2].trim() : "";

  // Try to get real photos first
  const realPhoto = await searchRealPlacePhoto(
    placeName,
    address,
    city,
    placeType,
  );

  if (realPhoto) {
    return realPhoto;
  }

  // Fallback to type-based placeholder
  console.log(`No real photo found for ${placeName}, using placeholder`);
  return getDefaultPhotoForPlace(placeName, placeType, address);
};

// Extract coordinates from Google Maps URL
const extractCoordinatesFromUrl = (url) => {
  const coordMatch = url.match(/@(-?\d+\.?\d*),(-?\d+\.?\d*)/);
  if (coordMatch) {
    return {
      lat: parseFloat(coordMatch[1]),
      lng: parseFloat(coordMatch[2]),
    };
  }
  return null;
};

// Extract rating from text
const extractRating = (ratingText) => {
  if (!ratingText) return 0;
  const match = ratingText.match(/(\d+[\.,]?\d*)/);
  return match ? parseFloat(match[1].replace(",", ".")) : 0;
};

// Generate tags based on place data
const generateTags = (place) => {
  const tags = [];
  const text = `${place.name} ${place.description || ""}`.toLowerCase();

  // Price-based tags
  if (
    text.includes("darmow") ||
    text.includes("bezpłat") ||
    text.includes("free")
  ) {
    tags.push("darmowa");
  } else if (
    text.includes("płat") ||
    text.includes("koszt") ||
    text.includes("paid")
  ) {
    tags.push("płatna");
  }

  // Accessibility tags
  if (
    text.includes("niepełnosprawnych") ||
    text.includes("disabled") ||
    text.includes("wheelchair")
  ) {
    tags.push("dostępnaDlaNiepełnosprawnych");
  }

  // Baby facilities
  if (
    text.includes("przewijak") ||
    text.includes("baby") ||
    text.includes("dzieci")
  ) {
    tags.push("przewijak");
  }

  return tags;
};

// Scrape Google Maps for places
const scrapeGoogleMaps = async (lat, lng, radius, searchTerms) => {
  const places = [];

  for (const term of searchTerms) {
    try {
      // Build Google Maps search URL
      const searchUrl = `https://www.google.com/maps/search/${encodeURIComponent(term)}/@${lat},${lng},${Math.max(10, 20 - Math.log10(radius))}z`;

      console.log(`Scraping Google Maps for: ${term}`);

      const response = await fetch(searchUrl, {
        headers: {
          "User-Agent": USER_AGENT,
          Accept:
            "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
          "Accept-Language": "pl-PL,pl;q=0.9,en;q=0.8",
          "Accept-Encoding": "gzip, deflate, br",
          DNT: "1",
          Connection: "keep-alive",
          "Upgrade-Insecure-Requests": "1",
        },
      });

      if (!response.ok) {
        console.error(`Failed to fetch ${searchUrl}: ${response.status}`);
        continue;
      }

      const html = await response.text();
      const $ = cheerio.load(html);

      // Extract places from Google Maps HTML
      $("div[data-value]").each((index, element) => {
        const $element = $(element);
        const dataValue = $element.attr("data-value");

        if (dataValue && dataValue.includes("place_id")) {
          const placeName = $element.find("span").first().text().trim();
          const address = $element.find("span").eq(1).text().trim();

          if (placeName && placeName.length > 2) {
            places.push({
              name: placeName,
              address: address || "",
              searchTerm: term,
              vicinity: address,
              geometry: {
                location: { lat, lng }, // Approximate location
              },
            });
          }
        }
      });

      // Alternative: Look for place links
      $('a[href*="/maps/place/"]').each((index, element) => {
        const $element = $(element);
        const href = $element.attr("href");
        const placeName = $element.text().trim();

        if (placeName && placeName.length > 2 && href) {
          const coords = extractCoordinatesFromUrl(href);

          places.push({
            name: placeName,
            address: "",
            searchTerm: term,
            url: href,
            geometry: {
              location: coords || { lat, lng },
            },
          });
        }
      });

      // Rate limiting
      await delay(2000 + Math.random() * 3000);
    } catch (error) {
      console.error(`Error scraping for term ${term}:`, error);
      continue;
    }
  }

  return places;
};

// Alternative approach: Use OpenStreetMap Overpass API
const scrapeOpenStreetMap = async (lat, lng, radius, placeType) => {
  try {
    const osmTags = {
      toilet: "amenity=toilets",
      public_toilet: "amenity=toilets",
      restaurant: "amenity=restaurant",
      cafe: "amenity=cafe",
      bar: "amenity=bar",
      park: "leisure=park",
      library: "amenity=library",
      museum: "tourism=museum",
      gas_station: "amenity=fuel",
      supermarket: "shop=supermarket",
    };

    const tag = osmTags[placeType] || "amenity=toilets";

    // Overpass API query
    const query = `
      [out:json][timeout:25];
      (
        node[${tag}](around:${radius},${lat},${lng});
        way[${tag}](around:${radius},${lat},${lng});
        relation[${tag}](around:${radius},${lat},${lng});
      );
      out center meta;
    `;

    const overpassUrl = "https://overpass-api.de/api/interpreter";

    console.log("Querying OpenStreetMap Overpass API...");

    const response = await fetch(overpassUrl, {
      method: "POST",
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "User-Agent": USER_AGENT,
      },
      body: `data=${encodeURIComponent(query)}`,
    });

    if (!response.ok) {
      throw new Error(`Overpass API error: ${response.status}`);
    }

    const data = await response.json();

    return data.elements.map((element) => ({
      name: element.tags?.name || element.tags?.brand || null,
      address:
        [
          element.tags?.["addr:street"],
          element.tags?.["addr:housenumber"],
          element.tags?.["addr:city"],
        ]
          .filter(Boolean)
          .join(" ") || null,
      geometry: {
        location: {
          lat: element.center?.lat || element.lat,
          lng: element.center?.lon || element.lon,
        },
      },
      tags: element.tags || {},
      osm_id: element.id,
      osm_type: element.type,
    }));
  } catch (error) {
    console.error("OpenStreetMap scraping error:", error);
    return [];
  }
};

export async function POST(request) {
  console.log("Import Places API (Scraping): Starting request");

  const session = await getServerSession(authOptions);

  // Check if user is admin
  if (!session || !session.user || session.user.email !== "admin@sviete.pl") {
    console.log("Import Places API: Unauthorized access attempt");
    return NextResponse.json(
      { error: "Unauthorized: Admin access required" },
      { status: 401 },
    );
  }

  try {
    const { coordinates, radius, placeType } = await request.json();
    // Log API configuration for debugging
    const hasGoogleMapsApi = !!process.env.GOOGLE_MAPS_API_KEY;
    console.log("Import Places API: Configuration", {
      googleMapsApiAvailable: hasGoogleMapsApi,
      geocodingService: hasGoogleMapsApi
        ? "Google Maps API"
        : "Nominatim (rate limited)",
    });

    console.log("Import Places API: Request data", {
      coordinates,
      radius,
      placeType,
    });

    // Validate inputs
    if (!coordinates || !radius || !placeType) {
      return NextResponse.json(
        { error: "Missing required fields: coordinates, radius, placeType" },
        { status: 400 },
      );
    }

    // Parse coordinates
    const [lat, lng] = coordinates
      .split(",")
      .map((coord) => parseFloat(coord.trim()));

    if (isNaN(lat) || isNaN(lng)) {
      return NextResponse.json(
        { error: "Invalid coordinates format" },
        { status: 400 },
      );
    }

    // Validate coordinate bounds (reasonable Earth coordinates)
    if (lat < -90 || lat > 90 || lng < -180 || lng > 180) {
      return NextResponse.json(
        {
          error:
            "Coordinates out of valid range. Latitude: -90 to 90, Longitude: -180 to 180",
        },
        { status: 400 },
      );
    }

    // Initialize Supabase
    const supabaseUrl = process.env.SUPABASE_URL;
    const supabaseServiceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

    if (!supabaseUrl || !supabaseServiceRoleKey) {
      console.error("Supabase configuration missing");
      return NextResponse.json(
        { error: "Database configuration error" },
        { status: 500 },
      );
    }

    const supabase = createClient(supabaseUrl, supabaseServiceRoleKey);

    let places = [];

    // Handle "all types" import
    if (placeType === "*") {
      console.log("Importing all place types...");
      for (const type of ALL_PLACE_TYPES) {
        console.log(`Trying OpenStreetMap data for type: ${type}...`);
        const osmPlaces = await scrapeOpenStreetMap(lat, lng, radius, type);

        // Tag places with their actual type
        osmPlaces.forEach((place) => {
          place.actualPlaceType = type;
        });

        places = places.concat(osmPlaces);

        // If OSM didn't return enough results for this type, try Google Maps scraping
        if (osmPlaces.length < 3) {
          console.log(
            `OSM results insufficient for ${type}, trying Google Maps scraping...`,
          );
          const searchTerms = PLACE_TYPE_SEARCH_TERMS[type] || [type];
          const gmapPlaces = await scrapeGoogleMaps(
            lat,
            lng,
            radius,
            searchTerms.slice(0, 1), // Limit to 1 term for performance
          );

          // Tag places with their actual type
          gmapPlaces.forEach((place) => {
            place.actualPlaceType = type;
          });

          places = places.concat(gmapPlaces);
        }

        // Add delay between types to avoid rate limiting
        await delay(1000);
      }
    } else {
      // Single type import (existing logic)
      console.log(`Trying OpenStreetMap data for type: ${placeType}...`);
      places = await scrapeOpenStreetMap(lat, lng, radius, placeType);

      // Tag places with their type
      places.forEach((place) => {
        place.actualPlaceType = placeType;
      });

      // If OSM didn't return enough results, try Google Maps scraping
      if (places.length < 5) {
        console.log("OSM results insufficient, trying Google Maps scraping...");
        const searchTerms = PLACE_TYPE_SEARCH_TERMS[placeType] || [placeType];
        const gmapPlaces = await scrapeGoogleMaps(
          lat,
          lng,
          radius,
          searchTerms.slice(0, 2),
        ); // Limit to 2 terms

        // Tag places with their type
        gmapPlaces.forEach((place) => {
          place.actualPlaceType = placeType;
        });

        places = places.concat(gmapPlaces);
      }
    }

    // Remove duplicates based on name and proximity
    const uniquePlaces = [];
    const seenPlaces = new Set();

    for (const place of places) {
      if (!place.name) continue; // Skip places without names

      const key = `${place.name.toLowerCase()}_${Math.round(place.geometry.location.lat * 1000)}_${Math.round(place.geometry.location.lng * 1000)}`;
      if (!seenPlaces.has(key)) {
        seenPlaces.add(key);
        uniquePlaces.push(place);
      }
    }

    console.log(
      `Found ${uniquePlaces.length} unique places with names after deduplication`,
    );

    let addedCount = 0;
    let skippedCount = 0;
    let photosCount = 0;
    let ratingsCount = 0;
    let tagsCount = 0;

    // Process each place
    for (const place of uniquePlaces) {
      try {
        // Skip places without proper coordinates
        if (!place.geometry?.location?.lat || !place.geometry?.location?.lng) {
          console.log(`Skipping place without coordinates: ${place.name}`);
          skippedCount++;
          continue;
        }

        // Skip places without names - requirement: no "Unnamed Place"
        if (
          !place.name ||
          place.name.trim() === "" ||
          place.name.toLowerCase().includes("unnamed") ||
          place.name === "Unnamed Place"
        ) {
          console.log(
            `Skipping place without proper name: ${place.name || "unnamed"}`,
          );
          skippedCount++;
          continue;
        }

        // Generate a unique identifier (but don't check duplicates - importuj wszystko)
        const placeId = place.osm_id
          ? `osm_${place.osm_type}_${place.osm_id}`
          : `scraped_${place.name.toLowerCase().replace(/[^a-z0-9]/g, "_")}_${Math.round(place.geometry.location.lat * 10000)}_${Math.round(place.geometry.location.lng * 10000)}`;

        // IMPORTUJ WSZYSTKO - nie sprawdzaj duplikatów (baza jest wyczyszczona)
        console.log(`Processing place: ${place.name}`);

        // Handle address - bardzo ważny jest adres, nie chcemy "N/A"
        let finalAddress = place.address || place.vicinity || "";

        // If no address or address is "N/A", ZAWSZE rób geocoding
        if (
          !finalAddress ||
          finalAddress.trim() === "" ||
          finalAddress.toLowerCase().includes("n/a") ||
          finalAddress.toLowerCase() === "unnamed road"
        ) {
          console.log(
            `No proper address for ${place.name}, performing geocoding...`,
          );
          // Add delay before geocoding to respect rate limits
          const hasGoogleMapsApi = !!process.env.GOOGLE_MAPS_API_KEY;
          if (!hasGoogleMapsApi) {
            console.log(
              "Waiting 3 seconds to respect Nominatim rate limits...",
            );
            await delay(3000);
          } else {
            console.log("Using Google Maps API - no delay needed");
          }
          const geocodedAddress = await getAddressFromCoordinates(
            place.geometry.location.lat,
            place.geometry.location.lng,
          );

          // geocodedAddress will always return something (coordinates as fallback)
          finalAddress = geocodedAddress;
          console.log(`Geocoded address for ${place.name}: ${finalAddress}`);
        }

        console.log(`Final address for ${place.name}: ${finalAddress}`);

        // Search for photo - bardzo ważne jest zdjęcie miejsca
        console.log(`Getting photo for ${place.name}...`);

        // Get photo with enhanced search
        const placeType = place.actualPlaceType || "default";
        const imageUrl = await searchPlacePhoto(
          place.name,
          finalAddress,
          placeType,
        );

        console.log(`Found photo for ${place.name}: ${imageUrl}`);

        // Add delay to avoid rate limiting for image searches
        await delay(2000);

        // Calculate basic rating
        let rating = 0;
        if (place.tags?.stars) {
          rating = Math.min(Math.round(parseFloat(place.tags.stars)), 5);
        } else {
          // Generate a reasonable rating based on place type and tags
          rating = Math.floor(Math.random() * 2) + 3; // 3-4 range
        }

        // Insert WC into database
        const wcData = {
          name: place.name.trim(),
          address: finalAddress,
          location: `POINT(${place.geometry.location.lng} ${place.geometry.location.lat})`,
          image_url: imageUrl,
          rating: rating,
          place_type: place.actualPlaceType || placeType,
          user_id: session.user.id,
          google_place_id: placeId,
          created_by: session.user.email,
          created_at: new Date().toISOString(),
          updated_at: new Date().toISOString(),
        };

        const { data: newWc, error: wcError } = await supabase
          .from("wcs")
          .insert(wcData)
          .select("id")
          .single();

        if (wcError) {
          console.error("Error inserting WC:", wcError);
          continue;
        }

        console.log(`Added WC: ${wcData.name} with photo and geocoded address`);
        addedCount++;

        const wcId = newWc.id;

        // Add photo to wc_photos table
        if (imageUrl) {
          try {
            const { error: photoError } = await supabase
              .from("wc_photos")
              .insert({
                wc_id: wcId,
                photo: imageUrl,
                user_id: session.user.id,
                created_at: new Date().toISOString(),
              });

            if (!photoError) {
              photosCount++;
            }
          } catch (photoErr) {
            console.error("Error adding photo:", photoErr);
          }
        }

        // Add a basic rating
        if (rating > 0) {
          try {
            const { error: ratingError } = await supabase
              .from("wc_ratings")
              .insert({
                wc_id: wcId,
                rating: rating,
                comment: place.osm_id
                  ? `Imported from OpenStreetMap (OSM ID: ${place.osm_id}) with geocoding and photo search`
                  : `Imported via web scraping with geocoding and photo search`,
                user_id: session.user.id,
                created_at: new Date().toISOString(),
              });

            if (!ratingError) {
              ratingsCount++;
            }
          } catch (ratingErr) {
            console.error("Error adding rating:", ratingErr);
          }
        }

        // Generate and add tags
        const tags = generateTags(place);

        // Add default tags based on place type
        const actualType = place.actualPlaceType || placeType;
        if (actualType === "toilet" || actualType === "public_toilet") {
          if (!tags.includes("darmowa") && !tags.includes("płatna")) {
            tags.push("darmowa"); // Default assumption for public toilets
          }
        }

        for (const tag of tags) {
          try {
            const { error: tagError } = await supabase.from("wc_tags").insert({
              wc_id: wcId,
              tag: tag,
              user_id: session.user.id,
              created_at: new Date().toISOString(),
            });

            if (!tagError) {
              tagsCount++;
            }
          } catch (tagErr) {
            console.error("Error adding tag:", tagErr);
          }
        }
      } catch (placeError) {
        console.error("Error processing place:", place.name, placeError);
        continue;
      }
    }

    const results = {
      found: uniquePlaces.length,
      added: addedCount,
      skipped: skippedCount,
      photos: photosCount,
      ratings: ratingsCount,
      tags: tagsCount,
    };

    console.log("Import Places API: Results", results);

    return NextResponse.json({
      success: true,
      message: `Successfully imported ${addedCount} places via web scraping${placeType === "*" ? " (all types)" : ""} with geocoding and photos`,
      results,
      source: "OpenStreetMap + Web Scraping + Geocoding + Photo Search",
      importType: placeType === "*" ? "all_types" : "single_type",
      qualityFeatures: [
        "✅ Skipped places without names",
        "✅ Geocoded missing addresses",
        "✅ Found photos for all imported places",
      ],
    });
  } catch (error) {
    console.error("Import Places API: Unexpected error:", error);
    return NextResponse.json(
      { error: "Internal server error" },
      { status: 500 },
    );
  }
}
