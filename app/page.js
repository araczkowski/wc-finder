"use client";

import { useSession, signIn, signOut } from "next-auth/react";
import Image from "next/image"; // For user icon placeholder
import Link from "next/link"; // <<< CRUCIAL IMPORT FOR THE LINK COMPONENT
import { useState, useEffect, useMemo, useCallback, useRef } from "react"; // Added useState, useEffect, useMemo, useCallback, useRef
import { useSearchParams } from "next/navigation"; // Added useSearchParams
import { useInfiniteScroll } from "./hooks/useInfiniteScroll";
import { useTranslation } from "./hooks/useTranslation";
import ImageSlideshow from "./components/ImageSlideshow";
import UserDropdown from "./components/UserDropdown";
import AddressAutocomplete from "./components/AddressAutocomplete";
import PlaceTypeDisplay from "./components/PlaceTypeDisplay";
import RatingDisplay from "./components/RatingDisplay";
import WCTags from "./components/WCTags";
import BottomSheet from "./components/BottomSheet";
import WCReport from "./components/WCReport";
import GoogleMap from "./components/GoogleMap";
import { getPlaceTypeLabel } from "./utils/placeTypes";
import { pl } from "./locales/pl";
import {
  LocateFixed,
  RulerDimensionLine,
  SquarePen,
  ChevronUp,
  MapPinned,
  Eye,
  Plus,
} from "lucide-react";

// Basic inline styles for layout - consider moving to CSS modules or global CSS
const styles = {
  pageContainer: {
    display: "flex",
    flexDirection: "column",
    minHeight: "100vh",
    fontFamily: "sans-serif",
  },
  header: {
    display: "flex",
    justifyContent: "space-between",
    width: "100%",
    alignItems: "center",
    padding: "1rem 2rem",
    backgroundColor: "#f0f0f0",
    borderBottom: "1px solid #ddd",
  },
  appName: {
    fontSize: "1.5rem",
    fontWeight: "bold",
  },
  authControls: {
    display: "flex",
    alignItems: "center",
    gap: "1rem",
  },
  userInfo: {
    display: "flex",
    alignItems: "center",
    gap: "0.75rem",
  },
  userImage: {
    borderRadius: "50%",
    border: "2px solid #ccc",
  },
  userName: {
    fontWeight: "500",
  },
  button: {
    padding: "0.5rem 1rem",
    borderRadius: "4px",
    border: "none",
    cursor: "pointer",
    fontWeight: "bold",
    fontSize: "0.9rem",
    textDecoration: "none", // For Link components styled as buttons
    display: "inline-block", // For Link components
  },
  signInButton: {
    backgroundColor: "#0070f3",
    color: "white",
  },
  signOutButton: {
    backgroundColor: "#e0e0e0",
    color: "#333",
  },
  mainContent: {
    flexGrow: 1,
    display: "flex",
    flexDirection: "column",
    alignItems: "center",
    justifyContent: "flex-start",
    padding: "3px",
    textAlign: "center",
    maxWidth: "500px",
    margin: "0 auto",
    width: "100%",
  },
  loader: {
    fontSize: "1.2rem",
    color: "#555",
  },
  welcomeMessage: {
    fontSize: "2rem",
    marginBottom: "1rem",
  },
  infoMessage: {
    fontSize: "1.1rem",
    color: "#333",
  },
  addButton: {
    // Style for the "Add New WC" button
    backgroundColor: "#28a745", // Green
    color: "white",
    padding: "0.75rem 1.5rem",
    fontSize: "1rem",
    borderRadius: "4px",
    textDecoration: "none",
    display: "inline-block",
    marginBottom: "1rem", // Space below the button
    fontWeight: "bold",
    width: "100%",
    maxWidth: "280px",
    textAlign: "center",
    marginTop: "1rem",
  },
  signInLink: {
    marginTop: "1rem",
    fontSize: "1rem",
    color: "#0070f3",
    textDecoration: "underline",
    cursor: "pointer",
  },
  loginButton: {
    backgroundColor: "white",
    color: "black",
    padding: "0.75rem 1.5rem",
    fontSize: "1rem",
    borderRadius: "8px",
    textDecoration: "none",
    display: "inline-block",
    fontWeight: "bold",
    width: "80%",
    textAlign: "center",
    margin: "0.5rem 0",
    border: "none",
    cursor: "pointer",
    transition: "all 0.2s ease",
    boxShadow: "0 2px 4px rgba(0,0,0,0.1)",
  },
  googleButton: {
    backgroundColor: "white",
    color: "black",
  },
  googleButtonHover: {
    backgroundColor: "#dddddd9e",
    transform: "translateY(-1px)",
    boxShadow: "0 4px 8px rgba(0,0,0,0.15)",
  },
  emailButton: {
    backgroundColor: "white",
    color: "black",
  },
  emailButtonHover: {
    backgroundColor: "#005cc5",
    transform: "translateY(-1px)",
    boxShadow: "0 4px 8px rgba(0,0,0,0.15)",
  },
  createAccountLink: {
    marginTop: "1.5rem",
    fontSize: "1rem",
    color: "#28a745",
    textDecoration: "underline",
    cursor: "pointer",
    transition: "color 0.2s ease",
    fontWeight: "500",
  },
  aboutButton: {
    backgroundColor: "white",
    color: "black",
  },
  // Styles for WC List
  wcListContainer: {
    width: "100%",
    maxWidth: "500px", // Same as form containers
    marginTop: "1rem",
    padding: "1rem",
    backgroundColor: "#fff",
    borderRadius: "8px",
    boxShadow: "0 2px 10px rgba(0,0,0,0.05)",
  },
  wcListHeader: {
    fontSize: "1.5rem",
    fontWeight: "bold",
    marginBottom: "1rem",
    color: "#333",
    textAlign: "left",
  },

  noWcsMessage: {
    marginTop: "1rem",
    color: "#555",
    textAlign: "left",
  },
  // Additional inline styles for mobile-first design
  pageContainer: {
    display: "flex",
    flexDirection: "column",
    minHeight: "100vh",
    fontFamily: "sans-serif",
    backgroundColor: "#f9f9f9ad",
    width: "100%",
    maxWidth: "500px",
    margin: "0 auto",
  },
  header: {
    display: "flex",
    justifyContent: "space-between",
    alignItems: "center",
    padding: "0.5rem 0.75rem",
    backgroundColor: "#f0f0f0",
    borderBottom: "1px solid #ddd",
    flexShrink: 0,
    width: "100%",
  },
  authControls: {
    display: "flex",
    alignItems: "center",
    gap: "0.5rem",
    width: "100%",
    justifyContent: "flex-end",
  },
  userInfo: {
    display: "flex",
    alignItems: "center",
    gap: "0.5rem",
  },
  userImage: {
    borderRadius: "50%",
    border: "2px solid #ccc",
    flexShrink: 0,
  },
  userName: {
    fontWeight: 500,
    display: "block",
    fontSize: "0.9rem",
    maxWidth: "120px",
    overflow: "hidden",
    textOverflow: "ellipsis",
    whiteSpace: "nowrap",
  },
  headerAddButton: {
    backgroundColor: "#28a745",
    color: "white",
    padding: "0.8rem 0.8rem",
    fontSize: "0.8rem",
    borderRadius: "4px",
    textDecoration: "none",
    fontWeight: "bold",
    transition: "background-color 0.2s ease",
    whiteSpace: "nowrap",
  },
  addressSection: {
    width: "100%",
    maxWidth: "500px",
    marginBottom: "0rem",
    padding: "1rem",
    backgroundColor: "#fff",
    borderRadius: "8px",
    boxShadow: "0 2px 10px rgba(0,0,0,0.05)",
    border: "1px solid #e9ecef",
    textAlign: "left",
  },
  addressField: {
    width: "100%",
    padding: "0.75rem",
    border: "1px solid #ddd",
    borderRadius: "6px",
    fontSize: "1rem",
    marginBottom: "0.5rem",
    outline: "none",
    transition: "border-color 0.2s ease",
    boxSizing: "border-box",
    display: "inline-block",
    height: "4em",
    paddingRight: "3em",
  },
  coordinatesText: {
    fontSize: "0.8rem",
    color: "#666",
    fontStyle: "italic",
  },
};

export default function Home() {
  const { data: session, status } = useSession();
  const { t } = useTranslation();
  const [isAutoLogging, setIsAutoLogging] = useState(false);
  // Log component rendering and current session status
  console.log(
    "[Home Page] Component rendering. Session status:",
    status,
    "Session object:",
    session ? "Exists" : "Null",
    "Full session:",
    session,
  );
  const searchParams = useSearchParams();
  const [filteredWcs, setFilteredWcs] = useState([]);
  const [locationPermission, setLocationPermission] = useState(null);
  const [statusMessage, setStatusMessage] = useState("");
  const [locationPrompted, setLocationPrompted] = useState(false);
  const [userLocation, setUserLocation] = useState(null); // { lat, lng }
  const [geolocationSupported, setGeolocationSupported] = useState(true);
  const [locationError, setLocationError] = useState(null);
  const [userAddress, setUserAddress] = useState("");
  const [isGeolocatingAddress, setIsGeolocatingAddress] = useState(false);
  const [addressDetected, setAddressDetected] = useState(false);
  const [addressManuallyChanged, setAddressManuallyChanged] = useState(false);
  const [userExplicitlyClearedAddress, setUserExplicitlyClearedAddress] =
    useState(false);
  const [hasSetAddress, setHasSetAddress] = useState(false);
  const [isLoadingLocation, setIsLoadingLocation] = useState(false);

  // Bottom Sheet states
  const [bottomSheetOpen, setBottomSheetOpen] = useState(false);
  const [selectedWcId, setSelectedWcId] = useState(null);

  // Map control states
  const [mapCenter, setMapCenter] = useState(null);
  const [mapZoom, setMapZoom] = useState(13);
  const [selectedWcForMap, setSelectedWcForMap] = useState(null);
  const pulseTimerRef = useRef(null);

  // Funkcja centrowania mapy na konkretnym WC
  const showWcOnMap = (wc) => {
    if (wc.lat && wc.lng) {
      const lat = parseFloat(wc.lat);
      const lng = parseFloat(wc.lng);
      if (!isNaN(lat) && !isNaN(lng)) {
        console.log("[HomePage] Centering map on WC:", wc.name, { lat, lng });
        setMapCenter({ lat, lng });
        setMapZoom(17); // Zoom in closer to show the WC
        setSelectedWcForMap(wc.id); // Mark this WC for pulsing
        setBottomSheetOpen(false); // Close bottom sheet to show map

        // Clear any existing pulse timer
        if (pulseTimerRef.current) {
          clearTimeout(pulseTimerRef.current);
        }

        // Stop pulsing after 3 seconds
        pulseTimerRef.current = setTimeout(() => {
          setSelectedWcForMap(null);
          pulseTimerRef.current = null;
        }, 3000);
      }
    }
  };

  // Funkcja resetowania mapy do lokalizacji użytkownika
  const resetMapToUser = () => {
    if (userLocation) {
      console.log("[HomePage] Resetting map to user location");
      setMapCenter(null); // Reset to user location
      setMapZoom(13); // Reset zoom
      setSelectedWcForMap(null); // Reset selected WC

      // Clear pulse timer
      if (pulseTimerRef.current) {
        clearTimeout(pulseTimerRef.current);
        pulseTimerRef.current = null;
      }
    }
  };

  // Cleanup timer on unmount
  useEffect(() => {
    return () => {
      if (pulseTimerRef.current) {
        clearTimeout(pulseTimerRef.current);
      }
    };
  }, []);

  // Funkcja automatycznego logowania
  const handleAutoLogin = async () => {
    setIsAutoLogging(true);
    try {
      const result = await signIn("credentials", {
        redirect: false,
        email: "public@sviete.pl",
        password: "public",
      });

      if (result?.error) {
        console.error("Auto login failed:", result.error);
        // Fallback - jeśli credentials nie działają, użyj Google
        signIn("google");
      } else if (result?.ok) {
        console.log("Auto login successful");
        // Strona zostanie automatycznie odświeżona przez useSession
      }
    } catch (error) {
      console.error("Auto login error:", error);
      // Fallback - użyj Google login
      signIn("google");
    }
    setIsAutoLogging(false);
  };

  // Clear localStorage completely on first login to start fresh
  useEffect(() => {
    console.log("[DEBUG localStorage] Login useEffect triggered:", {
      status,
      session: !!session,
      sessionUser: session?.user?.email,
    });

    if (status === "authenticated" && session) {
      // Check if this is the first login or if localStorage was already cleared for this session
      const hasLoggedInThisSession = localStorage.getItem(
        "hasLoggedInThisSession",
      );

      if (!hasLoggedInThisSession) {
        console.log(
          "[DEBUG localStorage] First login detected - clearing all localStorage data including location data",
        );

        // Clear all localStorage data
        localStorage.clear();

        // Mark that user has logged in this session
        localStorage.setItem("hasLoggedInThisSession", "true");

        // Clear all location-related React states to start fresh
        setUserAddress("");
        setAddressDetected(false);
        setAddressManuallyChanged(false);
        setUserExplicitlyClearedAddress(false);
        setUserLocation(null);
        setHasSetAddress(false);

        console.log(
          "[DEBUG localStorage] localStorage completely cleared and location states reset",
        );
      } else {
        console.log(
          "[DEBUG localStorage] User already logged in this session - preserving current state",
        );
      }
    } else {
      console.log(
        "[DEBUG localStorage] NOT clearing localStorage - conditions not met",
      );
    }
  }, [status, session]);

  // Geocode saved address function
  const geocodeSavedAddress = useCallback(async (address) => {
    try {
      const apiKey = process.env.NEXT_PUBLIC_GOOGLE_MAPS_API_KEY;

      if (apiKey) {
        const response = await fetch(
          `https://maps.googleapis.com/maps/api/geocode/json?address=${encodeURIComponent(address)}&key=${apiKey}&language=pl`,
        );
        const data = await response.json();

        if (data.status === "OK" && data.results.length > 0) {
          const location = data.results[0].geometry.location;
          const coordinates = {
            lat: location.lat,
            lng: location.lng,
          };
          console.log("[Home] Saved address coordinates:", coordinates);
          setUserLocation(coordinates);
          return;
        }
      }

      // Fallback to Nominatim
      const response = await fetch(
        `https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(address)}&limit=1&addressdetails=1&countrycodes=pl`,
      );
      const data = await response.json();

      if (data && data.length > 0) {
        const coordinates = {
          lat: parseFloat(data[0].lat),
          lng: parseFloat(data[0].lon),
        };
        console.log(
          "[Home] Saved address coordinates (Nominatim):",
          coordinates,
        );
        setUserLocation(coordinates);
      }
    } catch (error) {
      console.error("Geocoding saved address failed:", error);
    }
  }, []);

  // Load address state from localStorage on component mount
  useEffect(() => {
    if (typeof window !== "undefined") {
      // Don't load localStorage data if this is a fresh login session
      const hasLoggedInThisSession = localStorage.getItem(
        "hasLoggedInThisSession",
      );
      if (!hasLoggedInThisSession) {
        console.log(
          "[DEBUG localStorage] Skipping localStorage loading - fresh login session",
        );
        return;
      }

      console.log("[DEBUG localStorage] Loading data from localStorage...");
      const savedAddress = localStorage.getItem("userAddress");
      const savedManuallyChanged = localStorage.getItem(
        "addressManuallyChanged",
      );
      const savedExplicitlyCleared = localStorage.getItem(
        "userExplicitlyClearedAddress",
      );
      const savedHasSetAddress = localStorage.getItem("hasSetAddress");
      const savedUserLocation = localStorage.getItem("userLocation");
      const savedAddressDetected = localStorage.getItem("addressDetected");

      console.log("[DEBUG localStorage] Loaded values:", {
        savedAddress,
        savedManuallyChanged,
        savedExplicitlyCleared,
        savedHasSetAddress,
        savedUserLocation,
        savedAddressDetected,
      });

      if (savedAddress) {
        console.log("[DEBUG localStorage] Setting userAddress:", savedAddress);
        setUserAddress(savedAddress);
        setAddressDetected(true);
        setHasSetAddress(true);
      }
      if (savedHasSetAddress === "true") {
        console.log("[DEBUG localStorage] Setting hasSetAddress: true");
        setHasSetAddress(true);
      }
      if (savedUserLocation) {
        try {
          const location = JSON.parse(savedUserLocation);
          if (location && location.lat && location.lng) {
            console.log("[DEBUG localStorage] Setting userLocation:", location);
            setUserLocation(location);
          }
        } catch (error) {
          console.error("Failed to parse saved userLocation:", error);
        }
      }
      if (savedAddressDetected === "true") {
        console.log("[DEBUG localStorage] Setting addressDetected: true");
        setAddressDetected(true);
      }
      if (savedManuallyChanged === "true") {
        console.log(
          "[DEBUG localStorage] Setting addressManuallyChanged: true",
        );
        setAddressManuallyChanged(true);

        // Geocode saved address to get coordinates
        if (savedAddress) {
          console.log("[Home] Geocoding saved address:", savedAddress);
          // Use AddressAutocomplete's geocoding by triggering coordinate change
          setTimeout(() => {
            geocodeSavedAddress(savedAddress);
          }, 500);
        }
      }
      if (savedExplicitlyCleared === "true") {
        console.log(
          "[DEBUG localStorage] Setting userExplicitlyClearedAddress: true",
        );
        setUserExplicitlyClearedAddress(true);
      }
    }
  }, [geocodeSavedAddress]);

  // Save address state to localStorage when it changes
  useEffect(() => {
    if (typeof window !== "undefined") {
      if (userAddress) {
        console.log("[DEBUG localStorage] Saving userAddress:", userAddress);
        localStorage.setItem("userAddress", userAddress);
      } else {
        console.log("[DEBUG localStorage] Removing userAddress");
        localStorage.removeItem("userAddress");
      }
    }
  }, [userAddress]);

  useEffect(() => {
    if (typeof window !== "undefined") {
      console.log(
        "[DEBUG localStorage] Saving addressManuallyChanged:",
        addressManuallyChanged,
      );
      localStorage.setItem(
        "addressManuallyChanged",
        addressManuallyChanged.toString(),
      );
    }
  }, [addressManuallyChanged]);

  useEffect(() => {
    if (typeof window !== "undefined") {
      console.log(
        "[DEBUG localStorage] Saving userExplicitlyClearedAddress:",
        userExplicitlyClearedAddress,
      );
      localStorage.setItem(
        "userExplicitlyClearedAddress",
        userExplicitlyClearedAddress.toString(),
      );
    }
  }, [userExplicitlyClearedAddress]);

  useEffect(() => {
    if (typeof window !== "undefined") {
      console.log("[DEBUG localStorage] Saving hasSetAddress:", hasSetAddress);
      localStorage.setItem("hasSetAddress", hasSetAddress.toString());
    }
  }, [hasSetAddress]);

  useEffect(() => {
    if (typeof window !== "undefined") {
      if (userLocation) {
        console.log("[DEBUG localStorage] Saving userLocation:", userLocation);
        localStorage.setItem("userLocation", JSON.stringify(userLocation));
      } else {
        console.log("[DEBUG localStorage] Removing userLocation");
        localStorage.removeItem("userLocation");
      }
    }
  }, [userLocation]);

  useEffect(() => {
    if (typeof window !== "undefined") {
      console.log(
        "[DEBUG localStorage] Saving addressDetected:",
        addressDetected,
      );
      localStorage.setItem("addressDetected", addressDetected.toString());
    }
  }, [addressDetected]);

  // Fetch function for infinite scroll with location-based sorting
  const fetchWcs = useCallback(
    async (page, limit) => {
      if (!session) {
        throw new Error(t("noSessionAvailable"));
      }

      // Don't fetch data if no address and no location
      if (!userAddress && !userLocation) {
        return {
          data: [],
          pagination: {
            total: 0,
            hasMore: false,
          },
        };
      }

      // Add location parameters if available
      let url = `/api/wcs?page=${page}&limit=${limit}`;
      if (userLocation && userLocation.lat && userLocation.lng) {
        url += `&lat=${userLocation.lat}&lng=${userLocation.lng}`;
      }

      const response = await fetch(url);

      if (!response.ok) {
        const errorText = await response.text();
        // Try to parse JSON error response
        try {
          const errorData = JSON.parse(errorText);
          if (errorData.code === "PGRST103") {
            // This is expected when we reach the end of data
            throw new Error("PGRST103: Requested range not satisfiable");
          }
        } catch (parseError) {
          // If JSON parsing fails, use the original error
        }
        throw new Error(`${t("failedToLoad")} WCs: ${response.statusText}`);
      }

      const data = await response.json();

      // PostGIS handles distance calculation and sorting on the server side
      // Data comes pre-sorted with distance_km field included

      return data;
    },
    [session, t, userLocation, userAddress],
  );

  // Calculate distance between two points in kilometers
  const calculateDistance = (lat1, lng1, lat2, lng2) => {
    const R = 6371; // Earth's radius in kilometers
    const dLat = ((lat2 - lat1) * Math.PI) / 180;
    const dLng = ((lng2 - lng1) * Math.PI) / 180;
    const a =
      Math.sin(dLat / 2) * Math.sin(dLat / 2) +
      Math.cos((lat1 * Math.PI) / 180) *
        Math.cos((lat2 * Math.PI) / 180) *
        Math.sin(dLng / 2) *
        Math.sin(dLng / 2);
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    return R * c;
  };

  // Format distance for display
  const formatDistance = (distance) => {
    if (distance < 1) {
      return `${Math.round(distance * 1000)} ${t("meters")}`;
    } else {
      return `${distance.toFixed(1)} ${t("kilometers")}`;
    }
  };

  // Initialize infinite scroll
  const {
    data: wcs,
    loading: loadingWcs,
    loadingMore,
    error: wcError,
    hasMore,
    totalCount,
    allDataLoaded,
    loadInitialData,
    loadMore,
    reset,
  } = useInfiniteScroll(fetchWcs, 5);

  // Store stable references to functions
  const loadInitialDataRef = useRef(loadInitialData);
  const resetRef = useRef(reset);
  const locationTimeoutRef = useRef(null);

  // Update refs when functions change
  useEffect(() => {
    loadInitialDataRef.current = loadInitialData;
    resetRef.current = reset;
  }, [loadInitialData, reset]);

  // Reset data when user is unauthenticated
  useEffect(() => {
    if (status === "unauthenticated") {
      resetRef.current();
    }
  }, [status]);

  // Refresh WC list when user location changes (for GPS functionality) with debouncing
  useEffect(() => {
    // Clear previous timeout
    if (locationTimeoutRef.current) {
      clearTimeout(locationTimeoutRef.current);
    }

    if (status === "authenticated" && session && userLocation) {
      console.log("[Home] User location changed, setting up debounced refresh");
      setIsLoadingLocation(true);

      // Debounce the location update to avoid multiple rapid calls
      locationTimeoutRef.current = setTimeout(() => {
        console.log("[Home] Executing debounced WC list refresh");
        if (resetRef.current && loadInitialDataRef.current) {
          resetRef.current();
          loadInitialDataRef.current();
        }
        setIsLoadingLocation(false);
      }, 600); // 600ms debounce to account for AddressAutocomplete's 500ms delay
    } else {
      // Reset loading state if conditions are not met
      setIsLoadingLocation(false);
    }

    // Cleanup function
    return () => {
      if (locationTimeoutRef.current) {
        clearTimeout(locationTimeoutRef.current);
      }
    };
  }, [userLocation, status, session]);

  // New useEffect for logging state changes, for better insight
  useEffect(() => {
    console.log("[Home Page State Update] wcs:", wcs);
    console.log("[Home Page State Update] loadingWcs:", loadingWcs);
    console.log("[Home Page State Update] wcError:", wcError);
  }, [wcs, loadingWcs, wcError]);

  // Reverse geocode user location to get address (ONLY for GPS button)
  const reverseGeocode = useCallback(
    async (lat, lng) => {
      console.log("[DEBUG] reverseGeocode called from GPS button with:", {
        lat,
        lng,
      });
      console.log("[DEBUG] reverseGeocode - current localStorage before:", {
        userAddress: localStorage.getItem("userAddress"),
        userLocation: localStorage.getItem("userLocation"),
      });
      setIsGeolocatingAddress(true);
      try {
        const apiKey = process.env.NEXT_PUBLIC_GOOGLE_MAPS_API_KEY;
        console.log("[DEBUG] reverseGeocode - API key present:", !!apiKey);

        if (apiKey) {
          console.log("[DEBUG] reverseGeocode - Using Google Maps API");
          // Use Google Maps API
          const googleUrl = `https://maps.googleapis.com/maps/api/geocode/json?latlng=${lat},${lng}&key=${apiKey}&language=pl`;
          console.log("[DEBUG] reverseGeocode - Google Maps URL:", googleUrl);

          const response = await fetch(googleUrl);
          console.log(
            "[DEBUG] reverseGeocode - Google Maps response status:",
            response.status,
          );

          const data = await response.json();
          console.log(
            "[DEBUG] reverseGeocode - Google Maps API response:",
            data,
          );

          if (data.status === "OK" && data.results.length > 0) {
            console.log(
              "[DEBUG] reverseGeocode setting address from Google:",
              data.results[0].formatted_address,
            );
            console.log(
              "[DEBUG] reverseGeocode - calling setUserAddress, setAddressDetected, setHasSetAddress",
            );
            setUserAddress(data.results[0].formatted_address);
            setAddressDetected(true);
            setHasSetAddress(true);
            return;
          } else {
            console.log(
              "[DEBUG] reverseGeocode - Google Maps API failed with status:",
              data.status,
            );
            console.log(
              "[DEBUG] reverseGeocode - Google Maps API error message:",
              data.error_message,
            );
          }
        } else {
          console.log(
            "[DEBUG] reverseGeocode - No Google Maps API key, using Nominatim",
          );
        }

        // Fallback to Nominatim (OpenStreetMap)
        console.log("[DEBUG] reverseGeocode - Using Nominatim fallback");
        const nominatimUrl = `https://nominatim.openstreetmap.org/reverse?format=json&lat=${lat}&lon=${lng}&zoom=16&addressdetails=1&accept-language=pl`;
        console.log("[DEBUG] reverseGeocode - Nominatim URL:", nominatimUrl);

        const response = await fetch(nominatimUrl);
        console.log(
          "[DEBUG] reverseGeocode - Nominatim response status:",
          response.status,
        );

        const data = await response.json();
        console.log("[DEBUG] reverseGeocode - Nominatim response:", data);

        if (data && data.display_name) {
          console.log(
            "[DEBUG] reverseGeocode setting address from Nominatim:",
            data.display_name,
          );
          console.log(
            "[DEBUG] reverseGeocode - calling setUserAddress, setAddressDetected, setHasSetAddress",
          );
          setUserAddress(data.display_name);
          setAddressDetected(true);
          setHasSetAddress(true);
        } else {
          console.log(
            "[DEBUG] reverseGeocode - Nominatim failed, no display_name in response",
          );
          console.log(
            "[DEBUG] reverseGeocode fallback to coordinates:",
            `${lat.toFixed(6)}, ${lng.toFixed(6)}`,
          );
          console.log(
            "[DEBUG] reverseGeocode - calling setUserAddress, setAddressDetected, setHasSetAddress (fallback)",
          );
          setUserAddress(`${lat.toFixed(6)}, ${lng.toFixed(6)}`);
          setAddressDetected(true);
          setHasSetAddress(true);
        }
      } catch (error) {
        console.error("Reverse geocoding failed:", error);
        console.log("[DEBUG] reverseGeocode - Error details:", {
          message: error.message,
          name: error.name,
          stack: error.stack,
        });
        console.log(
          "[DEBUG] reverseGeocode fallback to coordinates:",
          `${lat.toFixed(6)}, ${lng.toFixed(6)}`,
        );
        console.log(
          "[DEBUG] reverseGeocode - calling setUserAddress, setAddressDetected, setHasSetAddress (fallback)",
        );
        setUserAddress(`${lat.toFixed(6)}, ${lng.toFixed(6)}`);
        setAddressDetected(true);
        setHasSetAddress(true);
      } finally {
        setIsGeolocatingAddress(false);
      }
    },
    [
      setUserAddress,
      setAddressDetected,
      setHasSetAddress,
      setIsGeolocatingAddress,
    ],
  );

  // Handle manual address change
  const handleAddressChange = useCallback(async (address, coordinates) => {
    console.log("[DEBUG] handleAddressChange called with:", {
      address,
      coordinates,
    });
    console.log("[DEBUG] handleAddressChange - current localStorage before:", {
      userAddress: localStorage.getItem("userAddress"),
      userLocation: localStorage.getItem("userLocation"),
    });
    console.log(
      "[DEBUG] handleAddressChange - calling setUserAddress:",
      address,
    );
    setUserAddress(address);

    // If address is cleared, mark as explicitly cleared and clear coordinates
    if (!address || address.trim() === "") {
      console.log("[Home] Address explicitly cleared by user");
      setUserExplicitlyClearedAddress(true);
      setAddressManuallyChanged(false);
      setAddressDetected(false);
      setUserLocation(null);
      setHasSetAddress(false);
      // Reset WC list when address is cleared
      if (resetRef.current) {
        resetRef.current();
      }
    } else {
      // Address has content, reset the explicitly cleared flag
      setHasSetAddress(true);
      setUserExplicitlyClearedAddress(false);
      setAddressDetected(true);
      setAddressManuallyChanged(true);
    }
  }, []);

  // Handle coordinates change from AddressAutocomplete
  const handleCoordinatesChange = useCallback(
    (coordinates) => {
      console.log("[DEBUG] handleCoordinatesChange called with:", coordinates);
      console.log(
        "[DEBUG] handleCoordinatesChange - current localStorage before:",
        {
          userAddress: localStorage.getItem("userAddress"),
          userLocation: localStorage.getItem("userLocation"),
        },
      );

      // Prevent updates if already loading to avoid race conditions
      if (isLoadingLocation) {
        console.log(
          "[DEBUG] handleCoordinatesChange - skipping update, already loading",
        );
        return;
      }

      if (coordinates) {
        console.log(
          "[DEBUG] handleCoordinatesChange - calling setUserLocation, setAddressManuallyChanged, setHasSetAddress",
        );
        setUserLocation({ lat: coordinates.lat, lng: coordinates.lng });
        setAddressManuallyChanged(true);
        setHasSetAddress(true);
      } else {
        console.log(
          "[DEBUG] handleCoordinatesChange - calling setUserLocation(null)",
        );
        setUserLocation(null);
      }
    },
    [isLoadingLocation],
  );

  // Simple rule: Load WC data only when userLocation has actual coordinates
  useEffect(() => {
    if (
      status === "authenticated" &&
      session &&
      userLocation &&
      resetRef.current &&
      loadInitialDataRef.current
    ) {
      console.log(
        "[Home] UserLocation changed, loading WC data:",
        userLocation,
      );
      resetRef.current();
      loadInitialDataRef.current();
    }
  }, [userLocation, status, session]);

  // Manage background class based on authentication status
  useEffect(() => {
    if (status === "unauthenticated") {
      // Add background for unauthenticated users
      document.body.classList.add("auth-background");
    } else if (status === "authenticated") {
      // Remove background for authenticated users
      document.body.classList.remove("auth-background");
    }

    // Cleanup on component unmount
    return () => {
      document.body.classList.remove("auth-background");
    };
  }, [status]);

  // Handle status messages from URL parameters
  useEffect(() => {
    const status = searchParams.get("status");
    if (status) {
      switch (status) {
        case "wc_updated":
          setStatusMessage("WC zostało pomyślnie zaktualizowane.");
          break;
        case "wc_deleted":
          setStatusMessage("WC zostało pomyślnie usunięte.");
          break;
        case "wc_added":
          setStatusMessage("WC zostało pomyślnie dodane.");
          break;
        default:
          break;
      }

      // Clear the status message after 5 seconds
      const timer = setTimeout(() => {
        setStatusMessage("");
      }, 5000);

      return () => clearTimeout(timer);
    }
  }, [searchParams]);

  // Set filtered WCs - no client-side sorting needed as PostGIS handles it
  useEffect(() => {
    setFilteredWcs(wcs);
  }, [wcs]);

  // Check geolocation permission on mount - NO automatic location detection here
  useEffect(() => {
    console.log("[DEBUG] Permission check useEffect triggered with:", {
      session: !!session,
      geolocationSupported: !!navigator.geolocation,
    });

    // Check if geolocation is supported
    if (!navigator.geolocation) {
      setGeolocationSupported(false);
      setLocationPermission("unsupported");
      return;
    }

    if (session && navigator.geolocation) {
      navigator.permissions
        .query({ name: "geolocation" })
        .then((permission) => {
          console.log("[DEBUG] Permission state:", permission.state);
          setLocationPermission(permission.state);
          permission.addEventListener("change", () => {
            setLocationPermission(permission.state);
          });
        })
        .catch(() => {
          setLocationPermission("prompt");
          console.log("[DEBUG] Permission query failed");
        });
    }
  }, [session]);

  const requestLocationPermission = () => {
    if (!navigator.geolocation) {
      setLocationError(t("locationNotSupported"));
      return;
    }

    setLocationError(null);
    navigator.geolocation.getCurrentPosition(
      (position) => {
        // NIE ustawiamy lokalizacji automatycznie - tylko sprawdzamy uprawnienia
        console.log(
          "[DEBUG] Location permission granted, but NOT setting location automatically",
        );
        setLocationPermission("granted");
        setLocationError(null);
      },
      (error) => {
        console.error("Geolocation error:", error);
        setLocationPermission("denied");

        switch (error.code) {
          case error.PERMISSION_DENIED:
            setLocationError(t("locationDenied"));
            break;
          case error.POSITION_UNAVAILABLE:
            setLocationError(t("locationUnavailableError"));
            break;
          case error.TIMEOUT:
            setLocationError(t("locationTimeout"));
            break;
          default:
            setLocationError(t("locationUnknownError"));
            break;
        }
      },
      {
        enableHighAccuracy: true,
        timeout: 10000,
        maximumAge: 300000,
      },
    );
  };

  const renderAuthControls = () => {
    if (status === "loading") {
      return <div style={styles.loader}>{t("loading")}</div>;
    }

    if (session) {
      return (
        <div
          style={{
            width: "100%",
            display: "flex",
            justifyContent: "space-between",
            alignItems: "center",
          }}
        >
          <div
            style={{
              lineHeight: "2em",
              display: "inline-block",
              alignItems: "center",
              gap: "0.5rem",
            }}
          >
            <Link
              href="/wc/add"
              style={{
                ...styles.headerAddButton,
                display:
                  session?.user?.email === "public@sviete.pl"
                    ? "none"
                    : styles.headerAddButton.display,
              }}
            >
              {t("addNewWC")}
            </Link>
          </div>
          <div
            style={{
              display: "inline-block",
              alignItems: "center",
              gap: "0.5rem",
            }}
          >
            {session?.user?.email === "public@sviete.pl" ? (
              <button
                onClick={async () => {
                  // Clear session flag from localStorage
                  if (typeof window !== "undefined") {
                    localStorage.removeItem("hasLoggedInThisSession");
                  }
                  // Sign out and redirect to signin page
                  await signOut({ callbackUrl: "/auth/signin" });
                }}
                style={{
                  ...styles.button,
                  ...styles.signInButton,
                  padding: "0.8rem 0.8rem",
                  fontSize: "0.8rem",
                  fontWeight: "bold",
                  whiteSpace: "nowrap",
                }}
              >
                {t("signIn")}
              </button>
            ) : (
              <UserDropdown session={session} />
            )}
          </div>
        </div>
      );
    }

    return (
      <Link href="/about" style={{ ...styles.button, ...styles.aboutButton }}>
        {t("aboutApp")}
      </Link>
    );
  };

  return (
    <div style={styles.pageContainer}>
      <header style={styles.header}>
        <div></div>
        <div style={styles.authControls}>{renderAuthControls()}</div>
      </header>

      <main style={styles.mainContent}>
        {status === "loading" ? (
          <p style={styles.loader}>Checking session...</p>
        ) : session ? (
          <>
            {/* Status Message */}
            {statusMessage && (
              <div
                style={{
                  backgroundColor: "#d4edda",
                  color: "#155724",
                  padding: "1rem",
                  borderRadius: "8px",
                  marginBottom: "1rem",
                  border: "1px solid #c3e6cb",
                  textAlign: "center",
                }}
              >
                {statusMessage}
              </div>
            )}

            {/* Address Section - Hide when map is shown */}
            <div
              style={{
                ...styles.addressSection,
                ...((userAddress || userLocation) &&
                  filteredWcs.length > 0 && {
                    display: "none",
                  }),
              }}
            >
              <label
                style={{
                  display: "block",
                  marginBottom: "8px",
                  fontSize: "1rem",
                  fontWeight: "600",
                  color: "#333",
                }}
              >
                {t("yourLocation")}
              </label>
              <div style={{ position: "relative" }}>
                <div style={{ position: "relative", display: "flex" }}>
                  <AddressAutocomplete
                    value={userAddress}
                    onChange={handleAddressChange}
                    onCoordinatesChange={handleCoordinatesChange}
                    onBlur={() => {
                      console.log("[Home] Address field blur event");
                    }}
                    placeholder={t("addressPlaceholder")}
                    style={{
                      ...styles.addressField,
                      paddingRight: "4.5rem",
                      fontSize: "16px",
                    }}
                    disabled={
                      loadingWcs || isLoadingLocation || isGeolocatingAddress
                    }
                  />
                  <button
                    onClick={() => {
                      console.log("[GPS Button] Button clicked");
                      if (navigator.geolocation) {
                        setIsGeolocatingAddress(true);
                        console.log("[GPS Button] Getting current position...");
                        navigator.geolocation.getCurrentPosition(
                          (position) => {
                            console.log(
                              "[GPS Button] Position received:",
                              position.coords,
                            );
                            const { latitude, longitude } = position.coords;
                            console.log("[GPS Button] Coordinates:", {
                              latitude,
                              longitude,
                            });
                            setUserLocation({ lat: latitude, lng: longitude });

                            // Call reverse geocoding to get address from coordinates
                            console.log(
                              "[GPS Button] Calling reverseGeocode with:",
                              { lat: latitude, lng: longitude },
                            );
                            reverseGeocode(latitude, longitude);
                          },
                          (error) => {
                            console.error(
                              "[GPS Button] Geolocation failed:",
                              error,
                            );
                            setLocationError(t("locationError"));
                            setIsGeolocatingAddress(false);
                          },
                          {
                            enableHighAccuracy: true,
                            timeout: 10000,
                            maximumAge: 0, // Zawsze pobieraj świeżą lokalizację
                          },
                        );
                      } else {
                        setLocationError(t("locationNotSupported"));
                      }
                    }}
                    disabled={
                      !geolocationSupported ||
                      locationPermission === "denied" ||
                      locationPermission === "unsupported"
                    }
                    title="Pobierz moją lokalizację GPS"
                    style={{
                      position: "absolute",
                      right: 0,
                      top: 0,
                      bottom: 0,
                      width: 40,
                      backgroundColor: "transparent",
                      border: "none",
                      cursor:
                        !geolocationSupported ||
                        locationPermission === "denied" ||
                        locationPermission === "unsupported"
                          ? "not-allowed"
                          : "pointer",
                      display: "flex",
                      alignItems: "center",
                      justifyContent: "center",
                      height: "5em",
                      backgroundColor:
                        !geolocationSupported ||
                        locationPermission === "denied" ||
                        locationPermission === "unsupported"
                          ? "#cccccc"
                          : "#007bff",
                      color: "white",
                      border: "none",
                      borderRadius: "4px",
                      fontSize: "0.8rem",
                      transition: "background-color 0.2s ease",
                      fontWeight: "bold",
                      width: "4em",
                      opacity:
                        !geolocationSupported ||
                        locationPermission === "denied" ||
                        locationPermission === "unsupported"
                          ? 0.5
                          : 1,
                    }}
                    onMouseEnter={(e) => {
                      e.target.style.backgroundColor = "#0056b3";
                    }}
                    onMouseLeave={(e) => {
                      e.target.style.backgroundColor = "#007bff";
                    }}
                  >
                    <LocateFixed size={26} />
                  </button>
                </div>
                {isGeolocatingAddress && (
                  <div
                    style={{
                      ...styles.coordinatesText,
                      color: "#007bff",
                      marginTop: "0.5rem",
                      display: "flex",
                      alignItems: "center",
                      gap: "0.5rem",
                    }}
                  >
                    <div
                      style={{
                        width: "12px",
                        height: "12px",
                        border: "2px solid #e9ecef",
                        borderTop: "2px solid #007bff",
                        borderRadius: "50%",
                        animation: "spin 1s linear infinite",
                      }}
                    ></div>
                    {t("geolocatingAddress")}
                  </div>
                )}
                {userLocation && !isGeolocatingAddress && (
                  <div
                    style={{
                      ...styles.coordinatesText,
                    }}
                  >
                    {t("coordinates")}: {userLocation.lat.toFixed(6)},{" "}
                    {userLocation.lng.toFixed(6)}
                    {addressManuallyChanged && (
                      <span
                        style={{
                          color: "#28a745",
                          marginLeft: "0.5rem",
                          fontWeight: "500",
                        }}
                      >
                        ✓ zaktualizowano
                      </span>
                    )}
                  </div>
                )}
                {!userLocation &&
                  !userAddress &&
                  !isGeolocatingAddress &&
                  !userExplicitlyClearedAddress &&
                  status === "authenticated" && (
                    <div
                      style={{
                        ...styles.coordinatesText,
                        color: "#999",
                        marginTop: "0.5rem",
                        fontStyle: "italic",
                      }}
                    >
                      🔍 {t("detectingLocation")}
                    </div>
                  )}
                {userExplicitlyClearedAddress && !userAddress && (
                  <div
                    style={{
                      ...styles.coordinatesText,
                      color: "#666",
                      marginTop: "0.5rem",
                      display: "flex",
                      alignItems: "center",
                      gap: "0.5rem",
                    }}
                  ></div>
                )}
              </div>
            </div>

            {/* Google Map Section - Full Height */}
            {(userAddress || userLocation) && filteredWcs.length > 0 && (
              <div
                style={{
                  position: "fixed",
                  top: 0,
                  left: 0,
                  width: "100%",
                  height: "100vh",
                  zIndex: 1,
                }}
              >
                {(() => {
                  console.log("[HomePage] Rendering GoogleMap with data:", {
                    wcsCount: filteredWcs.length,
                    userLocation,
                    sampleWcs: filteredWcs.slice(0, 3).map((wc) => ({
                      id: wc.id,
                      name: wc.name,
                      lat: wc.lat,
                      lng: wc.lng,
                      hasCoordinates: wc.lat !== null && wc.lng !== null,
                    })),
                  });
                  return null;
                })()}
                <GoogleMap
                  wcs={filteredWcs}
                  userLocation={userLocation}
                  selectedWcId={selectedWcForMap}
                  onMarkerClick={(wc) => {
                    console.log("[HomePage] Map marker clicked:", wc);
                    setSelectedWcId(wc.id);
                    setBottomSheetOpen(true);
                  }}
                  style={{
                    width: "100%",
                    height: "100%",
                  }}
                  zoom={mapZoom}
                  center={mapCenter || userLocation}
                />

                {/* Transparent Address Overlay */}
                <div
                  style={{
                    position: "absolute",
                    top: "20px",
                    left: "20px",
                    right: "20px",
                    zIndex: 10,
                    maxWidth: "500px",
                    margin: "0 auto",
                  }}
                >
                  <div
                    style={{
                      backgroundColor: "rgba(255, 255, 255, 0.2)",
                      borderRadius: "8px",
                      padding: "15px",
                      boxShadow: "0 2px 10px rgba(0, 0, 0, 0.3)",
                      backdropFilter: "blur(5px)",
                    }}
                  >
                    <div style={{ position: "relative", display: "flex" }}>
                      <AddressAutocomplete
                        value={userAddress}
                        onChange={handleAddressChange}
                        onCoordinatesChange={handleCoordinatesChange}
                        onBlur={() => {
                          console.log("[Home] Address field blur event");
                        }}
                        placeholder={t("addressPlaceholder")}
                        style={{
                          ...styles.addressField,
                          paddingRight: "4.5rem",
                          fontSize: "16px",
                          border: "1px solid #ddd",
                          backgroundColor: "white",
                        }}
                        disabled={
                          loadingWcs ||
                          isLoadingLocation ||
                          isGeolocatingAddress
                        }
                      />
                      <button
                        onClick={() => {
                          console.log("[GPS Button] Button clicked");
                          if (navigator.geolocation) {
                            setIsGeolocatingAddress(true);
                            console.log(
                              "[GPS Button] Getting current position...",
                            );
                            navigator.geolocation.getCurrentPosition(
                              (position) => {
                                console.log(
                                  "[GPS Button] Position received:",
                                  position.coords,
                                );
                                const { latitude, longitude } = position.coords;
                                console.log("[GPS Button] Coordinates:", {
                                  latitude,
                                  longitude,
                                });
                                setUserLocation({
                                  lat: latitude,
                                  lng: longitude,
                                });
                                setUserLocation({
                                  lat: latitude,
                                  lng: longitude,
                                });

                                // Call reverse geocoding to get address from coordinates
                                console.log(
                                  "[GPS Button] Calling reverseGeocode with:",
                                  { lat: latitude, lng: longitude },
                                );
                                reverseGeocode(latitude, longitude);
                              },
                              (error) => {
                                console.error(
                                  "[GPS Button] Geolocation failed:",
                                  error,
                                );
                                setLocationError(t("locationError"));
                                setIsGeolocatingAddress(false);
                              },
                              {
                                enableHighAccuracy: true,
                                timeout: 10000,
                                maximumAge: 0, // Zawsze pobieraj świeżą lokalizację
                              },
                            );
                          } else {
                            setLocationError(t("locationNotSupported"));
                          }
                        }}
                        disabled={
                          !geolocationSupported ||
                          locationPermission === "denied" ||
                          locationPermission === "unsupported"
                        }
                        title="Pobierz moją lokalizację GPS"
                        style={{
                          position: "absolute",
                          right: 0,
                          top: 0,
                          bottom: 0,
                          width: 40,
                          backgroundColor: "transparent",
                          border: "none",
                          cursor:
                            !geolocationSupported ||
                            locationPermission === "denied" ||
                            locationPermission === "unsupported"
                              ? "not-allowed"
                              : "pointer",
                          display: "flex",
                          alignItems: "center",
                          justifyContent: "center",
                          height: "5em",
                          backgroundColor:
                            !geolocationSupported ||
                            locationPermission === "denied" ||
                            locationPermission === "unsupported"
                              ? "#cccccc"
                              : "#007bff",
                          color: "white",
                          border: "none",
                          borderRadius: "0 4px 4px 0",
                          fontSize: "0.8rem",
                          transition: "background-color 0.2s ease",
                          fontWeight: "bold",
                          width: "4em",
                          opacity:
                            !geolocationSupported ||
                            locationPermission === "denied" ||
                            locationPermission === "unsupported"
                              ? 0.5
                              : 1,
                        }}
                        onMouseEnter={(e) => {
                          e.target.style.backgroundColor = "#0056b3";
                        }}
                        onMouseLeave={(e) => {
                          e.target.style.backgroundColor = "#007bff";
                        }}
                      >
                        <LocateFixed size={20} />
                      </button>
                    </div>
                    {isGeolocatingAddress && (
                      <div
                        style={{
                          color: "#007bff",
                          marginTop: "0.5rem",
                          display: "flex",
                          alignItems: "center",
                          gap: "0.5rem",
                          fontSize: "0.9rem",
                        }}
                      >
                        <div
                          style={{
                            width: "12px",
                            height: "12px",
                            border: "2px solid #e9ecef",
                            borderTop: "2px solid #007bff",
                            borderRadius: "50%",
                            animation: "spin 1s linear infinite",
                          }}
                        ></div>
                        {t("geolocatingAddress")}
                      </div>
                    )}
                    {userLocation && !isGeolocatingAddress && (
                      <div
                        style={{
                          color: "#666",
                          marginTop: "0.5rem",
                          fontSize: "0.8rem",
                        }}
                      >
                        📍 {userLocation.lat.toFixed(4)},{" "}
                        {userLocation.lng.toFixed(4)}
                      </div>
                    )}
                  </div>
                </div>

                {/* Reset Map Button - Floating */}
                {mapCenter && (
                  <div
                    style={{
                      position: "absolute",
                      top: "20px",
                      right: "20px",
                      zIndex: 11,
                    }}
                  >
                    <button
                      onClick={resetMapToUser}
                      style={{
                        backgroundColor: "rgba(255, 255, 255, 0.9)",
                        border: "1px solid #ccc",
                        borderRadius: "8px",
                        padding: "10px",
                        cursor: "pointer",
                        display: "flex",
                        alignItems: "center",
                        gap: "6px",
                        fontSize: "14px",
                        fontWeight: "500",
                        color: "#333",
                        boxShadow: "0 2px 10px rgba(0, 0, 0, 0.1)",
                        transition: "all 0.2s",
                      }}
                      onMouseEnter={(e) => {
                        e.target.style.backgroundColor = "#f8f9fa";
                        e.target.style.transform = "scale(1.05)";
                      }}
                      onMouseLeave={(e) => {
                        e.target.style.backgroundColor =
                          "rgba(255, 255, 255, 0.9)";
                        e.target.style.transform = "scale(1)";
                      }}
                      title="Wróć do mojej lokalizacji"
                      aria-label="Wróć do mojej lokalizacji na mapie"
                    >
                      <LocateFixed size={16} />
                      Moja lokalizacja
                    </button>
                  </div>
                )}
              </div>
            )}

            {/* WC List Display - Hidden when map is shown */}
            <div
              style={{
                ...styles.wcListContainer,
                ...((userAddress || userLocation) &&
                  filteredWcs.length > 0 && {
                    display: "none",
                  }),
              }}
            >
              {(loadingWcs || isLoadingLocation) && (
                <p style={styles.loader}>{t("loadingWcs")}</p>
              )}
              {wcError && (
                <p style={{ ...styles.infoMessage, color: "red" }}>{wcError}</p>
              )}
              {!loadingWcs &&
                !isLoadingLocation &&
                !wcError &&
                wcs.length === 0 &&
                userLocation &&
                !isGeolocatingAddress && (
                  <p style={styles.noWcsMessage}>{t("noWcsFound")}</p>
                )}
              {!loadingWcs &&
                !isLoadingLocation &&
                !wcError &&
                !userAddress &&
                !userLocation && (
                  <div
                    style={{
                      textAlign: "center",
                      padding: "40px 40px",
                      color: "#666",
                      fontSize: "1.1rem",
                      marginTop: "20px",
                      marginBottom: "20px",
                    }}
                  >
                    💁 Wpisz adres swojej lokalizacji lub naciśnij przycisk GPS,
                    aby zobaczyć dostępne toalety w pobliżu.
                  </div>
                )}

              {/* Geolocation not supported */}
              {!loadingWcs &&
                !wcError &&
                wcs.length > 0 &&
                !geolocationSupported && (
                  <div
                    style={{
                      textAlign: "center",
                      padding: "20px",
                      backgroundColor: "#f8d7da",
                      border: "1px solid #f5c6cb",
                      borderRadius: "8px",
                      marginBottom: "20px",
                      color: "#721c24",
                    }}
                  >
                    <div style={{ fontSize: "2rem", marginBottom: "10px" }}>
                      ❌
                    </div>
                    <h3 style={{ margin: "0 0 10px 0", color: "#721c24" }}>
                      Geolokalizacja nie jest wspierana
                    </h3>
                    <p style={{ margin: "0", lineHeight: "1.5" }}>
                      Twoja przeglądarka nie obsługuje geolokalizacji. WCs będą
                      wyświetlane w kolejności dodania, bez sortowania według
                      odległości.
                    </p>
                  </div>
                )}

              {/* Location Permission Message */}
              {!loadingWcs &&
                !wcError &&
                wcs.length > 0 &&
                !userLocation &&
                geolocationSupported &&
                (locationPermission === "denied" ||
                  locationPermission === "prompt") && (
                  <div
                    style={{
                      textAlign: "center",
                      padding: "20px",
                      backgroundColor: "#fff3cd",
                      border: "1px solid #ffeaa7",
                      borderRadius: "8px",
                      marginBottom: "20px",
                      color: "#856404",
                    }}
                  >
                    <div style={{ fontSize: "2rem", marginBottom: "10px" }}>
                      📍
                    </div>
                    <h3 style={{ margin: "0 0 10px 0", color: "#856404" }}>
                      {t("locationRequired")}
                    </h3>
                    <p style={{ margin: "0 0 15px 0", lineHeight: "1.5" }}>
                      {t("locationPermissionMessage")}
                    </p>
                    {locationError && (
                      <div
                        style={{
                          backgroundColor: "#f8d7da",
                          color: "#721c24",
                          padding: "10px",
                          borderRadius: "4px",
                          marginBottom: "15px",
                          fontSize: "0.9rem",
                        }}
                      >
                        {locationError}
                      </div>
                    )}
                    <button
                      onClick={requestLocationPermission}
                      style={{
                        padding: "12px 24px",
                        backgroundColor: "#007bff",
                        color: "white",
                        border: "none",
                        borderRadius: "6px",
                        fontSize: "1rem",
                        fontWeight: "bold",
                        cursor: "pointer",
                        transition: "background-color 0.3s ease",
                      }}
                      onMouseEnter={(e) => {
                        e.target.style.backgroundColor = "#0056b3";
                      }}
                      onMouseLeave={(e) => {
                        e.target.style.backgroundColor = "#007bff";
                      }}
                    >
                      {t("enableLocationAccess")}
                    </button>
                  </div>
                )}

              {!loadingWcs &&
                !isLoadingLocation &&
                !wcError &&
                filteredWcs.length > 0 &&
                (userAddress || userLocation) && (
                  <div
                    style={{
                      ...styles.successMessage,
                      fontSize: "0.9rem",
                      textAlign: "center",
                      marginBottom: "20px",
                    }}
                  >
                    {userLocation && !userAddress
                      ? t("locationSorted")
                      : userAddress && !userLocation
                        ? t("locationSortedByAddress")
                        : userAddress && userLocation
                          ? t("locationSortedByAddress")
                          : t("locationSorted")}
                  </div>
                )}

              {wcError && (
                <div
                  style={{
                    ...styles.errorMessage,
                    fontSize: "0.9rem",
                    textAlign: "center",
                    marginBottom: "20px",
                  }}
                >
                  {wcError}
                </div>
              )}

              {!loadingWcs &&
                !isLoadingLocation &&
                !wcError &&
                filteredWcs.length > 0 &&
                (userAddress || userLocation) && (
                  <div
                    style={{
                      textAlign: "center",
                      padding: "20px",
                      fontSize: "1rem",
                      color: "#007bff",
                      backgroundColor: "#f8f9fa",
                      border: "1px solid #e9ecef",
                      borderRadius: "8px",
                      margin: "20px 0",
                    }}
                  >
                    <p>
                      Znaleziono {filteredWcs.length}{" "}
                      {filteredWcs.length === 1 ? "toaletę" : "toalet"}
                    </p>
                    <p
                      style={{
                        fontSize: "0.9rem",
                        marginTop: "10px",
                        color: "#666",
                      }}
                    >
                      Przesuń w górę aby zobaczyć listę
                    </p>
                  </div>
                )}
            </div>
          </>
        ) : (
          <>
            <div
              style={{
                width: "100%",
                display: "flex",
                flexGrow: 1,
                justifyContent: "space-evenly",
                alignItems: "center",
                flexDirection: "column",
              }}
            >
              <Image
                src="/icons/logo.png"
                alt={t("searchingIcon")}
                width={300}
                height={128}
                style={{ marginBottom: "1.5rem" }}
                priority
              />
              <h1 className="welcome-message">{t("welcome")}</h1>

              <button
                onClick={handleAutoLogin}
                disabled={isAutoLogging}
                style={{
                  ...styles.loginButton,
                  backgroundColor: "#28a745",
                  color: "white",
                  fontSize: "1.2rem",
                  padding: "1rem 2rem",
                  marginTop: "1rem",
                  marginBottom: "1rem",
                  minWidth: "200px",
                  opacity: isAutoLogging ? 0.7 : 1,
                  cursor: isAutoLogging ? "not-allowed" : "pointer",
                }}
                onMouseEnter={(e) => {
                  if (!isAutoLogging) {
                    e.target.style.backgroundColor = "#218838";
                  }
                }}
                onMouseLeave={(e) => {
                  if (!isAutoLogging) {
                    e.target.style.backgroundColor = "#28a745";
                  }
                }}
              >
                {isAutoLogging ? "Logowanie..." : t("findToilet")}
              </button>

              <div
                style={{
                  display: "flex",
                  flexDirection: "column",
                  alignItems: "center",
                  gap: "0rem",
                  marginTop: "2rem",
                  width: "100%",
                }}
              >
                <p className="info-message">{t("pleaseSignIn")}</p>
                <button
                  onClick={() => signIn("google")}
                  style={{ ...styles.loginButton, ...styles.googleButton }}
                  onMouseEnter={(e) => {
                    Object.assign(e.target.style, styles.googleButtonHover);
                  }}
                  onMouseLeave={(e) => {
                    Object.assign(e.target.style, {
                      ...styles.loginButton,
                      ...styles.googleButton,
                    });
                  }}
                >
                  <svg
                    width="18"
                    height="18"
                    viewBox="0 0 24 24"
                    style={{ marginRight: "8px" }}
                  >
                    {/* Google Icon SVG */}
                    <path
                      fill="#EA4335"
                      d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"
                    ></path>
                    <path
                      fill="#34A853"
                      d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"
                    ></path>
                    <path
                      fill="#4A90E2"
                      d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"
                    ></path>
                    <path
                      fill="#FBBC05"
                      d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"
                    ></path>
                    <path fill="none" d="M1 1h22v22H1z"></path>
                  </svg>{" "}
                  {t("signInWithGoogle")}
                </button>

                <Link
                  href="/auth/signin"
                  style={{ ...styles.loginButton, ...styles.emailButton }}
                  onMouseEnter={(e) => {
                    Object.assign(e.target.style, styles.emailButtonHover);
                  }}
                  onMouseLeave={(e) => {
                    Object.assign(e.target.style, {
                      ...styles.loginButton,
                      ...styles.emailButton,
                    });
                  }}
                >
                  <span style={{ fontSize: "1.1em" }}>📧</span>{" "}
                  {t("signInWithEmail")}
                </Link>

                <Link
                  href="/auth/register"
                  style={styles.createAccountLink}
                  onMouseEnter={(e) => {
                    e.target.style.color = "#218838";
                  }}
                  onMouseLeave={(e) => {
                    e.target.style.color = "#28a745";
                  }}
                >
                  {t("createAccount")}
                </Link>
              </div>
            </div>
          </>
        )}
      </main>

      {/* Bottom Handle for WC List */}
      {!loadingWcs &&
        !isLoadingLocation &&
        !wcError &&
        filteredWcs.length > 0 &&
        (userAddress || userLocation) && (
          <div
            style={{
              position: "fixed",
              bottom: 0,
              left: "50%",
              transform: "translateX(-50%)",
              zIndex: 999,
              backgroundColor: "white",
              borderRadius: "20px 20px 0 0",
              padding: "10px 20px",
              boxShadow: "0 -4px 20px rgba(0, 0, 0, 0.15)",
              border: "1px solid #ddd",
              borderBottom: "none",
              maxWidth: "500px",
              width: "100%",
              display: "flex",
              alignItems: "center",
              justifyContent: "space-between",
            }}
          >
            {/* Przycisk Dodaj nowe WC */}
            <Link
              href="/wc/add"
              style={{
                display: "flex",
                alignItems: "center",
                gap: "6px",
                padding: "8px 12px",
                backgroundColor: "#007bff",
                color: "white",
                borderRadius: "18px",
                textDecoration: "none",
                fontSize: "12px",
                fontWeight: "500",
                transition: "all 0.2s ease",
                border: "none",
                cursor: "pointer",
              }}
              onMouseEnter={(e) => {
                e.target.style.backgroundColor = "#0056b3";
                e.target.style.transform = "translateY(-1px)";
              }}
              onMouseLeave={(e) => {
                e.target.style.backgroundColor = "#007bff";
                e.target.style.transform = "translateY(0)";
              }}
              onClick={(e) => e.stopPropagation()}
            >
              <Plus size={14} />
              Dodaj WC
            </Link>

            {/* Środkowa część z liczbą toalet */}
            <div
              style={{
                display: "flex",
                flexDirection: "column",
                alignItems: "center",
                cursor: "pointer",
                flex: 1,
              }}
              onClick={() => setBottomSheetOpen(true)}
            >
              <div
                style={{
                  display: "flex",
                  alignItems: "center",
                  justifyContent: "center",
                  marginBottom: "4px",
                }}
              >
                <ChevronUp size={20} color="#666" />
              </div>
              <div
                style={{ textAlign: "center", fontSize: "14px", color: "#666" }}
              >
                {wcs.length} {wcs.length === 1 ? "toaleta" : "toalet"}
              </div>
            </div>

            {/* Puste miejsce po prawej dla symetrii */}
            <div style={{ width: "80px" }}></div>
          </div>
        )}

      {/* WC List Bottom Sheet */}
      <BottomSheet
        isOpen={bottomSheetOpen}
        onClose={() => {
          setBottomSheetOpen(false);
          setSelectedWcId(null);
          // Odświeżenie danych po zamknięciu bottom sheet
          if (selectedWcId) {
            reset();
            loadInitialData();
          }
        }}
        snapPoints={[0.5, 0.8, 0.95]}
        initialSnap={0.8}
        minHeight={400}
        maxWidth={500}
        onScrollBottom={selectedWcId ? null : loadMore}
        isLoading={loadingMore}
        loadingMessage={t("loadingMore")}
        allDataLoaded={allDataLoaded}
        hasMore={hasMore}
        totalCount={totalCount}
        currentCount={wcs.length}
      >
        {selectedWcId ? (
          <WCReport
            wcId={selectedWcId}
            onClose={() => {
              setBottomSheetOpen(false);
              setSelectedWcId(null);
              // Odświeżenie danych po zamknięciu szczegółów WC
              reset();
              loadInitialData();
            }}
          />
        ) : (
          <div>
            <h3
              style={{
                marginBottom: "15px",
                fontSize: "1.2rem",
                fontWeight: "bold",
              }}
            >
              Lista toalet ({wcs.length})
            </h3>

            <div className="responsive-table">
              {wcs.map((wc) => (
                <div key={wc.id} className="table-row">
                  <div
                    className="table-cell, first-cell"
                    style={{
                      textAlign: "center",
                      position: "relative",
                    }}
                  >
                    <div
                      className="edit-cell"
                      style={{
                        textAlign: "center",
                        position: "absolute",
                        width: "60px",
                      }}
                    >
                      {session?.user?.email === wc.created_by ||
                      (wc.google_place_id && session?.user?.email) ? (
                        <Link
                          href={`/wc/edit/${wc.id}`}
                          onClick={(e) => e.stopPropagation()}
                          className="edit-button"
                          title={t("editIconTitle")}
                          style={{
                            zIndex: "10000",
                          }}
                        >
                          <SquarePen size={14} style={{ marginRight: "4px" }} />
                        </Link>
                      ) : (
                        <span>WC Google: {wc.google_place_id}</span>
                      )}
                    </div>
                    <div
                      style={{
                        fontSize: "1rem",
                        width: "50%",
                        position: "absolute",
                        height: "auto",
                        right: "0px",
                        zIndex: "1000000",
                        textAlign: "center",
                        alignItems: "center",
                        justifyContent: "center",
                      }}
                    >
                      {(wc.distance_km !== null &&
                        wc.distance_km !== undefined) ||
                      (wc.distance !== null && wc.distance !== undefined) ? (
                        <div
                          style={{
                            fontSize: "1rem",
                            color: "#ffffff",
                            backgroundColor: "#2196F3",
                            borderRadius: "2em",
                            fontWeight: "bold",
                            marginTop: "2px",
                            whiteSpace: "nowrap",
                            height: "3em",
                            lineHeight: "3.5em",
                            position: "relative",
                            right: "-1em",
                            width: "6em",
                            zIndex: 1000,
                            justifyContent: "center",
                            marginLeft: "auto",
                            marginRight: "auto",
                            verticalAlign: "middle",
                            textAlign: "center",
                            display: "inline-flex",
                            alignItems: "center",
                          }}
                        >
                          <RulerDimensionLine
                            size={22}
                            style={{ marginRight: "4px" }}
                          />
                          {formatDistance(wc.distance_km || wc.distance)}
                        </div>
                      ) : null}
                      <div
                        className="place-type-cell"
                        style={{
                          textAlign: "center",
                          display: "inline-block",
                        }}
                      >
                        <div
                          style={{
                            fontSize: "1rem",
                            color: "#ffffff",
                            backgroundColor: "#2196F3",
                            padding: "0px",
                            borderRadius: "2em",
                            fontWeight: "bold",
                            marginTop: "p0x",
                            whiteSpace: "nowrap",
                            height: "3em",
                            lineHeight: "4em",
                            position: "relative",
                            right: "-1em",
                            width: "3em",
                            zIndex: 1000,
                            display: "inline-block",
                            alignItems: "center",
                            justifyContent: "space-evenly",
                            flexWrap: "wrap",
                            flexDirection: "column",
                            alignContent: "center",
                            margin: "auto",
                            verticalAlign: "middle",
                            marginLeft: "1em",
                          }}
                        >
                          <PlaceTypeDisplay
                            placeType={wc.place_type}
                            showIcon={true}
                            showText={false}
                            iconSize={22}
                          />
                        </div>
                      </div>
                    </div>
                    <div
                      className="table-cell name-cell"
                      style={{ textAlign: "center" }}
                    >
                      {wc.name}
                    </div>

                    <div
                      className="table-cell rating-cell"
                      style={{ textAlign: "center" }}
                    >
                      {wc.rating ? (
                        <RatingDisplay
                          rating={wc.rating}
                          size={14}
                          showNumeric={true}
                        />
                      ) : (
                        t("notRated")
                      )}
                    </div>

                    <div
                      className="image-container"
                      style={{ textAlign: "left", width: "100%" }}
                    >
                      {wc.gallery_photos && wc.gallery_photos.length > 0 ? (
                        <ImageSlideshow
                          images={wc.gallery_photos}
                          alt={wc.name || t("wcImage")}
                          className="thumbnail-in-table"
                          width={200}
                          height={150}
                        />
                      ) : (
                        <div className="thumbnail-placeholder">
                          {t("noImage")}
                        </div>
                      )}
                    </div>
                  </div>

                  <div
                    className="table-cell third-cell"
                    style={{ textAlign: "center" }}
                  >
                    <div style={{ marginBottom: "4px" }}>
                      {wc.address || "N/A"}
                    </div>
                  </div>

                  <div
                    className="table-cell map-button-cell"
                    style={{
                      textAlign: "center",
                      display: "flex",
                      gap: "8px",
                      justifyContent: "center",
                    }}
                  >
                    <button
                      onClick={(e) => {
                        e.stopPropagation();
                        setSelectedWcId(wc.id);
                        setBottomSheetOpen(true);
                      }}
                      style={{
                        backgroundColor: "#007bff",
                        color: "white",
                        border: "none",
                        borderRadius: "8px",
                        padding: "8px 12px",
                        fontSize: "14px",
                        cursor: "pointer",
                        display: "flex",
                        alignItems: "center",
                        gap: "6px",
                        transition: "background-color 0.2s",
                        minWidth: "120px",
                        justifyContent: "center",
                      }}
                      onMouseEnter={(e) =>
                        (e.target.style.backgroundColor = "#0056b3")
                      }
                      onMouseLeave={(e) =>
                        (e.target.style.backgroundColor = "#007bff")
                      }
                      title="Pokaż szczegóły"
                      aria-label={`Pokaż szczegóły ${wc.name}`}
                    >
                      <Eye size={16} />
                      Pokaż szczegóły
                    </button>
                    <button
                      onClick={(e) => {
                        e.stopPropagation();
                        showWcOnMap(wc);
                      }}
                      style={{
                        backgroundColor: "#28a745",
                        color: "white",
                        border: "none",
                        borderRadius: "8px",
                        padding: "8px 12px",
                        fontSize: "14px",
                        cursor: "pointer",
                        display: "flex",
                        alignItems: "center",
                        gap: "6px",
                        transition: "background-color 0.2s",
                        minWidth: "120px",
                        justifyContent: "center",
                      }}
                      onMouseEnter={(e) =>
                        (e.target.style.backgroundColor = "#218838")
                      }
                      onMouseLeave={(e) =>
                        (e.target.style.backgroundColor = "#28a745")
                      }
                      title="Pokaż na mapie"
                      aria-label={`Pokaż ${wc.name} na mapie`}
                    >
                      <MapPinned size={16} />
                      Pokaż na mapie
                    </button>
                  </div>

                  <div
                    className="table-cell sixth-cell"
                    style={{ textAlign: "left" }}
                  >
                    <WCTags
                      wcId={wc.id}
                      isEditable={false}
                      isHeaderText={false}
                    />
                  </div>
                </div>
              ))}
            </div>
          </div>
        )}
      </BottomSheet>
    </div>
  );
}
