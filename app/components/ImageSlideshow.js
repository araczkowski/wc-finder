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

  // Multiple images - show slideshow without controls
  return (
    <div
      ref={containerRef}
      className="slideshow-container"
      data-multiple={images.length > 1 ? "true" : "false"}
      style={{ position: "relative", width: "50%", height: "150px" }}
      onTouchStart={onTouchStart}
      onTouchMove={onTouchMove}
      onTouchEnd={onTouchEnd}
      tabIndex={0}
      onFocus={() => setIsFocused(true)}
      onBlur={() => setIsFocused(false)}
      role="img"
      aria-label={`${alt} - slideshow z ${images.length} zdjęciami`}
    >
      {/* Main image - no controls shown */}
      <Image
        src={images[currentIndex]}
        alt={`${alt} ${currentIndex + 1}`}
        className={className}
        width={width}
        height={height}
        style={{ objectFit: "cover", width: "100%", height: "100%" }}
      />
    </div>
  );
};

export default ImageSlideshow;
