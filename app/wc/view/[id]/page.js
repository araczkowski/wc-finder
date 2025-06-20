"use client";

import { useState, useEffect, useMemo, useCallback } from "react";
import { useSession } from "next-auth/react";
import { useRouter, useParams } from "next/navigation";
import { createClient } from "@supabase/supabase-js";
import Link from "next/link";
import Image from "next/image";

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
  const [selectedPhotos, setSelectedPhotos] = useState([]);
  const [photoUploadLoading, setPhotoUploadLoading] = useState(false);
  const [photoError, setPhotoError] = useState("");

  const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

  const supabase = useMemo(() => {
    if (supabaseUrl && supabaseAnonKey) {
      return createClient(supabaseUrl, supabaseAnonKey);
    }
    console.warn("Supabase URL or Anon Key is missing for ViewWcPage.");
    return null;
  }, [supabaseUrl, supabaseAnonKey]);

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
      const response = await fetch(`/api/wc-ratings?wc_id=${wcId}&user_id=${session.user.id}`);
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
  }, [wcId, supabase, session?.user?.id, sessionStatus, fetchWcPhotos, fetchUserRating, fetchAllRatings]);

  const handleRatingSubmit = async (e) => {
    e.preventDefault();

    if (!userRating) {
      setRatingError("Please select a rating.");
      return;
    }

    setRatingLoading(true);
    setRatingError("");

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
          rating: userRating,
          comment: userComment.trim() || null,
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

  const handlePhotoSelection = (event) => {
    const files = Array.from(event.target.files);
    setSelectedPhotos(files);
    setPhotoError("");
  };

  const handlePhotoUpload = async () => {
    if (selectedPhotos.length === 0) {
      setPhotoError("Please select at least one photo");
      return;
    }

    setPhotoUploadLoading(true);
    setPhotoError("");

    try {
      const uploadPromises = selectedPhotos.map(async (file) => {
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

      setSelectedPhotos([]);
      const fileInput = document.getElementById("wcPhotos");
      if (fileInput) fileInput.value = "";

      await fetchWcPhotos();
    } catch (err) {
      console.error("Error uploading photos:", err);
      setPhotoError(err.message || "Failed to upload photos");
    } finally {
      setPhotoUploadLoading(false);
    }
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
        <Link href="/" style={styles.backButton} title="Powrót do strony głównej">
          ←
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

        <h2 style={{ marginBottom: "25px", color: "#333", textAlign: "center" }}>
          {wcData.name}
        </h2>

        {error && <p style={styles.formError}>{error}</p>}

        <div style={styles.form}>
          <div>
            <label style={styles.formLabel}>Nazwa</label>
            <div style={styles.viewText}>{wcData.name}</div>
          </div>

          <div>
            <label style={styles.formLabel}>Adres</label>
            <div style={wcData.address ? styles.viewText : styles.viewTextEmpty}>
              {wcData.address || "Nie podano"}
            </div>
          </div>

          <div>
            <label style={styles.formLabel}>Współrzędne</label>
            <div style={wcData.location ? styles.viewText : styles.viewTextEmpty}>
              {wcData.location || "Nie podano"}
            </div>
          </div>

          <div>
            <label style={styles.formLabel}>Zdjęcie</label>
            {wcData.image_url ? (
              <div style={{ marginTop: "10px" }}>
                <Image
                  src={wcData.image_url}
                  alt="WC"
                  width={300}
                  height={300}
                  style={styles.imagePreview}
                />
              </div>
            ) : (
              <div style={styles.viewTextEmpty}>Brak zdjęcia</div>
            )}
          </div>

          <div>
            <label style={styles.formLabel}>
              Ocena użytkownika ({wcData.rating || 0} / 10)
            </label>
            <div style={styles.starRatingContainer}>
              {[...Array(10)].map((_, index) => {
                const starValue = index + 1;
                return (
                  <span
                    key={starValue}
                    style={{
                      ...styles.star,
                      color: starValue <= (wcData.rating || 0) ? "#ffc107" : "#e4e5e9",
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
          <div style={{
            marginTop: "2rem",
            borderTop: "1px solid #ddd",
            paddingTop: "2rem",
          }}>
            <h3 style={{ marginBottom: "1rem", color: "#333" }}>Twoja ocena</h3>

            {ratingError && <p style={styles.formError}>{ratingError}</p>}

            <form onSubmit={handleRatingSubmit} style={styles.form}>
              <div>
                <label style={styles.formLabel}>
                  Oceń to WC ({userRating} / 10)
                </label>
                <div style={styles.starRatingContainer}>
                  {[...Array(10)].map((_, index) => {
                    const starValue = index + 1;
                    return (
                      <span
                        key={starValue}
                        style={{
                          ...styles.star,
                          color: starValue <= (userHoverRating || userRating) ? "#ffc107" : "#e4e5e9",
                          cursor: ratingLoading ? "default" : "pointer",
                        }}
                        onClick={() => !ratingLoading && setUserRating(starValue)}
                        onMouseEnter={() => !ratingLoading && setUserHoverRating(starValue)}
                        onMouseLeave={() => !ratingLoading && setUserHoverRating(0)}
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
                  onChange={(e) => setUserComment(e.target.value)}
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
                <label htmlFor="wcPhotos" style={styles.formLabel}>
                  Dodaj zdjęcia
                </label>
                <input
                  id="wcPhotos"
                  name="wcPhotos"
                  type="file"
                  accept="image/*"
                  multiple
                  capture="environment"
                  onChange={handlePhotoSelection}
                  style={{ ...styles.formInput, padding: "8px" }}
                  disabled={photoUploadLoading}
                />
                {selectedPhotos.length > 0 && (
                  <div style={{ marginTop: "10px" }}>
                    <p>Wybrane zdjęcia: {selectedPhotos.length}</p>
                    <button
                      type="button"
                      onClick={handlePhotoUpload}
                      style={{ ...styles.formButton, backgroundColor: "#17a2b8" }}
                      disabled={photoUploadLoading}
                    >
                      {photoUploadLoading ? "Przesyłanie..." : "Prześlij zdjęcia"}
                    </button>
                  </div>
                )}
                {photoError && (
                  <p style={{ ...styles.formError, marginTop: "5px" }}>
                    {photoError}
                  </p>
                )}
              </div>

              <button
                type="submit"
                style={styles.formButton}
                disabled={ratingLoading || !userRating}
              >
                {ratingLoading
                  ? hasUserRating
                    ? "Aktualizowanie..."
                    : "Zapisywanie..."
                  : hasUserRating
                    ? "Aktualizuj ocenę"
                    : "Zapisz ocenę"}
              </button>
            </form>
          </div>
        )}

        {/* Photo Gallery Section */}
        <div style={{
          marginTop: "2rem",
          borderTop: "1px solid #ddd",
          paddingTop: "2rem",
        }}>
          <h3 style={{ marginBottom: "1rem", color: "#333" }}>
            Zdjęcia ({wcPhotos.length})
          </h3>

          {photosLoading ? (
            <p style={{ textAlign: "center", color: "#666" }}>
              Ładowanie zdjęć...
            </p>
          ) : wcPhotos.length > 0 ? (
            <div style={styles.photoGallery}>
              {wcPhotos.map((photo) => (
                <div key={photo.id} style={styles.photoCard}>
                  <Image
                    src={photo.photo}
                    alt="WC Photo"
                    width={200}
                    height={200}
                    style={styles.photoImage}
                  />
                  <div style={styles.photoInfo}>
                    <div>Dodane przez: {photo.user_email || "Anonim"}</div>
                    <div>{new Date(photo.created_at).toLocaleDateString()}</div>
                    {photo.user_id === session?.user?.id && (
                      <button
                        onClick={() => handleDeletePhoto(photo.id)}
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
            <p style={{
              textAlign: "center",
              color: "#666",
              fontStyle: "italic",
            }}>
              Brak zdjęć. Bądź pierwszą osobą, która doda zdjęcie!
            </p>
          )}
        </div>

        {/* All Ratings Section */}
        {allRatings.length > 0 && (
          <div style={{
            marginTop: "2rem",
            borderTop: "1px solid #ddd",
            paddingTop: "2rem",
          }}>
            <h3 style={{ marginBottom: "1rem", color: "#333" }}>
              Wszystkie oceny ({allRatings.length}) - Średnia: {averageRating.toFixed(1)} ⭐
            </h3>

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
                  <div style={{
                    display: "flex",
                    justifyContent: "space-between",
                    alignItems: "flex-start",
                    marginBottom: "0.5rem",
                  }}>
                    <div>
                      <strong>{rating.user_email || "Anonim"}</strong>
                      <span style={{ marginLeft: "1rem", color: "#666" }}>
                        {"⭐".repeat(rating.rating)} ({rating.rating}/10)
                      </span>
                    </div>
                    <small style={{ color: "#666" }}>
                      {new Date(rating.created_at).toLocaleDateString()}
                    </small>
                  </div>

                  {rating.comment && (
                    <p style={{
                      color: "#555",
                      fontStyle: "italic",
                      marginTop: "0.5rem",
                    }}>
                      &ldquo;{rating.comment}&rdquo;
                    </p>
                  )}
                </div>
              ))}
            </div>
          </div>
        )}
      </div>
    </div>
  );
}
