"use client";

import { useState } from "react";
import Link from "next/link";
import AddressAutocomplete from "../components/AddressAutocomplete";

export default function TestAddressPage() {
  const [address, setAddress] = useState("");
  const [coordinates, setCoordinates] = useState(null);
  const [log, setLog] = useState([]);

  const addToLog = (message) => {
    const timestamp = new Date().toLocaleTimeString();
    setLog((prev) => [...prev, `[${timestamp}] ${message}`]);
  };

  const handleAddressChange = (newAddress) => {
    setAddress(newAddress);
    addToLog(`Address changed: ${newAddress}`);
  };

  const handleCoordinatesChange = (coords) => {
    setCoordinates(coords);
    addToLog(
      `Coordinates: ${coords ? `${coords.lat}, ${coords.lng}` : "null"}`,
    );
  };

  const clearLog = () => {
    setLog([]);
  };

  const resetForm = () => {
    setAddress("");
    setCoordinates(null);
    setLog([]);
  };

  return (
    <div
      style={{
        padding: "2rem",
        maxWidth: "800px",
        margin: "0 auto",
        fontFamily: "sans-serif",
      }}
    >
      <h1 style={{ marginBottom: "2rem", color: "#333" }}>
        🧪 Address Autocomplete Test Page
      </h1>

      <div
        style={{
          backgroundColor: "#f8f9fa",
          padding: "1.5rem",
          borderRadius: "8px",
          marginBottom: "2rem",
          border: "1px solid #dee2e6",
        }}
      >
        <h2 style={{ marginTop: 0, marginBottom: "1rem", color: "#495057" }}>
          Test Component
        </h2>

        <div style={{ marginBottom: "1rem" }}>
          <label
            style={{
              display: "block",
              marginBottom: "0.5rem",
              fontWeight: "bold",
              color: "#495057",
            }}
          >
            Address with Autocomplete:
          </label>
          <AddressAutocomplete
            value={address}
            onChange={handleAddressChange}
            onCoordinatesChange={handleCoordinatesChange}
            placeholder="Wpisz adres, np. ul. Marszałkowska 1, Warszawa"
            style={{
              fontSize: "1rem",
              padding: "0.75rem",
              border: "2px solid #007bff",
              borderRadius: "4px",
            }}
          />
        </div>

        <div
          style={{
            display: "grid",
            gridTemplateColumns: "1fr 1fr 1fr",
            gap: "1rem",
            marginTop: "1rem",
          }}
        >
          <button
            onClick={resetForm}
            style={{
              padding: "0.75rem",
              backgroundColor: "#6c757d",
              color: "white",
              border: "none",
              borderRadius: "4px",
              cursor: "pointer",
              fontSize: "1rem",
            }}
          >
            🔄 Reset Form
          </button>
          <button
            onClick={clearLog}
            style={{
              padding: "0.75rem",
              backgroundColor: "#dc3545",
              color: "white",
              border: "none",
              borderRadius: "4px",
              cursor: "pointer",
              fontSize: "1rem",
            }}
          >
            🗑️ Clear Log
          </button>
          <button
            onClick={() => {
              setAddress("ul. Marszałkowska 1, Warszawa");
              addToLog("Quick test: Set Warsaw address");
            }}
            style={{
              padding: "0.75rem",
              backgroundColor: "#28a745",
              color: "white",
              border: "none",
              borderRadius: "4px",
              cursor: "pointer",
              fontSize: "1rem",
            }}
          >
            🧪 Quick Test
          </button>
        </div>
      </div>

      <div
        style={{
          display: "grid",
          gridTemplateColumns: "1fr 1fr",
          gap: "2rem",
          marginBottom: "2rem",
        }}
      >
        {/* Current State */}
        <div
          style={{
            backgroundColor: "white",
            padding: "1.5rem",
            borderRadius: "8px",
            border: "1px solid #dee2e6",
            boxShadow: "0 2px 4px rgba(0,0,0,0.1)",
          }}
        >
          <h3 style={{ marginTop: 0, color: "#28a745" }}>📊 Current State</h3>

          <div style={{ marginBottom: "1rem" }}>
            <strong>Address:</strong>
            <div
              style={{
                padding: "0.5rem",
                backgroundColor: "#f8f9fa",
                border: "1px solid #dee2e6",
                borderRadius: "4px",
                marginTop: "0.25rem",
                wordBreak: "break-all",
              }}
            >
              {address || (
                <em style={{ color: "#6c757d" }}>No address entered</em>
              )}
            </div>
          </div>

          <div>
            <strong>GPS Coordinates:</strong>
            <div
              style={{
                padding: "0.5rem",
                backgroundColor: "#f8f9fa",
                border: "1px solid #dee2e6",
                borderRadius: "4px",
                marginTop: "0.25rem",
              }}
            >
              {coordinates ? (
                <div>
                  <div>
                    <strong>Lat:</strong> {coordinates.lat}
                  </div>
                  <div>
                    <strong>Lng:</strong> {coordinates.lng}
                  </div>
                  <div
                    style={{
                      marginTop: "0.5rem",
                      fontSize: "0.9rem",
                      color: "#6c757d",
                    }}
                  >
                    <a
                      href={`https://www.google.com/maps?q=${coordinates.lat},${coordinates.lng}`}
                      target="_blank"
                      rel="noopener noreferrer"
                      style={{ color: "#007bff" }}
                    >
                      🗺️ View on Google Maps
                    </a>
                  </div>
                </div>
              ) : (
                <em style={{ color: "#6c757d" }}>No coordinates available</em>
              )}
            </div>
          </div>
        </div>

        {/* Test Instructions */}
        <div
          style={{
            backgroundColor: "white",
            padding: "1.5rem",
            borderRadius: "8px",
            border: "1px solid #dee2e6",
            boxShadow: "0 2px 4px rgba(0,0,0,0.1)",
          }}
        >
          <h3 style={{ marginTop: 0, color: "#007bff" }}>🧪 Test Scenarios</h3>

          <ol style={{ paddingLeft: "1.5rem", lineHeight: "1.6" }}>
            <li>
              <strong>Polish Cities:</strong> Try &quot;Warszawa&quot;,
              &quot;Kraków&quot;, &quot;Gdańsk&quot;
            </li>
            <li>
              <strong>Streets:</strong> Try &quot;ul. Marszałkowska 1,
              Warszawa&quot;
            </li>
            <li>
              <strong>Special Characters:</strong> Try &quot;Wrocław&quot;,
              &quot;Łódź&quot;, &quot;Częstochowa&quot;
            </li>
            <li>
              <strong>Keyboard Navigation:</strong> Use ↑↓ keys, Enter to select
            </li>
            <li>
              <strong>Manual Entry:</strong> Type full address and press Enter
            </li>
            <li>
              <strong>Edit Form Test:</strong> Check if autocomplete works in
              edit form
            </li>
            <li>
              <strong>Coordinates Update:</strong> Verify GPS coordinates appear
              below
            </li>
            <li>
              <strong>Fallback Test:</strong> Try with invalid Google API key
            </li>
          </ol>

          <div
            style={{
              marginTop: "1rem",
              padding: "0.75rem",
              backgroundColor: "#fff3cd",
              border: "1px solid #ffeaa7",
              borderRadius: "4px",
              fontSize: "0.9rem",
            }}
          >
            <strong>💡 Note:</strong> If Google Maps API is not configured, the
            component will automatically fall back to OpenStreetMap (Nominatim).
            Watch the console for debugging information.
          </div>

          <div
            style={{
              marginTop: "0.5rem",
              padding: "0.75rem",
              backgroundColor: "#d1ecf1",
              border: "1px solid #bee5eb",
              borderRadius: "4px",
              fontSize: "0.9rem",
            }}
          >
            <strong>🔍 Expected Behavior:</strong>
            <ul style={{ margin: "0.5rem 0", paddingLeft: "1.5rem" }}>
              <li>Type 3+ characters → suggestions appear</li>
              <li>Select suggestion → address fills, coordinates appear</li>
              <li>Manual entry + Enter → coordinates appear</li>
              <li>Console shows debugging info in development</li>
            </ul>
          </div>
        </div>
      </div>

      {/* Activity Log */}
      <div
        style={{
          backgroundColor: "white",
          padding: "1.5rem",
          borderRadius: "8px",
          border: "1px solid #dee2e6",
          boxShadow: "0 2px 4px rgba(0,0,0,0.1)",
        }}
      >
        <h3 style={{ marginTop: 0, color: "#6f42c1" }}>📝 Activity Log</h3>

        <div
          style={{
            backgroundColor: "#f8f9fa",
            border: "1px solid #dee2e6",
            borderRadius: "4px",
            padding: "1rem",
            maxHeight: "300px",
            overflowY: "auto",
            fontFamily: "monospace",
            fontSize: "0.9rem",
            lineHeight: "1.4",
          }}
        >
          {log.length === 0 ? (
            <em style={{ color: "#6c757d" }}>
              No activity yet. Try typing in the address field above.
            </em>
          ) : (
            log.map((entry, index) => (
              <div key={index} style={{ marginBottom: "0.25rem" }}>
                {entry}
              </div>
            ))
          )}
        </div>
      </div>

      {/* API Status */}
      <div
        style={{
          marginTop: "2rem",
          padding: "1rem",
          backgroundColor: "#e7f3ff",
          border: "1px solid #b3d9ff",
          borderRadius: "4px",
          fontSize: "0.9rem",
        }}
      >
        <h4 style={{ margin: "0 0 0.5rem 0", color: "#0056b3" }}>
          🔧 API Configuration
        </h4>
        <div>
          <strong>Google Maps API:</strong>{" "}
          {process.env.NEXT_PUBLIC_GOOGLE_MAPS_API_KEY
            ? "✅ Configured"
            : "⚠️ Not configured (using Nominatim fallback)"}
        </div>
        <div style={{ marginTop: "0.25rem" }}>
          <strong>Development Mode:</strong>{" "}
          {process.env.NODE_ENV === "development"
            ? "✅ Enabled (debug info shown)"
            : "❌ Production"}
        </div>
        <div style={{ marginTop: "0.25rem" }}>
          <strong>Component Status:</strong>{" "}
          {address || coordinates ? "🔄 Active" : "⏳ Waiting for input"}
        </div>
        <div
          style={{ marginTop: "0.5rem", fontSize: "0.8rem", color: "#495057" }}
        >
          Add <code>NEXT_PUBLIC_GOOGLE_MAPS_API_KEY</code> to your{" "}
          <code>.env.local</code>
          file to enable Google Maps integration.
        </div>
      </div>

      {/* Navigation Links */}
      <div
        style={{
          marginTop: "2rem",
          textAlign: "center",
          display: "flex",
          gap: "1rem",
          justifyContent: "center",
        }}
      >
        <Link
          href="/"
          style={{
            display: "inline-block",
            padding: "0.75rem 1.5rem",
            backgroundColor: "#28a745",
            color: "white",
            textDecoration: "none",
            borderRadius: "4px",
            fontSize: "1rem",
          }}
        >
          ← Back to WC Finder
        </Link>
        <Link
          href="/wc/add"
          style={{
            display: "inline-block",
            padding: "0.75rem 1.5rem",
            backgroundColor: "#007bff",
            color: "white",
            textDecoration: "none",
            borderRadius: "4px",
            fontSize: "1rem",
          }}
        >
          🚽 Test in Add WC Form
        </Link>
      </div>
    </div>
  );
}
