"use client";

import { useState, useEffect, useRef, useCallback } from "react";
import Image from "next/image";

const ImageSlideshow = ({ images, alt, className, width, height }) => {
  const [currentIndex, setCurrentIndex] = useState(0);
  const [isAutoPlaying, setIsAutoPlaying] = useState(true);
  const [touchStart, setTouchStart] = useState(null);
  const [touchEnd, setTouchEnd] = useState(null);
  const [isFocused, setIsFocused] = useState(false);
  const containerRef = useRef(null);

  // Minimum swipe distance (in px)
  const minSwipeDistance = 50;

  // Handle manual navigation
  const goToNext = useCallback(() => {
    setIsAutoPlaying(false);
    setCurrentIndex((prevIndex) =>
      prevIndex === images.length - 1 ? 0 : prevIndex + 1,
    );
    // Resume auto-play after 5 seconds
    setTimeout(() => setIsAutoPlaying(true), 5000);
  }, [images.length]);

  const goToPrevious = useCallback(() => {
    setIsAutoPlaying(false);
    setCurrentIndex((prevIndex) =>
      prevIndex === 0 ? images.length - 1 : prevIndex - 1,
    );
    // Resume auto-play after 5 seconds
    setTimeout(() => setIsAutoPlaying(true), 5000);
  }, [images.length]);

  const goToSlide = useCallback((index) => {
    setIsAutoPlaying(false);
    setCurrentIndex(index);
    // Resume auto-play after 5 seconds
    setTimeout(() => setIsAutoPlaying(true), 5000);
  }, []);

  // Auto-advance slideshow every 3 seconds
  useEffect(() => {
    if (!images || images.length <= 1 || !isAutoPlaying) return;

    const interval = setInterval(() => {
      setCurrentIndex((prevIndex) =>
        prevIndex === images.length - 1 ? 0 : prevIndex + 1,
      );
    }, 3000);

    return () => clearInterval(interval);
  }, [images, isAutoPlaying]);

  // Keyboard navigation
  useEffect(() => {
    if (!isFocused || !images || images.length <= 1) return;

    const handleKeyPress = (e) => {
      switch (e.key) {
        case "ArrowLeft":
          e.preventDefault();
          goToPrevious();
          break;
        case "ArrowRight":
          e.preventDefault();
          goToNext();
          break;
        case " ":
          e.preventDefault();
          setIsAutoPlaying((prev) => !prev);
          break;
        case "Escape":
          e.preventDefault();
          setIsFocused(false);
          break;
        default:
          break;
      }
    };

    window.addEventListener("keydown", handleKeyPress);
    return () => window.removeEventListener("keydown", handleKeyPress);
  }, [isFocused, images, goToNext, goToPrevious]);

  // Touch handlers
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

    if (isLeftSwipe) {
      goToNext();
    } else if (isRightSwipe) {
      goToPrevious();
    }
  };

  // If no images or only one image, show single image or placeholder
  if (!images || images.length === 0) {
    return (
      <div className={`${className} thumbnail-placeholder`}>Brak zdjęcia</div>
    );
  }

  if (images.length === 1) {
    return (
      <Image
        src={images[0]}
        alt={alt}
        className={className}
        width={width}
        height={height}
        style={{ objectFit: "cover" }}
      />
    );
  }

  // Multiple images - show slideshow
  return (
    <div
      ref={containerRef}
      className="slideshow-container"
      data-multiple={images.length > 1 ? "true" : "false"}
      style={{ position: "relative", width: "100%", height: "300px" }}
      onTouchStart={onTouchStart}
      onTouchMove={onTouchMove}
      onTouchEnd={onTouchEnd}
      tabIndex={0}
      onFocus={() => setIsFocused(true)}
      onBlur={() => setIsFocused(false)}
      role="img"
      aria-label={`${alt} - slideshow z ${images.length} zdjęciami`}
    >
      {/* Main image */}
      <Image
        src={images[currentIndex]}
        alt={`${alt} ${currentIndex + 1}`}
        className={className}
        width={width}
        height={height}
        style={{ objectFit: "cover" }}
      />

      {/* Navigation arrows - only show for multiple images */}
      {images.length > 1 && (
        <button
          onClick={goToPrevious}
          className="slideshow-nav slideshow-prev"
          style={{
            position: "absolute",
            left: "5px",
            top: "50%",
            transform: "translateY(-50%)",
            background: "rgba(0, 123, 255, 0.6)",
            color: "white",
            border: "none",
            borderRadius: "50%",
            width: "30px",
            height: "30px",
            fontSize: "16px",
            cursor: "pointer",
            display: "flex",
            alignItems: "center",
            justifyContent: "center",
            zIndex: 2,
            transition: "background 0.2s ease",
          }}
          onMouseEnter={(e) =>
            (e.target.style.background = "rgba(0, 123, 255, 0.8)")
          }
          onMouseLeave={(e) =>
            (e.target.style.background = "rgba(0, 123, 255, 0.6)")
          }
          title="Poprzednie zdjęcie"
        >
          ‹
        </button>
      )}

      {images.length > 1 && (
        <button
          onClick={goToNext}
          className="slideshow-nav slideshow-next"
          style={{
            position: "absolute",
            right: "5px",
            top: "50%",
            transform: "translateY(-50%)",
            background: "rgba(0, 123, 255, 0.6)",
            color: "white",
            border: "none",
            borderRadius: "50%",
            width: "30px",
            height: "30px",
            fontSize: "16px",
            cursor: "pointer",
            display: "flex",
            alignItems: "center",
            justifyContent: "center",
            zIndex: 2,
            transition: "background 0.2s ease",
          }}
          onMouseEnter={(e) =>
            (e.target.style.background = "rgba(0, 123, 255, 0.8)")
          }
          onMouseLeave={(e) =>
            (e.target.style.background = "rgba(0, 123, 255, 0.6)")
          }
          title="Następne zdjęcie"
        >
          ›
        </button>
      )}

      {/* Dots indicator - only show for multiple images */}
      {images.length > 1 && (
        <div
          className="slideshow-dots"
          style={{
            position: "absolute",
            bottom: "8px",
            left: "50%",
            transform: "translateX(-50%)",
            display: "flex",
            gap: "4px",
            zIndex: 2,
            background: "rgba(0, 0, 0, 0.3)",
            padding: "4px 8px",
            borderRadius: "12px",
          }}
        >
          {images.map((_, index) => (
            <button
              key={index}
              onClick={() => goToSlide(index)}
              style={{
                width: "8px",
                height: "8px",
                borderRadius: "50%",
                border: "none",
                background:
                  currentIndex === index
                    ? "rgba(0, 123, 255, 1)"
                    : "rgba(255, 255, 255, 0.6)",
                cursor: "pointer",
                transition: "all 0.2s ease",
                transform: currentIndex === index ? "scale(1.3)" : "scale(1)",
              }}
              title={`Zdjęcie ${index + 1}`}
            />
          ))}
        </div>
      )}

      {/* Image counter */}
      <div
        className="slideshow-counter"
        style={{
          position: "absolute",
          top: "8px",
          right: "8px",
          background:
            images.length > 1 ? "rgba(0, 123, 255, 0.8)" : "rgba(0, 0, 0, 0.7)",
          color: "white",
          padding: "2px 6px",
          borderRadius: "12px",
          fontSize: "0.75rem",
          zIndex: 2,
          fontWeight: images.length > 1 ? "bold" : "normal",
        }}
      >
        {images.length > 1 ? `📷 ${currentIndex + 1}/${images.length}` : "📷"}
      </div>

      {/* Auto-play indicator */}
      {images.length > 1 && (
        <div
          className="slideshow-autoplay-indicator"
          style={{
            position: "absolute",
            top: "8px",
            left: "8px",
            background: isAutoPlaying
              ? "rgba(0, 150, 0, 0.8)"
              : "rgba(150, 150, 0, 0.8)",
            color: "white",
            padding: "3px 8px",
            borderRadius: "12px",
            fontSize: "0.7rem",
            zIndex: 2,
            cursor: "pointer",
            fontWeight: "bold",
          }}
          title={
            isAutoPlaying
              ? "Slideshow aktywny - kliknij aby zatrzymać (spacja)"
              : "Slideshow zatrzymany - kliknij aby uruchomić (spacja)"
          }
          onClick={() => setIsAutoPlaying((prev) => !prev)}
        >
          {isAutoPlaying ? "▶ AUTO" : "⏸ PAUZA"}
        </div>
      )}

      {/* Keyboard navigation hint */}
      {isFocused && images.length > 1 && (
        <div
          style={{
            position: "absolute",
            bottom: "30px",
            left: "50%",
            transform: "translateX(-50%)",
            background: "rgba(0, 0, 0, 0.8)",
            color: "white",
            padding: "4px 8px",
            borderRadius: "4px",
            fontSize: "0.7rem",
            zIndex: 2,
            whiteSpace: "nowrap",
          }}
        >
          ← → nawigacja | spacja: pauza | esc: wyjście
        </div>
      )}
    </div>
  );
};

export default ImageSlideshow;
