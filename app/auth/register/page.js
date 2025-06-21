"use client";

import { useState, useEffect } from "react";
import { useSession } from "next-auth/react";
import { useRouter } from "next/navigation";
import Link from "next/link";

export default function RegisterPage() {
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [error, setError] = useState("");
  // Success message on this page is no longer needed as we redirect
  // const [success, setSuccess] = useState("");
  const [loading, setLoading] = useState(false);

  const router = useRouter();
  const { data: session, status: sessionStatus } = useSession();

  // Manage background class for register page
  useEffect(() => {
    // Add background class when component mounts
    document.body.classList.add("auth-background");

    // Cleanup on component unmount
    return () => {
      document.body.classList.remove("auth-background");
    };
  }, []);

  // Redirect if already signed in
  useEffect(() => {
    if (sessionStatus === "authenticated") {
      router.push("/");
    }
  }, [sessionStatus, router]);

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError("");
    // setSuccess(""); // No longer setting local success message
    setLoading(true);

    if (password !== confirmPassword) {
      setError("Passwords do not match.");
      setLoading(false);
      return;
    }

    if (password.length < 8) {
      setError("Password must be at least 8 characters long.");
      setLoading(false);
      return;
    }

    try {
      const response = await fetch("/api/auth/register", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ name, email, password }),
      });

      const data = await response.json();

      if (!response.ok) {
        throw new Error(
          data.message || "Failed to create account. Please try again.",
        );
      }

      // If successful, redirect to the sign-in page with a status message
      // The sign-in page should be configured to display this message.
      router.push("/auth/signin?status=registration_pending_confirmation");

      // Form clearing is less critical now due to immediate redirect,
      // but can be kept for consistency if redirect fails for some reason (though unlikely here).
      // setName("");
      // setEmail("");
      // setPassword("");
      // setConfirmPassword("");
    } catch (err) {
      setError(err.message || "An error occurred during registration.");
      console.error("Registration error on client:", err);
      setLoading(false); // Ensure loading is false on error
    }
    // setLoading(false) might not be reached if redirect is very fast,
    // and component unmounts. If redirect is within the try block,
    // this finally block might not be necessary for setLoading if redirect always happens.
    // However, if an error occurs before redirect, setLoading must be set to false.
    // Kept setLoading(false) in the catch block for robustness.
  };

  // Styles moved to globals.css for better responsiveness
  // successStyle is no longer needed as we redirect
  // const successStyle = {
  //   ...messageStyle,
  //   color: "green",
  //   backgroundColor: "rgba(0,128,0,0.1)",
  // };

  if (sessionStatus === "loading") {
    return (
      <div
        style={{
          display: "flex",
          justifyContent: "center",
          alignItems: "center",
          height: "100vh",
        }}
      >
        Loading...
      </div>
    );
  }
  if (sessionStatus === "authenticated") {
    // This effect should handle the redirect, but this is a fallback.
    return (
      <div
        style={{
          display: "flex",
          justifyContent: "center",
          alignItems: "center",
          height: "100vh",
        }}
      >
        Redirecting...
      </div>
    );
  }

  return (
    <div className="form-container">
      <div className="form-card">
        <h2 style={{ marginBottom: "25px", color: "#333" }}>
          Create an Account
        </h2>

        {error && <p className="form-message form-error">{error}</p>}
        {/* Success message paragraph removed */}

        <form onSubmit={handleSubmit} className="form">
          <div>
            <input
              id="name"
              name="name"
              type="text"
              autoComplete="name"
              value={name}
              onChange={(e) => setName(e.target.value)}
              className="form-input"
              placeholder="Full Name (Optional)"
              disabled={loading}
            />
          </div>
          <div>
            <input
              id="email"
              name="email"
              type="email"
              autoComplete="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
              className="form-input"
              placeholder="Email address"
              disabled={loading}
            />
          </div>
          <div>
            <input
              id="password"
              name="password"
              type="password"
              autoComplete="new-password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
              className="form-input"
              placeholder="Password (min. 8 characters)"
              disabled={loading}
            />
          </div>
          <div>
            <input
              id="confirmPassword"
              name="confirmPassword"
              type="password"
              autoComplete="new-password"
              value={confirmPassword}
              onChange={(e) => setConfirmPassword(e.target.value)}
              required
              className="form-input"
              placeholder="Confirm Password"
              disabled={loading}
            />
          </div>
          <button type="submit" className="form-button" disabled={loading}>
            {loading ? "Creating Account..." : "Create Account"}
          </button>
        </form>
        <p style={{ marginTop: "25px", fontSize: "0.9em", color: "#555" }}>
          Already have an account?{" "}
          <Link
            href="/auth/signin"
            style={{
              color: "#0070f3",
              textDecoration: "none",
              fontWeight: "bold",
            }}
          >
            Sign In
          </Link>
        </p>
      </div>
    </div>
  );
}
