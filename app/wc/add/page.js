"use client";

import { useState, useEffect, useMemo } from "react";
import { useSession } from "next-auth/react";
import { useRouter } from "next/navigation";
import Link from "next/link";
import { createClient } from "@supabase/supabase-js"; // Import Supabase client

// Mobile-first styles
const styles = {
  loadingMessage: {
    textAlign: "center",
    fontSize: "1.2rem",
    color: "#555",
    padding: "50px",
  },
  formContainer: {
    display: "flex",
    flexDirection: "column",
    alignItems: "center",
    padding: "1rem",
    minHeight: "calc(100vh - 70px)",
    backgroundColor: "#f9f9f9",
    fontFamily: "sans-serif",
    width: "100%",
    maxWidth: "500px",
    margin: "0 auto",
  },
  formCard: {
    backgroundColor: "white",
    padding: "2rem",
    borderRadius: "8px",
    boxShadow: "0 4px 12px rgba(0, 0, 0, 0.1)",
    width: "100%",
    textAlign: "left",
  },
  form: {
    display: "flex",
    flexDirection: "column",
    gap: "1.25rem",
  },
  formLabel: {
    fontWeight: "bold",
    marginBottom: "0.3rem",
    fontSize: "0.9rem",
    color: "#333",
    display: "block",
  },
  formInput: {
    padding: "0.75rem",
    borderRadius: "4px",
    border: "1px solid #ddd",
    fontSize: "1rem",
    width: "100%",
    boxSizing: "border-box",
    transition: "border-color 0.2s ease",
  },
  formButton: {
    padding: "0.75rem 1rem",
    borderRadius: "4px",
    border: "none",
    fontSize: "1rem",
    fontWeight: "bold",
    cursor: "pointer",
    backgroundColor: "#28a745",
    color: "white",
    transition: "background-color 0.2s ease",
    marginTop: "0.5rem",
    minHeight: "44px",
  },
  formError: {
    color: "#dc3545",
    backgroundColor: "rgba(220, 53, 69, 0.1)",
    border: "1px solid rgba(220, 53, 69, 0.2)",
    padding: "0.75rem",
    borderRadius: "4px",
    marginBottom: "1.25rem",
    textAlign: "center",
    fontSize: "0.9em",
  },
  starRatingContainer: {
    display: "flex",
    justifyContent: "flex-start",
    alignItems: "center",
    margin: "0.3rem 0",
    gap: "0.125rem",
  },
  star: {
    fontSize: "1.5rem",
    color: "#e4e5e9",
    cursor: "pointer",
    transition: "color 0.2s ease-in-out",
    minWidth: "24px",
    minHeight: "24px",
    display: "flex",
    alignItems: "center",
    justifyContent: "center",
  },
  formCancelLink: {
    display: "inline-block",
    marginTop: "1.25rem",
    color: "#0070f3",
    textDecoration: "none",
    textAlign: "center",
    width: "100%",
    padding: "0.5rem",
  },
  imagePreview: {
    marginTop: "0.75rem",
    textAlign: "center",
    width: "100%",
  },
};

export default function AddWcPage() {
  const [name, setName] = useState("");
  const [address, setAddress] = useState("");
  const [location, setLocation] = useState(""); // Will store coordinates
  // State for image handling
  const [selectedFile, setSelectedFile] = useState(null);
  const [imagePreview, setImagePreview] = useState(null);
  const [rating, setRating] = useState(5); // Default to 5 stars (1-10 scale)
  const [hoverRating, setHoverRating] = useState(0);
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);
  const [geocoding, setGeocoding] = useState(false);
  const [gettingLocation, setGettingLocation] = useState(false);

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

  // Auto-detect user's current location when page loads
  useEffect(() => {
    if (sessionStatus === "authenticated" && !address && !location) {
      getCurrentLocation();
    }
  }, [sessionStatus, address, location]);

  // Function to get current location and reverse geocode to address
  const getCurrentLocation = () => {
    if (!navigator.geolocation) {
      return;
    }

    setGettingLocation(true);

    navigator.geolocation.getCurrentPosition(
      async (position) => {
        const { latitude, longitude } = position.coords;
        const coordinates = `${latitude},${longitude}`;
        setLocation(coordinates);

        // Reverse geocode to get address
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

              setAddress(fullAddress);
            }
          }
        } catch (error) {
          console.error("Reverse geocoding error:", error);
        }

        setGettingLocation(false);
      },
      (error) => {
        console.error("Geolocation error:", error);
        setGettingLocation(false);
      },
      {
        enableHighAccuracy: true,
        timeout: 10000,
        maximumAge: 300000, // 5 minutes
      },
    );
  };

  // Function to geocode address to coordinates
  const geocodeAddress = async (addressText) => {
    if (!addressText.trim()) return null;

    try {
      const response = await fetch(
        `https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(addressText)}&limit=1&addressdetails=1`,
      );

      if (response.ok) {
        const data = await response.json();
        if (data && data.length > 0) {
          const result = data[0];
          return `${result.lat},${result.lon}`;
        }
      }
    } catch (error) {
      console.error("Geocoding error:", error);
    }
    return null;
  };

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

    // Geocode address to coordinates if address is provided
    let coordinates = location; // Use existing location if provided
    if (address.trim() && !coordinates) {
      setGeocoding(true);
      coordinates = await geocodeAddress(address.trim());
      setGeocoding(false);
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
        address: address.trim() || null,
        location: coordinates || location.trim() || null,
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
    <div style={styles.formContainer}>
      <div style={styles.formCard}>
        <h2
          style={{ marginBottom: "25px", color: "#333", textAlign: "center" }}
        >
          Add New WC
        </h2>
        {gettingLocation && (
          <div
            style={{
              backgroundColor: "#e3f2fd",
              border: "1px solid #2196F3",
              borderRadius: "4px",
              padding: "12px",
              marginBottom: "20px",
              textAlign: "center",
              color: "#1976D2",
              fontSize: "0.9rem",
            }}
          >
            📍 Automatycznie wykrywamy Twoją bieżącą lokalizację...
          </div>
        )}
        {!gettingLocation && address && (
          <div
            style={{
              backgroundColor: "#e8f5e8",
              border: "1px solid #4CAF50",
              borderRadius: "4px",
              padding: "12px",
              marginBottom: "20px",
              textAlign: "center",
              color: "#2E7D32",
              fontSize: "0.9rem",
            }}
          >
            ✓ Lokalizacja została automatycznie wykryta. Możesz ją edytować w
            razie potrzeby.
          </div>
        )}
        {error && <p style={styles.formError}>{error}</p>}

        <form onSubmit={handleSubmit} style={styles.form}>
          <div>
            <label htmlFor="name" style={styles.formLabel}>
              Name*
            </label>
            <input
              id="name"
              name="name"
              type="text"
              value={name}
              onChange={(e) => setName(e.target.value)}
              required
              style={styles.formInput}
              placeholder="e.g., Central Park Restroom"
              disabled={loading}
            />
          </div>

          <div>
            <label htmlFor="address" style={styles.formLabel}>
              Address*
            </label>
            <input
              id="address"
              name="address"
              type="text"
              value={address}
              onChange={(e) => setAddress(e.target.value)}
              style={styles.formInput}
              placeholder="e.g., ul. Marszałkowska 1, Warszawa"
              disabled={loading || geocoding || gettingLocation}
              required
            />
            {gettingLocation && (
              <p
                style={{
                  fontSize: "0.8rem",
                  color: "#2196F3",
                  marginTop: "0.25rem",
                }}
              >
                📍 Pobieranie bieżącej lokalizacji...
              </p>
            )}
            {geocoding && (
              <p
                style={{
                  fontSize: "0.8rem",
                  color: "#666",
                  marginTop: "0.25rem",
                }}
              >
                📍 Pobieranie współrzędnych...
              </p>
            )}
            {!gettingLocation && !geocoding && address && (
              <div
                style={{
                  display: "flex",
                  justifyContent: "space-between",
                  alignItems: "center",
                  marginTop: "0.25rem",
                }}
              >
                <p
                  style={{
                    fontSize: "0.75rem",
                    color: "#4CAF50",
                    margin: 0,
                  }}
                >
                  ✓ Lokalizacja automatycznie wykryta
                </p>
                <button
                  type="button"
                  onClick={getCurrentLocation}
                  disabled={gettingLocation}
                  style={{
                    padding: "4px 8px",
                    fontSize: "0.7rem",
                    backgroundColor: "#2196F3",
                    color: "white",
                    border: "none",
                    borderRadius: "3px",
                    cursor: "pointer",
                  }}
                >
                  🔄 Odśwież
                </button>
              </div>
            )}
          </div>

          <div>
            <label htmlFor="location" style={styles.formLabel}>
              Coordinates
            </label>
            <input
              id="location"
              name="location"
              type="text"
              value={location}
              onChange={(e) => setLocation(e.target.value)}
              style={styles.formInput}
              placeholder="e.g., 52.2297,21.0122 (will be auto-filled from address)"
              disabled={loading || gettingLocation}
            />
            <p
              style={{
                fontSize: "0.75rem",
                color: "#666",
                marginTop: "0.25rem",
              }}
            >
              Współrzędne będą automatycznie pobrane z podanego adresu
            </p>
          </div>

          <div>
            <label htmlFor="imageFile" style={styles.formLabel}>
              Image (Optional)
            </label>
            <input
              id="imageFile"
              name="imageFile"
              type="file"
              accept="image/*"
              capture="environment" // "user" for front camera, "environment" for back
              onChange={handleFileChange}
              style={{ ...styles.formInput, padding: "8px" }} // Adjust padding for file input aesthetics
              disabled={loading}
            />
            {imagePreview && (
              <div style={styles.imagePreview}>
                <img
                  src={imagePreview}
                  alt="Selected image preview"
                  style={{ width: "100%" }}
                />
              </div>
            )}
          </div>

          <div>
            <label htmlFor="rating" style={styles.formLabel}>
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

          <button
            type="submit"
            style={styles.formButton}
            disabled={loading || geocoding || gettingLocation}
          >
            {gettingLocation
              ? "Pobieranie lokalizacji..."
              : geocoding
                ? "Pobieranie współrzędnych..."
                : loading
                  ? "Adding WC..."
                  : "Add WC"}
          </button>
        </form>
        <Link href="/" style={styles.formCancelLink}>
          Cancel
        </Link>
      </div>
    </div>
  );
}
