"use client";

import { useState, useEffect, useMemo } from "react";
import { useSession } from "next-auth/react";
import { useRouter } from "next/navigation";
import Link from "next/link";
import { createClient } from "@supabase/supabase-js"; // Import Supabase client

// Styles moved to globals.css for better responsiveness
const styles = {
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
    <div className="form-container">
      <div className="form-card">
        <h2
          style={{ marginBottom: "25px", color: "#333", textAlign: "center" }}
        >
          Add New WC
        </h2>

        {error && <p className="form-message form-error">{error}</p>}

        <form onSubmit={handleSubmit} className="form">
          <div>
            <label htmlFor="name" className="form-label">
              Name*
            </label>
            <input
              id="name"
              name="name"
              type="text"
              value={name}
              onChange={(e) => setName(e.target.value)}
              required
              className="form-input"
              placeholder="e.g., Central Park Restroom"
              disabled={loading}
            />
          </div>

          <div>
            <label htmlFor="location" className="form-label">
              Location
            </label>
            <input
              id="location"
              name="location"
              type="text"
              value={location}
              onChange={(e) => setLocation(e.target.value)}
              className="form-input"
              placeholder="e.g., Near the fountain, Main Street"
              disabled={loading}
            />
          </div>

          <div>
            <label htmlFor="imageFile" className="form-label">
              Image (Optional)
            </label>
            <input
              id="imageFile"
              name="imageFile"
              type="file"
              accept="image/*"
              capture="environment" // "user" for front camera, "environment" for back
              onChange={handleFileChange}
              className="form-input"
              style={{ padding: "8px" }} // Adjust padding for file input aesthetics
              disabled={loading}
            />
            {imagePreview && (
              <div className="image-preview">
                <img src={imagePreview} alt="Selected image preview" />
              </div>
            )}
          </div>

          <div>
            <label htmlFor="rating" className="form-label">
              Rating ({rating} / 10)
            </label>
            <div className="star-rating-container">
              {[...Array(10)].map((_, index) => {
                const starValue = index + 1;
                return (
                  <span
                    key={starValue}
                    className={`star ${starValue <= (hoverRating || rating) ? "active" : ""}`}
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

          <button type="submit" className="form-button" disabled={loading}>
            {loading ? "Adding WC..." : "Add WC"}
          </button>
        </form>
        <Link href="/" className="form-cancel-link">
          Cancel
        </Link>
      </div>
    </div>
  );
}
