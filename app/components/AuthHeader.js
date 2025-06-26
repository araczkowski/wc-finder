"use client";

import Link from "next/link";

const AuthHeader = () => {
  const headerStyles = {
    width: "100%",
    maxWidth: "500px",
    margin: "0 auto",
    padding: "0.75rem 1rem",
    display: "flex",
    justifyContent: "space-between",
    alignItems: "center",
    backgroundColor: "rgba(255, 255, 255, 0.95)",
    backdropFilter: "blur(10px)",
    borderBottom: "1px solid rgba(0, 0, 0, 0.1)",
    position: "sticky",
    top: "0",
    zIndex: "100",
    boxShadow: "0 2px 8px rgba(0, 0, 0, 0.05)",
  };

  const buttonStyles = {
    padding: "0.5rem 0.75rem",
    borderRadius: "6px",
    border: "1px solid #ddd",
    backgroundColor: "white",
    color: "#333",
    textDecoration: "none",
    fontSize: "0.85rem",
    fontWeight: "500",
    transition: "all 0.2s ease",
    cursor: "pointer",
    display: "inline-block",
    whiteSpace: "nowrap",
  };

  const buttonHoverStyles = {
    ...buttonStyles,
    backgroundColor: "#f5f5f5",
    borderColor: "#bbb",
  };

  return (
    <header style={headerStyles}>
      <Link
        href="/"
        style={buttonStyles}
        onMouseEnter={(e) => {
          Object.assign(e.target.style, buttonHoverStyles);
        }}
        onMouseLeave={(e) => {
          Object.assign(e.target.style, buttonStyles);
        }}
      >
        Strona główna
      </Link>

      <Link
        href="/about"
        style={buttonStyles}
        onMouseEnter={(e) => {
          Object.assign(e.target.style, buttonHoverStyles);
        }}
        onMouseLeave={(e) => {
          Object.assign(e.target.style, buttonStyles);
        }}
      >
        O aplikacji
      </Link>
    </header>
  );
};

export default AuthHeader;
