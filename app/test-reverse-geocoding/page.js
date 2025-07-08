"use client";

import { useState } from "react";
import Link from "next/link";

export default function TestReverseGeocodingPage() {
  const [lat, setLat] = useState("51.1998428");
  const [lng, setLng] = useState("16.611037");
  const [result, setResult] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);
  const [logs, setLogs] = useState([]);

  const addLog = (message, type = "info") => {
    const timestamp = new Date().toLocaleTimeString();
    setLogs(prev => [...prev, { timestamp, message, type }]);
  };

  const testGoogleMapsGeocoding = async () => {
    setLoading(true);
    setError(null);
    setResult(null);
    setLogs([]);

    try {
      const apiKey = process.env.NEXT_PUBLIC_GOOGLE_MAPS_API_KEY;
      addLog(`Google Maps API key present: ${!!apiKey}`);

      if (!apiKey) {
        throw new Error("Google Maps API key not found");
      }

      const url = `https://maps.googleapis.com/maps/api/geocode/json?latlng=${lat},${lng}&key=${apiKey}&language=pl`;
      addLog(`Request URL: ${url}`);

      const response = await fetch(url);
      addLog(`Response status: ${response.status}`);

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }

      const data = await response.json();
      addLog(`Response data: ${JSON.stringify(data, null, 2)}`);

      if (data.status === "OK" && data.results.length > 0) {
        setResult({
          service: "Google Maps",
          address: data.results[0].formatted_address,
          fullData: data
        });
        addLog(`Success! Address: ${data.results[0].formatted_address}`, "success");
      } else {
        throw new Error(`Google Maps API error: ${data.status} - ${data.error_message || 'Unknown error'}`);
      }
    } catch (err) {
      addLog(`Error: ${err.message}`, "error");
      setError(err.message);
    } finally {
      setLoading(false);
    }
  };

  const testNominatimGeocoding = async () => {
    setLoading(true);
    setError(null);
    setResult(null);
    setLogs([]);

    try {
      const url = `https://nominatim.openstreetmap.org/reverse?format=json&lat=${lat}&lon=${lng}&zoom=16&addressdetails=1&accept-language=pl`;
      addLog(`Request URL: ${url}`);

      const response = await fetch(url, {
        headers: {
          'User-Agent': 'WC-Finder/1.0 (test)'
        }
      });
      addLog(`Response status: ${response.status}`);

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }

      const data = await response.json();
      addLog(`Response data: ${JSON.stringify(data, null, 2)}`);

      if (data && data.display_name) {
        setResult({
          service: "Nominatim",
          address: data.display_name,
          fullData: data
        });
        addLog(`Success! Address: ${data.display_name}`, "success");
      } else {
        throw new Error("Nominatim: No display_name in response");
      }
    } catch (err) {
      addLog(`Error: ${err.message}`, "error");
      setError(err.message);
    } finally {
      setLoading(false);
    }
  };

  const testCombinedGeocoding = async () => {
    setLoading(true);
    setError(null);
    setResult(null);
    setLogs([]);

    try {
      const apiKey = process.env.NEXT_PUBLIC_GOOGLE_MAPS_API_KEY;
      addLog(`Starting combined geocoding test...`);
      addLog(`Google Maps API key present: ${!!apiKey}`);

      if (apiKey) {
        addLog("Trying Google Maps API first...");
        try {
          const googleUrl = `https://maps.googleapis.com/maps/api/geocode/json?latlng=${lat},${lng}&key=${apiKey}&language=pl`;
          addLog(`Google Maps URL: ${googleUrl}`);

          const googleResponse = await fetch(googleUrl);
          addLog(`Google Maps response status: ${googleResponse.status}`);

          const googleData = await googleResponse.json();
          addLog(`Google Maps response: ${JSON.stringify(googleData, null, 2)}`);

          if (googleData.status === "OK" && googleData.results.length > 0) {
            setResult({
              service: "Google Maps",
              address: googleData.results[0].formatted_address,
              fullData: googleData
            });
            addLog(`Google Maps Success! Address: ${googleData.results[0].formatted_address}`, "success");
            return;
          } else {
            addLog(`Google Maps failed: ${googleData.status} - ${googleData.error_message || 'Unknown error'}`, "warning");
          }
        } catch (googleErr) {
          addLog(`Google Maps error: ${googleErr.message}`, "error");
        }
      }

      // Fallback to Nominatim
      addLog("Falling back to Nominatim...");
      const nominatimUrl = `https://nominatim.openstreetmap.org/reverse?format=json&lat=${lat}&lon=${lng}&zoom=16&addressdetails=1&accept-language=pl`;
      addLog(`Nominatim URL: ${nominatimUrl}`);

      const nominatimResponse = await fetch(nominatimUrl, {
        headers: {
          'User-Agent': 'WC-Finder/1.0 (test)'
        }
      });
      addLog(`Nominatim response status: ${nominatimResponse.status}`);

      const nominatimData = await nominatimResponse.json();
      addLog(`Nominatim response: ${JSON.stringify(nominatimData, null, 2)}`);

      if (nominatimData && nominatimData.display_name) {
        setResult({
          service: "Nominatim",
          address: nominatimData.display_name,
          fullData: nominatimData
        });
        addLog(`Nominatim Success! Address: ${nominatimData.display_name}`, "success");
      } else {
        throw new Error("Both Google Maps and Nominatim failed");
      }
    } catch (err) {
      addLog(`Final error: ${err.message}`, "error");
      setError(err.message);
    } finally {
      setLoading(false);
    }
  };

  const getCurrentLocation = () => {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        (position) => {
          setLat(position.coords.latitude.toString());
          setLng(position.coords.longitude.toString());
          addLog(`Got current location: ${position.coords.latitude}, ${position.coords.longitude}`, "success");
        },
        (error) => {
          addLog(`Geolocation error: ${error.message}`, "error");
        }
      );
    } else {
      addLog("Geolocation is not supported by this browser", "error");
    }
  };

  const getLogColor = (type) => {
    switch (type) {
      case "success": return "#28a745";
      case "error": return "#dc3545";
      case "warning": return "#ffc107";
      default: return "#6c757d";
    }
  };

  return (
    <div style={{ padding: "2rem", maxWidth: "1200px", margin: "0 auto", fontFamily: "sans-serif" }}>
      <h1 style={{ marginBottom: "2rem", color: "#333" }}>
        🧪 Reverse Geocoding Test Page
      </h1>

      <div style={{ marginBottom: "2rem" }}>
        <Link href="/" style={{ color: "#007bff", textDecoration: "none" }}>
          ← Back to WC Finder
        </Link>
      </div>

      <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: "2rem" }}>
        {/* Controls */}
        <div style={{ backgroundColor: "white", padding: "1.5rem", borderRadius: "8px", border: "1px solid #dee2e6" }}>
          <h3 style={{ marginTop: 0, color: "#495057" }}>Coordinates Input</h3>

          <div style={{ marginBottom: "1rem" }}>
            <label style={{ display: "block", marginBottom: "0.5rem", fontWeight: "bold" }}>
              Latitude:
            </label>
            <input
              type="text"
              value={lat}
              onChange={(e) => setLat(e.target.value)}
              style={{
                width: "100%",
                padding: "0.5rem",
                border: "1px solid #ced4da",
                borderRadius: "4px",
                fontSize: "1rem"
              }}
            />
          </div>

          <div style={{ marginBottom: "1rem" }}>
            <label style={{ display: "block", marginBottom: "0.5rem", fontWeight: "bold" }}>
              Longitude:
            </label>
            <input
              type="text"
              value={lng}
              onChange={(e) => setLng(e.target.value)}
              style={{
                width: "100%",
                padding: "0.5rem",
                border: "1px solid #ced4da",
                borderRadius: "4px",
                fontSize: "1rem"
              }}
            />
          </div>

          <button
            onClick={getCurrentLocation}
            style={{
              width: "100%",
              padding: "0.75rem",
              backgroundColor: "#17a2b8",
              color: "white",
              border: "none",
              borderRadius: "4px",
              fontSize: "1rem",
              cursor: "pointer",
              marginBottom: "1rem"
            }}
          >
            📍 Get Current Location
          </button>

          <h4 style={{ marginTop: "1.5rem", color: "#495057" }}>Test Options</h4>

          <div style={{ display: "flex", flexDirection: "column", gap: "0.5rem" }}>
            <button
              onClick={testGoogleMapsGeocoding}
              disabled={loading}
              style={{
                padding: "0.75rem",
                backgroundColor: "#28a745",
                color: "white",
                border: "none",
                borderRadius: "4px",
                fontSize: "1rem",
                cursor: loading ? "not-allowed" : "pointer",
                opacity: loading ? 0.6 : 1
              }}
            >
              {loading ? "Testing..." : "Test Google Maps Only"}
            </button>

            <button
              onClick={testNominatimGeocoding}
              disabled={loading}
              style={{
                padding: "0.75rem",
                backgroundColor: "#007bff",
                color: "white",
                border: "none",
                borderRadius: "4px",
                fontSize: "1rem",
                cursor: loading ? "not-allowed" : "pointer",
                opacity: loading ? 0.6 : 1
              }}
            >
              {loading ? "Testing..." : "Test Nominatim Only"}
            </button>

            <button
              onClick={testCombinedGeocoding}
              disabled={loading}
              style={{
                padding: "0.75rem",
                backgroundColor: "#6f42c1",
                color: "white",
                border: "none",
                borderRadius: "4px",
                fontSize: "1rem",
                cursor: loading ? "not-allowed" : "pointer",
                opacity: loading ? 0.6 : 1
              }}
            >
              {loading ? "Testing..." : "Test Combined (Google → Nominatim)"}
            </button>
          </div>
        </div>

        {/* Results */}
        <div style={{ backgroundColor: "white", padding: "1.5rem", borderRadius: "8px", border: "1px solid #dee2e6" }}>
          <h3 style={{ marginTop: 0, color: "#495057" }}>Results</h3>

          {loading && (
            <div style={{ padding: "1rem", backgroundColor: "#e7f3ff", borderRadius: "4px", marginBottom: "1rem" }}>
              <div style={{ display: "flex", alignItems: "center", gap: "0.5rem" }}>
                <div style={{
                  width: "16px",
                  height: "16px",
                  border: "2px solid #007bff",
                  borderTop: "2px solid transparent",
                  borderRadius: "50%",
                  animation: "spin 1s linear infinite"
                }}></div>
                Testing reverse geocoding...
              </div>
            </div>
          )}

          {error && (
            <div style={{ padding: "1rem", backgroundColor: "#f8d7da", borderRadius: "4px", marginBottom: "1rem", color: "#721c24" }}>
              <strong>Error:</strong> {error}
            </div>
          )}

          {result && (
            <div style={{ padding: "1rem", backgroundColor: "#d4edda", borderRadius: "4px", marginBottom: "1rem", color: "#155724" }}>
              <strong>Success! ({result.service})</strong>
              <br />
              <strong>Address:</strong> {result.address}
            </div>
          )}

          {/* Logs */}
          <div style={{ marginTop: "1rem" }}>
            <h4 style={{ color: "#495057", marginBottom: "0.5rem" }}>Debug Logs</h4>
            <div style={{
              backgroundColor: "#f8f9fa",
              border: "1px solid #dee2e6",
              borderRadius: "4px",
              padding: "1rem",
              maxHeight: "400px",
              overflowY: "auto",
              fontFamily: "monospace",
              fontSize: "0.85rem"
            }}>
              {logs.length === 0 ? (
                <em style={{ color: "#6c757d" }}>No logs yet. Click a test button to start.</em>
              ) : (
                logs.map((log, index) => (
                  <div key={index} style={{ marginBottom: "0.25rem", color: getLogColor(log.type) }}>
                    <strong>[{log.timestamp}]</strong> {log.message}
                  </div>
                ))
              )}
            </div>
          </div>
        </div>
      </div>

      <div style={{ marginTop: "2rem", padding: "1rem", backgroundColor: "#e7f3ff", borderRadius: "4px" }}>
        <h4 style={{ margin: "0 0 0.5rem 0", color: "#0056b3" }}>🔧 API Configuration</h4>
        <div><strong>Google Maps API Key:</strong> {process.env.NEXT_PUBLIC_GOOGLE_MAPS_API_KEY ? "✅ Configured" : "❌ Not configured"}</div>
        <div style={{ marginTop: "0.25rem" }}><strong>Current Test Coordinates:</strong> {lat}, {lng}</div>
      </div>

      <style jsx>{`
        @keyframes spin {
          0% { transform: rotate(0deg); }
          100% { transform: rotate(360deg); }
        }
      `}</style>
    </div>
  );
}
