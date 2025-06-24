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
    justifyContent: "space-evenly",
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
    backgroundColor: "#0070f3",
    color: "white",
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
  const [isStateRestored, setIsStateRestored] = useState(false);

  // Early geocoding function for restored addresses
  const geocodeRestoredAddress = useCallback(async (address) => {
    console.log("[Home] Geocoding restored address:", address);
    try {
      const apiKey = process.env.NEXT_PUBLIC_GOOGLE_MAPS_API_KEY;

      if (apiKey) {
        // Use Google Maps API
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
          console.log("[Home] Restored address coordinates:", coordinates);
          setUserLocation(coordinates);
          // Load data after setting coordinates
          setTimeout(() => {
            if (loadInitialDataRef.current) {
              loadInitialDataRef.current();
            }
          }, 100);
          return;
        }
      }

      // Fallback to Nominatim (OpenStreetMap)
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
          "[Home] Restored address coordinates (Nominatim):",
          coordinates,
        );
        setUserLocation(coordinates);
        // Load data after setting coordinates
        setTimeout(() => {
          if (loadInitialDataRef.current) {
            loadInitialDataRef.current();
          }
        }, 100);
      }
    } catch (error) {
      console.error("Early geocoding failed:", error);
    }
  }, []);

  // Load address state from localStorage on component mount
  useEffect(() => {
    if (typeof window !== "undefined") {
      const savedAddress = localStorage.getItem("userAddress");
      const savedManuallyChanged = localStorage.getItem(
        "addressManuallyChanged",
      );
      const savedExplicitlyCleared = localStorage.getItem(
        "userExplicitlyClearedAddress",
      );

      if (savedAddress) {
        setUserAddress(savedAddress);
        setAddressDetected(true);
      }
      if (savedManuallyChanged === "true") {
        setAddressManuallyChanged(true);
      }
      if (savedExplicitlyCleared === "true") {
        setUserExplicitlyClearedAddress(true);
      }

      // Mark state as restored
      setIsStateRestored(true);

      // If we have a saved address that was manually changed, geocode it
      if (savedAddress && savedManuallyChanged === "true") {
        setTimeout(() => {
          geocodeRestoredAddress(savedAddress);
        }, 500);
      }
    }
  }, [geocodeRestoredAddress]);

  // Save address state to localStorage when it changes
  useEffect(() => {
    if (typeof window !== "undefined") {
      if (userAddress) {
        localStorage.setItem("userAddress", userAddress);
      } else {
        localStorage.removeItem("userAddress");
      }
    }
  }, [userAddress]);

  useEffect(() => {
    if (typeof window !== "undefined") {
      localStorage.setItem(
        "addressManuallyChanged",
        addressManuallyChanged.toString(),
      );
    }
  }, [addressManuallyChanged]);

  useEffect(() => {
    if (typeof window !== "undefined") {
      localStorage.setItem(
        "userExplicitlyClearedAddress",
        userExplicitlyClearedAddress.toString(),
      );
    }
  }, [userExplicitlyClearedAddress]);

  // Fetch function for infinite scroll with location-based sorting
  const fetchWcs = useCallback(
    async (page, limit) => {
      if (!session) {
        throw new Error(t("noSessionAvailable"));
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
    [session, t, userLocation],
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
    reset,
  } = useInfiniteScroll(fetchWcs, 5);

  // Store stable references to functions
  const loadInitialDataRef = useRef(loadInitialData);
  const resetRef = useRef(reset);

  // Update refs when functions change
  useEffect(() => {
    loadInitialDataRef.current = loadInitialData;
    resetRef.current = reset;
  }, [loadInitialData, reset]);

  // Separate useEffect for handling authentication state changes
  useEffect(() => {
    console.log(
      "[Home Page] Auth useEffect triggered. Status:",
      status,
      "Session:",
      session ? "Exists" : "Null",
      "State restored:",
      isStateRestored,
    );

    if (status === "authenticated" && session) {
      console.log("[Home Page] User authenticated, loading initial data.");
      loadInitialDataRef.current();
    } else if (status === "unauthenticated") {
      console.log("[Home Page] User unauthenticated, resetting data.");
      resetRef.current();
    }
  }, [status, session, isStateRestored]);

  // New useEffect for logging state changes, for better insight
  useEffect(() => {
    console.log("[Home Page State Update] wcs:", wcs);
    console.log("[Home Page State Update] loadingWcs:", loadingWcs);
    console.log("[Home Page State Update] wcError:", wcError);
  }, [wcs, loadingWcs, wcError]);

  // Reverse geocode user location to get address
  const reverseGeocode = useCallback(
    async (lat, lng) => {
      setIsGeolocatingAddress(true);
      try {
        const apiKey = process.env.NEXT_PUBLIC_GOOGLE_MAPS_API_KEY;

        if (apiKey) {
          // Use Google Maps API
          const response = await fetch(
            `https://maps.googleapis.com/maps/api/geocode/json?latlng=${lat},${lng}&key=${apiKey}&language=pl`,
          );
          const data = await response.json();

          if (data.status === "OK" && data.results.length > 0) {
            // Only set address if no manual address exists and user hasn't explicitly cleared it
            if (
              (!userAddress || userAddress === "") &&
              !addressManuallyChanged &&
              !userExplicitlyClearedAddress
            ) {
              setUserAddress(data.results[0].formatted_address);
              setAddressDetected(true);
            }
            return;
          }
        }

        // Fallback to Nominatim (OpenStreetMap)
        const response = await fetch(
          `https://nominatim.openstreetmap.org/reverse?format=json&lat=${lat}&lon=${lng}&zoom=16&addressdetails=1&accept-language=pl`,
        );
        const data = await response.json();

        if (data && data.display_name) {
          // Only set address if no manual address exists and user hasn't explicitly cleared it
          if (
            (!userAddress || userAddress === "") &&
            !addressManuallyChanged &&
            !userExplicitlyClearedAddress
          ) {
            setUserAddress(data.display_name);
            setAddressDetected(true);
          }
        }
      } catch (error) {
        console.error("Reverse geocoding failed:", error);
        // Only set coordinate address if no manual address exists and user hasn't explicitly cleared it
        if (
          (!userAddress || userAddress === "") &&
          !addressManuallyChanged &&
          !userExplicitlyClearedAddress
        ) {
          setUserAddress(`${lat.toFixed(6)}, ${lng.toFixed(6)}`);
          setAddressDetected(true);
        }
      } finally {
        setIsGeolocatingAddress(false);
      }
    },
    [userAddress, addressManuallyChanged, userExplicitlyClearedAddress],
  );

  // Update address when location changes
  useEffect(() => {
    if (userLocation && userLocation.lat && userLocation.lng) {
      // Only reverse geocode if no address is manually entered and user hasn't explicitly cleared it
      if (
        (!userAddress || userAddress === "") &&
        !addressManuallyChanged &&
        !userExplicitlyClearedAddress
      ) {
        reverseGeocode(userLocation.lat, userLocation.lng);
      }
    }
  }, [
    userLocation,
    userAddress,
    addressManuallyChanged,
    userExplicitlyClearedAddress,
    reverseGeocode,
  ]);

  // Handle manual address change
  const handleAddressChange = useCallback(async (address, coordinates) => {
    console.log(
      "[Home] Address changed:",
      address,
      "Coordinates:",
      coordinates,
    );
    setUserAddress(address);

    // If address is cleared, mark as explicitly cleared and clear coordinates
    if (!address || address.trim() === "") {
      console.log("[Home] Address explicitly cleared by user");
      setUserExplicitlyClearedAddress(true);
      setAddressManuallyChanged(false);
      setAddressDetected(false);
      setUserLocation(null);
    } else {
      // Address has content, reset the explicitly cleared flag
      setUserExplicitlyClearedAddress(false);
      setAddressDetected(true);
      setAddressManuallyChanged(true);
    }
  }, []);

  // Handle coordinates change from AddressAutocomplete
  const handleCoordinatesChange = useCallback((coordinates) => {
    console.log("[Home] Coordinates changed:", coordinates);
    if (coordinates) {
      setUserLocation({ lat: coordinates.lat, lng: coordinates.lng });
      setAddressManuallyChanged(true);
    } else {
      // Clear coordinates
      setUserLocation(null);
    }
  }, []);

  // Watch for userLocation changes to refresh WC list
  useEffect(() => {
    if (
      resetRef.current &&
      loadInitialDataRef.current &&
      isStateRestored &&
      status === "authenticated"
    ) {
      console.log(
        "[Home] UserLocation changed, refreshing WC list:",
        userLocation,
      );
      // Refresh WC list when location changes (including when set to null)
      resetRef.current();
      setTimeout(() => {
        loadInitialDataRef.current();
      }, 100);
    }
  }, [userLocation, isStateRestored, status]);

  // Watch for address clearing to trigger automatic location detection (only if not explicitly cleared)
  useEffect(() => {
    // If address is cleared and we don't have automatic location yet, but user hasn't explicitly cleared it
    if (
      !userAddress &&
      !addressManuallyChanged &&
      !userLocation &&
      !userExplicitlyClearedAddress &&
      navigator.geolocation &&
      locationPermission === "granted"
    ) {
      console.log(
        "[Home] Address cleared (not explicitly by user), triggering automatic location detection",
      );
      navigator.geolocation.getCurrentPosition(
        (position) => {
          const { latitude, longitude } = position.coords;
          setUserLocation({ lat: latitude, lng: longitude });
        },
        (error) => {
          console.log(
            "Auto location detection after address clear failed:",
            error,
          );
        },
        {
          enableHighAccuracy: false,
          timeout: 5000,
          maximumAge: 300000,
        },
      );
    }
  }, [
    userAddress,
    addressManuallyChanged,
    userLocation,
    userExplicitlyClearedAddress,
    locationPermission,
  ]);

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

  // Check geolocation permission on mount and ask for permission after login
  useEffect(() => {
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
          setLocationPermission(permission.state);
          permission.addEventListener("change", () => {
            setLocationPermission(permission.state);
          });

          // Automatically ask for location permission after login if not prompted yet
          if (permission.state === "prompt" && !locationPrompted) {
            setLocationPrompted(true);
            navigator.geolocation.getCurrentPosition(
              (position) => {
                setLocationPermission("granted");
                const { latitude, longitude } = position.coords;
                setUserLocation({ lat: latitude, lng: longitude });
              },
              () => {
                setLocationPermission("denied");
              },
            );
          } else if (permission.state === "granted" && !userLocation) {
            // Auto-detect location for distance sorting only if no manual address and not explicitly cleared
            if (
              (!userAddress || userAddress === "") &&
              !addressManuallyChanged &&
              !userExplicitlyClearedAddress
            ) {
              navigator.geolocation.getCurrentPosition(
                (position) => {
                  const { latitude, longitude } = position.coords;
                  setUserLocation({ lat: latitude, lng: longitude });
                },
                (error) => {
                  console.log("Auto location detection failed:", error);
                },
                {
                  enableHighAccuracy: false,
                  timeout: 5000,
                  maximumAge: 300000,
                },
              );
            }
          }
        })
        .catch(() => {
          setLocationPermission("prompt");
          // Try to ask for permission anyway
          if (!locationPrompted) {
            setLocationPrompted(true);
            navigator.geolocation.getCurrentPosition(
              (position) => {
                setLocationPermission("granted");
                const { latitude, longitude } = position.coords;
                // Only set location if no manual address is entered and not explicitly cleared
                if (
                  (!userAddress || userAddress === "") &&
                  !addressManuallyChanged &&
                  !userExplicitlyClearedAddress
                ) {
                  setUserLocation({ lat: latitude, lng: longitude });
                }
              },
              () => {
                setLocationPermission("denied");
              },
            );
          }
        });
    }
  }, [
    session,
    locationPrompted,
    userLocation,
    userAddress,
    addressManuallyChanged,
    userExplicitlyClearedAddress,
  ]);

  const requestLocationPermission = () => {
    if (!navigator.geolocation) {
      setLocationError(t("locationNotSupported"));
      return;
    }

    setLocationError(null);
    navigator.geolocation.getCurrentPosition(
      (position) => {
        const { latitude, longitude } = position.coords;
        // Only set location if no manual address is entered and not explicitly cleared
        if (
          (!userAddress || userAddress === "") &&
          !addressManuallyChanged &&
          !userExplicitlyClearedAddress
        ) {
          setUserLocation({ lat: latitude, lng: longitude });
        }
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
            <Link href="/wc/add" style={styles.headerAddButton}>
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
            <UserDropdown session={session} />
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

            {/* Address Section */}
            <div style={styles.addressSection}>
              <label
                style={{
                  fontSize: "1rem",
                  fontWeight: "600",
                  marginBottom: "0.75rem",
                  display: "block",
                  color: "#333",
                }}
              >
                📍 {t("userAddress")}
              </label>
              <div style={{ position: "relative" }}>
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
                    borderColor: addressManuallyChanged ? "#28a745" : "#ddd",
                  }}
                />
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
                  !userExplicitlyClearedAddress && (
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
                  >
                    <span>📍 Lokalizacja wyłączona</span>
                    <button
                      onClick={() => {
                        setUserExplicitlyClearedAddress(false);
                        if (
                          navigator.geolocation &&
                          locationPermission === "granted"
                        ) {
                          navigator.geolocation.getCurrentPosition(
                            (position) => {
                              const { latitude, longitude } = position.coords;
                              setUserLocation({
                                lat: latitude,
                                lng: longitude,
                              });
                            },
                            (error) => {
                              console.log(
                                "Auto location detection after re-enable failed:",
                                error,
                              );
                            },
                            {
                              enableHighAccuracy: false,
                              timeout: 5000,
                              maximumAge: 300000,
                            },
                          );
                        }
                      }}
                      style={{
                        padding: "4px 8px",
                        backgroundColor: "#007bff",
                        color: "white",
                        border: "none",
                        borderRadius: "4px",
                        fontSize: "0.8rem",
                        cursor: "pointer",
                        transition: "background-color 0.2s ease",
                      }}
                      onMouseEnter={(e) => {
                        e.target.style.backgroundColor = "#0056b3";
                      }}
                      onMouseLeave={(e) => {
                        e.target.style.backgroundColor = "#007bff";
                      }}
                    >
                      Włącz ponownie
                    </button>
                  </div>
                )}
              </div>
            </div>

            {/* WC List Display */}
            <div style={styles.wcListContainer}>
              {loadingWcs && <p style={styles.loader}>{t("loadingWcs")}</p>}
              {wcError && (
                <p style={{ ...styles.infoMessage, color: "red" }}>{wcError}</p>
              )}
              {!loadingWcs && !wcError && wcs.length === 0 && (
                <p style={styles.noWcsMessage}>{t("noWcsFound")}</p>
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

              {/* Location not available but permission granted */}
              {!loadingWcs &&
                !wcError &&
                wcs.length > 0 &&
                !userLocation &&
                locationPermission === "granted" && (
                  <div
                    style={{
                      textAlign: "center",
                      padding: "15px",
                      backgroundColor: "#e8f4f8",
                      border: "1px solid #bee5eb",
                      borderRadius: "8px",
                      marginBottom: "20px",
                      color: "#0c5460",
                    }}
                  >
                    <div style={{ fontSize: "1.5rem", marginBottom: "5px" }}>
                      🔄
                    </div>
                    <p
                      style={{
                        margin: "0",
                        fontSize: "0.9rem",
                        marginBottom: "10px",
                      }}
                    >
                      {t("gettingLocation")}
                    </p>
                    <button
                      onClick={() => window.location.reload()}
                      style={{
                        padding: "8px 16px",
                        backgroundColor: "#007bff",
                        color: "white",
                        border: "none",
                        borderRadius: "4px",
                        fontSize: "0.8rem",
                        cursor: "pointer",
                        transition: "background-color 0.2s",
                      }}
                      onMouseEnter={(e) => {
                        e.target.style.backgroundColor = "#0056b3";
                      }}
                      onMouseLeave={(e) => {
                        e.target.style.backgroundColor = "#007bff";
                      }}
                    >
                      🔄 Odśwież stronę
                    </button>
                  </div>
                )}

              {!loadingWcs && !wcError && filteredWcs.length > 0 && (
                <>
                  {userLocation && geolocationSupported && (
                    <div
                      style={{
                        textAlign: "center",
                        marginBottom: "15px",
                        padding: "8px",
                        backgroundColor: addressManuallyChanged
                          ? "#e3f2fd"
                          : "#e8f5e8",
                        borderRadius: "4px",
                        fontSize: "0.85rem",
                        color: addressManuallyChanged ? "#1976d2" : "#2E7D32",
                        border: addressManuallyChanged
                          ? "1px solid #2196F3"
                          : "1px solid #4CAF50",
                      }}
                    >
                      {addressManuallyChanged
                        ? t("locationSortedByAddress")
                        : t("locationSorted")}
                    </div>
                  )}

                  {!userLocation && !geolocationSupported && (
                    <div
                      style={{
                        textAlign: "center",
                        marginBottom: "15px",
                        padding: "8px",
                        backgroundColor: "#fff3cd",
                        borderRadius: "4px",
                        fontSize: "0.85rem",
                        color: "#856404",
                        border: "1px solid #ffeaa7",
                      }}
                    >
                      {t("locationUnavailable")}
                    </div>
                  )}
                  {!userLocation && geolocationSupported && (
                    <div
                      style={{
                        textAlign: "center",
                        marginBottom: "15px",
                        padding: "8px",
                        backgroundColor: "#f0f9ff",
                        borderRadius: "4px",
                        fontSize: "0.85rem",
                        color: "#0369a1",
                        border: "1px solid #bae6fd",
                      }}
                    >
                      {t("distancesAfterLocation")}
                    </div>
                  )}
                  <div className="responsive-table">
                    {filteredWcs.map((wc) => (
                      <Link
                        key={wc.id}
                        href={`/wc/edit/${wc.id}`}
                        className="edit-icon"
                        title={t("editIconTitle")}
                      >
                        <div className="table-row">
                          <div
                            className="table-cell"
                            style={{ textAlign: "center" }}
                          >
                            {wc.gallery_photos &&
                            wc.gallery_photos.length > 0 ? (
                              <ImageSlideshow
                                images={wc.gallery_photos}
                                alt={wc.name || t("wcImage")}
                                className="thumbnail-in-table"
                                width={400}
                                height={300}
                              />
                            ) : (
                              <div className="thumbnail-placeholder">
                                {t("noImage")}
                              </div>
                            )}
                          </div>
                          <div
                            className="table-cell"
                            style={{ textAlign: "center" }}
                          >
                            {wc.name}
                          </div>
                          <div
                            className="table-cell"
                            style={{ textAlign: "center" }}
                          >
                            <div style={{ marginBottom: "4px" }}>
                              {wc.address || "N/A"}
                            </div>
                            {(wc.distance_km !== null &&
                              wc.distance_km !== undefined) ||
                            (wc.distance !== null &&
                              wc.distance !== undefined) ? (
                              <div
                                style={{
                                  fontSize: "0.9rem",
                                  color: "#ffffff",
                                  backgroundColor: "#2196F3",
                                  padding: "2px 6px",
                                  borderRadius: "12px",
                                  fontWeight: "bold",
                                  display: "inline-block",
                                  marginTop: "2px",
                                }}
                              >
                                📍{" "}
                                {formatDistance(wc.distance_km || wc.distance)}
                              </div>
                            ) : null}
                          </div>
                          <div
                            className="table-cell"
                            style={{ textAlign: "center" }}
                          >
                            {wc.rating
                              ? `${t("stars").repeat(Math.min(wc.rating, 10))} ${t("ratingOutOf10", { rating: wc.rating })}`
                              : t("notRated")}
                          </div>
                        </div>
                      </Link>
                    ))}
                  </div>

                  {/* Loading more indicator */}
                  {loadingMore && (
                    <div
                      style={{
                        textAlign: "center",
                        padding: "20px",
                        fontSize: "1rem",
                        color: "#666",
                        backgroundColor: "#f8f9fa",
                        border: "1px solid #e9ecef",
                        borderRadius: "8px",
                        margin: "20px 0",
                        transition: "opacity 0.3s ease",
                      }}
                    >
                      <div
                        style={{
                          display: "flex",
                          alignItems: "center",
                          justifyContent: "center",
                          gap: "10px",
                        }}
                      >
                        <div
                          style={{
                            width: "20px",
                            height: "20px",
                            border: "2px solid #e9ecef",
                            borderTop: "2px solid #007bff",
                            borderRadius: "50%",
                            animation: "spin 1s linear infinite",
                          }}
                        ></div>
                        {t("loadingMore")}
                      </div>
                    </div>
                  )}

                  {/* No more data indicator */}
                  {(allDataLoaded || !hasMore) && wcs.length > 0 && (
                    <div
                      style={{
                        textAlign: "center",
                        padding: "20px",
                        fontSize: "0.9rem",
                        color: "#28a745",
                        backgroundColor: "#f8f9fa",
                        border: "1px solid #d4edda",
                        borderRadius: "8px",
                        margin: "20px 0",
                        fontWeight: "500",
                      }}
                    >
                      ✓ Wczytano {wcs.length}{" "}
                      {totalCount > 0 && totalCount === wcs.length
                        ? `z ${totalCount}`
                        : ""}{" "}
                      rekordów
                    </div>
                  )}
                </>
              )}
            </div>
          </>
        ) : (
          <>
            <Image
              src="/icons/person-searching-wc.svg"
              alt={t("searchingIcon")}
              width={128}
              height={128}
              style={{ marginBottom: "1.5rem" }}
              priority
            />
            <h1 className="welcome-message">{t("welcome")}</h1>
            <p className="info-message">{t("pleaseSignIn")}</p>

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
                📧 {t("signInWithEmail")}
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
          </>
        )}
      </main>
    </div>
  );
}
