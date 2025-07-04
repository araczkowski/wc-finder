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
  Camera,
  MapPin,
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
          const existingRating = result.ratings?.find(
            (r) => r.user_id === session.user.id,
          );
          if (existingRating) {
            setUserRating(existingRating.rating);
            setUserComment(existingRating.comment || "");
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
    if (wcId) {
      fetchWcData();
      fetchWcPhotos();
      fetchRatings();
    }
  }, [wcId, fetchWcData, fetchWcPhotos, fetchRatings]);

  const handleRatingSubmit = async () => {
    if (!userRating || userRating < 1 || userRating > 5) {
      setRatingError("Please select a rating between 1 and 5");
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
          rating: userRating,
          comment: userComment.trim() || null,
        }),
      });

      const result = await response.json();

      if (response.ok) {
        setHasUserRating(true);
        setShowRatingForm(false);
        await fetchRatings();
        await fetchWcData();
      } else {
        setRatingError(result.error || "Failed to submit rating");
      }
    } catch (err) {
      console.error("Error submitting rating:", err);
      setRatingError("An error occurred while submitting your rating");
    } finally {
      setRatingLoading(false);
    }
  };

  const handlePhotoUploaded = (newPhotos) => {
    // Refresh photos after upload
    fetchWcPhotos();
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
        padding: "20px",
        maxWidth: "100%",
        backgroundColor: "#ffffff",
        borderRadius: "12px",
        boxShadow: "0 4px 20px rgba(0, 0, 0, 0.1)",
        margin: "0 auto",
      }}
    >
      {/* Header with name and edit button */}
      <div
        style={{
          display: "flex",
          justifyContent: "space-between",
          alignItems: "center",
          marginBottom: "20px",
          paddingBottom: "15px",
          borderBottom: "2px solid #e9ecef",
        }}
      >
        <h2
          style={{
            margin: 0,
            fontSize: "1.8rem",
            color: "#2c3e50",
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
              padding: "10px 16px",
              backgroundColor: "#3498db",
              color: "white",
              borderRadius: "8px",
              textDecoration: "none",
              fontSize: "14px",
              fontWeight: "500",
              transition: "all 0.3s ease",
              boxShadow: "0 2px 10px rgba(52, 152, 219, 0.3)",
            }}
            onMouseEnter={(e) => {
              e.target.style.backgroundColor = "#2980b9";
              e.target.style.transform = "translateY(-2px)";
            }}
            onMouseLeave={(e) => {
              e.target.style.backgroundColor = "#3498db";
              e.target.style.transform = "translateY(0)";
            }}
          >
            <SquarePen size={16} style={{ marginRight: "6px" }} />
            Edytuj
          </Link>
        )}
      </div>

      {/* Distance and Type Row */}
      <div
        style={{
          display: "flex",
          gap: "12px",
          marginBottom: "20px",
          flexWrap: "wrap",
        }}
      >
        {/* Distance */}
        {(wcData.distance_km !== null && wcData.distance_km !== undefined) ||
        (wcData.distance !== null && wcData.distance !== undefined) ? (
          <div
            style={{
              display: "flex",
              alignItems: "center",
              backgroundColor: "#e74c3c",
              color: "white",
              padding: "10px 16px",
              borderRadius: "25px",
              fontSize: "14px",
              fontWeight: "bold",
              boxShadow: "0 2px 10px rgba(231, 76, 60, 0.3)",
            }}
          >
            <RulerDimensionLine size={16} style={{ marginRight: "8px" }} />
            {formatDistance(wcData.distance_km || wcData.distance)}
          </div>
        ) : null}

        {/* Place Type */}
        <div
          style={{
            display: "flex",
            alignItems: "center",
            backgroundColor: "#9b59b6",
            color: "white",
            padding: "10px 16px",
            borderRadius: "25px",
            fontSize: "14px",
            fontWeight: "bold",
            boxShadow: "0 2px 10px rgba(155, 89, 182, 0.3)",
          }}
        >
          <PlaceTypeDisplay
            placeType={wcData.place_type}
            showIcon={true}
            showText={true}
            iconSize={16}
            iconProps={{ style: { marginRight: "8px" } }}
          />
        </div>
      </div>

      {/* Rating Display */}
      <div
        style={{
          marginBottom: "20px",
          padding: "15px",
          backgroundColor: "#f8f9fa",
          borderRadius: "10px",
          border: "1px solid #e9ecef",
        }}
      >
        <div
          style={{
            display: "flex",
            justifyContent: "space-between",
            alignItems: "center",
            marginBottom: "12px",
          }}
        >
          <div
            style={{ fontSize: "16px", color: "#2c3e50", fontWeight: "600" }}
          >
            Ocena:
          </div>
          <div style={{ display: "flex", alignItems: "center", gap: "10px" }}>
            {wcData.rating || averageRating ? (
              <>
                <RatingDisplay
                  rating={wcData.rating || averageRating}
                  size={18}
                  showNumeric={true}
                />
                <span style={{ fontSize: "14px", color: "#7f8c8d" }}>
                  ({totalRatings} ocen)
                </span>
              </>
            ) : (
              <span style={{ fontSize: "14px", color: "#95a5a6" }}>
                Brak ocen
              </span>
            )}
          </div>
        </div>

        {/* User Rating Form */}
        {session?.user?.id && (
          <div>
            {!hasUserRating && !showRatingForm && (
              <button
                onClick={() => setShowRatingForm(true)}
                style={{
                  padding: "8px 16px",
                  backgroundColor: "#27ae60",
                  color: "white",
                  border: "none",
                  borderRadius: "6px",
                  fontSize: "14px",
                  cursor: "pointer",
                  transition: "background-color 0.3s",
                }}
                onMouseEnter={(e) =>
                  (e.target.style.backgroundColor = "#219a52")
                }
                onMouseLeave={(e) =>
                  (e.target.style.backgroundColor = "#27ae60")
                }
              >
                <Star size={16} style={{ marginRight: "6px" }} />
                Oceń to WC
              </button>
            )}

            {(showRatingForm || hasUserRating) && (
              <div style={{ marginTop: "12px" }}>
                <div style={{ marginBottom: "10px" }}>
                  <div style={{ fontSize: "14px", marginBottom: "6px" }}>
                    Twoja ocena:
                  </div>
                  <div style={{ display: "flex", gap: "4px" }}>
                    {[1, 2, 3, 4, 5].map((star) => (
                      <Star
                        key={star}
                        size={24}
                        style={{
                          cursor: "pointer",
                          color:
                            star <= (userHoverRating || userRating)
                              ? "#f39c12"
                              : "#bdc3c7",
                          fill:
                            star <= (userHoverRating || userRating)
                              ? "#f39c12"
                              : "none",
                        }}
                        onClick={() => setUserRating(star)}
                        onMouseEnter={() => setUserHoverRating(star)}
                        onMouseLeave={() => setUserHoverRating(0)}
                      />
                    ))}
                  </div>
                </div>

                <div style={{ marginBottom: "10px" }}>
                  <textarea
                    value={userComment}
                    onChange={(e) => setUserComment(e.target.value)}
                    placeholder="Dodaj komentarz (opcjonalnie)..."
                    style={{
                      width: "100%",
                      minHeight: "60px",
                      padding: "8px",
                      border: "1px solid #ddd",
                      borderRadius: "6px",
                      fontSize: "14px",
                      resize: "vertical",
                      fontFamily: "inherit",
                    }}
                  />
                </div>

                <div style={{ display: "flex", gap: "8px" }}>
                  <button
                    onClick={handleRatingSubmit}
                    disabled={ratingLoading || !userRating}
                    style={{
                      padding: "8px 16px",
                      backgroundColor: userRating ? "#27ae60" : "#95a5a6",
                      color: "white",
                      border: "none",
                      borderRadius: "6px",
                      fontSize: "14px",
                      cursor: userRating ? "pointer" : "not-allowed",
                      opacity: ratingLoading ? 0.7 : 1,
                    }}
                  >
                    {ratingLoading
                      ? "Zapisywanie..."
                      : hasUserRating
                        ? "Aktualizuj"
                        : "Zapisz"}
                  </button>
                  {showRatingForm && !hasUserRating && (
                    <button
                      onClick={() => setShowRatingForm(false)}
                      style={{
                        padding: "8px 16px",
                        backgroundColor: "#95a5a6",
                        color: "white",
                        border: "none",
                        borderRadius: "6px",
                        fontSize: "14px",
                        cursor: "pointer",
                      }}
                    >
                      Anuluj
                    </button>
                  )}
                </div>

                {ratingError && (
                  <div
                    style={{
                      marginTop: "8px",
                      color: "#e74c3c",
                      fontSize: "12px",
                    }}
                  >
                    {ratingError}
                  </div>
                )}
              </div>
            )}
          </div>
        )}
      </div>

      {/* Comments Section */}
      {allRatings.filter((r) => r.comment).length > 0 && (
        <div style={{ marginBottom: "20px" }}>
          <div
            style={{
              display: "flex",
              justifyContent: "space-between",
              alignItems: "center",
              marginBottom: "12px",
            }}
          >
            <h4 style={{ margin: 0, fontSize: "16px", color: "#2c3e50" }}>
              Komentarze ({allRatings.filter((r) => r.comment).length})
            </h4>
            <button
              onClick={() => setShowComments(!showComments)}
              style={{
                padding: "6px 12px",
                backgroundColor: "#3498db",
                color: "white",
                border: "none",
                borderRadius: "6px",
                fontSize: "12px",
                cursor: "pointer",
              }}
            >
              {showComments ? "Ukryj" : "Pokaż"}
            </button>
          </div>

          {showComments && (
            <div style={{ maxHeight: "200px", overflowY: "auto" }}>
              {allRatings
                .filter((rating) => rating.comment)
                .map((rating) => (
                  <div
                    key={rating.id}
                    style={{
                      padding: "12px",
                      marginBottom: "10px",
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
                        marginBottom: "8px",
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
                        <span style={{ fontSize: "12px", color: "#7f8c8d" }}>
                          {rating.user_id === session?.user?.id
                            ? "Ty"
                            : rating.user_email}
                        </span>
                      </div>
                      <span style={{ fontSize: "12px", color: "#95a5a6" }}>
                        {formatDate(rating.created_at)}
                      </span>
                    </div>
                    <p
                      style={{
                        margin: 0,
                        fontSize: "14px",
                        color: "#2c3e50",
                        lineHeight: "1.4",
                      }}
                    >
                      {rating.comment}
                    </p>
                  </div>
                ))}
            </div>
          )}
        </div>
      )}

      {/* Address */}
      <div
        style={{
          marginBottom: "20px",
          padding: "15px",
          backgroundColor: "#ecf0f1",
          borderRadius: "10px",
          border: "1px solid #bdc3c7",
        }}
      >
        <div
          style={{
            display: "flex",
            alignItems: "center",
            fontSize: "14px",
            color: "#2c3e50",
            marginBottom: "8px",
            fontWeight: "600",
          }}
        >
          <MapPin size={16} style={{ marginRight: "8px" }} />
          Adres:
        </div>
        <div style={{ fontSize: "14px", color: "#34495e" }}>
          {wcData.address || "Nie podano"}
        </div>
      </div>

      {/* Tags - moved above images */}
      <div
        style={{
          marginBottom: "20px",
          padding: "15px",
          backgroundColor: "#f8f9fa",
          borderRadius: "10px",
          border: "1px solid #e9ecef",
        }}
      >
        <WCTags
          wcId={wcData.id}
          isEditable={session?.user?.id ? true : false}
          isHeaderText={true}
        />
      </div>

      {/* Images Section - improved */}
      <div
        style={{
          marginBottom: "20px",
          padding: "15px",
          backgroundColor: "#ffffff",
          borderRadius: "10px",
          border: "2px solid #e9ecef",
        }}
      >
        <div
          style={{
            display: "flex",
            alignItems: "center",
            justifyContent: "space-between",
            marginBottom: "15px",
          }}
        >
          <div
            style={{
              display: "flex",
              alignItems: "center",
              fontSize: "16px",
              color: "#2c3e50",
              fontWeight: "600",
            }}
          >
            <Camera size={18} style={{ marginRight: "8px" }} />
            Zdjęcia
          </div>
        </div>

        {/* Photo Upload - always visible if user is logged in */}
        {session?.user?.id && (
          <div style={{ marginBottom: "15px" }}>
            <PhotoUpload
              wcId={wcId}
              onPhotoUploaded={handlePhotoUploaded}
              disabled={photosLoading}
            />
          </div>
        )}

        {/* Gallery Photos */}
        {wcData.gallery_photos && wcData.gallery_photos.length > 0 && (
          <div style={{ marginBottom: "15px" }}>
            <div
              style={{
                fontSize: "12px",
                color: "#7f8c8d",
                marginBottom: "8px",
                fontWeight: "500",
              }}
            >
              Zdjęcia z galerii:
            </div>
            <ImageSlideshow
              images={wcData.gallery_photos}
              alt={wcData.name || "WC Image"}
              width={200}
              height={150}
              style={{
                borderRadius: "10px",
                overflow: "hidden",
                boxShadow: "0 4px 15px rgba(0, 0, 0, 0.1)",
              }}
            />
          </div>
        )}

        {/* User Photos - always in management mode */}
        {wcPhotos.length > 0 && (
          <div style={{ marginBottom: "15px" }}>
            <div
              style={{
                fontSize: "12px",
                color: "#7f8c8d",
                marginBottom: "12px",
                fontWeight: "500",
              }}
            >
              Zdjęcia użytkowników ({wcPhotos.length}):
            </div>
            <div
              style={{
                display: "grid",
                gridTemplateColumns: "repeat(auto-fill, minmax(140px, 1fr))",
                gap: "12px",
                marginBottom: "10px",
              }}
            >
              {wcPhotos.map((photo) => (
                <div
                  key={photo.id}
                  style={{
                    position: "relative",
                    borderRadius: "10px",
                    overflow: "hidden",
                    border: "2px solid #e9ecef",
                    boxShadow: "0 2px 10px rgba(0, 0, 0, 0.1)",
                    transition: "transform 0.3s ease",
                  }}
                  onMouseEnter={(e) =>
                    (e.target.style.transform = "scale(1.05)")
                  }
                  onMouseLeave={(e) => (e.target.style.transform = "scale(1)")}
                >
                  <Image
                    src={photo.photo}
                    alt="User WC photo"
                    width={140}
                    height={105}
                    style={{
                      width: "100%",
                      height: "105px",
                      objectFit: "cover",
                      display: "block",
                    }}
                  />
                  {photo.user_id === session?.user?.id && (
                    <button
                      onClick={() => handleDeletePhoto(photo.id)}
                      style={{
                        position: "absolute",
                        top: "6px",
                        right: "6px",
                        width: "24px",
                        height: "24px",
                        backgroundColor: "rgba(231, 76, 60, 0.9)",
                        color: "white",
                        border: "none",
                        borderRadius: "50%",
                        fontSize: "14px",
                        cursor: "pointer",
                        display: "flex",
                        alignItems: "center",
                        justifyContent: "center",
                        transition: "background-color 0.3s",
                      }}
                      onMouseEnter={(e) =>
                        (e.target.style.backgroundColor =
                          "rgba(192, 57, 43, 0.9)")
                      }
                      onMouseLeave={(e) =>
                        (e.target.style.backgroundColor =
                          "rgba(231, 76, 60, 0.9)")
                      }
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
                      backgroundColor: "rgba(0, 0, 0, 0.8)",
                      color: "white",
                      fontSize: "10px",
                      padding: "4px 6px",
                      textAlign: "center",
                      fontWeight: "500",
                    }}
                  >
                    {photo.user_id === session?.user?.id ? "Ty" : "Użytkownik"}
                  </div>
                </div>
              ))}
            </div>
          </div>
        )}

        {/* No Photos Message */}
        {(!wcData.gallery_photos || wcData.gallery_photos.length === 0) &&
          wcPhotos.length === 0 && (
            <div
              style={{
                padding: "30px",
                textAlign: "center",
                backgroundColor: "#f8f9fa",
                borderRadius: "10px",
                color: "#7f8c8d",
                border: "2px dashed #bdc3c7",
              }}
            >
              {photosLoading ? (
                <div
                  style={{
                    display: "flex",
                    alignItems: "center",
                    justifyContent: "center",
                  }}
                >
                  <div
                    style={{
                      width: "16px",
                      height: "16px",
                      border: "2px solid #e9ecef",
                      borderTop: "2px solid #3498db",
                      borderRadius: "50%",
                      animation: "spin 1s linear infinite",
                      marginRight: "8px",
                    }}
                  ></div>
                  Ładowanie zdjęć...
                </div>
              ) : (
                <div>
                  <Camera
                    size={32}
                    style={{ marginBottom: "8px", color: "#bdc3c7" }}
                  />
                  <div>Brak zdjęć</div>
                  {session?.user?.id && (
                    <div style={{ fontSize: "12px", marginTop: "4px" }}>
                      Bądź pierwszą osobą, która doda zdjęcie!
                    </div>
                  )}
                </div>
              )}
            </div>
          )}

        {photoError && (
          <div
            style={{
              marginTop: "10px",
              padding: "10px 15px",
              backgroundColor: "#f8d7da",
              border: "1px solid #f5c6cb",
              borderRadius: "8px",
              fontSize: "12px",
              color: "#721c24",
            }}
          >
            {photoError}
          </div>
        )}
      </div>

      {/* Action Buttons */}
      <div
        style={{
          marginTop: "25px",
          textAlign: "center",
          display: "flex",
          gap: "12px",
          justifyContent: "center",
          flexWrap: "wrap",
        }}
      >
        <button
          onClick={onClose}
          style={{
            padding: "14px 28px",
            backgroundColor: "#95a5a6",
            color: "white",
            border: "none",
            borderRadius: "8px",
            fontSize: "16px",
            fontWeight: "500",
            cursor: "pointer",
            transition: "all 0.3s ease",
            boxShadow: "0 2px 10px rgba(149, 165, 166, 0.3)",
          }}
          onMouseEnter={(e) => {
            e.target.style.backgroundColor = "#7f8c8d";
            e.target.style.transform = "translateY(-2px)";
          }}
          onMouseLeave={(e) => {
            e.target.style.backgroundColor = "#95a5a6";
            e.target.style.transform = "translateY(0)";
          }}
        >
          ← Powrót
        </button>
        <Link
          href={`/wc/view/${wcData.id}`}
          style={{
            display: "inline-block",
            padding: "14px 28px",
            backgroundColor: "#3498db",
            color: "white",
            borderRadius: "8px",
            textDecoration: "none",
            fontSize: "16px",
            fontWeight: "500",
            transition: "all 0.3s ease",
            boxShadow: "0 2px 10px rgba(52, 152, 219, 0.3)",
          }}
          onMouseEnter={(e) => {
            e.target.style.backgroundColor = "#2980b9";
            e.target.style.transform = "translateY(-2px)";
          }}
          onMouseLeave={(e) => {
            e.target.style.backgroundColor = "#3498db";
            e.target.style.transform = "translateY(0)";
          }}
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
