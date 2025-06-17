"use client";

import { useState, useEffect, useMemo } from "react";
import { useSession } from "next-auth/react";
import { useRouter } from "next/navigation";
import Link from "next/link";
import { createClient } from "@supabase/supabase-js"; // Import Supabase client

// Basic inline styles (consider moving to CSS module or global CSS)
const styles = {
  container: {
    display: "flex",
    flexDirection: "column",
    alignItems: "center",
    padding: "20px",
    minHeight: "calc(100vh - 70px)", // Assuming a header height
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
  // State for image handling
  const [selectedFile, setSelectedFile] = useState(null);
  const [imagePreview, setImagePreview] = useState(null);
  const [rating, setRating] = useState(5); // Default to 5 stars (1-10 scale)
  const [hoverRating, setHoverRating] = useState(0);
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);

  const router = useRouter();
  const { data: session, status: sessionStatus } = useSession();

  const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

  const supabase = useMemo(() => {
    if (supabaseUrl && supabaseAnonKey) {
      return createClient(supabaseUrl, supabaseAnonKey);
    }
    console.warn(
      "Supabase URL or Anon Key is missing for AddWcPage client. Image uploads will fail.",
    );
    return null;
  }, [supabaseUrl, supabaseAnonKey]);

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

    try {
      let uploadedImageUrl = null;
      if (selectedFile && supabase) {
        // Use user_id and timestamp for a somewhat unique path
        // Ensure your bucket is named 'wc-images' or change as needed
        // Ensure RLS policies on 'wc-images' bucket allow uploads for authenticated users.
        const filePath = `${session.user.id}/${Date.now()}_${selectedFile.name}`;

        const { data: uploadData, error: uploadError } = await supabase.storage
          .from("wc-images") // Make sure this bucket name is correct
          .upload(filePath, selectedFile, {
            cacheControl: "3600",
            upsert: false, // Set to true if you want to allow overwriting files with the same path
          });

        if (uploadError) {
          console.error("Supabase Storage upload error:", uploadError);
          throw new Error(
            `Failed to upload image: ${uploadError.message}. Ensure the 'wc-images' bucket exists and RLS policies allow uploads by authenticated users.`,
          );
        }

        // Get public URL for the uploaded file
        const { data: publicUrlData } = supabase.storage
          .from("wc-images")
          .getPublicUrl(uploadData.path);

        if (!publicUrlData || !publicUrlData.publicUrl) {
          console.error(
            "Error getting public URL for uploaded image:",
            publicUrlData,
          );
          throw new Error("Failed to get public URL for image after upload.");
        }
        uploadedImageUrl = publicUrlData.publicUrl;
      }

      const wcData = {
        user_login: session.user.id,
        name: name.trim(),
        location: location.trim() || null,
        image_url: uploadedImageUrl, // Use the uploaded image URL
        rating: parseInt(rating, 10),
      };

      const response = await fetch("/api/wcs", {
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

      router.push("/?status=wc_added");
      router.refresh();
    } catch (err) {
      console.error("Client-side error adding WC:", err);
      setError(
        err.message || "An unexpected error occurred during submission.",
      );
    } finally {
      setLoading(false);
    }
  };

  const handleFileChange = (e) => {
    const file = e.target.files[0];
    if (file) {
      setSelectedFile(file);
      // Create a preview URL
      const previewUrl = URL.createObjectURL(file);
      setImagePreview(previewUrl);
    } else {
      setSelectedFile(null);
      setImagePreview(null);
    }
  };

  // Clean up the object URL to prevent memory leaks
  useEffect(() => {
    return () => {
      if (imagePreview) {
        URL.revokeObjectURL(imagePreview);
      }
    };
  }, [imagePreview]);

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
            <label htmlFor="imageFile" style={styles.label}>
              Image (Optional)
            </label>
            <input
              id="imageFile"
              name="imageFile"
              type="file"
              accept="image/*"
              capture="environment" // "user" for front camera, "environment" for back
              onChange={handleFileChange}
              style={{ ...styles.input, padding: "8px" }} // Adjust padding for file input aesthetics
              disabled={loading}
            />
            {imagePreview && (
              <div style={{ marginTop: "10px", textAlign: "center" }}>
                <img
                  src={imagePreview}
                  alt="Selected image preview"
                  style={{
                    maxWidth: "100%",
                    maxHeight: "200px",
                    borderRadius: "4px",
                    border: "1px solid #ddd",
                    objectFit: "contain",
                  }}
                />
              </div>
            )}
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
