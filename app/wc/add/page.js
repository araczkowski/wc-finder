"use client";

import { useState, useEffect } from "react";
import { useSession } from "next-auth/react";
import { useRouter } from "next/navigation";
import Link from "next/link";

// Basic inline styles (consider moving to CSS module or global CSS)
const styles = {
  container: {
    display: "flex",
    flexDirection: "column",
    alignItems: "center",
    padding: "20px",
    minHeight: "calc(100vh - 70px)", // Assuming a header height of around 70px
    backgroundColor: "#f9f9f9",
    fontFamily: "sans-serif",
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
  starRatingContainer: {
    display: "flex",
    justifyContent: "flex-start", // Align stars to the left under the label
    alignItems: "center",
    margin: "5px 0",
  },
  star: {
    fontSize: "2rem", // Make stars larger
    color: "#e4e5e9", // Default empty star color
    cursor: "pointer",
    padding: "0 2px", // Spacing between stars
    transition: "color 0.2s ease-in-out",
  },
  button: {
    padding: "12px 15px",
    borderRadius: "4px",
    border: "none",
    fontSize: "16px",
    fontWeight: "bold",
    cursor: "pointer",
    backgroundColor: "#28a745", // Green for submit
    color: "white",
    transition: "background-color 0.2s ease",
    marginTop: "10px",
  },
  cancelLink: {
    display: "inline-block",
    marginTop: "20px",
    color: "#0070f3",
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

export default function AddWcPage() {
  const [name, setName] = useState("");
  const [location, setLocation] = useState("");
  const [imageUrl, setImageUrl] = useState("");
  const [rating, setRating] = useState(5); // Default to 5 stars (1-10 scale)
  const [hoverRating, setHoverRating] = useState(0);
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);

  const router = useRouter();
  const { data: session, status: sessionStatus } = useSession();

  useEffect(() => {
    if (sessionStatus === "loading") {
      // Do nothing while session is loading to prevent premature redirect
      return;
    }
    if (sessionStatus === "unauthenticated") {
      // Redirect to sign-in page if user is not authenticated
      // Include callbackUrl so user is redirected back here after signing in
      router.push("/auth/signin?callbackUrl=/wc/add");
    }
  }, [sessionStatus, router]);

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError("");
    setLoading(true);

    if (!session?.user?.id) {
      setError("Authentication error. Please sign in again.");
      setLoading(false);
      return;
    }

    if (!name.trim()) {
      setError("Name is required.");
      setLoading(false);
      return;
    }

    if (rating < 1 || rating > 10) {
      // Ensure rating is within bounds, though UI should enforce this
      setError("Rating must be between 1 and 10.");
      setLoading(false);
      return;
    }

    const wcData = {
      user_login: session.user.id, // This should match your Supabase column name for the user's ID
      name: name.trim(),
      location: location.trim() || null, // Send null if empty
      image_url: imageUrl.trim() || null, // Send null if empty
      rating: parseInt(rating, 10), // Rating is now always 1-10
    };

    try {
      const response = await fetch("/api/wcs", {
        // Assuming your API route is at /api/wcs
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(wcData),
      });

      const result = await response.json();

      if (!response.ok) {
        throw new Error(
          result.message || "Failed to add WC. Please try again.",
        );
      }

      // Successful submission
      router.push("/?status=wc_added"); // Redirect to home page with a status message
      router.refresh(); // Optional: good if home page needs to refetch data server-side or clear cache
    } catch (err) {
      console.error("Client-side error adding WC:", err);
      setError(
        err.message || "An unexpected error occurred during submission.",
      );
    } finally {
      setLoading(false);
    }
  };

  if (sessionStatus === "loading") {
    return <div style={styles.loadingMessage}>Loading session...</div>;
  }

  // If user is not authenticated, they should be redirected by the useEffect.
  // This is a fallback UI message.
  if (sessionStatus === "unauthenticated") {
    return (
      <div style={styles.loadingMessage}>
        Please sign in to add a WC. Redirecting...
      </div>
    );
  }

  return (
    <div style={styles.container}>
      <div style={styles.card}>
        <h2
          style={{ marginBottom: "25px", color: "#333", textAlign: "center" }}
        >
          Add New WC
        </h2>

        {error && <p style={{ ...styles.message, ...styles.error }}>{error}</p>}

        <form onSubmit={handleSubmit} style={styles.form}>
          <div>
            <label htmlFor="name" style={styles.label}>
              Name*
            </label>
            <input
              id="name"
              name="name"
              type="text"
              value={name}
              onChange={(e) => setName(e.target.value)}
              required
              style={styles.input}
              placeholder="e.g., Central Park Restroom"
              disabled={loading}
            />
          </div>

          <div>
            <label htmlFor="location" style={styles.label}>
              Location
            </label>
            <input
              id="location"
              name="location"
              type="text"
              value={location}
              onChange={(e) => setLocation(e.target.value)}
              style={styles.input}
              placeholder="e.g., Near the fountain, Main Street"
              disabled={loading}
            />
          </div>

          <div>
            <label htmlFor="imageUrl" style={styles.label}>
              Image URL
            </label>
            <input
              id="imageUrl"
              name="image_url"
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
                          ? "#ffc107"
                          : "#e4e5e9",
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

          <button type="submit" style={styles.button} disabled={loading}>
            {loading ? "Adding WC..." : "Add WC"}
          </button>
        </form>
        <Link href="/" style={styles.cancelLink}>
          Cancel
        </Link>
      </div>
    </div>
  );
}
