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
    justifyContent: "center",
    padding: "2rem",
    textAlign: "center",
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
    marginBottom: "1.5rem", // Space below the button
    fontWeight: "bold",
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
    maxWidth: "900px", // Wider to accommodate more columns
    marginTop: "2rem",
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
  wcActions: {
    display: "flex",
    flexDirection: "column", // Stack buttons vertically if space is tight, or row
    gap: "0.5rem",
  },
  actionButton: {
    padding: "0.4rem 0.8rem",
    fontSize: "0.8rem",
    borderRadius: "4px",
    border: "1px solid transparent",
    cursor: "pointer",
    fontWeight: "500",
    textDecoration: "none",
    textAlign: "center",
    minWidth: "60px",
  },
  editButton: {
    backgroundColor: "#ffc107", // Amber
    color: "#333",
    borderColor: "#ffc107",
  },
  deleteButton: {
    backgroundColor: "#dc3545", // Red
    color: "white",
    borderColor: "#dc3545",
  },
  noWcsMessage: {
    marginTop: "1rem",
    color: "#555",
    textAlign: "left",
  },
  table: {
    width: "100%",
    borderCollapse: "collapse",
    marginTop: "1rem",
    tableLayout: "fixed", // Helps with column widths
  },
  th: {
    borderBottom: "2px solid #ddd",
    padding: "0.75rem",
    textAlign: "left",
    backgroundColor: "#f9f9f9",
    fontWeight: "bold",
    whiteSpace: "nowrap",
  },
  td: {
    borderBottom: "1px solid #eee",
    padding: "0.75rem",
    verticalAlign: "middle",
    wordWrap: "break-word", // For long text like location or UUID
  },
  thumbnailInTable: {
    width: "60px",
    height: "60px",
    objectFit: "cover",
    borderRadius: "4px",
    border: "1px solid #ddd",
  },
  thumbnailPlaceholder: {
    width: "60px",
    height: "60px",
    backgroundColor: "#e0e0e0",
    display: "flex",
    alignItems: "center",
    justifyContent: "center",
    color: "#777",
    fontSize: "0.8rem",
    borderRadius: "4px",
    border: "1px solid #ddd",
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

  const handleDeleteWc = async (wcId) => {
    if (!window.confirm("Are you sure you want to delete this WC?")) {
      return;
    }
    try {
      if (status !== "authenticated" || !session?.user?.id) {
        alert("You must be logged in to delete a WC.");
        return;
      }
      const response = await fetch(`/api/wcs/${wcId}`, {
        method: "DELETE",
        headers: { "Content-Type": "application/json" },
      });
      const result = await response.json();
      if (!response.ok) {
        throw new Error(result.message || `Server error: ${response.status}`);
      }
      setWcs(wcs.filter((wc) => wc.id !== wcId));
      alert(result.message || "WC deleted successfully!");
    } catch (err) {
      console.error("Error deleting WC:", err);
      alert(`Failed to delete WC: ${err.message}`);
    }
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
              width={40}
              height={40}
              style={styles.userImage}
              priority // Add priority if this image is above the fold
            />
          ) : (
            <div
              style={{
                ...styles.userImage,
                width: 40,
                height: 40,
                backgroundColor: "#ccc",
                display: "flex",
                alignItems: "center",
                justifyContent: "center",
                fontSize: "1.2rem",
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
          {/* Example: Link to a password change page (to be implemented) */}
          {/* <Link href="/auth/change-password" style={{...styles.button, marginLeft: '0.5rem', backgroundColor: '#6c757d', color: 'white'}}>Change Password</Link> */}
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
            <h1 style={styles.welcomeMessage}>
              Welcome back to WC Finder,{" "}
              {session.user?.name || session.user?.email}!
            </h1>
            <p style={styles.infoMessage}>
              You are signed in. Manage your WC locations below.
            </p>
            {/* Add New WC Button */}
            <Link href="/wc/add" style={styles.addButton}>
              Add New WC
            </Link>

            {/* WC List Display */}
            <div style={styles.wcListContainer}>
              <h2 style={styles.wcListHeader}>Your WC Locations</h2>
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
                <table style={styles.table}>
                  <thead>
                    <tr>
                      <th style={{ ...styles.th, width: "80px" }}>Image</th>
                      <th style={styles.th}>Name</th>
                      <th style={styles.th}>Location</th>
                      <th style={{ ...styles.th, width: "120px" }}>Rating</th>
                      <th style={styles.th}>Created By (Email)</th>
                      <th style={{ ...styles.th, width: "150px" }}>Actions</th>
                    </tr>
                  </thead>
                  <tbody>
                    {wcs.map((wc) => (
                      <tr key={wc.id}>
                        <td style={styles.td}>
                          {wc.image_url ? (
                            <img
                              src={wc.image_url}
                              alt={wc.name || "WC image"}
                              style={styles.thumbnailInTable}
                            />
                          ) : (
                            <div style={styles.thumbnailPlaceholder}>
                              No Img
                            </div>
                          )}
                        </td>
                        <td style={styles.td}>{wc.name}</td>
                        <td style={styles.td}>{wc.location || "N/A"}</td>
                        <td style={styles.td}>
                          {wc.rating
                            ? `${"⭐".repeat(Math.min(wc.rating, 10))} (${wc.rating}/10)`
                            : "Not rated"}
                        </td>
                        <td style={styles.td}>{wc.created_by || "N/A"}</td>
                        <td style={styles.td}>
                          {session.user?.id === wc.user_id && ( // Changed wc.created_by to wc.user_id for ownership check
                            <div style={styles.wcActions}>
                              <Link
                                href={`/wc/edit/${wc.id}`}
                                style={{
                                  ...styles.actionButton,
                                  ...styles.editButton,
                                }}
                              >
                                Edit
                              </Link>
                              <button
                                onClick={() => handleDeleteWc(wc.id)}
                                style={{
                                  ...styles.actionButton,
                                  ...styles.deleteButton,
                                }}
                              >
                                Delete
                              </button>
                            </div>
                          )}
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              )}
            </div>
          </>
        ) : (
          <>
            <h1 style={styles.welcomeMessage}>Welcome to WC Finder</h1>
            <p style={styles.infoMessage}>
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
