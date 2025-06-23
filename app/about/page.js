"use client";

import { useSession } from "next-auth/react";
import Link from "next/link";
import { useTranslation } from "../hooks/useTranslation";
import UserDropdown from "../components/UserDropdown";

const styles = {
  pageContainer: {
    display: "flex",
    flexDirection: "column",
    minHeight: "100vh",
    fontFamily: "sans-serif",
  },
  header: {
    display: "flex",
    justifyContent: "space-between",
    alignItems: "center",
    padding: "1rem 2rem",
    backgroundColor: "#f0f0f0",
    borderBottom: "1px solid #ddd",
  },
  appName: {
    fontSize: "1.5rem",
    fontWeight: "bold",
  },
  authControls: {
    display: "flex",
    alignItems: "center",
    gap: "1rem",
  },
  mainContent: {
    flex: 1,
    padding: "2rem",
    maxWidth: "800px",
    margin: "0 auto",
    width: "100%",
  },
  backLink: {
    display: "inline-flex",
    alignItems: "center",
    gap: "0.5rem",
    padding: "0.75rem 1.5rem",
    backgroundColor: "#007bff",
    color: "white",
    textDecoration: "none",
    borderRadius: "8px",
    marginBottom: "2rem",
    transition: "background-color 0.2s ease",
  },
  title: {
    fontSize: "2.5rem",
    fontWeight: "bold",
    marginBottom: "1.5rem",
    color: "#333",
  },
  section: {
    marginBottom: "2rem",
  },
  sectionTitle: {
    fontSize: "1.5rem",
    fontWeight: "600",
    marginBottom: "1rem",
    color: "#444",
  },
  paragraph: {
    lineHeight: "1.6",
    marginBottom: "1rem",
    color: "#666",
  },
  featureList: {
    listStyle: "none",
    padding: 0,
  },
  featureItem: {
    display: "flex",
    alignItems: "flex-start",
    gap: "0.75rem",
    marginBottom: "1rem",
    padding: "1rem",
    backgroundColor: "#f8f9fa",
    borderRadius: "8px",
    border: "1px solid #e9ecef",
  },
  featureIcon: {
    fontSize: "1.5rem",
    marginTop: "0.25rem",
  },
  featureText: {
    flex: 1,
  },
  featureTitle: {
    fontWeight: "600",
    marginBottom: "0.25rem",
    color: "#333",
  },
  featureDescription: {
    color: "#666",
    fontSize: "0.9rem",
  },
  techStack: {
    display: "grid",
    gridTemplateColumns: "repeat(auto-fit, minmax(150px, 1fr))",
    gap: "1rem",
  },
  techItem: {
    padding: "1rem",
    backgroundColor: "#f1f3f4",
    borderRadius: "8px",
    textAlign: "center",
    fontWeight: "500",
    color: "#444",
  },
  contactInfo: {
    backgroundColor: "#e3f2fd",
    padding: "1.5rem",
    borderRadius: "8px",
    border: "1px solid #bbdefb",
  },
};

export default function AboutPage() {
  const { data: session, status } = useSession();
  const { t } = useTranslation();

  const renderAuthControls = () => {
    if (status === "loading") {
      return <div>{t("loading")}</div>;
    }

    if (session) {
      return <UserDropdown session={session} />;
    }

    return (
      <Link
        href="/auth/signin"
        style={{
          padding: "0.5rem 1rem",
          backgroundColor: "#007bff",
          color: "white",
          textDecoration: "none",
          borderRadius: "4px",
        }}
      >
        Zaloguj się
      </Link>
    );
  };

  return (
    <div style={styles.pageContainer}>
      <header style={styles.header}>
        <div style={styles.appName}>WC Finder</div>
        <div style={styles.authControls}>{renderAuthControls()}</div>
      </header>

      <main style={styles.mainContent}>
        <Link href="/" style={styles.backLink}>
          <svg width="16" height="16" viewBox="0 0 16 16" fill="currentColor">
            <path fillRule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
          </svg>
          Powrót do strony głównej
        </Link>

        <h1 style={styles.title}>O aplikacji WC Finder</h1>

        <div style={styles.section}>
          <p style={styles.paragraph}>
            <strong>WC Finder</strong> to innowacyjna aplikacja webowa stworzona z myślą o pomocy użytkownikom
            w znalezieniu najbliższych publicznych toalet. Nasza platforma łączy w sobie nowoczesne technologie
            z praktycznym zastosowaniem, oferując kompleksowe rozwiązanie dla codziennych potrzeb.
          </p>
        </div>

        <div style={styles.section}>
          <h2 style={styles.sectionTitle}>🎯 Główne funkcje</h2>
          <ul style={styles.featureList}>
            <li style={styles.featureItem}>
              <span style={styles.featureIcon}>📍</span>
              <div style={styles.featureText}>
                <div style={styles.featureTitle}>Lokalizacja toalet</div>
                <div style={styles.featureDescription}>
                  Znajdź najbliższe publiczne toalety na podstawie Twojej aktualnej lokalizacji
                </div>
              </div>
            </li>
            <li style={styles.featureItem}>
              <span style={styles.featureIcon}>⭐</span>
              <div style={styles.featureText}>
                <div style={styles.featureTitle}>System ocen</div>
                <div style={styles.featureDescription}>
                  Oceniaj i czytaj opinie innych użytkowników o jakości toalet
                </div>
              </div>
            </li>
            <li style={styles.featureItem}>
              <span style={styles.featureIcon}>📸</span>
              <div style={styles.featureText}>
                <div style={styles.featureTitle}>Galeria zdjęć</div>
                <div style={styles.featureDescription}>
                  Przeglądaj zdjęcia toalet przed wizytą, dodawaj własne fotografie
                </div>
              </div>
            </li>
            <li style={styles.featureItem}>
              <span style={styles.featureIcon}>➕</span>
              <div style={styles.featureText}>
                <div style={styles.featureTitle}>Dodawanie nowych miejsc</div>
                <div style={styles.featureDescription}>
                  Pomóż społeczności dodając nowe toalety do bazy danych
                </div>
              </div>
            </li>
            <li style={styles.featureItem}>
              <span style={styles.featureIcon}>🔒</span>
              <div style={styles.featureText}>
                <div style={styles.featureTitle}>Bezpieczne logowanie</div>
                <div style={styles.featureDescription}>
                  Konto Google OAuth lub tradycyjne logowanie email/hasło
                </div>
              </div>
            </li>
          </ul>
        </div>

        <div style={styles.section}>
          <h2 style={styles.sectionTitle}>🚀 Technologie</h2>
          <p style={styles.paragraph}>
            Aplikacja została zbudowana z wykorzystaniem najnowszych technologii webowych:
          </p>
          <div style={styles.techStack}>
            <div style={styles.techItem}>Next.js 15</div>
            <div style={styles.techItem}>React 18</div>
            <div style={styles.techItem}>NextAuth.js</div>
            <div style={styles.techItem}>Supabase</div>
            <div style={styles.techItem}>PostgreSQL</div>
            <div style={styles.techItem}>Vercel</div>
          </div>
        </div>

        <div style={styles.section}>
          <h2 style={styles.sectionTitle}>📱 Responsywność</h2>
          <p style={styles.paragraph}>
            Aplikacja została zaprojektowana z myślą o urządzeniach mobilnych i jest w pełni responsywna.
            Działa równie dobrze na smartfonach, tabletach i komputerach desktop. Interfejs automatycznie
            dostosowuje się do rozmiaru ekranu, zapewniając optymalną funkcjonalność na każdym urządzeniu.
          </p>
        </div>

        <div style={styles.section}>
          <h2 style={styles.sectionTitle}>🌟 Dla kogo?</h2>
          <p style={styles.paragraph}>
            WC Finder jest idealny dla:
          </p>
          <ul style={{ ...styles.featureList, listStyle: "disc", paddingLeft: "2rem" }}>
            <li style={{ marginBottom: "0.5rem", color: "#666" }}>Turystów zwiedzających nowe miasta</li>
            <li style={{ marginBottom: "0.5rem", color: "#666" }}>Rodziców z małymi dziećmi</li>
            <li style={{ marginBottom: "0.5rem", color: "#666" }}>Osób z problemami zdrowotnymi wymagającymi częstego korzystania z toalet</li>
            <li style={{ marginBottom: "0.5rem", color: "#666" }}>Kierowców na długich trasach</li>
            <li style={{ marginBottom: "0.5rem", color: "#666" }}>Wszystkich, którzy chcą mieć pewność dostępu do czystych toalet</li>
          </ul>
        </div>

        <div style={styles.section}>
          <h2 style={styles.sectionTitle}>💡 Przyszłość projektu</h2>
          <p style={styles.paragraph}>
            Planujemy dalszy rozwój aplikacji, w tym dodanie funkcji offline,
            powiadomień push o nowych toaletach w pobliżu, oraz integrację z mapami Google.
            Twoje opinie i sugestie są dla nas bardzo ważne!
          </p>
        </div>

        <div style={styles.contactInfo}>
          <h3 style={{ marginBottom: "1rem", color: "#1976d2" }}>📞 Kontakt</h3>
          <p style={{ margin: "0.5rem 0", color: "#666" }}>
            <strong>Email:</strong> admin@sviete.pl
          </p>
          <p style={{ margin: "0.5rem 0", color: "#666" }}>
            Jesteśmy otwarci na Twoje sugestie i zgłoszenia błędów.
            Razem możemy uczynić tę aplikację jeszcze lepszą!
          </p>
        </div>
      </main>
    </div>
  );
}
