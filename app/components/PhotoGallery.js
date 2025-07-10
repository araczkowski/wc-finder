"use client";

import { useState, useEffect, useCallback } from "react";
import Image from "next/image";
import { X, ChevronLeft, ChevronRight } from "lucide-react";

export default function PhotoGallery({
  images = [],
  isOpen = false,
  onClose,
  initialIndex = 0,
  showThumbnails = true,
}) {
  const [currentIndex, setCurrentIndex] = useState(initialIndex);
  const [isLoading, setIsLoading] = useState(true);
  const [touchStart, setTouchStart] = useState(null);
  const [touchEnd, setTouchEnd] = useState(null);
  const [isVisible, setIsVisible] = useState(false);

  // Update current index when initialIndex changes
  useEffect(() => {
    setCurrentIndex(initialIndex);
  }, [initialIndex]);

  // Handle visibility animation
  useEffect(() => {
    if (isOpen) {
      setIsVisible(true);
    } else {
      const timer = setTimeout(() => setIsVisible(false), 300);
      return () => clearTimeout(timer);
    }
  }, [isOpen]);

  const goToNext = useCallback(() => {
    setCurrentIndex((prevIndex) =>
      prevIndex === images.length - 1 ? 0 : prevIndex + 1,
    );
    setIsLoading(true);
  }, [images.length]);

  const goToPrevious = useCallback(() => {
    setCurrentIndex((prevIndex) =>
      prevIndex === 0 ? images.length - 1 : prevIndex - 1,
    );
    setIsLoading(true);
  }, [images.length]);

  // Keyboard navigation
  useEffect(() => {
    const handleKeyDown = (e) => {
      if (!isOpen) return;

      switch (e.key) {
        case "Escape":
          onClose();
          break;
        case "ArrowLeft":
          goToPrevious();
          break;
        case "ArrowRight":
          goToNext();
          break;
        default:
          break;
      }
    };

    if (isOpen) {
      document.addEventListener("keydown", handleKeyDown);
      document.body.style.overflow = "hidden";
    }

    return () => {
      document.removeEventListener("keydown", handleKeyDown);
      document.body.style.overflow = "auto";
    };
  }, [isOpen, currentIndex, onClose, goToPrevious, goToNext]);

  const goToIndex = useCallback((index) => {
    setCurrentIndex(index);
    setIsLoading(true);
  }, []);

  // Handle touch gestures
  const minSwipeDistance = 50;

  const onTouchStart = (e) => {
    setTouchEnd(null);
    setTouchStart(e.targetTouches[0].clientX);
  };

  const onTouchMove = (e) => {
    setTouchEnd(e.targetTouches[0].clientX);
  };

  const onTouchEnd = () => {
    if (!touchStart || !touchEnd) return;

    const distance = touchStart - touchEnd;
    const isLeftSwipe = distance > minSwipeDistance;
    const isRightSwipe = distance < -minSwipeDistance;

    if (isLeftSwipe && images.length > 1) {
      goToNext();
    }
    if (isRightSwipe && images.length > 1) {
      goToPrevious();
    }
  };

  if (!isVisible || !images.length) return null;

  const currentImage = images[currentIndex];

  return (
    <div
      style={{
        position: "fixed",
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
        backgroundColor: "rgba(0, 0, 0, 0.95)",
        zIndex: 10000,
        display: "flex",
        flexDirection: "column",
        alignItems: "center",
        justifyContent: "center",
        padding: "20px",
        opacity: isOpen ? 1 : 0,
        transition: "opacity 0.3s ease-in-out",
      }}
      onClick={onClose}
    >
      {/* Close button */}
      <button
        onClick={onClose}
        style={{
          position: "absolute",
          top: "20px",
          right: "20px",
          background: "rgba(255, 255, 255, 0.2)",
          border: "none",
          borderRadius: "50%",
          width: "50px",
          height: "50px",
          display: "flex",
          alignItems: "center",
          justifyContent: "center",
          cursor: "pointer",
          color: "white",
          fontSize: "24px",
          transition: "background-color 0.3s",
          zIndex: 10001,
        }}
        onMouseEnter={(e) =>
          (e.target.style.backgroundColor = "rgba(255, 255, 255, 0.3)")
        }
        onMouseLeave={(e) =>
          (e.target.style.backgroundColor = "rgba(255, 255, 255, 0.2)")
        }
      >
        <X size={24} />
      </button>

      {/* Image counter */}
      <div
        style={{
          position: "absolute",
          top: "20px",
          left: "20px",
          color: "white",
          fontSize: "16px",
          fontWeight: "500",
          background: "rgba(0, 0, 0, 0.5)",
          padding: "8px 16px",
          borderRadius: "20px",
          zIndex: 10001,
        }}
      >
        {currentIndex + 1} / {images.length}
      </div>

      {/* Keyboard hints */}
      <div
        style={{
          position: "absolute",
          top: "60px",
          left: "20px",
          color: "white",
          fontSize: "12px",
          background: "rgba(0, 0, 0, 0.5)",
          padding: "6px 12px",
          borderRadius: "15px",
          zIndex: 10001,
          opacity: 0.8,
        }}
      >
        ← → do nawigacji • ESC do zamknięcia • przeciągnij palcem
      </div>

      {/* Navigation buttons */}
      {images.length > 1 && (
        <>
          <button
            onClick={(e) => {
              e.stopPropagation();
              goToPrevious();
            }}
            style={{
              position: "absolute",
              left: "20px",
              top: "50%",
              transform: "translateY(-50%)",
              background: "rgba(255, 255, 255, 0.2)",
              border: "none",
              borderRadius: "50%",
              width: "60px",
              height: "60px",
              display: "flex",
              alignItems: "center",
              justifyContent: "center",
              cursor: "pointer",
              color: "white",
              transition: "background-color 0.3s",
              zIndex: 10001,
            }}
            onMouseEnter={(e) =>
              (e.target.style.backgroundColor = "rgba(255, 255, 255, 0.3)")
            }
            onMouseLeave={(e) =>
              (e.target.style.backgroundColor = "rgba(255, 255, 255, 0.2)")
            }
          >
            <ChevronLeft size={30} />
          </button>

          <button
            onClick={(e) => {
              e.stopPropagation();
              goToNext();
            }}
            style={{
              position: "absolute",
              right: "20px",
              top: "50%",
              transform: "translateY(-50%)",
              background: "rgba(255, 255, 255, 0.2)",
              border: "none",
              borderRadius: "50%",
              width: "60px",
              height: "60px",
              display: "flex",
              alignItems: "center",
              justifyContent: "center",
              cursor: "pointer",
              color: "white",
              transition: "background-color 0.3s",
              zIndex: 10001,
            }}
            onMouseEnter={(e) =>
              (e.target.style.backgroundColor = "rgba(255, 255, 255, 0.3)")
            }
            onMouseLeave={(e) =>
              (e.target.style.backgroundColor = "rgba(255, 255, 255, 0.2)")
            }
          >
            <ChevronRight size={30} />
          </button>
        </>
      )}

      {/* Main image */}
      <div
        style={{
          position: "relative",
          maxWidth: "90vw",
          maxHeight: showThumbnails ? "70vh" : "80vh",
          width: "100%",
          height: "100%",
          display: "flex",
          alignItems: "center",
          justifyContent: "center",
        }}
        onClick={(e) => e.stopPropagation()}
        onTouchStart={onTouchStart}
        onTouchMove={onTouchMove}
        onTouchEnd={onTouchEnd}
      >
        {isLoading && (
          <div
            style={{
              position: "absolute",
              top: "50%",
              left: "50%",
              transform: "translate(-50%, -50%)",
              color: "white",
              fontSize: "18px",
            }}
          >
            Ładowanie...
          </div>
        )}

        <Image
          src={currentImage.url || currentImage.photo || currentImage}
          alt={currentImage.alt || `Zdjęcie ${currentIndex + 1}`}
          width={800}
          height={600}
          style={{
            maxWidth: "100%",
            maxHeight: "100%",
            objectFit: "contain",
            borderRadius: "8px",
            boxShadow: "0 4px 20px rgba(0, 0, 0, 0.5)",
            opacity: isLoading ? 0.5 : 1,
            transition: "opacity 0.3s ease-in-out",
          }}
          onLoad={() => setIsLoading(false)}
          onError={() => setIsLoading(false)}
        />
      </div>

      {/* Thumbnails */}
      {showThumbnails && images.length > 1 && (
        <div
          style={{
            position: "absolute",
            bottom: "20px",
            left: "50%",
            transform: "translateX(-50%)",
            display: "flex",
            gap: "10px",
            maxWidth: "90vw",
            overflowX: "auto",
            padding: "10px",
            backgroundColor: "rgba(0, 0, 0, 0.5)",
            borderRadius: "10px",
            zIndex: 10001,
          }}
          onClick={(e) => e.stopPropagation()}
        >
          {images.map((image, index) => (
            <div
              key={index}
              onClick={() => goToIndex(index)}
              style={{
                position: "relative",
                width: "60px",
                height: "45px",
                cursor: "pointer",
                border:
                  index === currentIndex
                    ? "2px solid #007bff"
                    : "2px solid transparent",
                borderRadius: "6px",
                overflow: "hidden",
                flexShrink: 0,
                transition: "border-color 0.3s",
                opacity: index === currentIndex ? 1 : 0.7,
              }}
              onMouseEnter={(e) => {
                if (index !== currentIndex) {
                  e.target.style.opacity = "1";
                }
              }}
              onMouseLeave={(e) => {
                if (index !== currentIndex) {
                  e.target.style.opacity = "0.7";
                }
              }}
            >
              <Image
                src={image.url || image.photo || image}
                alt={`Miniatura ${index + 1}`}
                width={60}
                height={45}
                style={{
                  width: "100%",
                  height: "100%",
                  objectFit: "cover",
                }}
              />
            </div>
          ))}
        </div>
      )}
    </div>
  );
}
