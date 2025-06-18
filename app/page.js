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
    justifyContent: "flex-start",
    padding: "1rem",
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
        <Image
          src="/icons/person-searching-wc.svg"
          alt="Person searching for WC"
          width={128}
          height={128}
          style={{ marginBottom: "1.5rem" }}
          priority // Good to add if it's a primary visual element
        />
        {status === "loading" ? (
          <p style={styles.loader}>Checking session...</p>
        ) : session ? (
          <>
            <h1 className="welcome-message">
              Welcome back to WC Finder,{" "}
              {session.user?.name || session.user?.email}!
            </h1>

            {/* Add New WC Button */}
            <Link href="/wc/add" style={styles.addButton}>
              Add New WC
            </Link>

            {/* WC List Display */}
            <div style={styles.wcListContainer}>
              <h2
                style={{
                  fontSize: "1.25rem",
                  fontWeight: "bold",
                  marginBottom: "1rem",
                  color: "#333",
                  textAlign: "center",
                }}
              >
                WC Locations
              </h2>
              {loadingWcs && <p style={styles.loader}>Loading WCs...</p>}
              {wcError && (
                <p style={{ ...styles.infoMessage, color: "red" }}>{wcError}</p>
              )}
              {!loadingWcs && !wcError && wcs.length === 0 && (
                <p style={styles.noWcsMessage}>
                  No WCs found. Click Add New WC to add one!
                </p>
              )}
              {!loadingWcs && !wcError && wcs.length > 0 && (
                <div className="responsive-table">
                  <div className="table-header">
                    <div className="header-cell">Image</div>
                    <div className="header-cell">Name</div>
                    <div className="header-cell">Location</div>
                    <div className="header-cell">Rating</div>
                    <div className="header-cell">Created By</div>
                    <div className="header-cell">Actions</div>
                  </div>
                  {wcs.map((wc) => (
                    <div key={wc.id} className="table-row">
                      <div className="table-cell" data-label="Image: ">
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
                      <div className="table-cell" data-label="Name: ">
                        {wc.name}
                      </div>
                      <div className="table-cell" data-label="Location: ">
                        {wc.location || "N/A"}
                      </div>
                      <div className="table-cell" data-label="Rating: ">
                        {wc.rating
                          ? `${"⭐".repeat(Math.min(wc.rating, 10))} (${wc.rating}/10)`
                          : "Not rated"}
                      </div>
                      <div className="table-cell" data-label="Created By: ">
                        {wc.created_by || "N/A"}
                      </div>
                      <div className="table-cell" data-label="Actions: ">
                        <div className="wc-actions">
                          <Link
                            href={`/wc/edit/${wc.id}`}
                            className="edit-icon"
                            title="Edit WC"
                          >
                            →
                          </Link>
                        </div>
                      </div>
                    </div>
                  ))}
                </div>
              )}
            </div>
          </>
        ) : (
          <>
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
