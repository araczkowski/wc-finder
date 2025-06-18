"use client";

import { useState, useEffect, useMemo } from "react";
import { useSession } from "next-auth/react";
import { useRouter, useParams } from "next/navigation";
import { createClient } from "@supabase/supabase-js";
import Link from "next/link";
import Image from "next/image"; // For <Image> component

// Styles moved to globals.css for better responsiveness
const styles = {
  submitButton: {
    backgroundColor: "#007bff", // Blue for update
  },
  removeImageButton: {
    backgroundColor: "#dc3545", // Red for remove
    fontSize: "0.9rem",
    padding: "8px 12px",
    width: "auto", // Fit content
    marginRight: "10px", // Space from cancel image change button
  },
  cancelImageChangeButton: {
    backgroundColor: "#6c757d", // Grey for cancel
    fontSize: "0.9rem",
    padding: "8px 12px",
    width: "auto",
  },
  imageActionsContainer: {
    marginTop: "5px",
    display: "flex",
    gap: "10px",
  },
  loadingMessage: {
    textAlign: "center",
    fontSize: "1.2rem",
    color: "#555",
    padding: "50px",
  },
  imagePreview: {
    maxWidth: "100%",
    maxHeight: "250px", // Max height for preview
    borderRadius: "4px",
    border: "1px solid #ddd",
    objectFit: "contain", // Ensure aspect ratio is maintained
  },
};

export default function EditWcPage() {
  const router = useRouter();
  const params = useParams();
  const wcId = params?.id;

  const { data: session, status: sessionStatus } = useSession();

  const [name, setName] = useState("");
  const [location, setLocation] = useState("");
  const [currentImageUrl, setCurrentImageUrl] = useState(null); // URL of the image when page loads
  const [selectedFile, setSelectedFile] = useState(null); // New file selected by user
  const [imagePreview, setImagePreview] = useState(null); // URL for preview (blob or currentImageUrl)
  const [wantsToRemoveImage, setWantsToRemoveImage] = useState(false); // Flag if user wants to remove existing image
  const [rating, setRating] = useState(0);
  const [hoverRating, setHoverRating] = useState(0);
  const [originalWcData, setOriginalWcData] = useState(null); // To store fetched WC data
  const [error, setError] = useState("");
  const [formLoading, setFormLoading] = useState(false); // For form submission
  const [pageLoading, setPageLoading] = useState(true); // For initial data fetch
  const [isOwner, setIsOwner] = useState(false); // Check if current user is the owner

  const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

  const supabase = useMemo(() => {
    if (supabaseUrl && supabaseAnonKey) {
      return createClient(supabaseUrl, supabaseAnonKey);
    }
    console.warn(
      "Supabase URL or Anon Key is missing for EditWcPage. Check .env.local",
    );
    return null;
  }, [supabaseUrl, supabaseAnonKey]);

  // Effect for authentication & redirect
  useEffect(() => {
    if (sessionStatus === "loading") return;
    if (sessionStatus === "unauthenticated") {
      router.push(`/auth/signin?callbackUrl=/wc/edit/${wcId}`);
    }
  }, [sessionStatus, router, wcId]);

  // Effect for fetching WC data
  useEffect(() => {
    const fetchWcData = async () => {
      if (
        !wcId ||
        !supabase ||
        sessionStatus !== "authenticated" ||
        !session?.user?.id
      ) {
        setPageLoading(sessionStatus === "loading");
        if (sessionStatus === "authenticated" && !wcId)
          setError("WC ID missing.");
        if (sessionStatus === "authenticated" && !supabase)
          setError("Supabase client not configured.");
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

        if (fetchError) throw fetchError;
        if (!fetchedWc) {
          setError("WC not found.");
          setPageLoading(false);
          return;
        }
        // Allow all authenticated users to view any WC, but only owners can edit
        setIsOwner(fetchedWc.user_id === session.user.id);

        setOriginalWcData(fetchedWc);
        setName(fetchedWc.name || "");
        setLocation(fetchedWc.location || "");
        setCurrentImageUrl(fetchedWc.image_url || null);
        setImagePreview(fetchedWc.image_url || null);
        setRating(fetchedWc.rating || 0);
      } catch (err) {
        console.error("Error fetching WC data for edit:", err);
        setError(`Failed to load WC details: ${err.message}`);
      } finally {
        setPageLoading(false);
      }
    };

    if (sessionStatus === "authenticated") {
      fetchWcData();
    }
  }, [wcId, supabase, sessionStatus, session?.user?.id]); // Re-run if user changes

  const handleFileChange = (event) => {
    const file = event.target.files[0];
    if (file) {
      setSelectedFile(file);
      setWantsToRemoveImage(false); // If a new file is selected, user doesn't want to "just remove"
      const objectUrl = URL.createObjectURL(file);
      setImagePreview(objectUrl);
    } else {
      // File selection cancelled
      setSelectedFile(null);
      setImagePreview(currentImageUrl); // Revert preview to current image
    }
  };

  const handleRemoveImageClick = () => {
    setWantsToRemoveImage(true);
    setSelectedFile(null); // Clear any selected file
    setImagePreview(null); // No preview if image is to be removed
    const fileInput = document.getElementById("imageFile");
    if (fileInput) fileInput.value = ""; // Reset the file input field
  };

  const handleCancelImageChange = () => {
    setSelectedFile(null);
    setImagePreview(currentImageUrl); // Revert preview to the original image URL
    setWantsToRemoveImage(false);
    const fileInput = document.getElementById("imageFile");
    if (fileInput) fileInput.value = ""; // Reset the file input field
  };

  // Cleanup for imagePreview Object URL
  useEffect(() => {
    return () => {
      if (imagePreview && imagePreview.startsWith("blob:")) {
        URL.revokeObjectURL(imagePreview);
      }
    };
  }, [imagePreview]);

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError("");
    setFormLoading(true);

    if (!session?.user?.id || !originalWcData) {
      setError("Authentication error or data missing. Cannot update.");
      setFormLoading(false);
      return;
    }
    if (!name.trim()) {
      setError("Name is required.");
      setFormLoading(false);
      return;
    }

    // The client will send image modification instructions and data.
    // The API route will handle the actual Supabase Storage interactions.
    const payload = {
      name: name.trim(),
      location: location.trim() || null,
      rating: rating > 0 ? parseInt(rating, 10) : null,
      // Information for the backend to handle image logic:
      current_image_url_on_client: currentImageUrl, // The URL of the image at the start of editing
      remove_image: wantsToRemoveImage,
    };

    const formData = new FormData();
    formData.append("jsonData", JSON.stringify(payload));
    if (selectedFile) {
      // If a new file was selected for upload
      formData.append("imageFile", selectedFile);
    }

    try {
      const response = await fetch(`/api/wcs/${wcId}`, {
        method: "PUT",
        body: formData, // Using FormData, so browser sets Content-Type to multipart/form-data
      });

      const result = await response.json();
      if (!response.ok) {
        throw new Error(result.message || "Failed to update WC.");
      }

      router.push("/?status=wc_updated");
      router.refresh();
    } catch (err) {
      console.error("Client-side error updating WC:", err);
      setError(err.message || "An unexpected error occurred during update.");
    } finally {
      setFormLoading(false);
    }
  };

  if (pageLoading || sessionStatus === "loading") {
    return <div style={styles.loadingMessage}>Loading WC Details...</div>;
  }
  if (sessionStatus === "unauthenticated") {
    return <div style={styles.loadingMessage}>Redirecting to sign in...</div>;
  }
  if (error && !originalWcData) {
    return (
      <div className="form-container">
        <div className="form-card">
          <p className="form-message form-error">{error}</p>
          <Link href="/" className="form-cancel-link">
            Back to Home
          </Link>
        </div>
      </div>
    );
  }
  if (!originalWcData) {
    return (
      <div className="form-container">
        <div className="form-card">
          <p style={styles.loadingMessage}>
            WC data not found or you are not authorized.
          </p>
          <Link href="/" className="form-cancel-link">
            Back to Home
          </Link>
        </div>
      </div>
    );
  }

  return (
    <div className="form-container">
      <div className="form-card">
        <h2
          style={{ marginBottom: "25px", color: "#333", textAlign: "center" }}
        >
          {isOwner ? "Edit WC" : "View WC"}: {originalWcData.name}
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
              disabled={formLoading}
              readOnly={!isOwner}
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
              disabled={formLoading}
              readOnly={!isOwner}
            />
          </div>
          <div>
            <label htmlFor="imageFile" className="form-label">
              Image
            </label>
            {imagePreview && !wantsToRemoveImage && (
              <div className="image-preview">
                <Image
                  src={imagePreview}
                  alt="WC Preview"
                  width={200}
                  height={200}
                  style={styles.imagePreview}
                />
              </div>
            )}
            {wantsToRemoveImage && (
              <p
                style={{
                  textAlign: "center",
                  fontStyle: "italic",
                  color: "#777",
                }}
              >
                Image will be removed.
              </p>
            )}
            <input
              id="imageFile"
              name="imageFile"
              type="file"
              accept="image/*"
              capture="environment"
              onChange={handleFileChange}
              className="form-input"
              style={{ padding: "8px" }}
              disabled={formLoading || !isOwner}
            />
            {isOwner && (
              <div style={styles.imageActionsContainer}>
                {currentImageUrl && !wantsToRemoveImage && !selectedFile && (
                  <button
                    type="button"
                    onClick={handleRemoveImageClick}
                    className="form-button"
                    style={styles.removeImageButton}
                    disabled={formLoading}
                  >
                    Remove Current Image
                  </button>
                )}
                {selectedFile && (
                  <button
                    type="button"
                    onClick={handleCancelImageChange}
                    className="form-button"
                    style={styles.cancelImageChangeButton}
                    disabled={formLoading}
                  >
                    Cancel Image Change
                  </button>
                )}
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
                    onClick={() =>
                      !formLoading && isOwner && setRating(starValue)
                    }
                    onMouseEnter={() =>
                      !formLoading && isOwner && setHoverRating(starValue)
                    }
                    onMouseLeave={() =>
                      !formLoading && isOwner && setHoverRating(0)
                    }
                    role="button"
                    tabIndex={formLoading || !isOwner ? -1 : 0}
                    onKeyDown={(e) => {
                      if (
                        !formLoading &&
                        isOwner &&
                        (e.key === "Enter" || e.key === " ")
                      )
                        setRating(starValue);
                    }}
                    aria-label={`Rate ${starValue} out of 10 stars`}
                    aria-disabled={formLoading || !isOwner}
                    style={{
                      cursor: isOwner ? "pointer" : "default",
                    }}
                  >
                    ★
                  </span>
                );
              })}
            </div>
          </div>
          {isOwner && (
            <button
              type="submit"
              className="form-button"
              style={styles.submitButton}
              disabled={formLoading || !supabase}
            >
              {formLoading ? "Updating..." : "Update WC"}
            </button>
          )}
        </form>
        <Link href="/" className="form-cancel-link">
          Cancel
        </Link>
      </div>
    </div>
  );
}
