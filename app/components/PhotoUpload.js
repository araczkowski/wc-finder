"use client";

import { useState, useRef, useEffect } from "react";
import { useSession } from "next-auth/react";
import {
  Camera,
  Upload,
  X,
  Check,
  AlertCircle,
  Image as ImageIcon,
} from "lucide-react";

const PhotoUpload = ({ wcId, onPhotoUploaded, disabled = false }) => {
  const { data: session } = useSession();
  const [uploading, setUploading] = useState(false);
  const [optimizing, setOptimizing] = useState(false);
  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");
  const [uploadProgress, setUploadProgress] = useState(0);
  const [optimizationInfo, setOptimizationInfo] = useState(null);
  const [showSourceSelector, setShowSourceSelector] = useState(false);
  const [isMobile, setIsMobile] = useState(false);
  const fileInputRef = useRef(null);
  const cameraInputRef = useRef(null);

  // Image optimization configuration
  const WC_GALLERY_CONFIG = {
    maxWidth: 800,
    maxHeight: 600,
    quality: 0.8,
    format: "webp",
    enableResize: true,
    enableCompress: true,
    enableFormat: true,
  };

  // Validate image file
  const validateImageFile = (file) => {
    const errors = [];
    const allowedTypes = ["image/jpeg", "image/jpg", "image/png", "image/webp"];
    const maxSize = 10 * 1024 * 1024; // 10MB

    if (!allowedTypes.includes(file.type)) {
      errors.push("Dozwolone są tylko pliki JPEG, PNG i WebP");
    }

    if (file.size > maxSize) {
      errors.push("Rozmiar pliku musi być mniejszy niż 10MB");
    }

    if (file.size === 0) {
      errors.push("Plik jest pusty");
    }

    return {
      isValid: errors.length === 0,
      errors,
    };
  };

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

  // Format file size
  const formatFileSize = (bytes) => {
    if (bytes === 0) return "0 Bytes";
    const k = 1024;
    const sizes = ["Bytes", "KB", "MB", "GB"];
    const i = Math.floor(Math.log(bytes) / Math.log(k));
    return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + " " + sizes[i];
  };

  // Image optimization function
  const optimizeImage = (file, config) => {
    return new Promise((resolve, reject) => {
      const canvas = document.createElement("canvas");
      const ctx = canvas.getContext("2d");
      const img = new Image();

      img.onload = () => {
        // Calculate new dimensions
        let { width, height } = img;
        const maxWidth = config.maxWidth || 800;
        const maxHeight = config.maxHeight || 600;

        if (config.enableResize) {
          const ratio = Math.min(maxWidth / width, maxHeight / height);
          if (ratio < 1) {
            width = Math.round(width * ratio);
            height = Math.round(height * ratio);
          }
        }

        // Set canvas dimensions
        canvas.width = width;
        canvas.height = height;

        // Draw and compress image
        ctx.drawImage(img, 0, 0, width, height);

        // Convert to blob
        const outputFormat = config.enableFormat ? "image/webp" : file.type;
        const quality = config.enableCompress ? config.quality || 0.8 : 1;

        canvas.toBlob(
          (blob) => {
            if (blob) {
              // Create new file with same name but potentially different extension
              const newFileName = config.enableFormat
                ? file.name.replace(/\.[^/.]+$/, ".webp")
                : file.name;

              const optimizedFile = new File([blob], newFileName, {
                type: outputFormat,
                lastModified: Date.now(),
              });

              resolve(optimizedFile);
            } else {
              reject(new Error("Nie udało się zoptymalizować zdjęcia"));
            }
          },
          outputFormat,
          quality,
        );
      };

      img.onerror = () => reject(new Error("Nie udało się wczytać zdjęcia"));
      img.src = URL.createObjectURL(file);
    });
  };

  // Optimize multiple images
  const optimizeImages = async (files, config) => {
    const optimizedFiles = [];

    for (let i = 0; i < files.length; i++) {
      const file = files[i];
      setUploadProgress(((i + 1) / files.length) * 50); // First 50% for optimization

      try {
        const optimizedFile = await optimizeImage(file, config);
        optimizedFiles.push(optimizedFile);
      } catch (error) {
        console.error(`Błąd optymalizacji pliku ${file.name}:`, error);
        // Use original file if optimization fails
        optimizedFiles.push(file);
      }
    }

    return optimizedFiles;
  };

  // Handle file selection and upload
  const handleFileSelection = async (event) => {
    const files = Array.from(event.target.files);

    if (files.length === 0) {
      setError("");
      setOptimizationInfo(null);
      return;
    }

    if (!session?.user?.id) {
      setError("Musisz być zalogowany, aby dodać zdjęcia");
      return;
    }

    setUploading(true);
    setOptimizing(true);
    setError("");
    setSuccess("");
    setUploadProgress(0);
    setOptimizationInfo(null);

    try {
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
        setError(
          `Walidacja zdjęć nie powiodła się: ${validationErrors.join("; ")}`,
        );
        event.target.value = "";
        return;
      }

      // Calculate original total size
      const originalTotalSize = files.reduce((sum, file) => sum + file.size, 0);

      // Optimize all images
      const optimizedFiles = await optimizeImages(files, WC_GALLERY_CONFIG);

      // Calculate optimization results
      const optimizedTotalSize = optimizedFiles.reduce(
        (sum, file) => sum + file.size,
        0,
      );
      const compressionRatio =
        ((originalTotalSize - optimizedTotalSize) / originalTotalSize) * 100;

      setOptimizationInfo({
        originalSize: formatFileSize(originalTotalSize),
        optimizedSize: formatFileSize(optimizedTotalSize),
        compressionRatio: compressionRatio.toFixed(1),
        fileCount: files.length,
      });

      setOptimizing(false);
      setUploadProgress(50);

      // Upload optimized files
      const uploadPromises = optimizedFiles.map(async (file, index) => {
        const formData = new FormData();
        formData.append("wc_id", wcId);
        formData.append("photo", file);

        const response = await fetch("/api/wc-photos", {
          method: "POST",
          body: formData,
        });

        const result = await response.json();
        if (!response.ok) {
          throw new Error(
            result.error || `Nie udało się przesłać zdjęcia ${index + 1}`,
          );
        }

        // Update progress
        setUploadProgress(50 + ((index + 1) / optimizedFiles.length) * 50);
        return result;
      });

      const results = await Promise.all(uploadPromises);

      setSuccess(
        `Pomyślnie dodano ${results.length} ${results.length === 1 ? "zdjęcie" : "zdjęć"}!`,
      );

      // Clear form
      event.target.value = "";

      // Notify parent component
      if (onPhotoUploaded) {
        onPhotoUploaded(results);
      }

      // Auto-hide success message
      setTimeout(() => setSuccess(""), 3000);
    } catch (error) {
      console.error("Błąd przesyłania zdjęć:", error);
      setError(`Przesyłanie zdjęć nie powiodło się: ${error.message}`);
      event.target.value = "";
    } finally {
      setOptimizing(false);
      setUploading(false);
      setUploadProgress(0);
    }
  };

  const handleButtonClick = () => {
    if (isMobile) {
      setShowSourceSelector(true);
    } else {
      if (fileInputRef.current) {
        fileInputRef.current.click();
      }
    }
  };

  const handleCameraClick = () => {
    if (cameraInputRef.current) {
      cameraInputRef.current.click();
    }
    setShowSourceSelector(false);
  };

  const handleGalleryClick = () => {
    if (fileInputRef.current) {
      fileInputRef.current.click();
    }
    setShowSourceSelector(false);
  };

  const isDisabled = disabled || uploading || optimizing || !session?.user?.id;

  return (
    <div style={styles.container}>
      {/* Gallery input */}
      <input
        ref={fileInputRef}
        type="file"
        multiple
        accept="image/*"
        onChange={handleFileSelection}
        style={styles.hiddenInput}
        disabled={isDisabled}
      />

      {/* Camera input for mobile */}
      <input
        ref={cameraInputRef}
        type="file"
        multiple
        accept="image/*"
        capture="environment"
        onChange={handleFileSelection}
        style={styles.hiddenInput}
        disabled={isDisabled}
      />

      {/* Main upload button */}
      <button
        type="button"
        onClick={handleButtonClick}
        disabled={isDisabled}
        style={{
          ...styles.uploadButton,
          opacity: isDisabled ? 0.6 : 1,
          cursor: isDisabled ? "not-allowed" : "pointer",
        }}
      >
        <Camera size={16} style={{ marginRight: "6px" }} />
        {uploading ? "Przesyłanie..." : "Dodaj zdjęcia"}
      </button>

      {/* Mobile source selector */}
      {showSourceSelector && isMobile && (
        <div
          style={styles.sourceSelector}
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
            <div style={styles.selectorHeader}>
              <span style={styles.selectorTitle}>Wybierz źródło zdjęć</span>
              <button
                onClick={() => setShowSourceSelector(false)}
                style={styles.closeButton}
              >
                <X size={16} />
              </button>
            </div>
            <div style={styles.selectorButtons}>
              <button
                onClick={handleCameraClick}
                style={styles.sourceButton}
                disabled={isDisabled}
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
              >
                <Camera size={24} style={{ marginBottom: "8px" }} />
                <span style={{ fontWeight: "600" }}>Aparat</span>
              </button>
              <button
                onClick={handleGalleryClick}
                style={styles.sourceButton}
                disabled={isDisabled}
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
              >
                <ImageIcon size={24} style={{ marginBottom: "8px" }} />
                <span style={{ fontWeight: "600" }}>Galeria</span>
              </button>
            </div>
          </div>
        </div>
      )}

      {!session?.user?.id && (
        <div style={styles.loginPrompt}>
          <AlertCircle size={14} style={{ marginRight: "4px" }} />
          Zaloguj się, aby dodać zdjęcia
        </div>
      )}

      {optimizing && (
        <div style={styles.optimizingMessage}>
          <div style={styles.progressBar}>
            <div
              style={{
                ...styles.progressFill,
                width: `${uploadProgress}%`,
              }}
            />
          </div>
          <div style={styles.progressText}>
            🔄{" "}
            {uploadProgress < 50
              ? "Optymalizowanie zdjęć..."
              : "Przesyłanie zdjęć..."}
          </div>
        </div>
      )}

      {optimizationInfo && (
        <div style={styles.optimizationInfo}>
          <div style={styles.optimizationTitle}>
            <Check size={16} style={{ marginRight: "6px", color: "#28a745" }} />
            Optymalizacja zakończona
          </div>
          <div style={styles.optimizationDetails}>
            <div>📊 Zdjęć: {optimizationInfo.fileCount}</div>
            <div>📏 Rozmiar oryginalny: {optimizationInfo.originalSize}</div>
            <div>
              ⚡ Rozmiar po optymalizacji: {optimizationInfo.optimizedSize}
            </div>
            <div>🎯 Kompresja: {optimizationInfo.compressionRatio}%</div>
          </div>
        </div>
      )}

      {error && (
        <div style={styles.errorMessage}>
          <AlertCircle size={16} style={{ marginRight: "6px" }} />
          {error}
        </div>
      )}

      {success && (
        <div style={styles.successMessage}>
          <Check size={16} style={{ marginRight: "6px" }} />
          {success}
        </div>
      )}
    </div>
  );
};

const styles = {
  container: {
    marginBottom: "15px",
  },
  hiddenInput: {
    display: "none",
  },
  uploadButton: {
    display: "flex",
    alignItems: "center",
    justifyContent: "center",
    width: "100%",
    padding: "12px 16px",
    backgroundColor: "#007bff",
    color: "white",
    border: "none",
    borderRadius: "6px",
    fontSize: "14px",
    fontWeight: "500",
    transition: "all 0.2s ease",
    cursor: "pointer",
  },
  loginPrompt: {
    display: "flex",
    alignItems: "center",
    justifyContent: "center",
    marginTop: "8px",
    fontSize: "12px",
    color: "#666",
    fontStyle: "italic",
  },
  optimizingMessage: {
    marginTop: "10px",
    padding: "12px",
    backgroundColor: "#e3f2fd",
    border: "1px solid #2196F3",
    borderRadius: "6px",
    fontSize: "14px",
    color: "#1976d2",
  },
  progressBar: {
    width: "100%",
    height: "4px",
    backgroundColor: "#e0e0e0",
    borderRadius: "2px",
    overflow: "hidden",
    marginBottom: "8px",
  },
  progressFill: {
    height: "100%",
    backgroundColor: "#2196F3",
    transition: "width 0.3s ease",
  },
  progressText: {
    fontSize: "12px",
    textAlign: "center",
  },
  optimizationInfo: {
    marginTop: "10px",
    padding: "12px",
    backgroundColor: "#f0fff4",
    border: "1px solid #28a745",
    borderRadius: "6px",
    fontSize: "12px",
    color: "#155724",
  },
  optimizationTitle: {
    display: "flex",
    alignItems: "center",
    fontWeight: "500",
    marginBottom: "8px",
  },
  optimizationDetails: {
    display: "grid",
    gridTemplateColumns: "1fr 1fr",
    gap: "4px",
    fontSize: "11px",
  },
  errorMessage: {
    display: "flex",
    alignItems: "center",
    marginTop: "10px",
    padding: "12px",
    backgroundColor: "#f8d7da",
    border: "1px solid #f5c6cb",
    borderRadius: "6px",
    fontSize: "14px",
    color: "#721c24",
  },
  successMessage: {
    display: "flex",
    alignItems: "center",
    marginTop: "10px",
    padding: "12px",
    backgroundColor: "#d4edda",
    border: "1px solid #c3e6cb",
    borderRadius: "6px",
    fontSize: "14px",
    color: "#155724",
  },
  sourceSelector: {
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
  },
  selectorHeader: {
    display: "flex",
    justifyContent: "space-between",
    alignItems: "center",
    padding: "16px 20px",
    borderBottom: "1px solid #e9ecef",
  },
  selectorTitle: {
    fontSize: "16px",
    fontWeight: "600",
    color: "#333",
  },
  closeButton: {
    background: "none",
    border: "none",
    cursor: "pointer",
    padding: "4px",
    color: "#666",
    borderRadius: "4px",
  },
  selectorButtons: {
    display: "flex",
    gap: "16px",
    padding: "24px 20px",
    justifyContent: "center",
  },
  sourceButton: {
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
  },
};

export default PhotoUpload;
