"use client";

import { useSession, signIn, signOut } from "next-auth/react";
import Image from "next/image"; // For user icon placeholder
import Link from "next/link"; // <<< CRUCIAL IMPORT FOR THE LINK COMPONENT

// Basic inline styles for layout - consider moving to CSS modules or global CSS
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
  userInfo: {
    display: "flex",
    alignItems: "center",
    gap: "0.75rem",
  },
  userImage: {
    borderRadius: "50%",
    border: "2px solid #ccc",
  },
  userName: {
    fontWeight: "500",
  },
  button: {
    padding: "0.5rem 1rem",
    borderRadius: "4px",
    border: "none",
    cursor: "pointer",
    fontWeight: "bold",
    fontSize: "0.9rem",
    textDecoration: "none", // For Link components styled as buttons
    display: "inline-block", // For Link components
  },
  signInButton: {
    backgroundColor: "#0070f3",
    color: "white",
  },
  signOutButton: {
    backgroundColor: "#e0e0e0",
    color: "#333",
  },
  mainContent: {
    flexGrow: 1,
    display: "flex",
    flexDirection: "column",
    alignItems: "center",
    justifyContent: "center",
    padding: "2rem",
    textAlign: "center",
  },
  loader: {
    fontSize: "1.2rem",
    color: "#555",
  },
  welcomeMessage: {
    fontSize: "2rem",
    marginBottom: "1rem",
  },
  infoMessage: {
    fontSize: "1.1rem",
    color: "#333",
  },
  signInLink: {
    marginTop: "1rem",
    fontSize: "1rem",
    color: "#0070f3",
    textDecoration: "underline",
    cursor: "pointer",
  },
};

export default function Home() {
  const { data: session, status } = useSession();

  const renderAuthControls = () => {
    if (status === "loading") {
      return <div style={styles.loader}>Loading...</div>;
    }

    if (session) {
      return (
        <div style={styles.userInfo}>
          {session.user?.image ? (
            <Image
              src={session.user.image}
              alt={session.user.name || "User avatar"}
              width={40}
              height={40}
              style={styles.userImage}
              priority // Add priority if this image is above the fold
            />
          ) : (
            <div
              style={{
                ...styles.userImage,
                width: 40,
                height: 40,
                backgroundColor: "#ccc",
                display: "flex",
                alignItems: "center",
                justifyContent: "center",
                fontSize: "1.2rem",
                color: "#fff", // Ensure initials are visible
              }}
            >
              {session.user?.name?.charAt(0).toUpperCase() ||
                session.user?.email?.charAt(0).toUpperCase() ||
                "U"}
            </div>
          )}
          <span style={styles.userName}>
            {session.user?.name || session.user?.email}
          </span>
          <button
            onClick={() => signOut({ callbackUrl: "/" })}
            style={{ ...styles.button, ...styles.signOutButton }}
          >
            Sign Out
          </button>
          {/* Example: Link to a password change page (to be implemented) */}
          {/* <Link href="/auth/change-password" style={{...styles.button, marginLeft: '0.5rem', backgroundColor: '#6c757d', color: 'white'}}>Change Password</Link> */}
        </div>
      );
    }

    return (
      <Link
        href="/auth/signin"
        style={{ ...styles.button, ...styles.signInButton }}
      >
        Sign In
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
        <Image
          src="/icons/person-searching-wc.svg"
          alt="Person searching for WC"
          width={128}
          height={128}
          style={{ marginBottom: "1.5rem" }}
          priority // Good to add if it's a primary visual element
        />
        {status === "loading" ? (
          <p style={styles.loader}>Checking session...</p>
        ) : session ? (
          <>
            <h1 style={styles.welcomeMessage}>
              Welcome back to WC Finder,{" "}
              {session.user?.name || session.user?.email}!
            </h1>
            <p style={styles.infoMessage}>
              You are signed in. This is where the main application content will
              go.
            </p>
            {/* Add main application features here */}
          </>
        ) : (
          <>
            <h1 style={styles.welcomeMessage}>Welcome to WC Finder</h1>
            <p style={styles.infoMessage}>
              Please sign in to access the application features.
            </p>
            <Link href="/auth/signin" style={styles.signInLink}>
              Sign In Here
            </Link>
          </>
        )}
      </main>
    </div>
  );
}
