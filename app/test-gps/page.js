"use client";

import { useState, useCallback } from "react";
import Link from "next/link";

export default function TestGPSPage() {
  const [userLocation, setUserLocation] = useState(null);
  const [userAddress, setUserAddress] = useState("");
  const [isGeolocatingAddress, setIsGeolocatingAddress] = useState(false);
  const [addressDetected, setAddressDetected] = useState(false);
  const [hasSetAddress, setHasSetAddress] = useState(false);
  const [locationError, setLocationError] = useState(null);
  const [logs, setLogs] = useState([]);

  const addLog = (message, type = "info") => {
    const timestamp = new Date().toLocaleTimeString();
    setLogs((prev) => [...prev, { timestamp, message, type }]);
    console.log(`[TestGPS] ${message}`);
  };

  // Reverse geocode user location to get address (ONLY for GPS button)
  const reverseGeocode = useCallback(
    async (lat, lng) => {
      addLog(`reverseGeocode called with: ${lat}, ${lng}`);
      setIsGeolocatingAddress(true);
      try {
        const apiKey = process.env.NEXT_PUBLIC_GOOGLE_MAPS_API_KEY;
        addLog(`API key present: ${!!apiKey}`);

        if (apiKey) {
          addLog("Using Google Maps API");
          // Use Google Maps API
          const googleUrl = `https://maps.googleapis.com/maps/api/geocode/json?latlng=${lat},${lng}&key=${apiKey}&language=pl`;
          addLog(`Google Maps URL: ${googleUrl}`);

          const response = await fetch(googleUrl);
          addLog(`Google Maps response status: ${response.status}`);

          const data = await response.json();
          addLog(`Google Maps API response: ${JSON.stringify(data, null, 2)}`);

          if (data.status === "OK" && data.results.length > 0) {
            addLog(
              `Setting address from Google: ${data.results[0].formatted_address}`,
              "success",
            );
            setUserAddress(data.results[0].formatted_address);
            setAddressDetected(true);
            setHasSetAddress(true);
            return;
          } else {
            addLog(
              `Google Maps API failed with status: ${data.status}`,
              "warning",
            );
            addLog(
              `Google Maps API error message: ${data.error_message}`,
              "warning",
            );
          }
        } else {
          addLog("No Google Maps API key, using Nominatim");
        }

        // Fallback to Nominatim (OpenStreetMap)
        addLog("Using Nominatim fallback");
        const nominatimUrl = `https://nominatim.openstreetmap.org/reverse?format=json&lat=${lat}&lon=${lng}&zoom=16&addressdetails=1&accept-language=pl`;
        addLog(`Nominatim URL: ${nominatimUrl}`);

        const response = await fetch(nominatimUrl);
        addLog(`Nominatim response status: ${response.status}`);

        const data = await response.json();
        addLog(`Nominatim response: ${JSON.stringify(data, null, 2)}`);

        if (data && data.display_name) {
          addLog(
            `Setting address from Nominatim: ${data.display_name}`,
            "success",
          );
          setUserAddress(data.display_name);
          setAddressDetected(true);
          setHasSetAddress(true);
        } else {
          addLog("Nominatim failed, no display_name in response", "warning");
          addLog(
            `Fallback to coordinates: ${lat.toFixed(6)}, ${lng.toFixed(6)}`,
          );
          setUserAddress(`${lat.toFixed(6)}, ${lng.toFixed(6)}`);
          setAddressDetected(true);
          setHasSetAddress(true);
        }
      } catch (error) {
        addLog(`Reverse geocoding failed: ${error.message}`, "error");
        addLog(
          `Error details: ${JSON.stringify(
            {
              message: error.message,
              name: error.name,
              stack: error.stack,
            },
            null,
            2,
          )}`,
        );
        addLog(`Fallback to coordinates: ${lat.toFixed(6)}, ${lng.toFixed(6)}`);
        setUserAddress(`${lat.toFixed(6)}, ${lng.toFixed(6)}`);
        setAddressDetected(true);
        setHasSetAddress(true);
      } finally {
        setIsGeolocatingAddress(false);
      }
    },
    [
      setUserAddress,
      setAddressDetected,
      setHasSetAddress,
      setIsGeolocatingAddress,
    ],
  );

  const handleGPSClick = () => {
    addLog("GPS Button clicked");
    setLocationError(null);
    setLogs([]);

    if (navigator.geolocation) {
      setIsGeolocatingAddress(true);
      addLog("Getting current position...");
      navigator.geolocation.getCurrentPosition(
        (position) => {
          addLog(
            `Position received: ${JSON.stringify(position.coords)}`,
            "success",
          );
          const { latitude, longitude } = position.coords;
          addLog(`Coordinates: ${latitude}, ${longitude}`);
          setUserLocation({ lat: latitude, lng: longitude });

          // Call reverse geocoding to get address from coordinates
          addLog(`Calling reverseGeocode with: ${latitude}, ${longitude}`);
          reverseGeocode(latitude, longitude);
        },
        (error) => {
          addLog(`Geolocation failed: ${error.message}`, "error");
          setLocationError(`Błąd lokalizacji: ${error.message}`);
          setIsGeolocatingAddress(false);
        },
        {
          enableHighAccuracy: true,
          timeout: 10000,
          maximumAge: 0, // Zawsze pobieraj świeżą lokalizację
        },
      );
    } else {
      addLog("Geolocation not supported", "error");
      setLocationError(
        "Geolokalizacja nie jest obsługiwana przez tę przeglądarkę",
      );
    }
  };

  const clearResults = () => {
    setUserLocation(null);
    setUserAddress("");
    setAddressDetected(false);
    setHasSetAddress(false);
    setLocationError(null);
    setLogs([]);
  };

  const getLogColor = (type) => {
    switch (type) {
      case "success":
        return "#28a745";
      case "error":
        return "#dc3545";
      case "warning":
        return "#ffc107";
      default:
        return "#6c757d";
    }
  };

  return (
    <div
      style={{
        padding: "2rem",
        maxWidth: "1200px",
        margin: "0 auto",
        fontFamily: "sans-serif",
      }}
    >
      <h1 style={{ marginBottom: "2rem", color: "#333" }}>
        🧪 GPS Reverse Geocoding Test
      </h1>

      <div style={{ marginBottom: "2rem" }}>
        <Link href="/" style={{ color: "#007bff", textDecoration: "none" }}>
          ← Back to WC Finder
        </Link>
      </div>

      <div
        style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: "2rem" }}
      >
        {/* Controls */}
        <div
          style={{
            backgroundColor: "white",
            padding: "1.5rem",
            borderRadius: "8px",
            border: "1px solid #dee2e6",
          }}
        >
          <h3 style={{ marginTop: 0, color: "#495057" }}>GPS Test Controls</h3>

          <div
            style={{ display: "flex", flexDirection: "column", gap: "1rem" }}
          >
            <button
              onClick={handleGPSClick}
              disabled={isGeolocatingAddress}
              style={{
                padding: "1rem",
                backgroundColor: isGeolocatingAddress ? "#6c757d" : "#28a745",
                color: "white",
                border: "none",
                borderRadius: "4px",
                fontSize: "1rem",
                cursor: isGeolocatingAddress ? "not-allowed" : "pointer",
                opacity: isGeolocatingAddress ? 0.6 : 1,
                display: "flex",
                alignItems: "center",
                justifyContent: "center",
                gap: "0.5rem",
              }}
            >
              {isGeolocatingAddress && (
                <div
                  style={{
                    width: "16px",
                    height: "16px",
                    border: "2px solid white",
                    borderTop: "2px solid transparent",
                    borderRadius: "50%",
                    animation: "spin 1s linear infinite",
                  }}
                ></div>
              )}
              {isGeolocatingAddress
                ? "Pobieranie..."
                : "📍 Pobierz moją lokalizację GPS"}
            </button>

            <button
              onClick={clearResults}
              style={{
                padding: "0.75rem",
                backgroundColor: "#6c757d",
                color: "white",
                border: "none",
                borderRadius: "4px",
                fontSize: "1rem",
                cursor: "pointer",
              }}
            >
              🗑️ Wyczyść wyniki
            </button>
          </div>

          {/* Current State */}
          <div
            style={{
              marginTop: "2rem",
              padding: "1rem",
              backgroundColor: "#f8f9fa",
              borderRadius: "4px",
            }}
          >
            <h4 style={{ margin: "0 0 0.5rem 0", color: "#495057" }}>
              Current State
            </h4>
            <div style={{ fontSize: "0.9rem", color: "#6c757d" }}>
              <div>
                <strong>userLocation:</strong>{" "}
                {userLocation
                  ? `${userLocation.lat.toFixed(6)}, ${userLocation.lng.toFixed(6)}`
                  : "null"}
              </div>
              <div>
                <strong>userAddress:</strong> {userAddress || "empty"}
              </div>
              <div>
                <strong>addressDetected:</strong>{" "}
                {addressDetected ? "true" : "false"}
              </div>
              <div>
                <strong>hasSetAddress:</strong>{" "}
                {hasSetAddress ? "true" : "false"}
              </div>
              <div>
                <strong>isGeolocatingAddress:</strong>{" "}
                {isGeolocatingAddress ? "true" : "false"}
              </div>
            </div>
          </div>

          {/* Error Display */}
          {locationError && (
            <div
              style={{
                marginTop: "1rem",
                padding: "1rem",
                backgroundColor: "#f8d7da",
                borderRadius: "4px",
                color: "#721c24",
                border: "1px solid #f5c6cb",
              }}
            >
              <strong>Error:</strong> {locationError}
            </div>
          )}
        </div>

        {/* Results */}
        <div
          style={{
            backgroundColor: "white",
            padding: "1.5rem",
            borderRadius: "8px",
            border: "1px solid #dee2e6",
          }}
        >
          <h3 style={{ marginTop: 0, color: "#495057" }}>Results & Logs</h3>

          {/* Address Result */}
          {userAddress && (
            <div
              style={{
                marginBottom: "1rem",
                padding: "1rem",
                backgroundColor: "#d4edda",
                borderRadius: "4px",
                color: "#155724",
                border: "1px solid #c3e6cb",
              }}
            >
              <h4 style={{ margin: "0 0 0.5rem 0" }}>✅ Address Found:</h4>
              <div style={{ fontWeight: "bold", marginBottom: "0.5rem" }}>
                {userAddress}
              </div>
              {userLocation && (
                <div style={{ fontSize: "0.9rem", color: "#6c757d" }}>
                  Coordinates: {userLocation.lat.toFixed(6)},{" "}
                  {userLocation.lng.toFixed(6)}
                </div>
              )}
            </div>
          )}

          {/* Debug Logs */}
          <div style={{ marginTop: "1rem" }}>
            <h4 style={{ color: "#495057", marginBottom: "0.5rem" }}>
              Debug Logs
            </h4>
            <div
              style={{
                backgroundColor: "#f8f9fa",
                border: "1px solid #dee2e6",
                borderRadius: "4px",
                padding: "1rem",
                maxHeight: "400px",
                overflowY: "auto",
                fontFamily: "monospace",
                fontSize: "0.85rem",
              }}
            >
              {logs.length === 0 ? (
                <em style={{ color: "#6c757d" }}>
                  No logs yet. Click the GPS button to start.
                </em>
              ) : (
                logs.map((log, index) => (
                  <div
                    key={index}
                    style={{
                      marginBottom: "0.25rem",
                      color: getLogColor(log.type),
                    }}
                  >
                    <strong>[{log.timestamp}]</strong> {log.message}
                  </div>
                ))
              )}
            </div>
          </div>
        </div>
      </div>

      <div
        style={{
          marginTop: "2rem",
          padding: "1rem",
          backgroundColor: "#e7f3ff",
          borderRadius: "4px",
        }}
      >
        <h4 style={{ margin: "0 0 0.5rem 0", color: "#0056b3" }}>
          🔧 Configuration Info
        </h4>
        <div>
          <strong>Google Maps API Key:</strong>{" "}
          {process.env.NEXT_PUBLIC_GOOGLE_MAPS_API_KEY
            ? "✅ Configured"
            : "❌ Not configured"}
        </div>
        <div style={{ marginTop: "0.25rem" }}>
          <strong>Geolocation Support:</strong>{" "}
          {navigator.geolocation ? "✅ Supported" : "❌ Not supported"}
        </div>
        <div style={{ marginTop: "0.25rem" }}>
          <strong>HTTPS:</strong>{" "}
          {window.location.protocol === "https:"
            ? "✅ Secure"
            : "⚠️ Not secure (may affect geolocation)"}
        </div>
      </div>

      <div
        style={{
          marginTop: "2rem",
          padding: "1rem",
          backgroundColor: "#f8f9fa",
          borderRadius: "4px",
        }}
      >
        <h4 style={{ margin: "0 0 0.5rem 0", color: "#495057" }}>
          🚀 Quick Test - Kraków Coordinates
        </h4>
        <p style={{ margin: "0.5rem 0", color: "#6c757d" }}>
          Test reverse geocoding with known coordinates (50.061389, 19.938333)
        </p>
        <button
          onClick={() => {
            addLog("Testing with Kraków coordinates...");
            setUserLocation({ lat: 50.061389, lng: 19.938333 });
            reverseGeocode(50.061389, 19.938333);
          }}
          disabled={isGeolocatingAddress}
          style={{
            padding: "0.75rem 1rem",
            backgroundColor: isGeolocatingAddress ? "#6c757d" : "#007bff",
            color: "white",
            border: "none",
            borderRadius: "4px",
            fontSize: "0.9rem",
            cursor: isGeolocatingAddress ? "not-allowed" : "pointer",
            opacity: isGeolocatingAddress ? 0.6 : 1,
          }}
        >
          🧪 Test Kraków Reverse Geocoding
        </button>
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
