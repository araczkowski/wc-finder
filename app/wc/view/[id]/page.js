"use client";

import { useState, useEffect, useMemo, useCallback, useRef } from "react";

// Simple debounce function
const debounce = (func, delay) => {
  let timeoutId;
  return (...args) => {
    clearTimeout(timeoutId);
    timeoutId = setTimeout(() => func.apply(null, args), delay);
  };
};

import { useSession, signOut } from "next-auth/react";
import { useRouter, useParams } from "next/navigation";
import { createClient } from "@supabase/supabase-js";
import Link from "next/link";
import Image from "next/image";
import {
  optimizeImage,
  optimizeImages,
  validateImageFile,
  WC_GALLERY_CONFIG,
} from "../../../utils/imageOptimizer";
import { getPlaceTypeLabel } from "../../../utils/placeTypes";
import { pl } from "../../../locales/pl";
import PlaceTypeDisplay from "../../../components/PlaceTypeDisplay";
import WCTags from "../../../components/WCTags";
import { CircleChevronLeft, Camera, X, Image as ImageIcon } from "lucide-react";
import PhotoGallery from "../../../components/PhotoGallery";

const styles = {
  loadingMessage: {
    textAlign: "center",
    fontSize: "1.2rem",
    color: "#555",
    padding: "50px",
  },
  backButton: {
    position: "absolute",
    top: "20px",
    left: "20px",
    backgroundColor: "#6c757d",
    color: "white",
    border: "none",
    borderRadius: "50%",
    width: "40px",
    height: "40px",
    display: "flex",
    alignItems: "center",
    justifyContent: "center",
    cursor: "pointer",
    fontSize: "1em",
    textDecoration: "none",
    zIndex: "1000",
  },
  editButton: {
    position: "absolute",
    top: "20px",
    right: "20px",
    backgroundColor: "#007bff",
    color: "white",
    border: "none",
    borderRadius: "20px",
    padding: "8px 16px",
    fontSize: "0.9em",
    textDecoration: "none",
    cursor: "pointer",
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
    position: "relative",
  },
  form: {
    display: "flex",
    flexDirection: "column",
    gap: "1.25rem",
  },
  formLabel: {
    fontWeight: "bold",
    marginBottom: "0.5rem",
    fontSize: "0.9rem",
    color: "#333",
    display: "block",
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
  viewText: {
    padding: "12px 0",
    fontSize: "16px",
    color: "#333",
    fontWeight: "500",
    borderBottom: "1px solid #f0f0f0",
    minHeight: "20px",
  },
  viewTextEmpty: {
    padding: "12px 0",
    fontSize: "16px",
    color: "#777",
    fontStyle: "italic",
    borderBottom: "1px solid #f0f0f0",
    minHeight: "20px",
  },
  imagePreview: {
    maxWidth: "100%",
    maxHeight: "300px",
    borderRadius: "8px",
    border: "1px solid #ddd",
    objectFit: "contain",
    marginTop: "10px",
  },
  starRatingContainer: {
    display: "flex",
    justifyContent: "flex-start",
    alignItems: "center",
    margin: "0.5rem 0",
    gap: "0.125rem",
  },
  star: {
    fontSize: "1.5rem",
    color: "#e4e5e9",
    transition: "color 0.2s ease-in-out",
    minWidth: "24px",
    minHeight: "24px",
    display: "flex",
    alignItems: "center",
    justifyContent: "center",
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
  formInput: {
    padding: "0.75rem",
    borderRadius: "4px",
    border: "1px solid #ddd",
    fontSize: "1rem",
    width: "100%",
    boxSizing: "border-box",
    transition: "border-color 0.2s ease",
  },
  photoGallery: {
    display: "grid",
    gridTemplateColumns: "repeat(auto-fill, minmax(200px, 1fr))",
    gap: "15px",
    marginBottom: "1rem",
  },
  photoCard: {
    position: "relative",
    borderRadius: "8px",
    overflow: "hidden",
    border: "1px solid #ddd",
    backgroundColor: "#f8f9fa",
    transition: "transform 0.2s ease, box-shadow 0.2s ease",
  },
  photoImage: {
    width: "100%",
    height: "200px",
    objectFit: "cover",
    display: "block",
  },
  photoInfo: {
    padding: "8px",
    fontSize: "0.8rem",
    color: "#666",
  },
  deletePhotoButton: {
    marginTop: "5px",
    padding: "2px 6px",
    fontSize: "0.7rem",
    backgroundColor: "#dc3545",
    color: "white",
    border: "none",
    borderRadius: "3px",
    cursor: "pointer",
  },
  photoButton: {
    padding: "0.75rem 1rem",
    borderRadius: "4px",
    border: "2px solid #007bff",
    fontSize: "1rem",
    fontWeight: "bold",
    cursor: "pointer",
    backgroundColor: "#007bff",
    color: "white",
    transition: "all 0.2s ease",
    marginTop: "0.5rem",
    minHeight: "44px",
    display: "flex",
    alignItems: "center",
    justifyContent: "center",
    gap: "0.5rem",
    width: "100%",
    boxSizing: "border-box",
  },
  hiddenFileInput: {
    display: "none",
  },
};

export default function ViewWcPage() {
  const router = useRouter();
  const params = useParams();
  const wcId = params?.id;

  const { data: session, status: sessionStatus } = useSession();

  const [wcData, setWcData] = useState(null);
  const [error, setError] = useState("");
  const [pageLoading, setPageLoading] = useState(true);
  const [isOwner, setIsOwner] = useState(false);

  // User rating state
  const [userRating, setUserRating] = useState(0);
  const [userComment, setUserComment] = useState("");
  const [userHoverRating, setUserHoverRating] = useState(0);
  const [hasUserRating, setHasUserRating] = useState(false);
  const [ratingLoading, setRatingLoading] = useState(false);
  const [ratingError, setRatingError] = useState("");
  const [allRatings, setAllRatings] = useState([]);
  const [averageRating, setAverageRating] = useState(0);

  // Photo states
  const [wcPhotos, setWcPhotos] = useState([]);
  const [photosLoading, setPhotosLoading] = useState(false);
  const [photoUploadLoading, setPhotoUploadLoading] = useState(false);
  const [photoError, setPhotoError] = useState("");
  const [photoOptimizing, setPhotoOptimizing] = useState(false);
  const [optimizationInfo, setOptimizationInfo] = useState(null);
  const [showSourceSelector, setShowSourceSelector] = useState(false);
  const [isMobile, setIsMobile] = useState(false);

  // Gallery states
  const [galleryOpen, setGalleryOpen] = useState(false);
  const [galleryImages, setGalleryImages] = useState([]);
  const [galleryInitialIndex, setGalleryInitialIndex] = useState(0);

  const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

  const supabase = useMemo(() => {
    if (supabaseUrl && supabaseAnonKey) {
      return createClient(supabaseUrl, supabaseAnonKey);
    }
    console.warn("Supabase URL or Anon Key is missing for ViewWcPage.");
    return null;
  }, [supabaseUrl, supabaseAnonKey]);

  // Check if device is mobile
  const checkIsMobile = () => {
    if (typeof window === "undefined") return false;
    return (
      /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(
        navigator.userAgent,
      ) ||
      (window.innerWidth <= 768 && "ontouchstart" in window)
    );
  };

  // Set mobile state on component mount
  useEffect(() => {
    setIsMobile(checkIsMobile());
  }, []);

  const fetchWcPhotos = useCallback(async () => {
    if (!wcId) return;

    setPhotosLoading(true);
    try {
      const response = await fetch(`/api/wc-photos?wc_id=${wcId}`);
      const result = await response.json();

      if (response.ok) {
        const photosWithUsers = await Promise.all(
          (result.photos || []).map(async (photo) => {
            if (photo.user_id === session?.user?.id) {
              return { ...photo, user_email: session.user.email };
            }
            return { ...photo, user_email: "User" };
          }),
        );
        setWcPhotos(photosWithUsers);
      } else {
        console.error("Error fetching WC photos:", result.error);
      }
    } catch (err) {
      console.error("Error fetching WC photos:", err);
    } finally {
      setPhotosLoading(false);
    }
  }, [wcId, session?.user?.id, session?.user?.email]);

  const fetchUserRating = useCallback(async () => {
    if (!wcId || !session?.user?.id) return;

    try {
      const response = await fetch(
        `/api/wc-ratings?wc_id=${wcId}&user_id=${session.user.id}`,
      );
      const result = await response.json();

      if (response.ok && result.rating) {
        setUserRating(result.rating.rating);
        setUserComment(result.rating.comment || "");
        setHasUserRating(true);
      }
    } catch (err) {
      console.error("Error fetching user rating:", err);
    }
  }, [wcId, session?.user?.id]);

  const fetchAllRatings = useCallback(async () => {
    if (!wcId) return;

    try {
      const response = await fetch(`/api/wc-ratings?wc_id=${wcId}`);
      const result = await response.json();

      if (response.ok) {
        setAllRatings(result.ratings || []);
        setAverageRating(result.averageRating || 0);
      }
    } catch (err) {
      console.error("Error fetching ratings:", err);
    }
  }, [wcId]);

  // Effect for fetching WC data
  useEffect(() => {
    const fetchWcData = async () => {
      if (!wcId || !supabase) {
        setPageLoading(false);
        if (!wcId) setError("WC ID missing.");
        if (!supabase) setError("Supabase client not configured.");
        return;
      }

      try {
        setPageLoading(true);
        setError("");

        const { data: wc, error: wcError } = await supabase
          .from("wcs")
          .select("*")
          .eq("id", wcId)
          .single();

        if (wcError) {
          console.error("Error fetching WC:", wcError);
          if (wcError.code === "PGRST116") {
            setError("WC not found.");
          } else {
            setError(`Failed to fetch WC data: ${wcError.message}`);
          }
          return;
        }

        setWcData(wc);
        setIsOwner(session?.user?.id === wc.user_id);

        // Fetch related data
        await Promise.all([
          fetchWcPhotos(),
          fetchUserRating(),
          fetchAllRatings(),
        ]);
      } catch (err) {
        console.error("Unexpected error fetching WC data:", err);
        setError("An unexpected error occurred.");
      } finally {
        setPageLoading(false);
      }
    };

    if (sessionStatus !== "loading") {
      fetchWcData();
    }
  }, [
    wcId,
    supabase,
    session?.user?.id,
    sessionStatus,
    fetchWcPhotos,
    fetchUserRating,
    fetchAllRatings,
  ]);

  const handleAutoSaveRating = async (rating, comment) => {
    if (!rating || rating < 1 || rating > 5) {
      return;
    }

    setRatingError("");
    setRatingLoading(true);

    if (sessionStatus !== "authenticated") {
      setRatingError("You must be logged in to rate.");
      setRatingLoading(false);
      return;
    }

    try {
      const response = await fetch("/api/wc-ratings", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          wc_id: wcId,
          rating: rating,
          comment: comment?.trim() || null,
        }),
      });

      const result = await response.json();
      if (!response.ok) {
        throw new Error(result.error || "Failed to save rating.");
      }

      setHasUserRating(true);
      await fetchAllRatings();
    } catch (err) {
      console.error("Error saving rating:", err);
      setRatingError(err.message || "Failed to save rating.");
    } finally {
      setRatingLoading(false);
    }
  };

  // Debounced version for comment changes using useRef
  const debounceTimeoutRef = useRef(null);

  const handleAutoSaveRatingDebounced = (rating, comment) => {
    if (debounceTimeoutRef.current) {
      clearTimeout(debounceTimeoutRef.current);
    }
    debounceTimeoutRef.current = setTimeout(() => {
      if (rating && rating >= 1 && rating <= 5) {
        handleAutoSaveRating(rating, comment);
      }
    }, 1000);
  };

  const handlePhotoSelection = async (event) => {
    const files = Array.from(event.target.files);

    if (files.length === 0) {
      setPhotoError("");
      setOptimizationInfo(null);
      return;
    }

    setPhotoUploadLoading(true);
    setPhotoOptimizing(true);
    setPhotoError("");
    setOptimizationInfo(null);

    try {
      console.log("[ViewWC] Validating and optimizing photos...");

      // Validate all files first
      const validationErrors = [];
      files.forEach((file, index) => {
        const validation = validateImageFile(file);
        if (!validation.isValid) {
          validationErrors.push(
            `Zdjęcie ${index + 1}: ${validation.errors.join(", ")}`,
          );
        }
      });

      if (validationErrors.length > 0) {
        setPhotoError(
          `Walidacja zdjęć nie powiodła się: ${validationErrors.join("; ")}`,
        );
        event.target.value = ""; // Clear the input
        setPhotoOptimizing(false);
        setPhotoUploadLoading(false);
        return;
      }

      // Calculate original total size
      const originalTotalSize = files.reduce((sum, file) => sum + file.size, 0);

      // Optimize all images for gallery
      const optimizedFiles = await optimizeImages(files, WC_GALLERY_CONFIG);

      // Calculate optimization results
      const optimizedTotalSize = optimizedFiles.reduce(
        (sum, file) => sum + file.size,
        0,
      );
      const compressionRatio = (
        (1 - optimizedTotalSize / originalTotalSize) *
        100
      ).toFixed(1);

      const optimizationResult = {
        originalSize: formatFileSize(originalTotalSize),
        optimizedSize: formatFileSize(optimizedTotalSize),
        compressionRatio: compressionRatio + "%",
        saved: formatFileSize(originalTotalSize - optimizedTotalSize),
        count: optimizedFiles.length,
      };

      setOptimizationInfo(optimizationResult);
      setPhotoOptimizing(false);

      console.log(
        "[ViewWC] Optymalizacja zdjęć zakończona dla",
        optimizedFiles.length,
        "zdjęć, rozpoczynanie uploadu...",
      );

      // Upload photos automatically
      const uploadPromises = optimizedFiles.map(async (file) => {
        const formData = new FormData();
        formData.append("wc_id", wcId);
        formData.append("photo", file);

        const response = await fetch("/api/wc-photos", {
          method: "POST",
          body: formData,
        });

        const result = await response.json();
        if (!response.ok) {
          throw new Error(result.error || "Failed to upload photo");
        }
        return result;
      });

      await Promise.all(uploadPromises);

      // Clear the input and refresh the gallery
      event.target.value = "";
      await fetchWcPhotos();

      console.log("[ViewWC] Zdjęcia zostały pomyślnie przesłane");
    } catch (error) {
      console.error("[ViewWC] Przesyłanie zdjęć nie powiodło się:", error);
      setPhotoError(`Przesyłanie zdjęć nie powiodło się: ${error.message}`);
      event.target.value = ""; // Clear the input
    } finally {
      setPhotoOptimizing(false);
      setPhotoUploadLoading(false);
    }
  };

  // Helper function to format file size
  const formatFileSize = (bytes) => {
    if (bytes === 0) return "0 Bytes";
    const k = 1024;
    const sizes = ["Bytes", "KB", "MB", "GB"];
    const i = Math.floor(Math.log(bytes) / Math.log(k));
    return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + " " + sizes[i];
  };

  const handleDeletePhoto = async (photoId) => {
    if (!confirm("Are you sure you want to delete this photo?")) return;

    try {
      const response = await fetch(`/api/wc-photos/${photoId}`, {
        method: "DELETE",
      });

      const result = await response.json();
      if (!response.ok) {
        throw new Error(result.error || "Failed to delete photo");
      }

      await fetchWcPhotos();
    } catch (err) {
      console.error("Error deleting photo:", err);
      setPhotoError(err.message || "Failed to delete photo");
    }
  };

  // Gallery functions
  const openGallery = (images, initialIndex = 0) => {
    setGalleryImages(images);
    setGalleryInitialIndex(initialIndex);
    setGalleryOpen(true);
  };

  // Combined gallery function for all images
  const openCombinedGallery = (sourceType, sourceIndex = 0) => {
    const allImages = [];
    let targetIndex = 0;

    // Add main WC image if exists
    if (wcData.image_url) {
      allImages.push({
        image_url: wcData.image_url,
        url: wcData.image_url,
        alt: `${wcData.name} - główne zdjęcie`,
        source: "main",
      });
    }

    // Add user photos
    if (wcPhotos.length > 0) {
      wcPhotos.forEach((photo, index) => {
        allImages.push({
          ...photo,
          url: photo.photo,
          alt: `Zdjęcie dodane przez ${photo.user_email || "Anonim"}`,
          source: "user",
        });
      });
    }

    // Calculate target index based on source
    if (sourceType === "main") {
      targetIndex = 0;
    } else if (sourceType === "user") {
      targetIndex = (wcData.image_url ? 1 : 0) + sourceIndex;
    }

    setGalleryImages(allImages);
    setGalleryInitialIndex(targetIndex);
    setGalleryOpen(true);
  };

  const closeGallery = () => {
    setGalleryOpen(false);
    setGalleryImages([]);
    setGalleryInitialIndex(0);
  };

  if (pageLoading || sessionStatus === "loading") {
    return <div style={styles.loadingMessage}>Ładowanie szczegółów WC...</div>;
  }

  if (error && !wcData) {
    return (
      <div style={styles.formContainer}>
        <div style={styles.formCard}>
          <p style={styles.formError}>{error}</p>
          <Link href="/" style={{ color: "#007bff", textDecoration: "none" }}>
            Powrót do strony głównej
          </Link>
        </div>
      </div>
    );
  }

  if (!wcData) {
    return (
      <div style={styles.formContainer}>
        <div style={styles.formCard}>
          <p style={styles.loadingMessage}>WC nie zostało znalezione.</p>
          <Link href="/" style={{ color: "#007bff", textDecoration: "none" }}>
            Powrót do strony głównej
          </Link>
        </div>
      </div>
    );
  }

  return (
    <div style={styles.formContainer}>
      <div style={styles.formCard}>
        <Link
          href="/"
          style={styles.backButton}
          title="Powrót do strony głównej"
        >
          <CircleChevronLeft size={24} />
        </Link>
        {isOwner && (
          <Link
            href={`/wc/edit/${wcId}`}
            style={styles.editButton}
            title="Edytuj WC"
          >
            Edytuj
          </Link>
        )}

        <h2
          style={{ marginBottom: "25px", color: "#333", textAlign: "center" }}
        >
          {wcData.name}
        </h2>

        {error && <p style={styles.formError}>{error}</p>}

        <div style={styles.form}>
          <div>
            <label style={styles.formLabel}>Adres</label>
            <div
              style={wcData.address ? styles.viewText : styles.viewTextEmpty}
            >
              {wcData.address || "Nie podano"}
            </div>
          </div>

          <div>
            <label style={styles.formLabel}>{pl.placeType}</label>
            <div style={styles.viewText}>
              <div
                style={{
                  display: "flex",
                  alignItems: "center",
                  gap: "8px",
                  fontSize: "16px",
                  fontWeight: "500",
                  color: "#333",
                }}
              >
                <PlaceTypeDisplay
                  placeType={wcData.place_type || "toilet"}
                  showIcon={true}
                  showText={true}
                  iconSize={18}
                  iconProps={{ style: { color: "#333" } }}
                  textStyle={{ color: "#333" }}
                  className="view-place-type"
                />
              </div>
            </div>
          </div>

          <div>
            <WCTags wcId={wcId} isEditable={true} />
          </div>

          <div>
            <label style={styles.formLabel}>Zdjęcie</label>
            {wcData.image_url ? (
              <div
                style={{
                  marginTop: "10px",
                  cursor: "pointer",
                  transition: "transform 0.2s ease",
                }}
                onClick={() => openCombinedGallery("main", 0)}
                onMouseEnter={(e) => {
                  e.currentTarget.style.transform = "scale(1.02)";
                }}
                onMouseLeave={(e) => {
                  e.currentTarget.style.transform = "scale(1)";
                }}
                title="Kliknij aby otworzyć galerię wszystkich zdjęć"
              >
                <Image
                  src={wcData.image_url}
                  alt="WC"
                  width={300}
                  height={300}
                  style={{
                    ...styles.imagePreview,
                    cursor: "pointer",
                  }}
                />
              </div>
            ) : (
              <div style={styles.viewTextEmpty}>Brak zdjęcia</div>
            )}
          </div>

          <div>
            <label style={styles.formLabel}>
              Ocena użytkownika ({wcData.rating || 0} / 5)
            </label>
            <div style={styles.starRatingContainer}>
              {[...Array(5)].map((_, index) => {
                const starValue = index + 1;
                return (
                  <span
                    key={starValue}
                    style={{
                      ...styles.star,
                      color:
                        starValue <= (wcData.rating || 0)
                          ? "#ffc107"
                          : "#e4e5e9",
                    }}
                  >
                    ★
                  </span>
                );
              })}
            </div>
          </div>
        </div>

        {/* User Rating Section */}
        {sessionStatus === "authenticated" && (
          <div
            style={{
              marginTop: "2rem",
              borderTop: "1px solid #ddd",
              paddingTop: "2rem",
            }}
          >
            {session?.user?.email === "public@sviete.pl" ? (
              <div
                style={{
                  textAlign: "center",
                  padding: "2rem",
                  backgroundColor: "#f8f9fa",
                  borderRadius: "8px",
                  border: "1px solid #dee2e6",
                }}
              >
                <p
                  style={{
                    fontSize: "1.1rem",
                    color: "#333",
                    marginBottom: "1rem",
                  }}
                >
                  Aby dodawać ocenę, komentować i dodawać zdjęcia musisz się{" "}
                  <button
                    onClick={async () => {
                      // Clear session flag from localStorage
                      if (typeof window !== "undefined") {
                        localStorage.removeItem("hasLoggedInThisSession");
                      }
                      // Sign out and redirect to signin page
                      await signOut({ callbackUrl: "/auth/signin" });
                    }}
                    style={{
                      background: "none",
                      border: "none",
                      color: "#007bff",
                      textDecoration: "underline",
                      cursor: "pointer",
                      fontSize: "inherit",
                      padding: 0,
                    }}
                  >
                    zalogować do aplikacji
                  </button>
                </p>
              </div>
            ) : (
              <>
                <h3 style={{ marginBottom: "1rem", color: "#333" }}>
                  Twoja ocena
                </h3>

                {ratingError && <p style={styles.formError}>{ratingError}</p>}

                <div style={styles.form}>
                  <div>
                    <label style={styles.formLabel}>
                      Oceń to WC ({userRating} / 5)
                    </label>
                    <div style={styles.starRatingContainer}>
                      {[...Array(5)].map((_, index) => {
                        const starValue = index + 1;
                        return (
                          <span
                            key={starValue}
                            style={{
                              ...styles.star,
                              color:
                                starValue <= (userHoverRating || userRating)
                                  ? "#ffc107"
                                  : "#e4e5e9",
                              cursor: ratingLoading ? "default" : "pointer",
                            }}
                            onClick={() => {
                              if (!ratingLoading) {
                                setUserRating(starValue);
                                handleAutoSaveRating(starValue, userComment);
                              }
                            }}
                            onMouseEnter={() =>
                              !ratingLoading && setUserHoverRating(starValue)
                            }
                            onMouseLeave={() =>
                              !ratingLoading && setUserHoverRating(0)
                            }
                          >
                            ★
                          </span>
                        );
                      })}
                    </div>
                  </div>

                  <div>
                    <label htmlFor="userComment" style={styles.formLabel}>
                      Komentarz (opcjonalnie)
                    </label>
                    <textarea
                      id="userComment"
                      name="userComment"
                      value={userComment}
                      onChange={(e) => {
                        setUserComment(e.target.value);
                        handleAutoSaveRatingDebounced(
                          userRating,
                          e.target.value,
                        );
                      }}
                      style={{
                        ...styles.formInput,
                        minHeight: "100px",
                        resize: "vertical",
                      }}
                      placeholder="Podziel się swoim doświadczeniem z tym WC..."
                      disabled={ratingLoading}
                    />
                  </div>

                  {/* Photo Upload Section */}
                  <div>
                    <label style={styles.formLabel}>Dodaj zdjęcia</label>
                    <input
                      id="wcPhotosGallery"
                      type="file"
                      multiple
                      accept="image/*"
                      onChange={handlePhotoSelection}
                      style={styles.hiddenFileInput}
                      disabled={photoUploadLoading || photoOptimizing}
                    />
                    <input
                      id="wcPhotosCamera"
                      type="file"
                      multiple
                      accept="image/*"
                      capture="environment"
                      onChange={handlePhotoSelection}
                      style={styles.hiddenFileInput}
                      disabled={photoUploadLoading || photoOptimizing}
                    />
                    <button
                      type="button"
                      onClick={() => {
                        if (isMobile) {
                          setShowSourceSelector(true);
                        } else {
                          document.getElementById("wcPhotosGallery").click();
                        }
                      }}
                      style={{
                        ...styles.photoButton,
                        opacity:
                          photoUploadLoading || photoOptimizing ? 0.6 : 1,
                        cursor:
                          photoUploadLoading || photoOptimizing
                            ? "not-allowed"
                            : "pointer",
                      }}
                      disabled={photoUploadLoading || photoOptimizing}
                    >
                      📷 Dodaj zdjęcia
                    </button>

                    {/* Mobile source selector */}
                    {showSourceSelector && isMobile && (
                      <div
                        style={{
                          position: "fixed",
                          top: "0",
                          left: "0",
                          right: "0",
                          bottom: "0",
                          backgroundColor: "rgba(0, 0, 0, 0.5)",
                          display: "flex",
                          alignItems: "center",
                          justifyContent: "center",
                          zIndex: 1000,
                        }}
                        onClick={() => setShowSourceSelector(false)}
                      >
                        <div
                          style={{
                            backgroundColor: "white",
                            borderRadius: "12px",
                            minWidth: "280px",
                            maxWidth: "90vw",
                            boxShadow: "0 10px 30px rgba(0, 0, 0, 0.3)",
                          }}
                          onClick={(e) => e.stopPropagation()}
                        >
                          <div
                            style={{
                              display: "flex",
                              justifyContent: "space-between",
                              alignItems: "center",
                              padding: "16px 20px",
                              borderBottom: "1px solid #e9ecef",
                            }}
                          >
                            <span
                              style={{
                                fontSize: "16px",
                                fontWeight: "600",
                                color: "#333",
                              }}
                            >
                              Wybierz źródło zdjęć
                            </span>
                            <button
                              onClick={() => setShowSourceSelector(false)}
                              style={{
                                background: "none",
                                border: "none",
                                cursor: "pointer",
                                padding: "4px",
                                color: "#666",
                                borderRadius: "4px",
                              }}
                            >
                              <X size={16} />
                            </button>
                          </div>
                          <div
                            style={{
                              display: "flex",
                              gap: "16px",
                              padding: "24px 20px",
                              justifyContent: "center",
                            }}
                          >
                            <button
                              onClick={() => {
                                document
                                  .getElementById("wcPhotosCamera")
                                  .click();
                                setShowSourceSelector(false);
                              }}
                              style={{
                                display: "flex",
                                flexDirection: "column",
                                alignItems: "center",
                                justifyContent: "center",
                                width: "110px",
                                height: "110px",
                                backgroundColor: "#f8f9fa",
                                border: "2px solid #007bff",
                                borderRadius: "16px",
                                fontSize: "14px",
                                fontWeight: "500",
                                color: "#007bff",
                                cursor: "pointer",
                                transition: "all 0.3s ease",
                                boxShadow: "0 4px 12px rgba(0, 123, 255, 0.15)",
                              }}
                              onMouseEnter={(e) => {
                                e.target.style.backgroundColor = "#007bff";
                                e.target.style.color = "white";
                                e.target.style.transform = "scale(1.05)";
                              }}
                              onMouseLeave={(e) => {
                                e.target.style.backgroundColor = "#f8f9fa";
                                e.target.style.color = "#007bff";
                                e.target.style.transform = "scale(1)";
                              }}
                              disabled={photoUploadLoading || photoOptimizing}
                            >
                              <Camera
                                size={24}
                                style={{ marginBottom: "8px" }}
                              />
                              <span style={{ fontWeight: "600" }}>Aparat</span>
                            </button>
                            <button
                              onClick={() => {
                                document
                                  .getElementById("wcPhotosGallery")
                                  .click();
                                setShowSourceSelector(false);
                              }}
                              style={{
                                display: "flex",
                                flexDirection: "column",
                                alignItems: "center",
                                justifyContent: "center",
                                width: "110px",
                                height: "110px",
                                backgroundColor: "#f8f9fa",
                                border: "2px solid #007bff",
                                borderRadius: "16px",
                                fontSize: "14px",
                                fontWeight: "500",
                                color: "#007bff",
                                cursor: "pointer",
                                transition: "all 0.3s ease",
                                boxShadow: "0 4px 12px rgba(0, 123, 255, 0.15)",
                              }}
                              onMouseEnter={(e) => {
                                e.target.style.backgroundColor = "#007bff";
                                e.target.style.color = "white";
                                e.target.style.transform = "scale(1.05)";
                              }}
                              onMouseLeave={(e) => {
                                e.target.style.backgroundColor = "#f8f9fa";
                                e.target.style.color = "#007bff";
                                e.target.style.transform = "scale(1)";
                              }}
                              disabled={photoUploadLoading || photoOptimizing}
                            >
                              <ImageIcon
                                size={24}
                                style={{ marginBottom: "8px" }}
                              />
                              <span style={{ fontWeight: "600" }}>Galeria</span>
                            </button>
                          </div>
                        </div>
                      </div>
                    )}

                    {photoOptimizing && (
                      <div
                        style={{
                          padding: "10px",
                          backgroundColor: "#e3f2fd",
                          border: "1px solid #2196F3",
                          borderRadius: "4px",
                          marginTop: "10px",
                          fontSize: "0.9rem",
                          color: "#1976d2",
                        }}
                      >
                        🔄 Optymalizowanie zdjęć...
                      </div>
                    )}

                    {optimizationInfo && (
                      <div
                        style={{
                          padding: "10px",
                          backgroundColor: "#e8f5e8",
                          border: "1px solid #4caf50",
                          borderRadius: "4px",
                          marginTop: "10px",
                          fontSize: "0.85rem",
                          color: "#2e7d32",
                        }}
                      >
                        ✅ {optimizationInfo.count} zdjęć zoptymalizowano!
                        <br />
                        📦 Rozmiar: {optimizationInfo.originalSize} →{" "}
                        {optimizationInfo.optimizedSize}
                        <br />
                        💾 Oszczędność: {optimizationInfo.saved} (
                        {optimizationInfo.compressionRatio})
                      </div>
                    )}

                    {photoUploadLoading && (
                      <div style={{ marginTop: "10px", textAlign: "center" }}>
                        <p style={{ color: "#007bff", fontSize: "0.9rem" }}>
                          📤 Przesyłanie zdjęć...
                        </p>
                      </div>
                    )}
                    {photoError && (
                      <p style={{ ...styles.formError, marginTop: "5px" }}>
                        {photoError}
                      </p>
                    )}
                  </div>

                  {ratingLoading && (
                    <div style={{ textAlign: "center", marginBottom: "10px" }}>
                      <p style={{ color: "#007bff", fontSize: "0.9rem" }}>
                        💾{" "}
                        {hasUserRating
                          ? "Aktualizowanie oceny..."
                          : "Zapisywanie oceny..."}
                      </p>
                    </div>
                  )}
                </div>
              </>
            )}
          </div>
        )}

        {/* Photo Gallery Section */}
        <div
          style={{
            marginTop: "2rem",
            borderTop: "1px solid #ddd",
            paddingTop: "2rem",
          }}
        >
          <h3 style={{ marginBottom: "1rem", color: "#333" }}>
            Zdjęcia ({wcPhotos.length})
          </h3>

          {photosLoading ? (
            <p style={{ textAlign: "center", color: "#666" }}>
              Ładowanie zdjęć...
            </p>
          ) : wcPhotos.length > 0 ? (
            <div style={styles.photoGallery}>
              {wcPhotos.map((photo, index) => (
                <div
                  key={photo.id}
                  style={styles.photoCard}
                  onClick={() => openCombinedGallery("user", index)}
                  title="Kliknij aby otworzyć galerię wszystkich zdjęć"
                >
                  <Image
                    src={photo.photo}
                    alt="WC Photo"
                    width={200}
                    height={200}
                    style={{
                      ...styles.photoImage,
                      cursor: "pointer",
                      transition: "transform 0.2s ease",
                    }}
                    onMouseEnter={(e) => {
                      e.currentTarget.style.transform = "scale(1.05)";
                    }}
                    onMouseLeave={(e) => {
                      e.currentTarget.style.transform = "scale(1)";
                    }}
                  />
                  <div style={styles.photoInfo}>
                    <div>Dodane przez: {photo.user_email || "Anonim"}</div>
                    <div>{new Date(photo.created_at).toLocaleDateString()}</div>
                    {photo.user_id === session?.user?.id && (
                      <button
                        onClick={(e) => {
                          e.stopPropagation();
                          handleDeletePhoto(photo.id);
                        }}
                        style={styles.deletePhotoButton}
                      >
                        Usuń
                      </button>
                    )}
                  </div>
                </div>
              ))}
            </div>
          ) : (
            <p
              style={{
                textAlign: "center",
                color: "#666",
                fontStyle: "italic",
              }}
            >
              Brak zdjęć. Bądź pierwszą osobą, która doda zdjęcie!
            </p>
          )}
        </div>

        {/* All Ratings Section */}
        {allRatings.length > 0 && (
          <div
            style={{
              marginTop: "2rem",
              borderTop: "1px solid #ddd",
              paddingTop: "2rem",
            }}
          >
            <h3 style={{ marginBottom: "1rem", color: "#333" }}>
              Wszystkie oceny ({allRatings.length}) - Średnia:{" "}
              {(averageRating / 2).toFixed(1)}
            </h3>
            <div style={styles.starRatingContainer}>
              {[...Array(5)].map((_, index) => {
                const starValue = index + 1;
                return (
                  <span
                    key={starValue}
                    style={{
                      ...styles.star,
                      color:
                        starValue <= Math.round(averageRating / 2)
                          ? "#ffc107"
                          : "#e4e5e9",
                    }}
                  >
                    ★
                  </span>
                );
              })}
            </div>

            <div style={{ maxHeight: "400px", overflowY: "auto" }}>
              {allRatings.map((rating) => (
                <div
                  key={rating.id}
                  style={{
                    padding: "1rem",
                    marginBottom: "1rem",
                    backgroundColor: "#f8f9fa",
                    borderRadius: "8px",
                    border: "1px solid #e9ecef",
                  }}
                >
                  <div
                    style={{
                      display: "flex",
                      justifyContent: "space-between",
                      alignItems: "flex-start",
                      marginBottom: "0.5rem",
                    }}
                  >
                    <div>
                      <strong>{rating.user_email || "Anonim"}</strong>
                      <span style={{ marginLeft: "1rem", color: "#666" }}>
                        {"⭐".repeat(rating.rating)} ({rating.rating}/5)
                      </span>
                    </div>
                    <small style={{ color: "#666" }}>
                      {new Date(rating.created_at).toLocaleDateString()}
                    </small>
                  </div>

                  {rating.comment && (
                    <p
                      style={{
                        color: "#555",
                        fontStyle: "italic",
                        marginTop: "0.5rem",
                      }}
                    >
                      &ldquo;{rating.comment}&rdquo;
                    </p>
                  )}
                </div>
              ))}
            </div>
          </div>
        )}

        {/* Photo Gallery */}
        <PhotoGallery
          images={galleryImages}
          isOpen={galleryOpen}
          onClose={closeGallery}
          initialIndex={galleryInitialIndex}
          showThumbnails={true}
        />
      </div>
    </div>
  );
}
