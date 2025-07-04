"use client";

import { useState, useEffect } from "react";
import { useSession } from "next-auth/react";
import Link from "next/link";
import { SquarePen, RulerDimensionLine } from "lucide-react";
import ImageSlideshow from "./ImageSlideshow";
import PlaceTypeDisplay from "./PlaceTypeDisplay";
import RatingDisplay from "./RatingDisplay";
import WCTags from "./WCTags";

export default function WCReport({ wcId, onClose }) {
  const { data: session } = useSession();
  const [wcData, setWcData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  useEffect(() => {
    if (!wcId) return;

    const fetchWcData = async () => {
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
    };

    fetchWcData();
  }, [wcId]);

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

      {/* Rating */}
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
          Rating:
        </div>
        <div>
          {wcData.rating ? (
            <RatingDisplay
              rating={wcData.rating}
              size={16}
              showNumeric={true}
            />
          ) : (
            <span style={{ color: "#999" }}>Not rated</span>
          )}
        </div>
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
          Address:
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
            fontSize: "14px",
            color: "#666",
            marginBottom: "10px",
          }}
        >
          Photos:
        </div>
        {wcData.gallery_photos && wcData.gallery_photos.length > 0 ? (
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
        ) : (
          <div
            style={{
              padding: "20px",
              textAlign: "center",
              backgroundColor: "#f8f9fa",
              borderRadius: "8px",
              color: "#666",
            }}
          >
            Brak zdjęć
          </div>
        )}
      </div>

      {/* Tags */}
      <div
        style={{
          marginBottom: "15px",
        }}
      >
        <div
          style={{
            fontSize: "14px",
            color: "#666",
            marginBottom: "10px",
          }}
        >
          Tags:
        </div>
        <WCTags wcId={wcData.id} isEditable={false} isHeaderText={false} />
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
            backgroundColor: "#28a745",
            color: "white",
            borderRadius: "6px",
            textDecoration: "none",
            fontSize: "16px",
            fontWeight: "500",
            transition: "background-color 0.2s",
          }}
          onMouseEnter={(e) => (e.target.style.backgroundColor = "#218838")}
          onMouseLeave={(e) => (e.target.style.backgroundColor = "#28a745")}
        >
          Oceń to miejsce
        </Link>
      </div>
    </div>
  );
}
