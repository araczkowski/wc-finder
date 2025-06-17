"use client";

import { useState, useEffect, useMemo } from "react";
import { useSession } from "next-auth/react";
import { useRouter, useParams } from "next/navigation";
import { createClient } from "@supabase/supabase-js";
import Link from "next/link";

// Styles are similar to AddWcPage, can be refactored into a shared component/hook later
const styles = {
  container: {
    display: "flex",
    flexDirection: "column",
    alignItems: "center",
    padding: "20px",
    minHeight: "calc(100vh - 70px)", // Adjust if you have a header/footer
    backgroundColor: "#f9f9f9",
  },
  card: {
    backgroundColor: "white",
    padding: "30px 40px",
    borderRadius: "8px",
    boxShadow: "0 4px 12px rgba(0,0,0,0.1)",
    width: "100%",
    maxWidth: "600px",
    textAlign: "left",
  },
  form: {
    display: "flex",
    flexDirection: "column",
    gap: "20px",
  },
  label: {
    fontWeight: "bold",
    marginBottom: "5px",
    fontSize: "0.9rem",
    color: "#333",
    display: "block",
  },
  input: {
    padding: "12px",
    borderRadius: "4px",
    border: "1px solid #ddd",
    fontSize: "16px",
    width: "100%",
    boxSizing: "border-box",
  },
  select: {
    padding: "12px",
    borderRadius: "4px",
    border: "1px solid #ddd",
    fontSize: "16px",
    width: "100%",
    boxSizing: "border-box",
    backgroundColor: "white",
  },
  starRatingContainer: {
    display: "flex",
    justifyContent: "center", // Center stars
    alignItems: "center",
    margin: "5px 0",
  },
  star: {
    fontSize: "2rem",
    color: "#e4e5e9", // Default empty star color
    cursor: "pointer",
    padding: "0 2px",
    transition: "color 0.2s ease-in-out",
  },
  button: {
    padding: "12px 15px",
    borderRadius: "4px",
    border: "none",
    fontSize: "16px",
    fontWeight: "bold",
    cursor: "pointer",
    backgroundColor: "#007bff", // Blue for update
    color: "white",
    transition: "background-color 0.2s ease",
    marginTop: "10px",
  },
  cancelLink: {
    display: "inline-block",
    marginTop: "15px",
    color: "#6c757d", // Grey for cancel
    textDecoration: "none",
    textAlign: "center",
    width: "100%",
  },
  message: {
    padding: "10px",
    borderRadius: "4px",
    marginBottom: "20px",
    textAlign: "center",
    fontSize: "0.9em",
  },
  error: {
    color: "red",
    backgroundColor: "rgba(255,0,0,0.1)",
  },
  loadingMessage: {
    textAlign: "center",
    fontSize: "1.2rem",
    color: "#555",
    padding: "50px",
  },
};

export default function EditWcPage() {
  const router = useRouter();
  const params = useParams();
  const wcId = params?.id;

  const { data: session, status: sessionStatus } = useSession();

  const [name, setName] = useState("");
  const [location, setLocation] = useState("");
  const [imageUrl, setImageUrl] = useState("");
  const [rating, setRating] = useState(0);
  const [hoverRating, setHoverRating] = useState(0); // For hover effect
  const [originalWcData, setOriginalWcData] = useState(null);
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false); // For form submission
  const [pageLoading, setPageLoading] = useState(true); // For initial data fetch

  const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

  const supabase = useMemo(() => {
    if (supabaseUrl && supabaseAnonKey) {
      return createClient(supabaseUrl, supabaseAnonKey);
    }
    console.warn("Supabase URL or Anon Key is missing for EditWcPage client.");
    return null;
  }, [supabaseUrl, supabaseAnonKey]);

  useEffect(() => {
    if (sessionStatus === "unauthenticated") {
      router.push("/auth/signin");
    }
  }, [sessionStatus, router]);

  useEffect(() => {
    const fetchWcData = async () => {
      if (!wcId || !supabase || !session?.user?.id) {
        if (sessionStatus === "authenticated" && !wcId) {
          setError("WC ID is missing.");
          setPageLoading(false);
        }
        // If supabase or session is not ready yet, don't proceed
        if (!supabase || sessionStatus !== "authenticated") {
          setPageLoading(sessionStatus === "loading"); // Keep loading if session is loading
          return;
        }
        return;
      }

      setPageLoading(true);
      setError("");
      try {
        const { data: fetchedWc, error: fetchError } = await supabase
          .from("wcs")
          .select("*")
          .eq("id", wcId)
          .single();

        if (fetchError) {
          throw fetchError;
        }

        if (!fetchedWc) {
          setError("WC not found.");
          setOriginalWcData(null);
          setPageLoading(false);
          return;
        }

        // Authorization check: Ensure the logged-in user owns this WC
        if (fetchedWc.user_id !== session.user.id) {
          setError("You are not authorized to edit this WC.");
          setOriginalWcData(null); // Clear data if not authorized
          setPageLoading(false);
          // Optionally, redirect: router.push('/');
          return;
        }

        setOriginalWcData(fetchedWc);
        setName(fetchedWc.name || "");
        setLocation(fetchedWc.location || "");
        setImageUrl(fetchedWc.image_url || "");
        setRating(fetchedWc.rating || 0);
      } catch (err) {
        console.error("Error fetching WC data:", err);
        setError(`Failed to fetch WC details: ${err.message}`);
        setOriginalWcData(null);
      } finally {
        setPageLoading(false);
      }
    };

    if (sessionStatus === "authenticated") {
      fetchWcData();
    } else if (sessionStatus === "loading") {
      setPageLoading(true); // Explicitly set loading if session is still loading
    }
  }, [wcId, supabase, sessionStatus, session?.user?.id, router]);

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError("");
    setLoading(true);

    if (
      !session?.user?.id ||
      !originalWcData ||
      originalWcData.user_id !== session.user.id
    ) {
      setError("Unauthorized or original data missing. Cannot update.");
      setLoading(false);
      return;
    }
    if (!name.trim()) {
      setError("Name is required.");
      setLoading(false);
      return;
    }

    const updatedWcData = {
      name: name.trim(),
      location: location.trim() || null,
      image_url: imageUrl.trim() || null,
      rating: rating > 0 ? parseInt(rating, 10) : null, // Ensure it's an int or null
    };

    try {
      // API route for update will be /api/wcs/[id]
      const response = await fetch(`/api/wcs/${wcId}`, {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
          // Include Authorization header if your API route needs to verify NextAuth session token
          // 'Authorization': `Bearer ${session.accessToken}`,
        },
        body: JSON.stringify(updatedWcData),
      });

      const result = await response.json();

      if (!response.ok) {
        throw new Error(result.message || "Failed to update WC.");
      }

      router.push("/?status=wc_updated");
      router.refresh();
    } catch (err) {
      console.error("Failed to update WC:", err);
      setError(err.message || "An unexpected error occurred during update.");
    } finally {
      setLoading(false);
    }
  };

  if (sessionStatus === "loading" || pageLoading) {
    return <div style={styles.loadingMessage}>Loading WC details...</div>;
  }

  if (sessionStatus === "unauthenticated") {
    // This should ideally be handled by the useEffect redirect, but serves as a fallback.
    return <div style={styles.loadingMessage}>Redirecting to sign in...</div>;
  }

  // If there's an error and no original data (e.g., not found, not authorized, or wcId missing from start)
  if (error && !originalWcData) {
    return (
      <div style={styles.container}>
        <div style={styles.card}>
          <h2
            style={{ marginBottom: "25px", color: "#333", textAlign: "center" }}
          >
            Edit WC
          </h2>
          <p style={{ ...styles.message, ...styles.error }}>{error}</p>
          <Link href="/" style={styles.cancelLink}>
            Go to Home
          </Link>
        </div>
      </div>
    );
  }

  if (!originalWcData) {
    // Fallback if still no data after loading and no specific error path hit
    return (
      <div style={styles.loadingMessage}>
        Could not load WC data or WC not found.
      </div>
    );
  }

  return (
    <div style={styles.container}>
      <div style={styles.card}>
        <h2
          style={{ marginBottom: "25px", color: "#333", textAlign: "center" }}
        >
          Edit WC: {originalWcData?.name}
        </h2>

        {error && !originalWcData && (
          /* Only show general form error if original data load failed */ <p
            style={{ ...styles.message, ...styles.error }}
          >
            {error}
          </p>
        )}
        {/* Show submission specific errors here */}
        {error && originalWcData && (
          <p style={{ ...styles.message, ...styles.error }}>{error}</p>
        )}

        <form onSubmit={handleSubmit} style={styles.form}>
          <div>
            <label htmlFor="name" style={styles.label}>
              Name*
            </label>
            <input
              id="name"
              type="text"
              value={name}
              onChange={(e) => setName(e.target.value)}
              required
              style={styles.input}
              placeholder="e.g., Main Street Public Toilet"
              disabled={loading}
            />
          </div>

          <div>
            <label htmlFor="location" style={styles.label}>
              Location
            </label>
            <input
              id="location"
              type="text"
              value={location}
              onChange={(e) => setLocation(e.target.value)}
              style={styles.input}
              placeholder="e.g., 123 Main St, Anytown or Park Entrance"
              disabled={loading}
            />
          </div>

          <div>
            <label htmlFor="imageUrl" style={styles.label}>
              Image URL
            </label>
            <input
              id="imageUrl"
              type="url"
              value={imageUrl}
              onChange={(e) => setImageUrl(e.target.value)}
              style={styles.input}
              placeholder="https://example.com/image.jpg"
              disabled={loading}
            />
          </div>

          <div>
            <label htmlFor="rating" style={styles.label}>
              Rating ({rating} / 10)
            </label>
            <div style={styles.starRatingContainer}>
              {[...Array(10)].map((_, index) => {
                const starValue = index + 1;
                return (
                  <span
                    key={starValue}
                    style={{
                      ...styles.star,
                      color:
                        starValue <= (hoverRating || rating)
                          ? "#ffc107" // Filled star color
                          : "#e4e5e9", // Empty star color
                    }}
                    onClick={() => setRating(starValue)}
                    onMouseEnter={() => setHoverRating(starValue)}
                    onMouseLeave={() => setHoverRating(0)}
                    role="button"
                    tabIndex={0}
                    onKeyDown={(e) => {
                      if (e.key === "Enter" || e.key === " ")
                        setRating(starValue);
                    }}
                    aria-label={`Rate ${starValue} out of 10 stars`}
                  >
                    ★
                  </span>
                );
              })}
            </div>
          </div>

          <button
            type="submit"
            style={styles.button}
            disabled={loading || !supabase}
          >
            {loading ? "Updating..." : "Update WC"}
          </button>
        </form>
        <Link href="/" style={styles.cancelLink}>
          Cancel
        </Link>
      </div>
    </div>
  );
}
