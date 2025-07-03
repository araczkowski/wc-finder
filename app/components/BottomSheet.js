"use client";

import {
  motion,
  useDragControls,
  useMotionValue,
  useTransform,
} from "framer-motion";
import { useEffect, useRef, useState } from "react";

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
  const dragControls = useDragControls();
  const y = useMotionValue(0);
  const [currentSnap, setCurrentSnap] = useState(initialSnap);
  const containerRef = useRef(null);
  const contentRef = useRef(null);
  const [windowHeight, setWindowHeight] = useState(0);

  // Debug logging
  console.log("BottomSheet render:", {
    isOpen,
    selectedWcId: children?.props?.wcId,
  });

  useEffect(() => {
    const updateHeight = () => {
      setWindowHeight(window.innerHeight);
    };

    updateHeight();
    window.addEventListener("resize", updateHeight);
    return () => window.removeEventListener("resize", updateHeight);
  }, []);

  const currentHeight = windowHeight * currentSnap;
  const opacity = useTransform(y, [-200, 0], [0, 1]);

  // Scroll handler for infinite scroll
  const handleScroll = (e) => {
    if (!onScrollBottom) return;

    const element = e.target;
    const isNearBottom =
      element.scrollTop + element.clientHeight >= element.scrollHeight - 100;

    if (isNearBottom && !isLoading) {
      onScrollBottom();
    }
  };

  const handleDragEnd = (event, info) => {
    const velocity = info.velocity.y;
    const currentY = y.get();

    // Calculate which snap point to go to
    let targetSnap = currentSnap;

    if (velocity > 500) {
      // Fast downward swipe - go to lower snap point or close
      const currentIndex = snapPoints.indexOf(currentSnap);
      if (currentIndex > 0) {
        targetSnap = snapPoints[currentIndex - 1];
      } else {
        onClose();
        return;
      }
    } else if (velocity < -500) {
      // Fast upward swipe - go to higher snap point
      const currentIndex = snapPoints.indexOf(currentSnap);
      if (currentIndex < snapPoints.length - 1) {
        targetSnap = snapPoints[currentIndex + 1];
      }
    } else {
      // Slow drag - snap to nearest point
      const threshold = windowHeight * 0.1;
      if (currentY > threshold) {
        const currentIndex = snapPoints.indexOf(currentSnap);
        if (currentIndex > 0) {
          targetSnap = snapPoints[currentIndex - 1];
        } else {
          onClose();
          return;
        }
      } else if (currentY < -threshold) {
        const currentIndex = snapPoints.indexOf(currentSnap);
        if (currentIndex < snapPoints.length - 1) {
          targetSnap = snapPoints[currentIndex + 1];
        }
      }
    }

    setCurrentSnap(targetSnap);
    y.set(0);
  };

  if (!isOpen) {
    console.log("BottomSheet not open, returning null");
    return null;
  }

  console.log("BottomSheet rendering with:", {
    isOpen,
    currentHeight,
    windowHeight,
  });

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
        ref={containerRef}
        drag="y"
        dragControls={dragControls}
        dragConstraints={{ top: -100, bottom: 100 }}
        dragElastic={0.1}
        onDragEnd={handleDragEnd}
        style={{
          y,
          opacity,
          backgroundColor: "white",
          borderRadius: "20px 20px 0 0",
          width: "100%",
          maxWidth: maxWidth,
          minHeight: Math.max(minHeight, currentHeight),
          height: currentHeight,
          boxShadow: "0 -4px 20px rgba(0, 0, 0, 0.15)",
          display: "flex",
          flexDirection: "column",
          overflow: "hidden",
        }}
        onClick={(e) => e.stopPropagation()}
        animate={{
          height: currentHeight,
        }}
        transition={{
          type: "spring",
          damping: 30,
          stiffness: 300,
        }}
      >
        {/* Handle */}
        <div
          style={{
            width: "40px",
            height: "4px",
            backgroundColor: "#ccc",
            borderRadius: "2px",
            margin: "12px auto 8px",
            cursor: "grab",
          }}
          onPointerDown={(e) => dragControls.start(e)}
        />

        {/* Content */}
        <div
          ref={contentRef}
          onScroll={handleScroll}
          style={{
            flex: 1,
            padding: "0 20px 20px",
            overflow: "auto",
            scrollbarWidth: "thin",
            scrollbarColor: "#ccc transparent",
          }}
        >
          {children}

          {/* Loading indicator */}
          {isLoading && (
            <div
              style={{
                textAlign: "center",
                padding: "20px",
                fontSize: "1rem",
                color: "#666",
                backgroundColor: "#f8f9fa",
                border: "1px solid #e9ecef",
                borderRadius: "8px",
                margin: "20px 0",
                transition: "opacity 0.3s ease",
              }}
            >
              <div
                style={{
                  display: "flex",
                  alignItems: "center",
                  justifyContent: "center",
                  gap: "10px",
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
                  }}
                ></div>
                {loadingMessage}
              </div>
            </div>
          )}

          {/* No more data indicator */}
          {(allDataLoaded || !hasMore) && currentCount > 0 && (
            <div
              style={{
                textAlign: "center",
                padding: "20px",
                fontSize: "0.9rem",
                color: "#28a745",
                backgroundColor: "#f8f9fa",
                border: "1px solid #d4edda",
                borderRadius: "8px",
                margin: "20px 0",
                fontWeight: "500",
              }}
            >
              ✓ Wczytano {currentCount}{" "}
              {totalCount > 0 && totalCount === currentCount
                ? `z ${totalCount}`
                : ""}{" "}
              {currentCount === 1 ? "toaleta" : "toalet"}
            </div>
          )}
        </div>
      </motion.div>
    </motion.div>
  );
}
