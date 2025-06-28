"use client";

import { useState } from "react";
import { useSession } from "next-auth/react";
import { useRouter } from "next/navigation";
import Link from "next/link";
import {
  CircleChevronLeft,
  Download,
  MapPin,
  Radius,
  Map,
  Copy,
} from "lucide-react";
import { PLACE_TYPES } from "../../utils/placeTypes";
import { pl } from "../../locales/pl";

const styles = {
  container: {
    minHeight: "100vh",
    backgroundColor: "#f8f9fa",
    padding: "20px",
  },
  formContainer: {
    display: "flex",
    justifyContent: "center",
    alignItems: "flex-start",
    minHeight: "calc(100vh - 40px)",
  },
  formCard: {
    backgroundColor: "white",
    padding: "2rem",
    borderRadius: "8px",
    boxShadow: "0 2px 10px rgba(0,0,0,0.1)",
    width: "100%",
    maxWidth: "600px",
    position: "relative",
  },
  backButton: {
    position: "absolute",
    top: "20px",
    left: "20px",
    color: "#666",
    textDecoration: "none",
    display: "flex",
    alignItems: "center",
    gap: "8px",
    fontSize: "14px",
    padding: "8px",
    borderRadius: "4px",
    transition: "all 0.2s ease",
  },
  title: {
    marginBottom: "2rem",
    color: "#333",
    textAlign: "center",
    fontSize: "24px",
    fontWeight: "600",
    marginTop: "20px",
  },
  form: {
    display: "flex",
    flexDirection: "column",
    gap: "1.5rem",
  },
  formGroup: {
    display: "flex",
    flexDirection: "column",
    gap: "0.5rem",
  },
  formLabel: {
    fontSize: "14px",
    fontWeight: "600",
    color: "#333",
    display: "flex",
    alignItems: "center",
    gap: "8px",
  },
  formInput: {
    padding: "12px",
    border: "1px solid #ddd",
    borderRadius: "4px",
    fontSize: "16px",
    transition: "border-color 0.2s ease",
  },
  formSelect: {
    padding: "12px",
    border: "1px solid #ddd",
    borderRadius: "4px",
    fontSize: "16px",
    backgroundColor: "white",
    cursor: "pointer",
    transition: "border-color 0.2s ease",
  },
  submitButton: {
    padding: "12px 24px",
    backgroundColor: "#007bff",
    color: "white",
    border: "none",
    borderRadius: "4px",
    fontSize: "16px",
    fontWeight: "600",
    cursor: "pointer",
    display: "flex",
    alignItems: "center",
    justifyContent: "center",
    gap: "8px",
    transition: "background-color 0.2s ease",
    marginTop: "1rem",
  },
  submitButtonDisabled: {
    backgroundColor: "#6c757d",
    cursor: "not-allowed",
  },
  errorMessage: {
    color: "#dc3545",
    fontSize: "14px",
    marginTop: "0.5rem",
  },
  successMessage: {
    color: "#28a745",
    fontSize: "14px",
    marginTop: "0.5rem",
  },
  loadingMessage: {
    color: "#007bff",
    fontSize: "14px",
    marginTop: "0.5rem",
  },
  accessDenied: {
    textAlign: "center",
    padding: "2rem",
    color: "#dc3545",
    fontSize: "18px",
  },
  helpText: {
    fontSize: "12px",
    color: "#666",
    marginTop: "4px",
  },
  progressContainer: {
    marginTop: "1rem",
    padding: "1rem",
    backgroundColor: "#f8f9fa",
    borderRadius: "4px",
    border: "1px solid #e9ecef",
  },
  progressText: {
    fontSize: "14px",
    color: "#333",
    marginBottom: "0.5rem",
  },
  progressBar: {
    width: "100%",
    height: "20px",
    backgroundColor: "#e9ecef",
    borderRadius: "10px",
    overflow: "hidden",
  },
  progressFill: {
    height: "100%",
    backgroundColor: "#007bff",
    transition: "width 0.3s ease",
  },
  resultsContainer: {
    marginTop: "1rem",
    padding: "1rem",
    backgroundColor: "#f8f9fa",
    borderRadius: "4px",
    border: "1px solid #e9ecef",
  },
  resultItem: {
    fontSize: "14px",
    color: "#333",
    marginBottom: "0.25rem",
  },
};

export default function ImportWcPage() {
  const { data: session, status } = useSession();
  const router = useRouter();

  const [coordinates, setCoordinates] = useState("");
  const [radius, setRadius] = useState("1");
  const [placeType, setPlaceType] = useState("toilet");
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");
  const [progress, setProgress] = useState(0);
  const [results, setResults] = useState(null);
  const [googleMapsUrl, setGoogleMapsUrl] = useState("");

  // Check if user is admin
  const isAdmin = session?.user?.email === "admin@sviete.pl";

  if (status === "loading") {
    return (
      <div style={styles.container}>
        <div style={styles.formContainer}>
          <div style={styles.formCard}>
            <p style={styles.loadingMessage}>Ładowanie...</p>
          </div>
        </div>
      </div>
    );
  }

  if (!session || !isAdmin) {
    return (
      <div style={styles.container}>
        <div style={styles.formContainer}>
          <div style={styles.formCard}>
            <Link href="/" style={styles.backButton}>
              <CircleChevronLeft size={20} />
              Powrót do strony głównej
            </Link>
            <div style={styles.accessDenied}>
              <h2>Brak dostępu</h2>
              <p>Ta strona jest dostępna tylko dla administratorów.</p>
            </div>
          </div>
        </div>
      </div>
    );
  }

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError("");
    setSuccess("");
    setResults(null);
    setProgress(0);

    // Validate inputs
    if (!coordinates.trim()) {
      setError("Współrzędne są wymagane");
      return;
    }

    if (!radius.trim()) {
      setError("Promień jest wymagany");
      return;
    }

    const radiusNum = parseFloat(radius);
    if (isNaN(radiusNum) || radiusNum <= 0) {
      setError("Promień musi być liczbą większą od 0");
      return;
    }

    if (radiusNum > 50) {
      setError("Maksymalny promień to 50 km");
      return;
    }

    // Clean and normalize coordinates input
    const cleanCoords = coordinates
      .trim()
      .replace(/\s+/g, " ") // normalize whitespace
      .replace(/[，]/g, ",") // replace Unicode commas
      .replace(/\u00A0/g, " ") // replace non-breaking spaces
      .replace(/\u2009/g, " ") // replace thin spaces
      .replace(/\u202F/g, " "); // replace narrow no-break spaces

    // Validate coordinates format (lat,lng) - accept precise Google Maps coordinates
    const coordsPattern = /^-?\d+(\.\d+)?\s*,\s*-?\d+(\.\d+)?$/;
    if (!coordsPattern.test(cleanCoords)) {
      setError(
        `Nieprawidłowy format współrzędnych. Otrzymano: "${coordinates}". Wymagany format: szerokość,długość (np. 52.2297,21.0122)`,
      );
      return;
    }

    // Parse and validate coordinate bounds
    const coordParts = cleanCoords.split(",");
    if (coordParts.length !== 2) {
      setError(
        "Współrzędne muszą zawierać dokładnie dwie wartości oddzielone przecinkiem",
      );
      return;
    }

    const lat = parseFloat(coordParts[0].trim());
    const lng = parseFloat(coordParts[1].trim());

    if (isNaN(lat) || isNaN(lng)) {
      setError("Współrzędne muszą być liczbami");
      return;
    }

    if (lat < -90 || lat > 90) {
      setError(
        `Szerokość geograficzna poza zakresem: ${lat}. Musi być między -90 a 90`,
      );
      return;
    }

    if (lng < -180 || lng > 180) {
      setError(
        `Długość geograficzna poza zakresem: ${lng}. Musi być między -180 a 180`,
      );
      return;
    }

    setLoading(true);

    try {
      const response = await fetch("/api/admin/import-places", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          coordinates: cleanCoords,
          radius: radiusNum * 1000, // Convert km to meters for API
          placeType,
        }),
      });

      const data = await response.json();

      if (!response.ok) {
        throw new Error(
          data.error || "Wystąpił błąd podczas pobierania danych",
        );
      }

      setSuccess(
        `Pomyślnie pobrano i zapisano dane z OpenStreetMap i web scraping${placeType === "*" ? " (wszystkie typy)" : ""}`,
      );
      setResults(data.results);
      setProgress(100);
    } catch (err) {
      console.error("Import error:", err);
      setError(err.message || "Wystąpił błąd podczas pobierania danych");
    } finally {
      setLoading(false);
    }
  };

  const extractCoordinatesFromUrl = (url) => {
    // First check if it's already just coordinates
    const coordPattern = /^-?\d+(\.\d+)?\s*,\s*-?\d+(\.\d+)?$/;
    if (coordPattern.test(url.trim())) {
      return url
        .trim()
        .replace(/\s+/g, "")
        .replace(/\s*,\s*/, ",");
    }

    // Try to extract coordinates from Google Maps URL
    const patterns = [
      /@(-?\d+\.?\d*),(-?\d+\.?\d*)/,
      /!3d(-?\d+\.?\d*)!4d(-?\d+\.?\d*)/,
      /ll=(-?\d+\.?\d*),(-?\d+\.?\d*)/,
      /q=(-?\d+\.?\d*),(-?\d+\.?\d*)/,
      /center=(-?\d+\.?\d*),(-?\d+\.?\d*)/,
    ];

    for (const pattern of patterns) {
      const match = url.match(pattern);
      if (match) {
        return `${match[1]},${match[2]}`;
      }
    }
    return null;
  };

  const handleExtractFromUrl = () => {
    if (!googleMapsUrl.trim()) {
      setError("Podaj URL z Google Maps");
      return;
    }

    const extracted = extractCoordinatesFromUrl(googleMapsUrl);
    if (extracted) {
      setCoordinates(extracted);
      setGoogleMapsUrl("");
      setError("");
    } else {
      setError("Nie można wyodrębnić współrzędnych z podanego URL");
    }
  };

  const placeTypeOptions = [
    ...(isAdmin ? [{ value: "*", label: "* Wszystkie typy" }] : []),
    ...PLACE_TYPES.map((type) => ({
      value: type,
      label: pl.placeTypes[type] || type,
    })),
  ];

  return (
    <div style={styles.container}>
      <div style={styles.formContainer}>
        <div style={styles.formCard}>
          <Link href="/" style={styles.backButton}>
            <CircleChevronLeft size={20} />
            Powrót
          </Link>

          <h1 style={styles.title}>
            <Download size={24} style={{ marginRight: "8px" }} />
            Pobieranie WC z OpenStreetMap
          </h1>

          <form onSubmit={handleSubmit} style={styles.form}>
            <div style={styles.formGroup}>
              <label style={styles.formLabel}>
                <MapPin size={16} />
                Współrzędne
              </label>
              <input
                type="text"
                value={coordinates}
                onChange={(e) => setCoordinates(e.target.value)}
                placeholder="52.2297,21.0122"
                style={styles.formInput}
                disabled={loading}
              />
              <div style={styles.helpText}>
                Podaj współrzędne w formacie: szerokość,długość (np.
                52.2297,21.0122 lub precyzyjne z Google Maps)
              </div>

              {/* Debug info for coordinates */}
              {coordinates && (
                <div
                  style={{
                    fontSize: "11px",
                    color: "#666",
                    marginTop: "4px",
                    backgroundColor: "#f0f0f0",
                    padding: "4px 8px",
                    borderRadius: "3px",
                    fontFamily: "monospace",
                  }}
                >
                  Debug: &quot;{coordinates}&quot; (długość:{" "}
                  {coordinates.length} znaków)
                  <br />
                  Kody:{" "}
                  {coordinates
                    .split("")
                    .map((char, i) => `${char}(${char.charCodeAt(0)})`)
                    .join(" ")}
                </div>
              )}

              {/* Google Maps URL Helper */}
              <div
                style={{
                  marginTop: "1rem",
                  padding: "1rem",
                  backgroundColor: "#f8f9fa",
                  borderRadius: "4px",
                  border: "1px solid #e9ecef",
                }}
              >
                <label
                  style={{
                    ...styles.formLabel,
                    fontSize: "12px",
                    marginBottom: "0.5rem",
                  }}
                >
                  <Copy size={14} />
                  Lub wyodrębnij z URL Google Maps:
                </label>
                <div style={{ display: "flex", gap: "0.5rem" }}>
                  <input
                    type="text"
                    value={googleMapsUrl}
                    onChange={(e) => setGoogleMapsUrl(e.target.value)}
                    placeholder="Wklej URL z Google Maps..."
                    style={{ ...styles.formInput, flex: 1, margin: 0 }}
                    disabled={loading}
                  />
                  <button
                    type="button"
                    onClick={handleExtractFromUrl}
                    style={{
                      padding: "8px 12px",
                      backgroundColor: "#28a745",
                      color: "white",
                      border: "none",
                      borderRadius: "4px",
                      fontSize: "12px",
                      cursor: "pointer",
                      whiteSpace: "nowrap",
                    }}
                    disabled={loading}
                  >
                    Wyodrębnij
                  </button>
                </div>
                <div
                  style={{ fontSize: "11px", color: "#666", marginTop: "4px" }}
                >
                  Przykład:
                  https://maps.google.com/.../@51.164381946325875,16.592739184016388,...
                  <br />
                  Lub po prostu: 51.164381946325875, 16.592739184016388
                </div>
              </div>
            </div>

            <div style={styles.formGroup}>
              <label style={styles.formLabel}>
                <Radius size={16} />
                Promień (kilometry)
              </label>
              <input
                type="number"
                value={radius}
                onChange={(e) => setRadius(e.target.value)}
                placeholder="1"
                min="0.1"
                max="50"
                step="0.1"
                style={styles.formInput}
                disabled={loading}
              />
              <div style={styles.helpText}>
                Maksymalny promień wyszukiwania w kilometrach (0.1-50)
              </div>
            </div>

            <div style={styles.formGroup}>
              <label style={styles.formLabel}>
                <Map size={16} />
                Typ miejsca
              </label>
              <select
                value={placeType}
                onChange={(e) => setPlaceType(e.target.value)}
                style={styles.formSelect}
                disabled={loading}
              >
                {placeTypeOptions.map((option) => (
                  <option key={option.value} value={option.value}>
                    {option.label}
                  </option>
                ))}
              </select>
              <div style={styles.helpText}>
                Wybierz typ miejsca do wyszukania
              </div>
            </div>

            <button
              type="submit"
              style={{
                ...styles.submitButton,
                ...(loading ? styles.submitButtonDisabled : {}),
              }}
              disabled={loading}
            >
              {loading ? (
                <>
                  <span>Pobieranie...</span>
                </>
              ) : (
                <>
                  <Download size={16} />
                  Pobierz
                </>
              )}
            </button>

            {error && <div style={styles.errorMessage}>{error}</div>}
            {success && <div style={styles.successMessage}>{success}</div>}
          </form>

          {loading && (
            <div style={styles.progressContainer}>
              <div style={styles.progressText}>
                Pobieranie danych z OpenStreetMap i web scraping...
                {placeType === "*" && " (wszystkie typy)"}
              </div>
              <div style={styles.progressBar}>
                <div
                  style={{
                    ...styles.progressFill,
                    width: `${progress}%`,
                  }}
                />
              </div>
            </div>
          )}

          {results && (
            <div style={styles.resultsContainer}>
              <h3>Wyniki importu{placeType === "*" && " (wszystkie typy)"}:</h3>
              <div style={styles.resultItem}>
                📍 Znaleziono miejsc: {results.found || 0}
              </div>
              <div style={styles.resultItem}>
                ✅ Dodano nowych WC: {results.added || 0}
              </div>
              <div style={styles.resultItem}>
                ⚠️ Pominięto duplikatów: {results.skipped || 0}
              </div>
              <div style={styles.resultItem}>
                🖼️ Dodano zdjęć: {results.photos || 0}
              </div>
              <div style={styles.resultItem}>
                ⭐ Dodano ocen: {results.ratings || 0}
              </div>
              <div style={styles.resultItem}>
                🏷️ Dodano tagów: {results.tags || 0}
              </div>
              {placeType === "*" && (
                <div style={styles.resultItem}>
                  🎯 Importowane typy: {PLACE_TYPES.length} typów
                </div>
              )}
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
