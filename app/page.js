"use client";

import { useSession, signIn, signOut } from "next-auth/react";
import Image from "next/image"; // For user icon placeholder
import Link from "next/link"; // <<< CRUCIAL IMPORT FOR THE LINK COMPONENT
import { useState, useEffect, useMemo } from "react"; // Added useState, useEffect, useMemo
import { useSearchParams } from "next/navigation"; // Added useSearchParams
import { createClient } from "@supabase/supabase-js"; // Added Supabase client

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
  searchContainer: {
    width: "100%",
    marginBottom: "1.5rem",
    position: "relative",
  },
  searchInput: {
    padding: "1rem",
    paddingRight: "120px",
    borderRadius: "12px",
    border: "2px solid #e1e5e9",
    fontSize: "1rem",
    width: "100%",
    boxSizing: "border-box",
    transition: "all 0.3s ease",
    backgroundColor: "#f8f9fa",
    outline: "none",
    fontFamily: "sans-serif",
    color: "black",
  },
  locationButton: {
    position: "absolute",
    right: "8px",
    top: "50%",
    transform: "translateY(-50%)",
    padding: "0.5rem 0.75rem",
    borderRadius: "8px",
    border: "none",
    fontSize: "0.8rem",
    fontWeight: "600",
    cursor: "pointer",
    backgroundColor: "#667eea",
    color: "white",
    transition: "all 0.3s ease",
    minHeight: "36px",
    display: "flex",
    alignItems: "center",
    gap: "4px",
  },
  locationButtonDisabled: {
    backgroundColor: "#6c757d",
    cursor: "not-allowed",
    opacity: 0.6,
  },
};

export default function Home() {
  const { data: session, status } = useSession();
  // Log component rendering and current session status
  console.log(
    "[Home Page] Component rendering. Session status:",
    status,
    "Session object:",
    session ? "Exists" : "Null",
  );
  const searchParams = useSearchParams();
  const [wcs, setWcs] = useState([]);
  const [loadingWcs, setLoadingWcs] = useState(false);
  const [wcError, setWcError] = useState("");
  const [searchQuery, setSearchQuery] = useState("");
  const [filteredWcs, setFilteredWcs] = useState([]);
  const [locationLoading, setLocationLoading] = useState(false);
  const [locationPermission, setLocationPermission] = useState(null);
  const [locationPrompted, setLocationPrompted] = useState(false);

  const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

  const supabase = useMemo(() => {
    if (supabaseUrl && supabaseAnonKey) {
      console.log(
        "[Home Page] Initializing Supabase client with URL:",
        supabaseUrl,
      );
      return createClient(supabaseUrl, supabaseAnonKey);
    }
    console.warn(
      "[Home Page] Supabase URL or Anon Key is missing. Supabase client not initialized. Check .env.local and restart server.",
    );
    return null;
  }, [supabaseUrl, supabaseAnonKey]);

  useEffect(() => {
    // Log when this effect runs and the state of its dependencies
    console.log(
      "[Home Page] Main useEffect triggered. Deps - Status:",
      status,
      "Session:",
      session ? "Exists" : "Null",
      "Supabase Client:",
      supabase ? "Exists" : "Null",
      "SearchParams:",
      searchParams.toString(),
    );

    const fetchWcs = async () => {
      console.log(
        "[Home Page] fetchWcs called. Session status:",
        status,
        "Supabase client available:",
        !!supabase,
      );
      if (!supabase || !session) {
        console.log(
          "[Home Page] fetchWcs: Aborting fetch - Supabase client or session not available.",
        );
        if (!session && status !== "loading") {
          setWcs([]); // Ensure WCs are cleared if unauthenticated and not loading
          setLoadingWcs(false);
        }
        return;
      }

      setLoadingWcs(true);
      setWcError("");
      try {
        console.log(
          "[Home Page] fetchWcs: Attempting to fetch from 'wcs' table.",
        );
        const { data: fetchedWcs, error } = await supabase
          .from("wcs")
          .select("*") // Fetches all columns, including created_by
          .order("created_at", { ascending: false });

        console.log(
          "[Home Page] Supabase fetch result - Error:",
          JSON.stringify(error, null, 2),
        );
        console.log(
          "[Home Page] Supabase fetch result - Data (fetchedWcs):",
          JSON.stringify(fetchedWcs, null, 2),
        );

        if (error) {
          throw error;
        }
        setWcs(fetchedWcs || []);
        console.log("[Home Page] WCs state set with:", fetchedWcs || []);
      } catch (err) {
        console.error("[Home Page] Error in fetchWcs catch block:", err);
        setWcError(`Failed to fetch WCs: ${err.message}`);
      } finally {
        setLoadingWcs(false);
        console.log("[Home Page] fetchWcs finished.");
      }
    };

    if (status === "authenticated" && supabase) {
      console.log(
        "[Home Page] Main useEffect: Conditions met (authenticated and supabase client exists), calling fetchWcs().",
      );
      fetchWcs();
    } else if (status === "unauthenticated") {
      console.log(
        "[Home Page] Main useEffect: User unauthenticated, clearing WCs list and ensuring loading is false.",
      );
      setWcs([]);
      setLoadingWcs(false);
    } else if (status === "loading") {
      console.log(
        "[Home Page] Main useEffect: Session is loading, will not fetch WCs yet.",
      );
    } else if (!supabase) {
      console.warn(
        "[Home Page] Main useEffect: Supabase client not available (likely due to missing env vars), cannot fetch WCs.",
      );
      setLoadingWcs(false);
    }
  }, [status, session, supabase, searchParams]);

  // New useEffect for logging state changes, for better insight
  useEffect(() => {
    console.log("[Home Page State Update] wcs:", wcs);
    console.log("[Home Page State Update] loadingWcs:", loadingWcs);
    console.log("[Home Page State Update] wcError:", wcError);
  }, [wcs, loadingWcs, wcError]);

  // Filter WCs based on search query
  useEffect(() => {
    if (!searchQuery.trim()) {
      setFilteredWcs(wcs);
    } else {
      const filtered = wcs.filter(
        (wc) =>
          wc.address?.toLowerCase().includes(searchQuery.toLowerCase()) ||
          wc.name?.toLowerCase().includes(searchQuery.toLowerCase()),
      );
      setFilteredWcs(filtered);
    }
  }, [wcs, searchQuery]);

  // Check geolocation permission on mount and ask for permission after login
  useEffect(() => {
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
              () => {
                setLocationPermission("granted");
              },
              () => {
                setLocationPermission("denied");
              },
              { timeout: 5000 },
            );
          }
        })
        .catch(() => {
          setLocationPermission("prompt");
          // Try to ask for permission anyway
          if (!locationPrompted) {
            setLocationPrompted(true);
            navigator.geolocation.getCurrentPosition(
              () => {
                setLocationPermission("granted");
              },
              () => {
                setLocationPermission("denied");
              },
              { timeout: 5000 },
            );
          }
        });
    }
  }, [session, locationPrompted]);

  const handleMyLocation = () => {
    if (!navigator.geolocation) {
      alert("Geolocation is not supported by this browser.");
      return;
    }

    setLocationLoading(true);

    navigator.geolocation.getCurrentPosition(
      async (position) => {
        const { latitude, longitude } = position.coords;

        try {
          // Try to use free reverse geocoding API
          try {
            const response = await fetch(
              `https://nominatim.openstreetmap.org/reverse?format=json&lat=${latitude}&lon=${longitude}&zoom=18&addressdetails=1`,
            );

            if (response.ok) {
              const data = await response.json();
              if (data && data.display_name) {
                // Use full address from display_name, but clean it up slightly
                let fullAddress = data.display_name;

                // Remove country and postal code from the end if present
                fullAddress = fullAddress
                  .replace(/, \d{2}-\d{3},.*$/, "") // Remove Polish postal codes and everything after
                  .replace(/, Poland$/, "") // Remove ", Poland" at the end
                  .replace(/, Polska$/, "") // Remove ", Polska" at the end
                  .trim();

                setSearchQuery(fullAddress);
              } else {
                setSearchQuery(
                  `${latitude.toFixed(4)}, ${longitude.toFixed(4)}`,
                );
              }
            } else {
              // Fallback to coordinates if geocoding fails
              setSearchQuery(`${latitude.toFixed(4)}, ${longitude.toFixed(4)}`);
            }
          } catch (geocodingError) {
            console.error("Geocoding error:", geocodingError);
            // Fallback to coordinates
            setSearchQuery(`${latitude.toFixed(4)}, ${longitude.toFixed(4)}`);
          }
        } catch (error) {
          console.error("Location error:", error);
          setSearchQuery(`${latitude.toFixed(4)}, ${longitude.toFixed(4)}`);
        }

        setLocationLoading(false);
      },
      (error) => {
        setLocationLoading(false);
        console.error("Geolocation error:", error);

        switch (error.code) {
          case error.PERMISSION_DENIED:
            alert(
              "Location access denied. Please enable location access and try again.",
            );
            setLocationPermission("denied");
            break;
          case error.POSITION_UNAVAILABLE:
            alert("Location information is unavailable.");
            break;
          case error.TIMEOUT:
            alert("Location request timed out.");
            break;
          default:
            alert("An unknown error occurred while retrieving location.");
            break;
        }
      },
      {
        enableHighAccuracy: true,
        timeout: 10000,
        maximumAge: 300000, // 5 minutes
      },
    );
  };

  const renderAuthControls = () => {
    if (status === "loading") {
      return <div style={styles.loader}>Loading...</div>;
    }

    if (session) {
      return (
        <div style={styles.userInfo}>
          {session.user?.image ? (
            <Image
              src={session.user.image}
              alt={session.user.name || "User avatar"}
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
            Sign Out
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
        <div style={styles.appName}>WC Finder</div>
        <div style={styles.authControls}>{renderAuthControls()}</div>
      </header>

      <main style={styles.mainContent}>
        {status === "loading" ? (
          <p style={styles.loader}>Checking session...</p>
        ) : session ? (
          <>
            {/* Search Container */}
            <div style={styles.searchContainer}>
              {locationPermission === "denied" && (
                <p
                  style={{
                    fontSize: "0.8rem",
                    color: "#e74c3c",
                    marginBottom: "0.5rem",
                    textAlign: "center",
                  }}
                >
                  📍 Location access denied. Enable in browser settings for
                  better search.
                </p>
              )}
              <input
                type="text"
                placeholder="Search WCs by address..."
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                style={styles.searchInput}
                onFocus={(e) => {
                  e.target.style.borderColor = "#667eea";
                  e.target.style.boxShadow =
                    "0 0 0 3px rgba(102, 126, 234, 0.1)";
                  e.target.style.backgroundColor = "#ffffff";
                }}
                onBlur={(e) => {
                  e.target.style.borderColor = "#e1e5e9";
                  e.target.style.boxShadow = "none";
                  e.target.style.backgroundColor = "#f8f9fa";
                }}
              />
              <button
                onClick={handleMyLocation}
                disabled={locationLoading}
                style={{
                  ...styles.locationButton,
                  ...(locationLoading ? styles.locationButtonDisabled : {}),
                }}
                onMouseEnter={(e) => {
                  if (!locationLoading) {
                    e.target.style.backgroundColor = "#5a67d8";
                    e.target.style.transform = "translateY(-50%) scale(1.05)";
                  }
                }}
                onMouseLeave={(e) => {
                  if (!locationLoading) {
                    e.target.style.backgroundColor = "#667eea";
                    e.target.style.transform = "translateY(-50%) scale(1)";
                  }
                }}
                title="Use my current location"
              >
                {locationLoading ? (
                  <>
                    <div
                      style={{
                        width: "12px",
                        height: "12px",
                        border: "2px solid transparent",
                        borderTop: "2px solid white",
                        borderRadius: "50%",
                        animation: "spin 1s linear infinite",
                      }}
                    ></div>
                    GPS
                  </>
                ) : (
                  <>📍Lokalizacja</>
                )}
              </button>
            </div>

            {/* Add New WC Button */}
            <Link href="/wc/add" style={styles.addButton}>
              Add New WC
            </Link>

            {/* WC List Display */}
            <div style={styles.wcListContainer}>
              {loadingWcs && <p style={styles.loader}>Loading WCs...</p>}
              {wcError && (
                <p style={{ ...styles.infoMessage, color: "red" }}>{wcError}</p>
              )}
              {!loadingWcs && !wcError && wcs.length === 0 && (
                <p style={styles.noWcsMessage}>
                  No WCs found. Click Add New WC to add one!
                </p>
              )}
              {!loadingWcs &&
                !wcError &&
                searchQuery &&
                filteredWcs.length === 0 &&
                wcs.length > 0 && (
                  <p style={styles.noWcsMessage}>
                    No WCs found matching &quot;{searchQuery}&quot;. Try a
                    different search term.
                  </p>
                )}
              {!loadingWcs && !wcError && filteredWcs.length > 0 && (
                <div className="responsive-table">
                  {filteredWcs.map((wc) => (
                    <Link
                      key={wc.id}
                      href={`/wc/edit/${wc.id}`}
                      className="edit-icon"
                      title="Edit WC"
                    >
                      <div className="table-row">
                        <div
                          className="table-cell"
                          style={{ textAlign: "center" }}
                        >
                          {wc.image_url ? (
                            <img
                              src={wc.image_url}
                              alt={wc.name || "WC image"}
                              className="thumbnail-in-table"
                            />
                          ) : (
                            <div className="thumbnail-placeholder">No Img</div>
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
                          {wc.address || "N/A"}
                        </div>
                        <div
                          className="table-cell"
                          style={{ textAlign: "center" }}
                        >
                          {wc.rating
                            ? `${"⭐".repeat(Math.min(wc.rating, 10))} (${wc.rating}/10)`
                            : "Not rated"}
                        </div>
                      </div>
                    </Link>
                  ))}
                </div>
              )}
            </div>
          </>
        ) : (
          <>
            <Image
              src="/icons/person-searching-wc.svg"
              alt="Person searching for WC"
              width={128}
              height={128}
              style={{ marginBottom: "1.5rem" }}
              priority
            />
            <h1 className="welcome-message">Welcome to WC Finder</h1>
            <p className="info-message">
              Please sign in to access the application features.
            </p>
            <Link href="/auth/signin" style={styles.signInLink}>
              Sign In Here
            </Link>
          </>
        )}
      </main>
    </div>
  );
}
