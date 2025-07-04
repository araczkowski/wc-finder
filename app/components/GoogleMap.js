"use client";

import { useState, useEffect, useRef, useCallback, memo, useMemo } from "react";

const GoogleMap = memo(
  ({
    wcs = [],
    userLocation = null,
    onMarkerClick = null,
    className = "",
    style = {},
    zoom = 13,
    center = null,
  }) => {
    const mapRef = useRef(null);
    const mapInstanceRef = useRef(null);
    const markersRef = useRef([]);
    const userMarkerRef = useRef(null);
    const infoWindowRef = useRef(null);
    const [isLoaded, setIsLoaded] = useState(false);
    const [error, setError] = useState(null);

    // Default center (Warsaw if no center provided)
    const defaultCenter = useMemo(() => {
      return center || userLocation || { lat: 52.2297, lng: 21.0122 };
    }, [center, userLocation]);

    // Check if Google Maps is loaded
    const checkGoogleMapsLoaded = useCallback(() => {
      return (
        typeof window !== "undefined" &&
        window.google &&
        window.google.maps &&
        window.google.maps.Map
      );
    }, []);

    // Load Google Maps API
    useEffect(() => {
      const loadGoogleMaps = () => {
        if (checkGoogleMapsLoaded()) {
          setIsLoaded(true);
          return;
        }

        // Check if script is already loading
        if (document.querySelector('script[src*="maps.googleapis.com"]')) {
          const checkInterval = setInterval(() => {
            if (checkGoogleMapsLoaded()) {
              setIsLoaded(true);
              clearInterval(checkInterval);
            }
          }, 100);
          return;
        }

        const apiKey = process.env.NEXT_PUBLIC_GOOGLE_MAPS_API_KEY;
        if (!apiKey) {
          setError("Google Maps API key is not configured");
          return;
        }

        const script = document.createElement("script");
        script.src = `https://maps.googleapis.com/maps/api/js?key=${apiKey}&libraries=places&callback=initGoogleMaps`;
        script.async = true;
        script.defer = true;

        window.initGoogleMaps = () => {
          setIsLoaded(true);
        };

        script.onerror = () => {
          setError("Failed to load Google Maps API");
        };

        document.head.appendChild(script);
      };

      loadGoogleMaps();
    }, [checkGoogleMapsLoaded]);

    // Initialize map
    useEffect(() => {
      if (!isLoaded || !mapRef.current || mapInstanceRef.current) return;

      try {
        const mapOptions = {
          center: defaultCenter,
          zoom: zoom,
          mapTypeId: window.google.maps.MapTypeId.ROADMAP,
          fullscreenControl: true,
          streetViewControl: true,
          mapTypeControl: true,
          zoomControl: true,
          styles: [
            {
              featureType: "poi",
              elementType: "labels",
              stylers: [{ visibility: "off" }],
            },
          ],
        };

        mapInstanceRef.current = new window.google.maps.Map(
          mapRef.current,
          mapOptions,
        );

        // Initialize InfoWindow
        infoWindowRef.current = new window.google.maps.InfoWindow();

        console.log("[GoogleMap] Map initialized successfully");
      } catch (err) {
        console.error("[GoogleMap] Error initializing map:", err);
        setError("Failed to initialize map");
      }
    }, [isLoaded, defaultCenter, zoom]);

    // Clear existing markers
    const clearMarkers = useCallback(() => {
      markersRef.current.forEach((marker) => {
        marker.setMap(null);
      });
      markersRef.current = [];

      if (userMarkerRef.current) {
        userMarkerRef.current.setMap(null);
        userMarkerRef.current = null;
      }
    }, []);

    // Create WC marker
    const createWcMarker = useCallback(
      (wc) => {
        if (!mapInstanceRef.current || !window.google) return null;

        // Use lat/lng fields from API response
        let lat, lng;

        console.log(`[GoogleMap] createWcMarker called for WC ${wc.id}:`, {
          name: wc.name,
          lat: wc.lat,
          lng: wc.lng,
          latType: typeof wc.lat,
          lngType: typeof wc.lng,
        });

        if (
          wc.lat !== null &&
          wc.lng !== null &&
          wc.lat !== undefined &&
          wc.lng !== undefined
        ) {
          lat = parseFloat(wc.lat);
          lng = parseFloat(wc.lng);
          console.log(`[GoogleMap] Parsed coordinates for WC ${wc.id}:`, {
            lat,
            lng,
          });
        } else {
          console.warn(`[GoogleMap] Missing coordinates for WC ${wc.id}:`, {
            lat: wc.lat,
            lng: wc.lng,
            latNull: wc.lat === null,
            lngNull: wc.lng === null,
            latUndefined: wc.lat === undefined,
            lngUndefined: wc.lng === undefined,
          });
          return null;
        }

        if (isNaN(lat) || isNaN(lng)) {
          console.warn(`[GoogleMap] Invalid coordinates for WC ${wc.id}:`, {
            lat,
            lng,
            latIsNaN: isNaN(lat),
            lngIsNaN: isNaN(lng),
          });
          return null;
        }

        const position = { lat, lng };

        // Create custom marker icon for WC
        const markerIcon = {
          path: window.google.maps.SymbolPath.CIRCLE,
          scale: 8,
          fillColor: "#4285f4",
          fillOpacity: 1,
          strokeColor: "#ffffff",
          strokeWeight: 2,
        };

        const marker = new window.google.maps.Marker({
          position: position,
          map: mapInstanceRef.current,
          title: wc.name || "WC",
          icon: markerIcon,
          zIndex: 100,
        });

        console.log(
          `[GoogleMap] ✓ Successfully created marker for WC ${wc.id} at position:`,
          position,
        );

        // Create info window content
        const createInfoContent = (wc) => {
          const distance = wc.distance_km
            ? wc.distance_km < 1
              ? `${Math.round(wc.distance_km * 1000)} m`
              : `${wc.distance_km.toFixed(1)} km`
            : "";

          return `
        <div style="padding: 10px; max-width: 300px;">
          <h3 style="margin: 0 0 8px 0; color: #333; font-size: 16px;">
            ${wc.name || "WC"}
          </h3>
          ${
            wc.address
              ? `
            <p style="margin: 0 0 4px 0; color: #666; font-size: 14px;">
              📍 ${wc.address}
            </p>
          `
              : ""
          }
          ${
            distance
              ? `
            <p style="margin: 0 0 4px 0; color: #666; font-size: 14px;">
              📏 ${distance}
            </p>
          `
              : ""
          }
          ${
            wc.rating
              ? `
            <p style="margin: 0 0 8px 0; color: #666; font-size: 14px;">
              ⭐ ${wc.rating}/10
            </p>
          `
              : ""
          }
          <div style="margin-top: 8px;">
            <a href="/wc/view/${wc.id}"
               style="color: #4285f4; text-decoration: none; font-size: 14px; margin-right: 12px;"
               target="_blank">
              Zobacz szczegóły
            </a>
            <a href="/wc/edit/${wc.id}"
               style="color: #4285f4; text-decoration: none; font-size: 14px;"
               target="_blank">
              Edytuj
            </a>
          </div>
        </div>
      `;
        };

        // Add click listener
        marker.addListener("click", () => {
          if (infoWindowRef.current) {
            infoWindowRef.current.setContent(createInfoContent(wc));
            infoWindowRef.current.open(mapInstanceRef.current, marker);
          }

          if (onMarkerClick) {
            onMarkerClick(wc);
          }
        });

        return marker;
      },
      [onMarkerClick],
    );

    // Create user location marker
    const createUserMarker = useCallback((location) => {
      if (!mapInstanceRef.current || !window.google || !location) return null;

      const userIcon = {
        path: window.google.maps.SymbolPath.CIRCLE,
        scale: 10,
        fillColor: "#EA4335",
        fillOpacity: 1,
        strokeColor: "#ffffff",
        strokeWeight: 3,
      };

      const marker = new window.google.maps.Marker({
        position: location,
        map: mapInstanceRef.current,
        title: "Twoja lokalizacja",
        icon: userIcon,
        zIndex: 200,
      });

      marker.addListener("click", () => {
        if (infoWindowRef.current) {
          infoWindowRef.current.setContent(`
          <div style="padding: 10px;">
            <h3 style="margin: 0; color: #333;">Twoja lokalizacja</h3>
          </div>
        `);
          infoWindowRef.current.open(mapInstanceRef.current, marker);
        }
      });

      return marker;
    }, []);

    // Update markers when WCs change
    useEffect(() => {
      if (!mapInstanceRef.current || !isLoaded) return;

      console.log(`[GoogleMap] Updating markers for ${wcs.length} WCs`);
      console.log("[GoogleMap] Sample WCs:", wcs.slice(0, 3));

      // Clear existing markers
      clearMarkers();

      // Add WC markers
      const newMarkers = [];
      const skippedWcs = [];

      wcs.forEach((wc, index) => {
        console.log(`[GoogleMap] Processing WC ${index + 1}/${wcs.length}:`, {
          id: wc.id,
          name: wc.name,
          lat: wc.lat,
          lng: wc.lng,
          hasCoordinates: wc.lat !== null && wc.lng !== null,
        });

        const marker = createWcMarker(wc);
        if (marker) {
          newMarkers.push(marker);
          console.log(`[GoogleMap] ✓ Created marker for WC: ${wc.name}`);
        } else {
          skippedWcs.push(wc);
          console.warn(
            `[GoogleMap] ✗ Failed to create marker for WC: ${wc.name}`,
            {
              lat: wc.lat,
              lng: wc.lng,
            },
          );
        }
      });

      markersRef.current = newMarkers;

      // Add user location marker
      if (userLocation) {
        userMarkerRef.current = createUserMarker(userLocation);
        console.log("[GoogleMap] ✓ Created user location marker");
      }

      console.log(
        `[GoogleMap] Final result: ${newMarkers.length} markers created, ${skippedWcs.length} skipped`,
      );
      if (skippedWcs.length > 0) {
        console.log(
          "[GoogleMap] Skipped WCs:",
          skippedWcs.map((wc) => ({
            id: wc.id,
            name: wc.name,
            lat: wc.lat,
            lng: wc.lng,
          })),
        );
      }
    }, [
      wcs,
      isLoaded,
      clearMarkers,
      createWcMarker,
      createUserMarker,
      userLocation,
    ]);

    // Update map center and zoom when user location changes
    useEffect(() => {
      if (!mapInstanceRef.current || !userLocation) return;

      mapInstanceRef.current.panTo(userLocation);
      if (mapInstanceRef.current.getZoom() < 13) {
        mapInstanceRef.current.setZoom(13);
      }
    }, [userLocation]);

    // Auto-fit bounds to show all markers
    useEffect(() => {
      if (
        !mapInstanceRef.current ||
        !isLoaded ||
        markersRef.current.length === 0
      )
        return;

      const bounds = new window.google.maps.LatLngBounds();

      // Add WC markers to bounds
      markersRef.current.forEach((marker) => {
        bounds.extend(marker.getPosition());
      });

      // Add user location to bounds
      if (userLocation) {
        bounds.extend(userLocation);
      }

      // Only fit bounds if we have multiple points
      if (
        markersRef.current.length > 1 ||
        (markersRef.current.length > 0 && userLocation)
      ) {
        mapInstanceRef.current.fitBounds(bounds, {
          padding: 50,
        });

        // Ensure minimum zoom level
        const listener = window.google.maps.event.addListener(
          mapInstanceRef.current,
          "bounds_changed",
          () => {
            if (mapInstanceRef.current.getZoom() > 16) {
              mapInstanceRef.current.setZoom(16);
            }
            window.google.maps.event.removeListener(listener);
          },
        );
      }
    }, [wcs, userLocation, isLoaded]);

    // Cleanup
    useEffect(() => {
      return () => {
        clearMarkers();
        if (infoWindowRef.current) {
          infoWindowRef.current.close();
        }
      };
    }, [clearMarkers]);

    if (error) {
      return (
        <div
          className={className}
          style={{
            ...style,
            display: "flex",
            alignItems: "center",
            justifyContent: "center",
            background: "#f5f5f5",
            color: "#666",
            border: "1px solid #ddd",
            borderRadius: "8px",
          }}
        >
          <div style={{ textAlign: "center", padding: "20px" }}>
            <p style={{ margin: "0 0 8px 0" }}>🗺️ Nie można załadować mapy</p>
            <p style={{ margin: 0, fontSize: "14px" }}>{error}</p>
          </div>
        </div>
      );
    }

    if (!isLoaded) {
      return (
        <div
          className={className}
          style={{
            ...style,
            display: "flex",
            alignItems: "center",
            justifyContent: "center",
            background: "#f5f5f5",
            color: "#666",
            border: "1px solid #ddd",
            borderRadius: "8px",
          }}
        >
          <div style={{ textAlign: "center", padding: "20px" }}>
            <p style={{ margin: "0 0 8px 0" }}>🗺️ Ładowanie mapy...</p>
            <div
              style={{
                width: "24px",
                height: "24px",
                border: "2px solid #ddd",
                borderTop: "2px solid #4285f4",
                borderRadius: "50%",
                margin: "0 auto",
                animation: "spin 1s linear infinite",
              }}
            />
          </div>
        </div>
      );
    }

    return (
      <div className={className} style={style}>
        <div
          ref={mapRef}
          style={{
            width: "100%",
            height: "100%",
            borderRadius: "8px",
          }}
        />
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
  },
);

GoogleMap.displayName = "GoogleMap";

export default GoogleMap;
