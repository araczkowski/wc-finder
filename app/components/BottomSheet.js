"use client";

import { motion, useMotionValue, useAnimation } from "framer-motion";
import { useEffect, useRef, useState } from "react";
import { ChevronUp, ChevronDown, X } from "lucide-react";

export default function BottomSheet({
  isOpen,
  onClose,
  children,
  snapPoints = [0.3, 0.7, 0.95],
  initialSnap = 0.7,
  minHeight = 200,
  maxWidth = 500,
  onScrollBottom,
  isLoading = false,
  loadingMessage = "Ładowanie...",
  allDataLoaded = false,
  hasMore = true,
  totalCount = 0,
  currentCount = 0,
}) {
  const [currentSnap, setCurrentSnap] = useState(initialSnap);
  const [windowHeight, setWindowHeight] = useState(0);
  const [isDragging, setIsDragging] = useState(false);
  const [canClose, setCanClose] = useState(false);
  const height = useMotionValue(0);
  const controls = useAnimation();
  const contentRef = useRef(null);

  useEffect(() => {
    const updateHeight = () => {
      const newWindowHeight = window.innerHeight;
      setWindowHeight(newWindowHeight);
      height.set(newWindowHeight * currentSnap);
    };

    updateHeight();
    window.addEventListener("resize", updateHeight);
    return () => window.removeEventListener("resize", updateHeight);
  }, [currentSnap, height]);

  useEffect(() => {
    if (isOpen) {
      const targetHeight = windowHeight * currentSnap;
      height.set(targetHeight);
      controls.start({ height: targetHeight });
    } else {
      controls.start({ height: 0 });
    }
  }, [isOpen, currentSnap, windowHeight, controls, height]);

  const handlePan = (event, info) => {
    const newHeight = height.get() - info.delta.y;

    // Constrain the height to prevent going above window bounds
    const maxHeight = windowHeight * 0.95; // 95% of window height
    const minHeight = 0; // Allow dragging to 0 for closing
    const constrainedHeight = Math.min(
      Math.max(newHeight, minHeight),
      maxHeight,
    );

    height.set(constrainedHeight);

    // Check if we're in the close zone
    const closeThreshold = windowHeight * snapPoints[0] * 0.6;
    setCanClose(constrainedHeight < closeThreshold);
  };

  const handlePanStart = () => {
    setIsDragging(true);
    setCanClose(false);
    document.body.style.overflow = "hidden";
  };

  const handlePanEnd = (event, info) => {
    setIsDragging(false);
    setCanClose(false);
    document.body.style.overflow = "";

    const currentHeightValue = height.get();
    const velocity = info.velocity.y;
    const offset = info.offset.y;

    // Check if we should close the bottom sheet
    const shouldClose =
      // Fast downward swipe from any position
      velocity > 500 ||
      // Dragged down significantly from the smallest snap point
      (currentSnap === snapPoints[0] && offset > 50) ||
      // Dragged below 60% of the smallest snap point
      currentHeightValue < windowHeight * snapPoints[0] * 0.6;

    if (shouldClose) {
      onClose();
      return;
    }

    // Calculate projected height for snap point selection
    const projectedHeight = currentHeightValue - velocity * 0.1;
    const maxHeight = windowHeight * 0.95;
    const snapPixelValues = snapPoints.map((p) =>
      Math.min(windowHeight * p, maxHeight),
    );
    const closestSnapPixel = snapPixelValues.reduce((prev, curr) => {
      return Math.abs(curr - projectedHeight) < Math.abs(prev - projectedHeight)
        ? curr
        : prev;
    });

    const newSnap = closestSnapPixel / windowHeight;
    setCurrentSnap(newSnap);
  };

  const handleCloseClick = () => {
    onClose();
  };

  const handleScroll = (e) => {
    if (!onScrollBottom || isDragging) return;
    const element = e.target;
    const isNearBottom =
      element.scrollTop + element.clientHeight >= element.scrollHeight - 100;
    if (isNearBottom && !isLoading) {
      onScrollBottom();
    }
  };

  if (!isOpen) {
    return null;
  }

  return (
    <motion.div
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      exit={{ opacity: 0 }}
      onClick={onClose}
      style={{
        position: "fixed",
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
        backgroundColor: "rgba(0, 0, 0, 0.5)",
        zIndex: 1000,
        display: "flex",
        alignItems: "flex-end",
        justifyContent: "center",
      }}
    >
      <motion.div
        onPanStart={handlePanStart}
        onPan={handlePan}
        onPanEnd={handlePanEnd}
        style={{
          backgroundColor: "white",
          borderRadius: "20px 20px 0 0",
          width: "100%",
          maxWidth: maxWidth,
          height: height,
          minHeight: minHeight,
          boxShadow: isDragging
            ? "0 -8px 32px rgba(0, 0, 0, 0.3)"
            : "0 -4px 20px rgba(0, 0, 0, 0.15)",
          display: "flex",
          flexDirection: "column",
          overflow: "hidden",
          cursor: isDragging ? "grabbing" : "grab",
          touchAction: "pan-y",
          opacity: isDragging && canClose ? 0.7 : 1,
          transition: isDragging ? "opacity 0.1s ease" : "none",
        }}
        onClick={(e) => e.stopPropagation()}
        animate={controls}
        transition={{ type: "spring", damping: 30, stiffness: 300 }}
      >
        <motion.div
          onPanStart={handlePanStart}
          onPan={handlePan}
          onPanEnd={handlePanEnd}
          style={{
            width: "100%",
            display: "flex",
            justifyContent: "right",
            alignItems: "center",
            cursor: isDragging ? "grabbing" : "grab",
            touchAction: "none",
          }}
        >
          <div
            style={{
              display: "flex",
              flexDirection: "column",
              alignItems: "left",
              gap: "8px",
              paddingRight: "12px",
            }}
          >
            <div
              onClick={handleCloseClick}
              style={{
                borderRadius: "50%",
                backgroundColor: "transparent",
                cursor: "pointer",
                transition: "all 0.2s ease",
                display: "flex",
                alignItems: "center",
                justifyContent: "center",
                minWidth: "48px",
                minHeight: "48px",
              }}
              onMouseEnter={(e) => {
                e.target.style.backgroundColor = "#f0f0f0";
                e.target.querySelector("svg").style.color = "#007bff";
              }}
              onMouseLeave={(e) => {
                e.target.style.backgroundColor = "transparent";
                e.target.querySelector("svg").style.color = "#666";
              }}
              onTouchStart={(e) => {
                e.target.style.backgroundColor = "#f0f0f0";
                e.target.querySelector("svg").style.color = "#007bff";
              }}
              onTouchEnd={(e) => {
                setTimeout(() => {
                  e.target.style.backgroundColor = "transparent";
                  e.target.querySelector("svg").style.color = "#666";
                }, 150);
              }}
            >
              <X
                size={24}
                color="#666"
                style={{
                  transition: "color 0.2s ease",
                }}
              />
            </div>
          </div>
        </motion.div>
        <div
          ref={contentRef}
          onScroll={handleScroll}
          style={{
            flex: 1,
            padding: "0 20px 20px",
            overflow: "auto",
            scrollbarWidth: "thin",
            scrollbarColor: "#ccc transparent",
            touchAction: "pan-y",
          }}
        >
          {children}
          {isLoading && (
            <div
              style={{
                textAlign: "center",
                padding: "20px",
                fontSize: "1rem",
                color: "#666",
              }}
            >
              {loadingMessage}
            </div>
          )}
          {(allDataLoaded || !hasMore) && currentCount > 0 && (
            <div
              style={{
                textAlign: "center",
                padding: "20px",
                fontSize: "0.9rem",
                color: "#28a745",
              }}
            >
              ✓ Wczytano wszystkie toalety
            </div>
          )}
        </div>
      </motion.div>
    </motion.div>
  );
}
