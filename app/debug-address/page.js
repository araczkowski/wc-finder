"use client";

import { useState } from "react";
import Link from "next/link";
import AddressAutocomplete from "../components/AddressAutocomplete";

export default function DebugAddressPage() {
  const [address, setAddress] = useState("");
  const [coordinates, setCoordinates] = useState(null);
  const [debugLog, setDebugLog] = useState([]);

  const addLog = (message, type = "info") => {
    const timestamp = new Date().toLocaleTimeString();
    const logEntry = {
      timestamp,
      message,
      type,
      id: Date.now() + Math.random(),
    };
    setDebugLog((prev) => [logEntry, ...prev].slice(0, 20)); // Keep last 20 entries
  };

  const handleAddressChange = (newAddress) => {
    addLog(`Address onChange called: "${newAddress}"`, "address");
    setAddress(newAddress);
  };

  const handleCoordinatesChange = (coords) => {
    addLog(
      `Coordinates onChange called: ${coords ? `${coords.lat}, ${coords.lng}` : "null"}`,
      "coordinates",
    );
    if (coords && coords.lat && coords.lng) {
      setCoordinates(coords);
    }
  };

  const clearAll = () => {
    setAddress("");
    setCoordinates(null);
    setDebugLog([]);
  };

  const testScenarios = [
    { name: "Warszawa", description: "Simple city name" },
    {
      name: "ul. Marszałkowska 1, Warszawa",
      description: "Full street address",
    },
    { name: "Kraków", description: "City with special character" },
    { name: "Wrocław", description: "City with ł character" },
  ];

  const runTest = (testAddress) => {
    addLog(`🧪 Running test with: "${testAddress}"`, "test");
    setAddress(testAddress);
  };

  return (
    <div
      style={{
        padding: "2rem",
        maxWidth: "1000px",
        margin: "0 auto",
        fontFamily: "sans-serif",
        backgroundColor: "#f5f5f5",
        minHeight: "100vh",
      }}
    >
      <h1 style={{ color: "#333", marginBottom: "2rem" }}>
        🐛 Address Autocomplete Debug Page
      </h1>

      {/* Test Component */}
      <div
        style={{
          backgroundColor: "white",
          padding: "2rem",
          borderRadius: "8px",
          marginBottom: "2rem",
          boxShadow: "0 2px 4px rgba(0,0,0,0.1)",
        }}
      >
        <h2 style={{ marginTop: 0, color: "#007bff" }}>Component Under Test</h2>

        <div style={{ marginBottom: "1rem" }}>
          <label
            style={{
              display: "block",
              marginBottom: "0.5rem",
              fontWeight: "bold",
            }}
          >
            Address Input:
          </label>
          <AddressAutocomplete
            value={address}
            onChange={handleAddressChange}
            onCoordinatesChange={handleCoordinatesChange}
            placeholder="Start typing an address..."
            style={{
              width: "100%",
              padding: "12px",
              fontSize: "16px",
              border: "2px solid #007bff",
              borderRadius: "4px",
            }}
          />
        </div>

        <div
          style={{
            display: "grid",
            gridTemplateColumns: "1fr 1fr",
            gap: "1rem",
          }}
        >
          <div>
            <strong>Current Address Value:</strong>
            <div
              style={{
                padding: "8px",
                backgroundColor: "#f8f9fa",
                border: "1px solid #dee2e6",
                borderRadius: "4px",
                marginTop: "4px",
                minHeight: "40px",
                wordBreak: "break-all",
              }}
            >
              {address || <em style={{ color: "#6c757d" }}>No address</em>}
            </div>
          </div>

          <div>
            <strong>Current Coordinates:</strong>
            <div
              style={{
                padding: "8px",
                backgroundColor: "#f8f9fa",
                border: "1px solid #dee2e6",
                borderRadius: "4px",
                marginTop: "4px",
                minHeight: "40px",
              }}
            >
              {coordinates ? (
                <div>
                  <div>Lat: {coordinates.lat}</div>
                  <div>Lng: {coordinates.lng}</div>
                </div>
              ) : (
                <em style={{ color: "#6c757d" }}>No coordinates</em>
              )}
            </div>
          </div>
        </div>
      </div>

      {/* Quick Tests */}
      <div
        style={{
          backgroundColor: "white",
          padding: "2rem",
          borderRadius: "8px",
          marginBottom: "2rem",
          boxShadow: "0 2px 4px rgba(0,0,0,0.1)",
        }}
      >
        <h2 style={{ marginTop: 0, color: "#28a745" }}>Quick Test Scenarios</h2>

        <div
          style={{
            display: "grid",
            gridTemplateColumns: "repeat(auto-fit, minmax(250px, 1fr))",
            gap: "1rem",
          }}
        >
          {testScenarios.map((test, index) => (
            <button
              key={index}
              onClick={() => runTest(test.name)}
              style={{
                padding: "12px",
                backgroundColor: "#28a745",
                color: "white",
                border: "none",
                borderRadius: "4px",
                cursor: "pointer",
                textAlign: "left",
              }}
            >
              <div style={{ fontWeight: "bold" }}>{test.name}</div>
              <div style={{ fontSize: "0.9em", opacity: 0.9 }}>
                {test.description}
              </div>
            </button>
          ))}
        </div>

        <div style={{ marginTop: "1rem" }}>
          <button
            onClick={clearAll}
            style={{
              padding: "12px 24px",
              backgroundColor: "#dc3545",
              color: "white",
              border: "none",
              borderRadius: "4px",
              cursor: "pointer",
            }}
          >
            🗑️ Clear All
          </button>
        </div>
      </div>

      {/* Debug Log */}
      <div
        style={{
          backgroundColor: "white",
          padding: "2rem",
          borderRadius: "8px",
          boxShadow: "0 2px 4px rgba(0,0,0,0.1)",
        }}
      >
        <h2 style={{ marginTop: 0, color: "#6f42c1" }}>Debug Log</h2>

        <div
          style={{
            backgroundColor: "#000",
            color: "#00ff00",
            padding: "1rem",
            borderRadius: "4px",
            fontFamily: "monospace",
            fontSize: "14px",
            maxHeight: "400px",
            overflowY: "auto",
          }}
        >
          {debugLog.length === 0 ? (
            <div style={{ color: "#666" }}>Waiting for activity...</div>
          ) : (
            debugLog.map((log) => (
              <div
                key={log.id}
                style={{
                  marginBottom: "4px",
                  color:
                    log.type === "address"
                      ? "#00ff00"
                      : log.type === "coordinates"
                        ? "#ffff00"
                        : log.type === "test"
                          ? "#ff6600"
                          : "#00ffff",
                }}
              >
                [{log.timestamp}] {log.message}
              </div>
            ))
          )}
        </div>
      </div>

      {/* Instructions */}
      <div
        style={{
          backgroundColor: "#fff3cd",
          border: "1px solid #ffeaa7",
          borderRadius: "8px",
          padding: "1.5rem",
          marginTop: "2rem",
        }}
      >
        <h3 style={{ marginTop: 0, color: "#856404" }}>
          🔍 Debug Instructions
        </h3>
        <ol style={{ paddingLeft: "1.5rem", lineHeight: "1.6" }}>
          <li>
            <strong>Manual Test:</strong> Type in the address field and watch
            the log
          </li>
          <li>
            <strong>Suggestion Test:</strong> Type &quot;War&quot; and select
            from dropdown
          </li>
          <li>
            <strong>Quick Test:</strong> Use the green buttons to test common
            scenarios
          </li>
          <li>
            <strong>Check Console:</strong> Open browser console (F12) for
            detailed logs
          </li>
          <li>
            <strong>Verify:</strong> Address should update immediately,
            coordinates after geocoding
          </li>
        </ol>

        <div
          style={{
            marginTop: "1rem",
            padding: "1rem",
            backgroundColor: "#d1ecf1",
            border: "1px solid #bee5eb",
            borderRadius: "4px",
          }}
        >
          <strong>Expected Behavior:</strong>
          <ul style={{ margin: "0.5rem 0", paddingLeft: "1.5rem" }}>
            <li>Type 3+ characters → suggestions appear</li>
            <li>Click/select suggestion → address field updates immediately</li>
            <li>After selection → coordinates appear within 1-2 seconds</li>
            <li>Both events appear in debug log with timestamps</li>
          </ul>
        </div>
      </div>

      {/* Back Navigation */}
      <div style={{ textAlign: "center", marginTop: "2rem" }}>
        <Link
          href="/"
          style={{
            display: "inline-block",
            padding: "12px 24px",
            backgroundColor: "#6c757d",
            color: "white",
            textDecoration: "none",
            borderRadius: "4px",
          }}
        >
          ← Back to Home
        </Link>
      </div>
    </div>
  );
}
