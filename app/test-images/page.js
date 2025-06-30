"use client";

import { useState } from "react";
import Link from "next/link";
import { CircleChevronLeft, ImageIcon, RefreshCw } from "lucide-react";

const styles = {
  container: {
    minHeight: "100vh",
    backgroundColor: "#f8f9fa",
    padding: "2rem 1rem",
  },
  header: {
    maxWidth: "1200px",
    margin: "0 auto",
    marginBottom: "2rem",
  },
  backButton: {
    display: "inline-flex",
    alignItems: "center",
    gap: "0.5rem",
    color: "#007bff",
    textDecoration: "none",
    marginBottom: "1rem",
    fontSize: "0.9rem",
    fontWeight: "500",
  },
  title: {
    fontSize: "2rem",
    fontWeight: "bold",
    color: "#333",
    display: "flex",
    alignItems: "center",
    gap: "0.5rem",
    marginBottom: "1rem",
  },
  description: {
    color: "#666",
    lineHeight: "1.6",
  },
  content: {
    maxWidth: "1200px",
    margin: "0 auto",
  },
  section: {
    backgroundColor: "white",
    borderRadius: "8px",
    padding: "1.5rem",
    marginBottom: "2rem",
    boxShadow: "0 2px 4px rgba(0,0,0,0.1)",
  },
  sectionTitle: {
    fontSize: "1.25rem",
    fontWeight: "600",
    color: "#333",
    marginBottom: "1rem",
  },
  grid: {
    display: "grid",
    gridTemplateColumns: "repeat(auto-fit, minmax(300px, 1fr))",
    gap: "1rem",
  },
  imageCard: {
    border: "1px solid #e9ecef",
    borderRadius: "6px",
    overflow: "hidden",
  },
  imageContainer: {
    position: "relative",
    width: "100%",
    height: "200px",
    overflow: "hidden",
  },
  image: {
    width: "100%",
    height: "100%",
    objectFit: "cover",
  },
  imageInfo: {
    padding: "1rem",
  },
  placeName: {
    fontWeight: "600",
    color: "#333",
    marginBottom: "0.25rem",
  },
  placeType: {
    fontSize: "0.85rem",
    color: "#666",
    marginBottom: "0.5rem",
  },
  address: {
    fontSize: "0.8rem",
    color: "#888",
  },
  refreshButton: {
    display: "inline-flex",
    alignItems: "center",
    gap: "0.5rem",
    backgroundColor: "#007bff",
    color: "white",
    border: "none",
    borderRadius: "4px",
    padding: "0.5rem 1rem",
    cursor: "pointer",
    fontSize: "0.9rem",
    marginBottom: "1rem",
  },
  note: {
    backgroundColor: "#e7f3ff",
    border: "1px solid #b3d9ff",
    borderRadius: "4px",
    padding: "1rem",
    color: "#0056b3",
    fontSize: "0.9rem",
    lineHeight: "1.5",
  },
};

// Enhanced photo fallback function (simplified version)
const getDefaultPhotoForPlace = (placeName, placeType, address = "") => {
  const typeImages = {
    toilet: [
      "https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=400&h=300&fit=crop&auto=format",
      "https://images.unsplash.com/photo-1497366216548-37526070297c?w=400&h=300&fit=crop&auto=format",
      "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=400&h=300&fit=crop&auto=format",
    ],
    public_toilet: [
      "https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=400&h=300&fit=crop&auto=format",
      "https://images.unsplash.com/photo-1497366216548-37526070297c?w=400&h=300&fit=crop&auto=format",
      "https://images.unsplash.com/photo-1449824913935-59a10b8d2000?w=400&h=300&fit=crop&auto=format",
    ],
    restaurant: [
      "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=400&h=300&fit=crop&auto=format",
      "https://images.unsplash.com/photo-1555396273-367ea4eb4db5?w=400&h=300&fit=crop&auto=format",
      "https://images.unsplash.com/photo-1578474846511-04ba529f0b88?w=400&h=300&fit=crop&auto=format",
    ],
    cafe: [
      "https://images.unsplash.com/photo-1501339847302-ac426a4a7cbb?w=400&h=300&fit=crop&auto=format",
      "https://images.unsplash.com/photo-1554118811-1e0d58224f24?w=400&h=300&fit=crop&auto=format",
      "https://images.unsplash.com/photo-1559925393-8be0ec4767c8?w=400&h=300&fit=crop&auto=format",
    ],
    park: [
      "https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=400&h=300&fit=crop&auto=format",
      "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=300&fit=crop&auto=format",
      "https://images.unsplash.com/photo-1574263867128-5d0b71bf8c17?w=400&h=300&fit=crop&auto=format",
    ],
    shopping_mall: [
      "https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=400&h=300&fit=crop&auto=format",
      "https://images.unsplash.com/photo-1519201946738-60a74d467a9d?w=400&h=300&fit=crop&auto=format",
      "https://images.unsplash.com/photo-1534452203293-494d7ddbf7e0?w=400&h=300&fit=crop&auto=format",
    ],
    gas_station: [
      "https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400&h=300&fit=crop&auto=format",
      "https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=300&fit=crop&auto=format",
      "https://images.unsplash.com/photo-1528459801416-a9e53bbf4e17?w=400&h=300&fit=crop&auto=format",
    ],
    default: [
      "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=400&h=300&fit=crop&auto=format",
      "https://images.unsplash.com/photo-1497366216548-37526070297c?w=400&h=300&fit=crop&auto=format",
      "https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=400&h=300&fit=crop&auto=format",
    ],
  };

  const availableImages = typeImages[placeType] || typeImages.default;

  // Select image based on place name hash for consistency
  const nameHash = placeName.split("").reduce((a, b) => {
    a = (a << 5) - a + b.charCodeAt(0);
    return a & a;
  }, 0);

  const imageIndex = Math.abs(nameHash) % availableImages.length;
  return availableImages[imageIndex];
};

export default function TestImagesPage() {
  const [refreshKey, setRefreshKey] = useState(0);

  const testPlaces = [
    {
      name: "McDonald's Centrum",
      type: "restaurant",
      address: "ul. Krakowska 12, Warszawa",
    },
    {
      name: "Starbucks Coffee",
      type: "cafe",
      address: "ul. Nowy Świat 15, Warszawa",
    },
    {
      name: "Toaleta publiczna",
      type: "toilet",
      address: "ul. Marszałkowska 1, Warszawa",
    },
    {
      name: "WC Dworzec Centralny",
      type: "public_toilet",
      address: "Aleje Jerozolimskie 54, Warszawa",
    },
    {
      name: "Park Łazienkowski",
      type: "park",
      address: "Łazienki Królewskie, Warszawa",
    },
    {
      name: "Galeria Mokotów",
      type: "shopping_mall",
      address: "ul. Wołoska 12, Warszawa",
    },
    {
      name: "Shell Stacja",
      type: "gas_station",
      address: "ul. Puławska 100, Warszawa",
    },
    {
      name: "KFC Restauracja",
      type: "restaurant",
      address: "ul. Złota 44, Warszawa",
    },
    {
      name: "Costa Coffee",
      type: "cafe",
      address: "ul. Chmielna 13, Warszawa",
    },
    {
      name: "Toaleta Muzeum",
      type: "toilet",
      address: "Plac Defilad 1, Warszawa",
    },
  ];

  const handleRefresh = () => {
    setRefreshKey(prev => prev + 1);
  };

  return (
    <div style={styles.container}>
      <div style={styles.header}>
        <Link href="/" style={styles.backButton}>
          <CircleChevronLeft size={20} />
          Powrót do strony głównej
        </Link>

        <h1 style={styles.title}>
          <ImageIcon size={28} />
          System Obrazów - Demonstracja
        </h1>

        <p style={styles.description}>
          Ta strona prezentuje jak działa nowy system wybierania obrazów dla importowanych lokalizacji WC.
          System automatycznie dobiera odpowiednie zdjęcia na podstawie typu miejsca i nazwy, zapewniając
          spójność wizualną i wysoką jakość obrazów.
        </p>
      </div>

      <div style={styles.content}>
        <div style={styles.section}>
          <div style={styles.note}>
            <strong>Jak to działa:</strong><br />
            • System analizuje nazwę miejsca i typ lokalizacji<br />
            • Dla każdego typu miejsca (restauracja, kawiarnia, toaleta, park) używa dedykowanych zestawów obrazów<br />
            • Ta sama nazwa miejsca zawsze otrzymuje ten sam obraz (dla spójności)<br />
            • Wszystkie obrazy pochodzą z wysokiej jakości źródeł (Unsplash)<br />
            • Dla toalet system wybiera obrazy budynków zamiast generycznych ikon WC
          </div>
        </div>

        <div style={styles.section}>
          <h2 style={styles.sectionTitle}>Przykłady Obrazów dla Różnych Typów Miejsc</h2>

          <button
            style={styles.refreshButton}
            onClick={handleRefresh}
          >
            <RefreshCw size={16} />
            Odśwież obrazy
          </button>

          <div style={styles.grid}>
            {testPlaces.map((place, index) => {
              const imageUrl = getDefaultPhotoForPlace(
                place.name + refreshKey, // Add refreshKey to see different images
                place.type,
                place.address
              );

              return (
                <div key={`${index}-${refreshKey}`} style={styles.imageCard}>
                  <div style={styles.imageContainer}>
                    <img
                      src={imageUrl}
                      alt={`${place.name} - ${place.type}`}
                      style={styles.image}
                      onError={(e) => {
                        e.target.src = "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=400&h=300&fit=crop&auto=format";
                      }}
                    />
                  </div>
                  <div style={styles.imageInfo}>
                    <div style={styles.placeName}>{place.name}</div>
                    <div style={styles.placeType}>
                      Typ: {place.type.replace('_', ' ')}
                    </div>
                    <div style={styles.address}>{place.address}</div>
                  </div>
                </div>
              );
            })}
          </div>
        </div>

        <div style={styles.section}>
          <h2 style={styles.sectionTitle}>Zalety Nowego Systemu</h2>
          <ul style={{ lineHeight: '1.8', color: '#555' }}>
            <li><strong>Spójność wizualna:</strong> Ta sama lokalizacja zawsze otrzymuje ten sam obraz</li>
            <li><strong>Wysoka jakość:</strong> Wszystkie obrazy pochodzą z profesjonalnych źródeł</li>
            <li><strong>Kontekstowość:</strong> Obrazy dopasowane do typu miejsca (restauracja, kawiarnia, etc.)</li>
            <li><strong>Inteligentne dla toalet:</strong> Zamiast ikon WC używa obrazów budynków</li>
            <li><strong>Różnorodność:</strong> Każdy typ miejsca ma kilka wariantów obrazów</li>
            <li><strong>Fallback strategy:</strong> System próbuje znaleźć prawdziwe zdjęcia przed użyciem placeholderów</li>
            <li><strong>Konfigurowalność:</strong> Można wyłączyć lub dostosować przez zmienne środowiskowe</li>
          </ul>
        </div>
      </div>
    </div>
  );
}
