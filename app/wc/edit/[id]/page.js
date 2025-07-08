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
// Removed authentication imports - no longer needed
import { useRouter, useParams } from "next/navigation";
import { createClient } from "@supabase/supabase-js";
import Link from "next/link";
import Image from "next/image"; // For <Image> component
import {
  optimizeImage,
  optimizeImages,
  validateImageFile,
  WC_GALLERY_CONFIG,
  WC_MAIN_IMAGE_CONFIG,
} from "../../../utils/imageOptimizer";
import AddressAutocomplete from "../../../components/AddressAutocomplete";
import {
  getPlaceTypeOptions,
  getPlaceTypeLabel,
  DEFAULT_PLACE_TYPE,
} from "../../../utils/placeTypes";
import PlaceTypeSelect from "../../../components/PlaceTypeSelect";
import { pl } from "../../../locales/pl";
import { useTranslation } from "../../../hooks/useTranslation";
import PlaceTypeDisplay from "../../../components/PlaceTypeDisplay";
import WCTags from "../../../components/WCTags";
import { CircleChevronLeft, Camera, X, Image as ImageIcon } from "lucide-react";

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
  deleteButton: {
    backgroundColor: "#dc3545", // Red for delete
    marginTop: "1rem",
    fontSize: "0.9rem",
  },
  modalOverlay: {
    position: "fixed",
    top: 0,
    left: 0,
    right: 0,
    bottom: 0,
    backgroundColor: "rgba(0, 0, 0, 0.5)",
    display: "flex",
    alignItems: "center",
    justifyContent: "center",
    zIndex: 1000,
  },
  modalContent: {
    backgroundColor: "white",
    padding: "2rem",
    borderRadius: "8px",
    maxWidth: "400px",
    width: "90%",
    textAlign: "center",
  },
  modalTitle: {
    fontSize: "1.2rem",
    fontWeight: "bold",
    marginBottom: "1rem",
    color: "#dc3545",
  },
  modalText: {
    marginBottom: "1.5rem",
    color: "#333",
    lineHeight: "1.5",
  },
  modalButtons: {
    display: "flex",
    gap: "1rem",
    justifyContent: "center",
  },
  modalButton: {
    padding: "0.75rem 1.5rem",
    borderRadius: "4px",
    border: "none",
    cursor: "pointer",
    fontSize: "1rem",
    fontWeight: "500",
    transition: "all 0.2s ease",
  },
  modalConfirmButton: {
    backgroundColor: "#dc3545",
    color: "white",
  },
  modalCancelButton: {
    backgroundColor: "#6c757d",
    color: "white",
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
  backButton: {
    position: "absolute",
    top: "20px",
    left: "20px",
    color: "black",
    border: "none",
    borderRadius: "50%",
    width: "40px",
    height: "40px",
    display: "flex",
    alignItems: "center",
    justifyContent: "center",
    cursor: "pointer",
    fontSize: "2em",
    textDecoration: "none",
    zIndex: "1000",
  },
  formCardWithBack: {
    position: "relative",
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
  photoCardHover: {
    transform: "scale(1.02)",
    boxShadow: "0 4px 12px rgba(0,0,0,0.15)",
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

export default function EditWcPage() {
  const router = useRouter();
  const params = useParams();
  const wcId = params?.id;

  // Removed session - no longer needed for authentication

  const [name, setName] = useState("");
  const [location, setLocation] = useState("");
  const [address, setAddress] = useState("");
  const [coordinates, setCoordinates] = useState(null); // For GPS coordinates
  const [placeType, setPlaceType] = useState(DEFAULT_PLACE_TYPE);

  // Enhanced address setter with debugging
  const handleAddressChange = (newAddress) => {
    console.log("[EditWC] Address changed to:", newAddress);
    setAddress(newAddress);
  };
  const [currentImageUrl, setCurrentImageUrl] = useState(null); // URL of the image when page loads
  const [selectedFile, setSelectedFile] = useState(null); // New file selected by user
  const [imagePreview, setImagePreview] = useState(null); // URL for preview (blob or currentImageUrl)
  const [imageOptimizing, setImageOptimizing] = useState(false); // Loading state for image optimization
  const [optimizationInfo, setOptimizationInfo] = useState(null); // Information about image optimization
  const [wantsToRemoveImage, setWantsToRemoveImage] = useState(false); // Flag if user wants to remove existing image
  const [rating, setRating] = useState(0);
  const [hoverRating, setHoverRating] = useState(0);
  const [originalWcData, setOriginalWcData] = useState(null); // To store fetched WC data
  const [error, setError] = useState("");
  const [formLoading, setFormLoading] = useState(false); // For form submission
  const [pageLoading, setPageLoading] = useState(true); // For initial data fetch
  const [isOwner, setIsOwner] = useState(false); // Check if current user is the owner
  const [deleteLoading, setDeleteLoading] = useState(false); // For delete operation
  const [deleteError, setDeleteError] = useState(""); // For delete errors
  const [showDeleteConfirm, setShowDeleteConfirm] = useState(false); // For delete confirmation modal

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
  const [showSourceSelector, setShowSourceSelector] = useState(false);
  const [showPhotoSourceSelector, setShowPhotoSourceSelector] = useState(false);
  const [isMobile, setIsMobile] = useState(false);

  const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

  const { t } = useTranslation();

  const supabase = useMemo(() => {
    if (supabaseUrl && supabaseAnonKey) {
      return createClient(supabaseUrl, supabaseAnonKey);
    }
    console.warn(
      "Supabase URL or Anon Key is missing for EditWcPage. Check .env.local",
    );
    return null;
  }, [supabaseUrl, supabaseAnonKey]);

  const fetchWcPhotos = useCallback(async () => {
    if (!wcId) return;

    setPhotosLoading(true);
    try {
      const response = await fetch(`/api/wc-photos?wc_id=${wcId}`);
      const result = await response.json();

      if (response.ok) {
        // Add user email information to photos
        const photosWithUsers = await Promise.all(
          (result.photos || []).map(async (photo) => {
            // Show "User" for all photos since we removed authentication requirements
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
  }, [wcId]);

  // Effect for authentication & redirect - REMOVED to allow all users access

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

  // Effect for fetching WC data
  useEffect(() => {
    const fetchWcData = async () => {
      if (!wcId || !supabase) {
        setPageLoading(false);
        if (!wcId) setError("WC ID missing.");
        if (!supabase) setError("Supabase client not configured.");
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
        // Allow all users to edit any WC - removed owner/admin restrictions
        setIsOwner(true);

        setOriginalWcData(fetchedWc);
        setName(fetchedWc.name || "");
        setLocation(fetchedWc.location || "");
        setAddress(fetchedWc.address || "");

        // Parse existing coordinates if available
        if (fetchedWc.location) {
          try {
            // Handle PostGIS geography format - call API to get coordinates
            const coordsResponse = await fetch(`/api/wcs/${wcId}/coordinates`);
            if (coordsResponse.ok) {
              const coordsData = await coordsResponse.json();
              if (coordsData.latitude && coordsData.longitude) {
                setCoordinates({
                  lat: coordsData.latitude,
                  lng: coordsData.longitude,
                });
              }
            } else {
              // Fallback: try to parse as old format "lat,lng"
              const coords = fetchedWc.location.split(",");
              if (coords.length === 2) {
                const lat = parseFloat(coords[0]);
                const lng = parseFloat(coords[1]);
                if (!isNaN(lat) && !isNaN(lng)) {
                  setCoordinates({ lat, lng });
                }
              }
            }
          } catch (error) {
            console.warn("Could not parse coordinates:", error);
          }
        }
        setCurrentImageUrl(fetchedWc.image_url || null);
        setImagePreview(fetchedWc.image_url || null);
        setRating(fetchedWc.rating || 0);
        setPlaceType(fetchedWc.place_type || DEFAULT_PLACE_TYPE);

        // Fetch user ratings and photos
        await fetchUserRatings();
        await fetchWcPhotos();
      } catch (err) {
        console.error("Error fetching WC data for edit:", err);
        setError(`Failed to load WC details: ${err.message}`);
      } finally {
        setPageLoading(false);
      }
    };

    const fetchUserRatings = async () => {
      try {
        console.log("[fetchUserRatings] Fetching ratings for WC:", wcId);
        const response = await fetch(`/api/wc-ratings?wc_id=${wcId}`);
        const result = await response.json();

        console.log("[fetchUserRatings] API Response:", {
          status: response.status,
          ok: response.ok,
          result,
        });

        if (response.ok) {
          console.log("[fetchUserRatings] Setting ratings data:", {
            ratingsCount: result.ratings?.length || 0,
            averageRating: result.averageRating || 0,
          });

          setAllRatings(result.ratings || []);
          setAverageRating(result.averageRating || 0);

          // Since we removed authentication, reset user rating state
          setUserRating(0);
          setUserComment("");
          setHasUserRating(false);
          console.log(
            "[fetchUserRatings] Reset user rating state for public access",
          );
        } else {
          console.error("[fetchUserRatings] API Error:", result);
        }
      } catch (err) {
        console.error("[fetchUserRatings] Error fetching ratings:", err);
      }
    };

    // Always fetch WC data regardless of authentication status
    fetchWcData();
  }, [wcId, supabase, fetchWcPhotos]); // Re-run if data changes

  // Handle coordinates change from AddressAutocomplete
  const handleCoordinatesChange = (coords) => {
    console.log("[EditWC] handleCoordinatesChange called with:", coords);
    if (coords && coords.lat && coords.lng) {
      console.log("[EditWC] Setting coordinates:", coords);
      setCoordinates(coords);
      setLocation(`${coords.lat},${coords.lng}`);
      console.log(
        "[EditWC] Updated location state:",
        `${coords.lat},${coords.lng}`,
      );
    } else {
      console.warn("[EditWC] Invalid coordinates received:", coords);
    }
  };

  const handleFileChange = async (event) => {
    const file = event.target.files[0];
    if (file) {
      // Validate image file first
      const validation = validateImageFile(file);
      if (!validation.isValid) {
        setError(`Image validation failed: ${validation.errors.join(", ")}`);
        event.target.value = ""; // Clear the input
        return;
      }

      try {
        setError(""); // Clear any previous errors
        setOptimizationInfo(null);
        setImageOptimizing(true);
        console.log("[EditWC] Optimizing image before preview...");

        // Optimize the image for main WC image
        const optimizedFile = await optimizeImage(file, WC_MAIN_IMAGE_CONFIG);

        // Calculate optimization info
        const compressionRatio = (
          (1 - optimizedFile.size / file.size) *
          100
        ).toFixed(1);
        const optimizationResult = {
          originalSize: formatFileSize(file.size),
          optimizedSize: formatFileSize(optimizedFile.size),
          compressionRatio: compressionRatio + "%",
          saved: formatFileSize(file.size - optimizedFile.size),
        };

        setSelectedFile(optimizedFile);
        setOptimizationInfo(optimizationResult);
        setWantsToRemoveImage(false); // If a new file is selected, user doesn't want to "just remove"

        // Create a preview URL with optimized image
        const previewUrl = URL.createObjectURL(optimizedFile);
        setImagePreview(previewUrl);

        console.log("[EditWC] Image optimization complete");
      } catch (optimizationError) {
        console.error("[EditWC] Image optimization failed:", optimizationError);
        setError(`Image optimization failed: ${optimizationError.message}`);
        event.target.value = ""; // Clear the input
      } finally {
        setImageOptimizing(false);
      }
    } else {
      // File selection cancelled
      setSelectedFile(null);
      setImagePreview(currentImageUrl); // Revert preview to current image
    }
  };

  const handleCancelImageChange = () => {
    setSelectedFile(null);
    setImagePreview(currentImageUrl); // Revert preview to the original image URL
    setWantsToRemoveImage(false);
    setOptimizationInfo(null); // Clear optimization info
    const fileInput = document.getElementById("imageFile");
    if (fileInput) fileInput.value = ""; // Reset the file input field
  };

  // Helper function to format file size
  const formatFileSize = (bytes) => {
    if (bytes === 0) return "0 Bytes";
    const k = 1024;
    const sizes = ["Bytes", "KB", "MB", "GB"];
    const i = Math.floor(Math.log(bytes) / Math.log(k));
    return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + " " + sizes[i];
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

    if (!originalWcData) {
      setError("Data missing. Cannot update.");
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
      address: address.trim() || null,
      rating: rating > 0 ? parseInt(rating, 10) : null,
      place_type: placeType,
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

  const handleDeleteWC = async () => {
    setDeleteLoading(true);
    setDeleteError("");

    try {
      const response = await fetch(`/api/wcs/${wcId}`, {
        method: "DELETE",
      });

      const result = await response.json();

      if (!response.ok) {
        throw new Error(result.message || "Failed to delete WC.");
      }

      // Redirect to home page with success message
      router.push("/?status=wc_deleted");
      router.refresh();
    } catch (err) {
      console.error("Client-side error deleting WC:", err);
      setDeleteError(
        err.message || "An unexpected error occurred during deletion.",
      );
    } finally {
      setDeleteLoading(false);
      setShowDeleteConfirm(false);
    }
  };

  const handleAutoSaveRating = async (rating, comment) => {
    if (!rating || rating < 1 || rating > 5) {
      return;
    }

    setRatingError("");
    setRatingLoading(true);

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

      // Refresh ratings
      const ratingsResponse = await fetch(`/api/wc-ratings?wc_id=${wcId}`);
      const ratingsResult = await ratingsResponse.json();

      if (ratingsResponse.ok) {
        setAllRatings(ratingsResult.ratings || []);
        setAverageRating(ratingsResult.averageRating || 0);
      }
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
      return;
    }

    setPhotoUploadLoading(true);
    setPhotoError("");

    try {
      console.log("[EditWC] Validating and optimizing photos...");

      // Validate all files first
      const validationErrors = [];
      files.forEach((file, index) => {
        const validation = validateImageFile(file);
        if (!validation.isValid) {
          validationErrors.push(
            `Photo ${index + 1}: ${validation.errors.join(", ")}`,
          );
        }
      });

      if (validationErrors.length > 0) {
        setPhotoError(
          `Photo validation failed: ${validationErrors.join("; ")}`,
        );
        event.target.value = ""; // Clear the input
        setPhotoUploadLoading(false);
        return;
      }

      // Optimize all images for gallery
      const optimizedFiles = await optimizeImages(files, WC_GALLERY_CONFIG);

      console.log(
        "[EditWC] Photo optimization complete for",
        optimizedFiles.length,
        "photos, starting upload...",
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

      console.log("[EditWC] Photos uploaded successfully");
    } catch (error) {
      console.error("[EditWC] Photo upload failed:", error);
      setPhotoError(`Photo upload failed: ${error.message}`);
      event.target.value = ""; // Clear the input
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

      // Refresh photos
      await fetchWcPhotos();
    } catch (err) {
      console.error("Error deleting photo:", err);
      setPhotoError(err.message || "Failed to delete photo");
    }
  };

  if (pageLoading) {
    return <div style={styles.loadingMessage}>Wczytuje szczegóły WC...</div>;
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
    <div style={styles.formContainer}>
      <div style={{ ...styles.formCard, ...styles.formCardWithBack }}>
        <Link href="/" style={styles.backButton} title="Back to Home">
          <CircleChevronLeft size={24} />
        </Link>
        <h2
          style={{ marginBottom: "25px", color: "#333", textAlign: "center" }}
        >
          {originalWcData.name}
        </h2>
        {error && <p style={styles.formError}>{error}</p>}
        {isOwner ? (
          <form onSubmit={handleSubmit} style={styles.form}>
            <div>
              <label htmlFor="name" style={styles.formLabel}>
                {t("Name")}
              </label>
              <input
                id="name"
                name="name"
                type="text"
                value={name}
                onChange={(e) => setName(e.target.value)}
                required
                style={styles.formInput}
                disabled={formLoading}
              />
            </div>
            <div>
              <label htmlFor="address" style={styles.formLabel}>
                {t("Address")}
              </label>
              <AddressAutocomplete
                value={address}
                onChange={handleAddressChange}
                onCoordinatesChange={handleCoordinatesChange}
                placeholder="Wpisz adres, np. ul. Marszałkowska 1, Warszawa"
                disabled={formLoading}
                style={styles.formInput}
              />
            </div>

            <div className="hidden-div">
              <label htmlFor="location" style={styles.formLabel}>
                {t("Coordinates")}
              </label>
              <input
                id="location"
                name="location"
                type="text"
                value={location}
                onChange={(e) => setLocation(e.target.value)}
                style={styles.formInput}
                placeholder="e.g., 52.2297,21.0122"
                disabled={true}
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
              {coordinates && (
                <p
                  style={{
                    fontSize: "0.75rem",
                    color: "#4CAF50",
                    marginTop: "0.25rem",
                  }}
                >
                  ✓ GPS: {coordinates.lat.toFixed(6)},{" "}
                  {coordinates.lng.toFixed(6)}
                </p>
              )}
            </div>

            <div>
              <label htmlFor="placeType" style={styles.formLabel}>
                {pl.placeType}*
              </label>
              <PlaceTypeSelect
                value={placeType}
                onChange={setPlaceType}
                translations={pl}
                disabled={formLoading}
                required={true}
                placeholder={pl.selectPlaceType}
              />
            </div>

            <div>
              <WCTags wcId={wcId} isEditable={true} />
            </div>

            <div>
              <label style={styles.formLabel}>Zdjęcie</label>
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
                id="imageFileGallery"
                name="imageFileGallery"
                type="file"
                accept="image/*"
                onChange={handleFileChange}
                style={styles.hiddenFileInput}
                disabled={formLoading || imageOptimizing}
              />
              <input
                id="imageFileCamera"
                name="imageFileCamera"
                type="file"
                accept="image/*"
                capture="environment"
                onChange={handleFileChange}
                style={styles.hiddenFileInput}
                disabled={formLoading || imageOptimizing}
              />
              <button
                type="button"
                onClick={() => {
                  if (isMobile) {
                    setShowSourceSelector(true);
                  } else {
                    document.getElementById("imageFileGallery").click();
                  }
                }}
                style={{
                  ...styles.photoButton,
                  opacity: formLoading || imageOptimizing ? 0.6 : 1,
                  cursor:
                    formLoading || imageOptimizing ? "not-allowed" : "pointer",
                }}
                disabled={formLoading || imageOptimizing}
              >
                <Camera size={16} style={{ marginRight: "8px" }} />
                📷 Dodaj zdjęcie
              </button>

              {/* Mobile source selector for main image */}
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
                          document.getElementById("imageFileCamera").click();
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
                        disabled={formLoading || imageOptimizing}
                      >
                        <Camera size={24} style={{ marginBottom: "8px" }} />
                        <span style={{ fontWeight: "600" }}>Aparat</span>
                      </button>
                      <button
                        onClick={() => {
                          document.getElementById("imageFileGallery").click();
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
                        disabled={formLoading || imageOptimizing}
                      >
                        <ImageIcon size={24} style={{ marginBottom: "8px" }} />
                        <span style={{ fontWeight: "600" }}>Galeria</span>
                      </button>
                    </div>
                  </div>
                </div>
              )}

              {/* Image optimization loading state */}
              {imageOptimizing && (
                <div
                  style={{
                    textAlign: "center",
                    color: "#666",
                    fontSize: "0.9rem",
                    marginTop: "10px",
                  }}
                >
                  🔄 Optimizing image...
                </div>
              )}

              {/* Image optimization info */}
              {optimizationInfo && (
                <div
                  style={{
                    backgroundColor: "#e8f5e8",
                    border: "1px solid #c3e6c3",
                    borderRadius: "4px",
                    padding: "10px",
                    marginTop: "10px",
                    fontSize: "0.85rem",
                    color: "#2e7d32",
                  }}
                >
                  <div style={{ fontWeight: "bold", marginBottom: "5px" }}>
                    ✅ Image optimized successfully
                  </div>
                  <div>Original: {optimizationInfo.originalSize}</div>
                  <div>Optimized: {optimizationInfo.optimizedSize}</div>
                  <div>Compressed: {optimizationInfo.compressionRatio}</div>
                  <div>Saved: {optimizationInfo.saved}</div>
                </div>
              )}
              <div style={styles.imageActionsContainer}>
                {selectedFile && (
                  <button
                    type="button"
                    onClick={handleCancelImageChange}
                    style={{
                      ...styles.formButton,
                      ...styles.cancelImageChangeButton,
                    }}
                    disabled={formLoading}
                  >
                    Cancel Image Change
                  </button>
                )}
              </div>
            </div>
            <div>
              <label htmlFor="rating" style={styles.formLabel}>
                Rating ({rating} / 5)
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
                          starValue <= (hoverRating || rating)
                            ? "#ffc107"
                            : "#e4e5e9",
                        cursor: "pointer",
                      }}
                      onClick={() => !formLoading && setRating(starValue)}
                      onMouseEnter={() =>
                        !formLoading && setHoverRating(starValue)
                      }
                      onMouseLeave={() => !formLoading && setHoverRating(0)}
                      role="button"
                      tabIndex={formLoading ? -1 : 0}
                      onKeyDown={(e) => {
                        if (
                          !formLoading &&
                          (e.key === "Enter" || e.key === " ")
                        )
                          setRating(starValue);
                      }}
                      aria-label={`Rate ${starValue} out of 5 stars`}
                      aria-disabled={formLoading}
                    >
                      ★
                    </span>
                  );
                })}
              </div>
            </div>
            <button
              type="submit"
              style={{ ...styles.formButton, ...styles.submitButton }}
              disabled={formLoading || !supabase}
            >
              {formLoading ? "Updating..." : "Update WC"}
            </button>

            {/* Delete WC Button - now available for all users */}
            {true && (
              <>
                {deleteError && <p style={styles.formError}>{deleteError}</p>}
                <button
                  type="button"
                  onClick={() => setShowDeleteConfirm(true)}
                  style={{ ...styles.formButton, ...styles.deleteButton }}
                  disabled={deleteLoading || formLoading}
                >
                  {deleteLoading ? "Usuwanie..." : "Usuń WC"}
                </button>
              </>
            )}
          </form>
        ) : (
          <div style={styles.form}>
            <div>
              <label style={styles.formLabel}>{t("Name")}</label>
              <div className="viewText">{name}</div>
            </div>

            <div>
              <label style={styles.formLabel}>{t("Address")}</label>
              <div className={address ? "viewText" : "viewTextEmpty"}>
                {address || "Nie podano"}
              </div>
            </div>

            <div>
              <label style={styles.formLabel}>{pl.placeType}</label>
              <div className="viewText">
                <PlaceTypeDisplay
                  placeType={placeType || "toilet"}
                  showIcon={true}
                  showText={true}
                  iconSize={18}
                />
              </div>
            </div>

            <div>
              <label style={styles.formLabel}>Zdjęcie</label>
              {imagePreview ? (
                <div className="image-preview" style={{ marginTop: "10px" }}>
                  <Image
                    src={imagePreview}
                    alt="WC Preview"
                    width={200}
                    height={200}
                    style={styles.imagePreview}
                  />
                </div>
              ) : (
                <div className="viewTextEmpty">Brak zdjęcia</div>
              )}
            </div>
            <div>
              <label style={styles.formLabel}>
                Ocena średnia ({rating} / 5):
              </label>
              <div style={styles.starRatingContainer}>
                {[...Array(5)].map((_, index) => {
                  const starValue = index + 1;
                  return (
                    <span
                      key={starValue}
                      style={{
                        ...styles.star,
                        color: starValue <= rating ? "#ffc107" : "#e4e5e9",
                        cursor: "default",
                      }}
                    >
                      ★
                    </span>
                  );
                })}
              </div>
            </div>
          </div>
        )}

        {/* User Rating Section */}
        <div
          style={{
            marginTop: "2rem",
            borderTop: "1px solid #ddd",
            paddingTop: "2rem",
          }}
        >
          {/* Removed login requirement - allow all users to rate and comment */}
          {true && (
            <>
              <h3 style={{ marginBottom: "1rem", color: "#333" }}>
                {t("YourRating")} ({userRating} / 5)
              </h3>

              {ratingError && <p style={styles.formError}>{ratingError}</p>}

              <div style={styles.form}>
                <div>
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
                          onKeyDown={(e) => {
                            if (
                              !ratingLoading &&
                              (e.key === "Enter" || e.key === " ")
                            ) {
                              setUserRating(starValue);
                              handleAutoSaveRating(starValue, userComment);
                            }
                          }}
                          aria-label={`Rate ${starValue} out of 5 stars`}
                          aria-disabled={ratingLoading}
                        >
                          ★
                        </span>
                      );
                    })}
                  </div>
                </div>

                <div>
                  <label htmlFor="userComment" style={styles.formLabel}>
                    {t("optionalComment")}
                  </label>
                  <textarea
                    id="userComment"
                    name="userComment"
                    value={userComment}
                    onChange={(e) => {
                      setUserComment(e.target.value);
                      handleAutoSaveRatingDebounced(userRating, e.target.value);
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
                  {" "}
                  <input
                    id="wcPhotosGallery"
                    name="wcPhotosGallery"
                    type="file"
                    accept="image/*"
                    multiple
                    onChange={handlePhotoSelection}
                    style={styles.hiddenFileInput}
                    disabled={photoUploadLoading}
                  />
                  <input
                    id="wcPhotosCamera"
                    name="wcPhotosCamera"
                    type="file"
                    accept="image/*"
                    multiple
                    capture="environment"
                    onChange={handlePhotoSelection}
                    style={styles.hiddenFileInput}
                    disabled={photoUploadLoading}
                  />
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
                  <button
                    type="button"
                    onClick={() => {
                      if (isMobile) {
                        setShowPhotoSourceSelector(true);
                      } else {
                        document.getElementById("wcPhotosGallery").click();
                      }
                    }}
                    style={{
                      ...styles.photoButton,
                      opacity: photoUploadLoading ? 0.6 : 1,
                      cursor: photoUploadLoading ? "not-allowed" : "pointer",
                    }}
                    disabled={photoUploadLoading}
                  >
                    📷 Dodaj zdjęcia
                  </button>
                  {/* Mobile source selector for gallery photos */}
                  {showPhotoSourceSelector && isMobile && (
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
                      onClick={() => setShowPhotoSourceSelector(false)}
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
                            onClick={() => setShowPhotoSourceSelector(false)}
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
                              document.getElementById("wcPhotosCamera").click();
                              setShowPhotoSourceSelector(false);
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
                            disabled={photoUploadLoading}
                          >
                            <Camera size={24} style={{ marginBottom: "8px" }} />
                            <span style={{ fontWeight: "600" }}>Aparat</span>
                          </button>
                          <button
                            onClick={() => {
                              document
                                .getElementById("wcPhotosGallery")
                                .click();
                              setShowPhotoSourceSelector(false);
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
                            disabled={photoUploadLoading}
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
                  {photoUploadLoading && (
                    <div style={{ marginTop: "10px", textAlign: "center" }}>
                      <p style={{ color: "#007bff", fontSize: "0.9rem" }}>
                        📤 Uploading photos...
                      </p>
                    </div>
                  )}
                  {photoError && (
                    <p style={{ ...styles.formError, marginTop: "5px" }}>
                      {photoError}
                    </p>
                  )}
                </div>
              </div>
            </>
          )}
        </div>

        {/* Photo Gallery Section */}
        <div
          style={{
            marginTop: "2rem",
            borderTop: "1px solid #ddd",
            paddingTop: "2rem",
          }}
        >
          <h3 style={{ marginBottom: "1rem", color: "#333" }}>
            Galeria zdjęć ({wcPhotos.length})
          </h3>

          {photosLoading ? (
            <p style={{ textAlign: "center", color: "#666" }}>
              Loading photos...
            </p>
          ) : wcPhotos.length > 0 ? (
            <div style={styles.photoGallery}>
              {wcPhotos.map((photo) => (
                <div
                  key={photo.id}
                  style={styles.photoCard}
                  onMouseEnter={(e) => {
                    e.currentTarget.style.transform = "scale(1.02)";
                    e.currentTarget.style.boxShadow =
                      "0 4px 12px rgba(0,0,0,0.15)";
                  }}
                  onMouseLeave={(e) => {
                    e.currentTarget.style.transform = "scale(1)";
                    e.currentTarget.style.boxShadow = "none";
                  }}
                >
                  <Image
                    src={photo.photo}
                    alt="WC Photo"
                    width={200}
                    height={200}
                    style={styles.photoImage}
                  />
                  <div style={styles.photoInfo}>
                    <div>By: {photo.user_email || "Anonymous"}</div>
                    <div>{new Date(photo.created_at).toLocaleDateString()}</div>
                    {true && (
                      <button
                        onClick={() => handleDeletePhoto(photo.id)}
                        style={styles.deletePhotoButton}
                      >
                        Delete
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
              Brak zdjęć. Bądź pierwszy, który doda jedno!
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
              Wszystkie Oceny ({allRatings.length}) - Średnia:{" "}
              {averageRating.toFixed(1)}
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
                        starValue <= Math.round(averageRating)
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
                      <strong>{rating.user_email || "Anonymous"}</strong>
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
      </div>

      {/* Delete Confirmation Modal */}
      {showDeleteConfirm && (
        <div style={styles.modalOverlay}>
          <div style={styles.modalContent}>
            <h3 style={styles.modalTitle}>Potwierdź usunięcie</h3>
            <p style={styles.modalText}>
              Czy na pewno chcesz usunąć to WC:{" "}
              <strong>{originalWcData?.name}</strong>?
              <br />
              <br />
              Ta operacja jest nieodwracalna i usunie wszystkie powiązane
              zdjęcia, oceny i komentarze.
            </p>
            <div style={styles.modalButtons}>
              <button
                style={{ ...styles.modalButton, ...styles.modalCancelButton }}
                onClick={() => setShowDeleteConfirm(false)}
                disabled={deleteLoading}
              >
                Anuluj
              </button>
              <button
                style={{ ...styles.modalButton, ...styles.modalConfirmButton }}
                onClick={handleDeleteWC}
                disabled={deleteLoading}
              >
                {deleteLoading ? "Usuwanie..." : "Usuń WC"}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
