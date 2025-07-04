"use client";

import { useState, useEffect, useCallback } from "react";
import { useSession } from "next-auth/react";
import Link from "next/link";
import Image from "next/image";
import {
  SquarePen,
  RulerDimensionLine,
  Star,
  MessageCircle,
  Save,
  X,
} from "lucide-react";
import ImageSlideshow from "./ImageSlideshow";
import PlaceTypeDisplay from "./PlaceTypeDisplay";
import RatingDisplay from "./RatingDisplay";
import WCTags from "./WCTags";
import PhotoUpload from "./PhotoUpload";

export default function WCReport({ wcId, onClose }) {
  const { data: session } = useSession();
  const [wcData, setWcData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  // Rating states
  const [userRating, setUserRating] = useState(0);
  const [userComment, setUserComment] = useState("");
  const [userHoverRating, setUserHoverRating] = useState(0);
  const [hasUserRating, setHasUserRating] = useState(false);
  const [ratingLoading, setRatingLoading] = useState(false);
  const [ratingError, setRatingError] = useState("");
  const [allRatings, setAllRatings] = useState([]);
  const [averageRating, setAverageRating] = useState(0);
  const [totalRatings, setTotalRatings] = useState(0);

  // UI states
  const [showRatingForm, setShowRatingForm] = useState(false);
  const [showComments, setShowComments] = useState(false);
  const [showPhotoUpload, setShowPhotoUpload] = useState(false);
  const [showUserPhotos, setShowUserPhotos] = useState(false);

  // Photo states
  const [wcPhotos, setWcPhotos] = useState([]);
  const [photosLoading, setPhotosLoading] = useState(false);
  const [photoError, setPhotoError] = useState("");

  const fetchWcData = useCallback(async () => {
    try {
      setLoading(true);
      const response = await fetch(`/api/wc/${wcId}`);
      const result = await response.json();

      if (response.ok) {
        setWcData(result);
      } else {
        setError(result.error || "Failed to fetch WC data");
      }
    } catch (err) {
      console.error("Error fetching WC data:", err);
      setError("An error occurred while fetching WC data");
    } finally {
      setLoading(false);
    }
  }, [wcId]);

  const fetchWcPhotos = useCallback(async () => {
    if (!wcId) return;

    setPhotosLoading(true);
    try {
      const response = await fetch(`/api/wc-photos?wc_id=${wcId}`);
      const result = await response.json();

      if (response.ok) {
        setWcPhotos(result.photos || []);
      } else {
        console.error("Error fetching WC photos:", result.error);
      }
    } catch (err) {
      console.error("Error fetching WC photos:", err);
    } finally {
      setPhotosLoading(false);
    }
  }, [wcId]);

  const fetchRatings = useCallback(async () => {
    if (!wcId) return;

    try {
      const response = await fetch(`/api/wc-ratings?wc_id=${wcId}`);
      const result = await response.json();

      if (response.ok) {
        setAllRatings(result.ratings || []);
        setAverageRating(result.averageRating || 0);
        setTotalRatings(result.totalRatings || 0);

        // Check if current user has already rated
        if (session?.user?.id) {
          const userRatingData = result.ratings?.find(
            (r) => r.user_id === session.user.id,
          );
          if (userRatingData) {
            setUserRating(userRatingData.rating);
            setUserComment(userRatingData.comment || "");
            setHasUserRating(true);
          }
        }
      } else {
        console.error("Error fetching ratings:", result.error);
      }
    } catch (err) {
      console.error("Error fetching ratings:", err);
    }
  }, [wcId, session?.user?.id]);

  useEffect(() => {
    if (!wcId) return;
    fetchWcData();
    fetchRatings();
    fetchWcPhotos();
  }, [wcId, fetchWcData, fetchRatings, fetchWcPhotos]);

  const submitRating = async () => {
    if (!session?.user?.id) {
      alert("Musisz być zalogowany, aby dodać ocenę");
      return;
    }

    if (userRating === 0) {
      alert("Wybierz ocenę od 1 do 5 gwiazdek");
      return;
    }

    setRatingLoading(true);
    setRatingError("");

    try {
      const response = await fetch("/api/wc-ratings", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          wc_id: wcId,
          rating: userRating * 2, // Convert 1-5 stars to 1-10 scale
          comment: userComment.trim() || null,
        }),
      });

      const result = await response.json();

      if (response.ok) {
        setHasUserRating(true);
        setShowRatingForm(false);
        await fetchRatings(); // Refresh ratings
        alert(
          hasUserRating
            ? "Ocena została zaktualizowana!"
            : "Ocena została dodana!",
        );
      } else {
        setRatingError(result.error || "Błąd podczas zapisywania oceny");
      }
    } catch (err) {
      console.error("Error submitting rating:", err);
      setRatingError("Wystąpił błąd podczas zapisywania oceny");
    } finally {
      setRatingLoading(false);
    }
  };

  const deleteRating = async () => {
    if (!session?.user?.id || !hasUserRating) return;

    if (!confirm("Czy na pewno chcesz usunąć swoją ocenę?")) return;

    setRatingLoading(true);

    try {
      const response = await fetch(`/api/wc-ratings?wc_id=${wcId}`, {
        method: "DELETE",
      });

      const result = await response.json();

      if (response.ok) {
        setUserRating(0);
        setUserComment("");
        setHasUserRating(false);
        setShowRatingForm(false);
        await fetchRatings(); // Refresh ratings
        alert("Ocena została usunięta!");
      } else {
        setRatingError(result.error || "Błąd podczas usuwania oceny");
      }
    } catch (err) {
      console.error("Error deleting rating:", err);
      setRatingError("Wystąpił błąd podczas usuwania oceny");
    } finally {
      setRatingLoading(false);
    }
  };

  const handlePhotoUploaded = (newPhotos) => {
    // Refresh photos after upload
    fetchWcPhotos();
    setShowPhotoUpload(false);
  };

  const handleDeletePhoto = async (photoId) => {
    if (!confirm("Czy na pewno chcesz usunąć to zdjęcie?")) return;

    try {
      const response = await fetch(`/api/wc-photos/${photoId}`, {
        method: "DELETE",
      });

      const result = await response.json();
      if (!response.ok) {
        throw new Error(result.error || "Nie udało się usunąć zdjęcia");
      }

      await fetchWcPhotos();
    } catch (err) {
      console.error("Błąd usuwania zdjęcia:", err);
      setPhotoError(err.message || "Nie udało się usunąć zdjęcia");
    }
  };

  const formatDistance = (distance) => {
    if (distance === null || distance === undefined) return "N/A";

    const distanceInKm =
      typeof distance === "number" ? distance : parseFloat(distance);

    if (distanceInKm < 1) {
      return `${Math.round(distanceInKm * 1000)}m`;
    } else {
      return `${distanceInKm.toFixed(1)}km`;
    }
  };

  const formatDate = (dateString) => {
    return new Date(dateString).toLocaleDateString("pl-PL", {
      year: "numeric",
      month: "short",
      day: "numeric",
    });
  };

  if (loading) {
    return (
      <div
        style={{
          display: "flex",
          justifyContent: "center",
          alignItems: "center",
          height: "200px",
          fontSize: "16px",
          color: "#666",
        }}
      >
        <div
          style={{
            width: "20px",
            height: "20px",
            border: "2px solid #e9ecef",
            borderTop: "2px solid #007bff",
            borderRadius: "50%",
            animation: "spin 1s linear infinite",
            marginRight: "10px",
          }}
        ></div>
        Loading...
      </div>
    );
  }

  if (error) {
    return (
      <div
        style={{
          padding: "20px",
          textAlign: "center",
          color: "#dc3545",
          fontSize: "16px",
        }}
      >
        Error: {error}
      </div>
    );
  }

  if (!wcData) {
    return (
      <div
        style={{
          padding: "20px",
          textAlign: "center",
          color: "#666",
          fontSize: "16px",
        }}
      >
        WC not found
      </div>
    );
  }

  return (
    <div
      style={{
        padding: "10px 0",
        maxWidth: "100%",
      }}
    >
      {/* Header with name and edit button */}
      <div
        style={{
          display: "flex",
          justifyContent: "space-between",
          alignItems: "center",
          marginBottom: "15px",
          paddingBottom: "10px",
          borderBottom: "1px solid #e9ecef",
        }}
      >
        <h2
          style={{
            margin: 0,
            fontSize: "1.5rem",
            color: "#333",
            fontWeight: "bold",
          }}
        >
          {wcData.name}
        </h2>

        {(session?.user?.email === wcData.created_by ||
          (wcData.google_place_id && session?.user?.email)) && (
          <Link
            href={`/wc/edit/${wcData.id}`}
            onClick={(e) => e.stopPropagation()}
            style={{
              display: "flex",
              alignItems: "center",
              padding: "8px 12px",
              backgroundColor: "#007bff",
              color: "white",
              borderRadius: "6px",
              textDecoration: "none",
              fontSize: "14px",
              fontWeight: "500",
              transition: "background-color 0.2s",
            }}
            onMouseEnter={(e) => (e.target.style.backgroundColor = "#0056b3")}
            onMouseLeave={(e) => (e.target.style.backgroundColor = "#007bff")}
          >
            <SquarePen size={16} style={{ marginRight: "6px" }} />
            Edit
          </Link>
        )}
      </div>

      {/* Distance and Type Row */}
      <div
        style={{
          display: "flex",
          gap: "10px",
          marginBottom: "15px",
        }}
      >
        {/* Distance */}
        {(wcData.distance_km !== null && wcData.distance_km !== undefined) ||
        (wcData.distance !== null && wcData.distance !== undefined) ? (
          <div
            style={{
              display: "flex",
              alignItems: "center",
              backgroundColor: "#2196F3",
              color: "white",
              padding: "8px 12px",
              borderRadius: "20px",
              fontSize: "14px",
              fontWeight: "bold",
            }}
          >
            <RulerDimensionLine size={16} style={{ marginRight: "6px" }} />
            {formatDistance(wcData.distance_km || wcData.distance)}
          </div>
        ) : null}

        {/* Place Type */}
        <div
          style={{
            display: "flex",
            alignItems: "center",
            backgroundColor: "#2196F3",
            color: "white",
            padding: "8px 12px",
            borderRadius: "20px",
            fontSize: "14px",
            fontWeight: "bold",
          }}
        >
          <PlaceTypeDisplay
            placeType={wcData.place_type}
            showIcon={true}
            showText={true}
            iconSize={16}
            style={{ color: "white" }}
          />
        </div>
      </div>

      {/* Rating Section */}
      <div
        style={{
          marginBottom: "15px",
          padding: "15px",
          backgroundColor: "#f8f9fa",
          borderRadius: "8px",
          border: "1px solid #e9ecef",
        }}
      >
        <div
          style={{
            display: "flex",
            justifyContent: "space-between",
            alignItems: "center",
            marginBottom: "10px",
          }}
        >
          <div>
            <div
              style={{
                fontSize: "14px",
                color: "#666",
                marginBottom: "5px",
              }}
            >
              Średnia ocena:
            </div>
            <div style={{ display: "flex", alignItems: "center", gap: "10px" }}>
              {averageRating > 0 ? (
                <>
                  <RatingDisplay
                    rating={averageRating}
                    size={16}
                    showNumeric={true}
                  />
                  <span style={{ fontSize: "14px", color: "#666" }}>
                    ({totalRatings} {totalRatings === 1 ? "ocena" : "ocen"})
                  </span>
                </>
              ) : (
                <span style={{ color: "#999" }}>Brak ocen</span>
              )}
            </div>
          </div>

          {session?.user?.id && (
            <div style={{ display: "flex", gap: "8px" }}>
              <button
                onClick={() => setShowRatingForm(!showRatingForm)}
                style={{
                  display: "flex",
                  alignItems: "center",
                  gap: "6px",
                  padding: "8px 12px",
                  backgroundColor: hasUserRating ? "#28a745" : "#007bff",
                  color: "white",
                  border: "none",
                  borderRadius: "6px",
                  fontSize: "14px",
                  fontWeight: "500",
                  cursor: "pointer",
                  transition: "background-color 0.2s",
                }}
              >
                <Star size={16} />
                {hasUserRating ? "Edytuj ocenę" : "Oceń"}
              </button>

              {totalRatings > 0 && (
                <button
                  onClick={() => setShowComments(!showComments)}
                  style={{
                    display: "flex",
                    alignItems: "center",
                    gap: "6px",
                    padding: "8px 12px",
                    backgroundColor: "#6c757d",
                    color: "white",
                    border: "none",
                    borderRadius: "6px",
                    fontSize: "14px",
                    fontWeight: "500",
                    cursor: "pointer",
                    transition: "background-color 0.2s",
                  }}
                >
                  <MessageCircle size={16} />
                  Komentarze
                </button>
              )}
            </div>
          )}
        </div>

        {/* Rating Form */}
        {showRatingForm && session?.user?.id && (
          <div
            style={{
              marginTop: "15px",
              padding: "15px",
              backgroundColor: "white",
              borderRadius: "6px",
              border: "1px solid #ddd",
            }}
          >
            <div style={{ marginBottom: "15px" }}>
              <label
                style={{
                  display: "block",
                  marginBottom: "8px",
                  fontSize: "14px",
                  fontWeight: "500",
                  color: "#333",
                }}
              >
                Twoja ocena:
              </label>
              <div style={{ display: "flex", gap: "4px" }}>
                {[1, 2, 3, 4, 5].map((star) => (
                  <Star
                    key={star}
                    size={24}
                    style={{
                      cursor: "pointer",
                      fill:
                        star <= (userHoverRating || userRating)
                          ? "#ffc107"
                          : "none",
                      color:
                        star <= (userHoverRating || userRating)
                          ? "#ffc107"
                          : "#ddd",
                      transition: "all 0.2s",
                    }}
                    onMouseEnter={() => setUserHoverRating(star)}
                    onMouseLeave={() => setUserHoverRating(0)}
                    onClick={() => setUserRating(star)}
                  />
                ))}
              </div>
            </div>

            <div style={{ marginBottom: "15px" }}>
              <label
                style={{
                  display: "block",
                  marginBottom: "8px",
                  fontSize: "14px",
                  fontWeight: "500",
                  color: "#333",
                }}
              >
                Komentarz (opcjonalnie):
              </label>
              <textarea
                value={userComment}
                onChange={(e) => setUserComment(e.target.value)}
                placeholder="Podziel się swoimi wrażeniami..."
                style={{
                  width: "100%",
                  minHeight: "80px",
                  padding: "8px 12px",
                  border: "1px solid #ddd",
                  borderRadius: "4px",
                  fontSize: "14px",
                  resize: "vertical",
                  fontFamily: "inherit",
                }}
              />
            </div>

            {ratingError && (
              <div
                style={{
                  color: "#dc3545",
                  fontSize: "14px",
                  marginBottom: "15px",
                  padding: "8px",
                  backgroundColor: "#f8d7da",
                  borderRadius: "4px",
                  border: "1px solid #f5c6cb",
                }}
              >
                {ratingError}
              </div>
            )}

            <div style={{ display: "flex", gap: "8px" }}>
              <button
                onClick={submitRating}
                disabled={ratingLoading || userRating === 0}
                style={{
                  display: "flex",
                  alignItems: "center",
                  gap: "6px",
                  padding: "8px 16px",
                  backgroundColor: userRating === 0 ? "#ccc" : "#28a745",
                  color: "white",
                  border: "none",
                  borderRadius: "4px",
                  fontSize: "14px",
                  fontWeight: "500",
                  cursor: userRating === 0 ? "not-allowed" : "pointer",
                  transition: "background-color 0.2s",
                }}
              >
                {ratingLoading ? (
                  <div
                    style={{
                      width: "14px",
                      height: "14px",
                      border: "2px solid #ffffff30",
                      borderTop: "2px solid #ffffff",
                      borderRadius: "50%",
                      animation: "spin 1s linear infinite",
                    }}
                  ></div>
                ) : (
                  <Save size={16} />
                )}
                {hasUserRating ? "Zaktualizuj" : "Zapisz"}
              </button>

              <button
                onClick={() => {
                  setShowRatingForm(false);
                  setRatingError("");
                }}
                style={{
                  display: "flex",
                  alignItems: "center",
                  gap: "6px",
                  padding: "8px 16px",
                  backgroundColor: "#6c757d",
                  color: "white",
                  border: "none",
                  borderRadius: "4px",
                  fontSize: "14px",
                  fontWeight: "500",
                  cursor: "pointer",
                  transition: "background-color 0.2s",
                }}
              >
                <X size={16} />
                Anuluj
              </button>

              {hasUserRating && (
                <button
                  onClick={deleteRating}
                  disabled={ratingLoading}
                  style={{
                    display: "flex",
                    alignItems: "center",
                    gap: "6px",
                    padding: "8px 16px",
                    backgroundColor: "#dc3545",
                    color: "white",
                    border: "none",
                    borderRadius: "4px",
                    fontSize: "14px",
                    fontWeight: "500",
                    cursor: "pointer",
                    transition: "background-color 0.2s",
                  }}
                >
                  <X size={16} />
                  Usuń ocenę
                </button>
              )}
            </div>
          </div>
        )}

        {/* Comments Section */}
        {showComments && allRatings.length > 0 && (
          <div
            style={{
              marginTop: "15px",
              padding: "15px",
              backgroundColor: "white",
              borderRadius: "6px",
              border: "1px solid #ddd",
            }}
          >
            <h4
              style={{ margin: "0 0 15px 0", fontSize: "16px", color: "#333" }}
            >
              Komentarze ({allRatings.filter((r) => r.comment).length})
            </h4>
            <div style={{ maxHeight: "200px", overflowY: "auto" }}>
              {allRatings
                .filter((rating) => rating.comment)
                .map((rating) => (
                  <div
                    key={rating.id}
                    style={{
                      padding: "10px",
                      marginBottom: "10px",
                      backgroundColor: "#f8f9fa",
                      borderRadius: "4px",
                      border: "1px solid #e9ecef",
                    }}
                  >
                    <div
                      style={{
                        display: "flex",
                        justifyContent: "space-between",
                        alignItems: "center",
                        marginBottom: "5px",
                      }}
                    >
                      <div
                        style={{
                          display: "flex",
                          alignItems: "center",
                          gap: "8px",
                        }}
                      >
                        <RatingDisplay rating={rating.rating} size={12} />
                        <span style={{ fontSize: "12px", color: "#666" }}>
                          {rating.user_id === session?.user?.id
                            ? "Ty"
                            : rating.user_email}
                        </span>
                      </div>
                      <span style={{ fontSize: "12px", color: "#999" }}>
                        {formatDate(rating.created_at)}
                      </span>
                    </div>
                    <p
                      style={{
                        margin: 0,
                        fontSize: "14px",
                        color: "#333",
                        lineHeight: "1.4",
                      }}
                    >
                      {rating.comment}
                    </p>
                  </div>
                ))}
            </div>
          </div>
        )}
      </div>

      {/* Address */}
      <div
        style={{
          marginBottom: "15px",
        }}
      >
        <div
          style={{
            fontSize: "14px",
            color: "#666",
            marginBottom: "5px",
          }}
        >
          Adres:
        </div>
        <div
          style={{
            fontSize: "14px",
            color: "#333",
          }}
        >
          {wcData.address || "N/A"}
        </div>
      </div>

      {/* Images */}
      <div
        style={{
          marginBottom: "15px",
        }}
      >
        <div
          style={{
            display: "flex",
            justifyContent: "space-between",
            alignItems: "center",
            marginBottom: "10px",
          }}
        >
          <div
            style={{
              fontSize: "14px",
              color: "#666",
            }}
          >
            Zdjęcia:
          </div>
          {session?.user?.id && (
            <div style={{ display: "flex", gap: "6px" }}>
              <button
                onClick={() => setShowUserPhotos(!showUserPhotos)}
                style={{
                  display: "flex",
                  alignItems: "center",
                  gap: "4px",
                  padding: "4px 8px",
                  backgroundColor: "#6c757d",
                  color: "white",
                  border: "none",
                  borderRadius: "4px",
                  fontSize: "12px",
                  fontWeight: "500",
                  cursor: "pointer",
                  transition: "background-color 0.2s",
                }}
              >
                {showUserPhotos ? "Ukryj" : "Zarządzaj"}
              </button>
              <button
                onClick={() => setShowPhotoUpload(!showPhotoUpload)}
                style={{
                  display: "flex",
                  alignItems: "center",
                  gap: "4px",
                  padding: "4px 8px",
                  backgroundColor: showPhotoUpload ? "#dc3545" : "#007bff",
                  color: "white",
                  border: "none",
                  borderRadius: "4px",
                  fontSize: "12px",
                  fontWeight: "500",
                  cursor: "pointer",
                  transition: "background-color 0.2s",
                }}
              >
                {showPhotoUpload ? "Anuluj" : "Dodaj"}
              </button>
            </div>
          )}
        </div>

        {showPhotoUpload && (
          <PhotoUpload
            wcId={wcId}
            onPhotoUploaded={handlePhotoUploaded}
            disabled={photosLoading}
          />
        )}

        {/* Gallery Photos */}
        {wcData.gallery_photos && wcData.gallery_photos.length > 0 && (
          <div style={{ marginBottom: "15px" }}>
            <div
              style={{
                fontSize: "12px",
                color: "#999",
                marginBottom: "8px",
              }}
            >
              Zdjęcia z galerii:
            </div>
            <ImageSlideshow
              images={wcData.gallery_photos}
              alt={wcData.name || "WC Image"}
              width={175}
              height={140}
              style={{
                borderRadius: "8px",
                overflow: "hidden",
              }}
            />
          </div>
        )}

        {/* User Photos */}
        {wcPhotos.length > 0 && (
          <div style={{ marginBottom: "15px" }}>
            <div
              style={{
                fontSize: "12px",
                color: "#999",
                marginBottom: "8px",
              }}
            >
              Zdjęcia użytkowników ({wcPhotos.length}):
            </div>
            {showUserPhotos ? (
              <div
                style={{
                  display: "grid",
                  gridTemplateColumns: "repeat(auto-fill, minmax(120px, 1fr))",
                  gap: "8px",
                  marginBottom: "10px",
                }}
              >
                {wcPhotos.map((photo) => (
                  <div
                    key={photo.id}
                    style={{
                      position: "relative",
                      borderRadius: "6px",
                      overflow: "hidden",
                      border: "1px solid #e9ecef",
                    }}
                  >
                    <Image
                      src={photo.photo}
                      alt="User WC photo"
                      width={120}
                      height={90}
                      style={{
                        width: "100%",
                        height: "90px",
                        objectFit: "cover",
                        display: "block",
                      }}
                    />
                    {photo.user_id === session?.user?.id && (
                      <button
                        onClick={() => handleDeletePhoto(photo.id)}
                        style={{
                          position: "absolute",
                          top: "4px",
                          right: "4px",
                          width: "20px",
                          height: "20px",
                          backgroundColor: "rgba(220, 53, 69, 0.9)",
                          color: "white",
                          border: "none",
                          borderRadius: "50%",
                          fontSize: "10px",
                          cursor: "pointer",
                          display: "flex",
                          alignItems: "center",
                          justifyContent: "center",
                        }}
                        title="Usuń zdjęcie"
                      >
                        ×
                      </button>
                    )}
                    <div
                      style={{
                        position: "absolute",
                        bottom: "0",
                        left: "0",
                        right: "0",
                        backgroundColor: "rgba(0, 0, 0, 0.7)",
                        color: "white",
                        fontSize: "10px",
                        padding: "2px 4px",
                        textAlign: "center",
                      }}
                    >
                      {photo.user_id === session?.user?.id
                        ? "Ty"
                        : "Użytkownik"}
                    </div>
                  </div>
                ))}
              </div>
            ) : (
              <ImageSlideshow
                images={wcPhotos.map((photo) => photo.photo)}
                alt={wcData.name || "WC Image"}
                width={175}
                height={140}
                style={{
                  borderRadius: "8px",
                  overflow: "hidden",
                }}
              />
            )}
          </div>
        )}

        {/* No Photos Message */}
        {(!wcData.gallery_photos || wcData.gallery_photos.length === 0) &&
          wcPhotos.length === 0 && (
            <div
              style={{
                padding: "20px",
                textAlign: "center",
                backgroundColor: "#f8f9fa",
                borderRadius: "8px",
                color: "#666",
              }}
            >
              {photosLoading ? "Ładowanie zdjęć..." : "Brak zdjęć"}
            </div>
          )}

        {photoError && (
          <div
            style={{
              marginTop: "10px",
              padding: "8px 12px",
              backgroundColor: "#f8d7da",
              border: "1px solid #f5c6cb",
              borderRadius: "4px",
              fontSize: "12px",
              color: "#721c24",
            }}
          >
            {photoError}
          </div>
        )}
      </div>

      {/* Tags */}
      <div
        style={{
          marginBottom: "15px",
        }}
      >
        <WCTags
          wcId={wcData.id}
          isEditable={session?.user?.id ? true : false}
          isHeaderText={true}
        />
      </div>

      {/* Action Buttons */}
      <div
        style={{
          marginTop: "20px",
          textAlign: "center",
          display: "flex",
          gap: "10px",
          justifyContent: "center",
        }}
      >
        <button
          onClick={onClose}
          style={{
            padding: "12px 24px",
            backgroundColor: "#6c757d",
            color: "white",
            border: "none",
            borderRadius: "6px",
            fontSize: "16px",
            fontWeight: "500",
            cursor: "pointer",
            transition: "background-color 0.2s",
          }}
          onMouseEnter={(e) => (e.target.style.backgroundColor = "#5a6268")}
          onMouseLeave={(e) => (e.target.style.backgroundColor = "#6c757d")}
        >
          ← Powrót
        </button>
        <Link
          href={`/wc/view/${wcData.id}`}
          style={{
            display: "inline-block",
            padding: "12px 24px",
            backgroundColor: "#007bff",
            color: "white",
            borderRadius: "6px",
            textDecoration: "none",
            fontSize: "16px",
            fontWeight: "500",
            transition: "background-color 0.2s",
          }}
          onMouseEnter={(e) => (e.target.style.backgroundColor = "#0056b3")}
          onMouseLeave={(e) => (e.target.style.backgroundColor = "#007bff")}
        >
          Pełny widok
        </Link>
      </div>

      <style jsx>{`
        @keyframes spin {
          0% {
            transform: rotate(0deg);
          }
          100% {
            transform: rotate(360deg);
          }
        }
      `}</style>
    </div>
  );
}
