"use client";

import { useSession, signIn, signOut } from "next-auth/react";
import Image from "next/image"; // For user icon placeholder
import Link from "next/link"; // <<< CRUCIAL IMPORT FOR THE LINK COMPONENT
import { useState, useEffect, useMemo, useCallback, useRef } from "react"; // Added useState, useEffect, useMemo, useCallback, useRef
import { useSearchParams } from "next/navigation"; // Added useSearchParams
import { useInfiniteScroll } from "./hooks/useInfiniteScroll";
import { useTranslation } from "./hooks/useTranslation";

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
    backgroundColor: "#f9f9f9",
    width: "100%",
    maxWidth: "500px",
    margin: "0 auto",
  },
  header: {
    display: "flex",
    justifyContent: "space-between",
    alignItems: "center",
    padding: "0.75rem 1rem",
    backgroundColor: "#f0f0f0",
    borderBottom: "1px solid #ddd",
    flexShrink: 0,
    width: "100%",
  },
  authControls: {
    display: "flex",
    alignItems: "center",
    gap: "0.5rem",
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
  const [locationPrompted, setLocationPrompted] = useState(false);
  const [userLocation, setUserLocation] = useState(null); // { lat, lng }
  const [geolocationSupported, setGeolocationSupported] = useState(true);
  const [locationError, setLocationError] = useState(null);

  // Fetch function for infinite scroll
  const fetchWcs = useCallback(
    async (page, limit) => {
      if (!session) {
        throw new Error(t("noSessionAvailable"));
      }

      const response = await fetch(`/api/wcs?page=${page}&limit=${limit}`);

      if (!response.ok) {
        throw new Error(`${t("failedToLoad")} WCs: ${response.statusText}`);
      }

      return await response.json();
    },
    [session, t],
  );

  // Initialize infinite scroll
  const {
    data: wcs,
    loading: loadingWcs,
    loadingMore,
    error: wcError,
    hasMore,
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
    );

    if (status === "authenticated" && session) {
      console.log("[Home Page] User authenticated, loading initial data.");
      loadInitialDataRef.current();
    } else if (status === "unauthenticated") {
      console.log("[Home Page] User unauthenticated, resetting data.");
      resetRef.current();
    }
  }, [status, session]); // Depend on auth status and session

  // New useEffect for logging state changes, for better insight
  useEffect(() => {
    console.log("[Home Page State Update] wcs:", wcs);
    console.log("[Home Page State Update] loadingWcs:", loadingWcs);
    console.log("[Home Page State Update] wcError:", wcError);
  }, [wcs, loadingWcs, wcError]);

  // Calculate distance between two coordinates using Haversine formula
  const calculateDistance = (lat1, lng1, lat2, lng2) => {
    const R = 6371; // Earth's radius in kilometers
    const dLat = (lat2 - lat1) * (Math.PI / 180);
    const dLng = (lng2 - lng1) * (Math.PI / 180);
    const a =
      Math.sin(dLat / 2) * Math.sin(dLat / 2) +
      Math.cos(lat1 * (Math.PI / 180)) *
        Math.cos(lat2 * (Math.PI / 180)) *
        Math.sin(dLng / 2) *
        Math.sin(dLng / 2);
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    return R * c; // Distance in kilometers
  };

  // Format distance for display
  const formatDistance = (distanceKm) => {
    if (distanceKm < 1) {
      return `${Math.round(distanceKm * 1000)}m`;
    } else if (distanceKm < 10) {
      return `${distanceKm.toFixed(1)}km`;
    } else {
      return `${Math.round(distanceKm)}km`;
    }
  };

  // Sort WCs based on location distance
  useEffect(() => {
    let filtered = [...wcs];

    // Add distance calculations and sort by distance if user location is available
    if (userLocation) {
      filtered = filtered
        .map((wc) => {
          if (wc.location) {
            const [lat, lng] = wc.location.split(",").map(Number);
            if (!isNaN(lat) && !isNaN(lng)) {
              const distance = calculateDistance(
                userLocation.lat,
                userLocation.lng,
                lat,
                lng,
              );
              return { ...wc, distance };
            }
          }
          return { ...wc, distance: null };
        })
        .sort((a, b) => {
          // Sort by distance (nearest first), put items without distance at the end
          if (a.distance === null && b.distance === null) return 0;
          if (a.distance === null) return 1;
          if (b.distance === null) return -1;
          return a.distance - b.distance;
        });
    }

    setFilteredWcs(filtered);
  }, [wcs, userLocation]);

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
            // Auto-detect location for distance sorting
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
                setUserLocation({ lat: latitude, lng: longitude });
              },
              () => {
                setLocationPermission("denied");
              },
            );
          }
        });
    }
  }, [session, locationPrompted, userLocation]);

  const requestLocationPermission = () => {
    if (!navigator.geolocation) {
      setLocationError(t("locationNotSupported"));
      return;
    }

    setLocationError(null);
    navigator.geolocation.getCurrentPosition(
      (position) => {
        const { latitude, longitude } = position.coords;
        setUserLocation({ lat: latitude, lng: longitude });
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
        <div style={styles.userInfo}>
          {session.user?.image ? (
            <Image
              src={session.user.image}
              alt={session.user.name || t("userAvatar")}
              width={32}
              height={32}
              style={styles.userImage}
              priority // Add priority if this image is above the fold
            />
          ) : (
            <div
              style={{
                ...styles.userImage,
                width: 32,
                height: 32,
                backgroundColor: "#ccc",
                display: "flex",
                alignItems: "center",
                justifyContent: "center",
                fontSize: "1rem",
                color: "#fff", // Ensure initials are visible
              }}
            >
              {session.user?.name?.charAt(0).toUpperCase() ||
                session.user?.email?.charAt(0).toUpperCase() ||
                "U"}
            </div>
          )}
          <span style={styles.userName}>
            {session.user?.name || session.user?.email}
          </span>
          <button
            onClick={() => signOut({ callbackUrl: "/" })}
            style={{ ...styles.button, ...styles.signOutButton }}
          >
            {t("signOut")}
          </button>
        </div>
      );
    }

    return (
      <Link
        href="/auth/signin"
        style={{ ...styles.button, ...styles.signInButton }}
      >
        Sign In
      </Link>
    );
  };

  return (
    <div style={styles.pageContainer}>
      <header style={styles.header}>
        <div style={styles.appName}>{t("appName")}</div>
        <div style={styles.authControls}>{renderAuthControls()}</div>
      </header>

      <main style={styles.mainContent}>
        {status === "loading" ? (
          <p style={styles.loader}>Checking session...</p>
        ) : session ? (
          <>
            {/* Add New WC Button */}
            <Link href="/wc/add" style={styles.addButton}>
              {t("addNewWc")}
            </Link>

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
                    <p style={{ margin: "0", fontSize: "0.9rem" }}>
                      {t("gettingLocation")}
                    </p>
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
                        backgroundColor: "#e8f5e8",
                        borderRadius: "4px",
                        fontSize: "0.85rem",
                        color: "#2E7D32",
                        border: "1px solid #4CAF50",
                      }}
                    >
                      {t("locationSorted")}
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
                            {wc.image_url ? (
                              <Image
                                src={wc.image_url}
                                alt={wc.name || t("wcImage")}
                                className="thumbnail-in-table"
                                width={80}
                                height={80}
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
                            <div>{wc.address || "N/A"}</div>
                            {wc.distance !== null &&
                              wc.distance !== undefined && (
                                <div
                                  style={{
                                    fontSize: "0.8rem",
                                    color: "#2196F3",
                                    marginTop: "2px",
                                    fontWeight: "bold",
                                  }}
                                >
                                  📍 {formatDistance(wc.distance)}
                                </div>
                              )}
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
                  {!hasMore && wcs.length > 0 && (
                    <div
                      style={{
                        textAlign: "center",
                        padding: "20px",
                        fontSize: "0.9rem",
                        color: "#6c757d",
                        backgroundColor: "#f8f9fa",
                        border: "1px solid #e9ecef",
                        borderRadius: "8px",
                        margin: "20px 0",
                        fontStyle: "italic",
                      }}
                    >
                      {t("allWcsLoaded", { count: wcs.length })}
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
            <Link href="/auth/signin" style={styles.signInLink}>
              {t("signInHere")}
            </Link>
          </>
        )}
      </main>
    </div>
  );
}
