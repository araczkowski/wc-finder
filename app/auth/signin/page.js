"use client";

import { useState, useEffect } from "react";
import { signIn, getProviders, useSession } from "next-auth/react";
import { useRouter, useSearchParams, useContext } from "next/navigation";
import Link from "next/link";
import { useTranslation } from "../../hooks/useTranslation";

// Mobile-first styles
const styles = {
  formContainer: {
    display: "flex",
    flexDirection: "column",
    alignItems: "center",
    padding: "1rem",
    minHeight: "100vh",
    backgroundColor: "#f9f9f9",
    fontFamily: "sans-serif",
    width: "100%",
    maxWidth: "500px",
    margin: "0 auto",
  },
  formCard: {
    backgroundColor: "white",
    padding: "2rem",
    borderRadius: "8px",
    boxShadow: "0 4px 12px rgba(0, 0, 0, 0.1)",
    width: "100%",
    textAlign: "left",
    marginTop: "2rem",
  },
  formLabel: {
    fontWeight: "bold",
    marginBottom: "0.3rem",
    fontSize: "0.9rem",
    color: "#333",
    display: "block",
  },
  formInput: {
    padding: "0.75rem",
    borderRadius: "4px",
    border: "1px solid #ddd",
    fontSize: "1rem",
    width: "100%",
    boxSizing: "border-box",
    transition: "border-color 0.2s ease",
    marginBottom: "1rem",
  },
  formButton: {
    padding: "0.75rem 1rem",
    borderRadius: "4px",
    border: "none",
    fontSize: "1rem",
    fontWeight: "bold",
    cursor: "pointer",
    backgroundColor: "#28a745",
    color: "white",
    transition: "background-color 0.2s ease",
    marginTop: "0.5rem",
    minHeight: "44px",
    width: "100%",
  },
  googleButton: {
    backgroundColor: "#4285F4",
    color: "white",
    marginBottom: "1rem",
  },
  formError: {
    color: "#dc3545",
    backgroundColor: "rgba(220, 53, 69, 0.1)",
    border: "1px solid rgba(220, 53, 69, 0.2)",
    padding: "0.75rem",
    borderRadius: "4px",
    marginBottom: "1.25rem",
    textAlign: "center",
    fontSize: "0.9em",
  },
  formSuccess: {
    color: "#28a745",
    backgroundColor: "rgba(40, 167, 69, 0.1)",
    border: "1px solid rgba(40, 167, 69, 0.2)",
    padding: "0.75rem",
    borderRadius: "4px",
    marginBottom: "1.25rem",
    textAlign: "center",
    fontSize: "0.9em",
  },
  formInfo: {
    color: "#0070f3",
    backgroundColor: "rgba(0, 112, 243, 0.1)",
    border: "1px solid rgba(0, 112, 243, 0.2)",
    padding: "0.75rem",
    borderRadius: "4px",
    marginBottom: "1.25rem",
    textAlign: "center",
    fontSize: "0.9em",
  },
  formCancelLink: {
    display: "inline-block",
    marginTop: "1.25rem",
    color: "#0070f3",
    textDecoration: "none",
    textAlign: "center",
    width: "100%",
    padding: "0.5rem",
  },
};

export default function SignInPage() {
  const [providers, setProviders] = useState(null);
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState(""); // For general sign-in errors
  const [formLoading, setFormLoading] = useState(false);
  const [infoMessage, setInfoMessage] = useState(""); // For primary info like "email not confirmed"

  // State for resend confirmation logic
  const [showResendButton, setShowResendButton] = useState(false);
  const [resendLoading, setResendLoading] = useState(false);
  const [resendSuccessMessage, setResendSuccessMessage] = useState("");
  const [resendErrorMessage, setResendErrorMessage] = useState("");

  const router = useRouter();
  const searchParams = useSearchParams();
  const { data: session, status: sessionStatus } = useSession();

  const { t } = useTranslation();

  // Manage background class for signin page
  useEffect(() => {
    // Add background class when component mounts
    document.body.classList.add("auth-background");

    // Cleanup on component unmount
    return () => {
      document.body.classList.remove("auth-background");
    };
  }, []);

  // Redirect if already signed in and clear localStorage
  useEffect(() => {
    if (sessionStatus === "authenticated") {
      console.log("[SignIn] localStorage cleared after successful login");
      localStorage.clear();
      router.push(searchParams.get("callbackUrl") || "/");
    }
  }, [sessionStatus, router, searchParams]);

  // Fetch providers
  useEffect(() => {
    const fetchProviders = async () => {
      try {
        const res = await getProviders();
        setProviders(res);
      } catch (err) {
        setError("Failed to load sign-in options. Please try again later.");
        console.error("Failed to fetch providers:", err);
      }
    };
    fetchProviders();
  }, []);

  // Set error/info messages from URL query parameters
  useEffect(() => {
    const nextAuthError = searchParams.get("error");
    const supabaseErrorCode = searchParams.get("error_code");
    const supabaseErrorDescription = searchParams.get("error_description");
    const statusMessage = searchParams.get("status");

    // Clear all messages initially to avoid showing stale messages
    setError("");
    setInfoMessage("");
    setShowResendButton(false);
    setResendSuccessMessage("");
    setResendErrorMessage("");

    if (supabaseErrorCode) {
      // Handle Supabase-specific errors from URL (e.g., after bad email confirmation link)
      if (
        supabaseErrorCode === "otp_expired" ||
        supabaseErrorDescription
          ?.toLowerCase()
          .includes("invalid or has expired")
      ) {
        setInfoMessage(
          "The confirmation link is invalid or has expired. Please enter your email below and try resending the confirmation.",
        );
        setShowResendButton(true); // Allow resending
      } else if (supabaseErrorDescription) {
        // Generic Supabase error from URL
        setError(`Error: ${supabaseErrorDescription.replace(/\+/g, " ")}`);
      } else {
        setError("An unknown error occurred during the previous operation.");
      }
      // Clean Supabase error params from URL if desired, to prevent re-processing on refresh
      // Be careful with router.replace as it can cause loops if not handled well.
      // const newPath = router.pathname; // or '/auth/signin'
      // router.replace(newPath, undefined, { shallow: true });
    } else if (nextAuthError) {
      // Handle NextAuth errors
      switch (nextAuthError) {
        case "CredentialsSignin":
          setError("Invalid email or password. Please try again.");
          break;
        case "OAuthAccountNotLinked":
          setError(
            "This email is already linked with another provider. Try signing in with that provider or link your accounts.",
          );
          break;
        case "EmailCreateAccount": // Example error if sign up fails and redirects here
          setError(
            "Could not create account. The email might already be in use or an error occurred.",
          );
          break;
        case "EmailNotConfirmed":
          setInfoMessage(
            "Your email address has not been confirmed. Please check your inbox for a confirmation link.",
          );
          setShowResendButton(true);
          break;
        default:
          setError(
            `An authentication error occurred: ${nextAuthError}. Please try again.`,
          );
      }
    } else if (statusMessage) {
      // Handle custom status messages
      if (statusMessage === "registration_pending_confirmation") {
        setInfoMessage(
          "Registration successful! Please check your email to confirm your account before signing in.",
        );
      } else if (statusMessage === "email_confirmed") {
        setInfoMessage("Email confirmed successfully! You can now sign in.");
      }
    }
  }, [searchParams]); // Rerun when query params change

  const handleCredentialsSignIn = async (e) => {
    e.preventDefault();
    // Clear all previous messages before new sign-in attempt
    setError("");
    setInfoMessage("");
    setShowResendButton(false);
    setResendSuccessMessage("");
    setResendErrorMessage("");
    setFormLoading(true);

    const result = await signIn("credentials", {
      redirect: false, // Handle redirect manually to show errors on this page
      email,
      password,
    });

    setFormLoading(false);

    if (result?.error) {
      if (result.error === "CredentialsSignin") {
        setError("Invalid email or password. Please try again.");
      } else if (result.error === "EmailNotConfirmed") {
        setInfoMessage(
          "Your email address has not been confirmed. Please check your inbox for a confirmation link.",
        );
        setShowResendButton(true); // Show resend button because email is already in the form
      } else {
        setError(
          result.error ||
            "Login failed. Please check your credentials and try again.",
        );
      }
    } else if (result?.ok && !result.error) {
      // Successful sign in, redirect
      router.push(searchParams.get("callbackUrl") || "/");
      router.refresh(); // Ensure session is updated across app
    }
  };

  const handleResendConfirmation = async () => {
    if (!email) {
      setResendErrorMessage(
        "Please ensure your email address is entered in the form above to resend the confirmation.",
      );
      setResendSuccessMessage("");
      return;
    }
    setResendLoading(true);
    setResendSuccessMessage("");
    setResendErrorMessage("");
    // Clear the main "email not confirmed" or "otp expired" message as we're attempting to resend.
    setInfoMessage("");

    try {
      const response = await fetch("/api/auth/resend-confirmation", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email }),
      });
      const data = await response.json();

      if (!response.ok) {
        throw new Error(data.message || "Failed to resend confirmation email.");
      }
      setResendSuccessMessage(
        data.message ||
          "Confirmation email has been resent. Please check your inbox (and spam folder).",
      );
      setShowResendButton(false); // Hide button after successful resend for a cleaner UI
    } catch (err) {
      setResendErrorMessage(
        err.message || "An error occurred. Please try again.",
      );
      setShowResendButton(true); // Keep resend button visible if resend failed
    } finally {
      setResendLoading(false);
    }
  };

  // Styles moved to globals.css for better responsiveness
  const styles = {
    primaryButton: { backgroundColor: "#0070f3", color: "white" }, // For main sign-in
    googleButton: {
      backgroundColor: "#fff",
      color: "#333",
      border: "1px solid #ccc",
      display: "flex",
      alignItems: "center",
      justifyContent: "center",
      gap: "8px",
    },
    secondaryButton: {
      backgroundColor: "#6c757d",
      color: "white",
      marginTop: "10px",
    }, // For resend
    messageBase: {
      // Base for all info/error/success messages
      padding: "10px",
      borderRadius: "4px",
      marginBottom: "15px",
      marginTop: "10px",
      textAlign: "center",
      fontSize: "0.9em",
      wordWrap: "break-word",
    },
    error: { color: "red", backgroundColor: "rgba(255,0,0,0.1)" }, // General errors
    info: {
      // For "email not confirmed", "otp_expired" type messages
      color: "#004085",
      backgroundColor: "#cce5ff",
      border: "1px solid #b8daff",
    },
    success: {
      // For "email resent successfully" type messages
      color: "#155724",
      backgroundColor: "#d4edda",
      border: "1px solid #c3e6cb",
    },
    divider: {
      textAlign: "center",
      margin: "20px 0",
      color: "#777",
      display: "flex",
      alignItems: "center",
      gap: "10px",
    },
    line: { flexGrow: 1, height: "1px", backgroundColor: "#ddd" },
  };

  if (sessionStatus === "loading" || !providers) {
    return (
      <div className="form-container">
        <div className="form-card">
          <p>Loading...</p>
        </div>
      </div>
    );
  }
  if (sessionStatus === "authenticated") {
    return (
      <div className="form-container">
        <div className="form-card">
          <p>Redirecting...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="form-container">
      <div className="form-card">
        <h2 style={{ marginBottom: "20px", color: "grey" }}>
          {t("signInToApp")}
        </h2>

        {/* Display general sign-in errors */}
        {error && <p className="form-message form-error">{error}</p>}

        {/* Display info messages */}
        {infoMessage && (
          <p className="form-message form-success">{infoMessage}</p>
        )}

        {/* Display messages related to the resend action */}
        {resendErrorMessage && (
          <p style={{ ...styles.messageBase, ...styles.error }}>
            {resendErrorMessage}
          </p>
        )}
        {resendSuccessMessage && (
          <p style={{ ...styles.messageBase, ...styles.success }}>
            {resendSuccessMessage}
          </p>
        )}

        {/* Resend button appears if conditions met */}
        {showResendButton && !resendSuccessMessage && (
          <button
            onClick={handleResendConfirmation}
            style={{ ...styles.button, ...styles.secondaryButton }}
            disabled={resendLoading || !email} // Disable if resending or if email field is empty
          >
            {resendLoading ? "Resending..." : "Resend Confirmation Email"}
          </button>
        )}

        {providers?.google && (
          <button
            onClick={() =>
              signIn("google", {
                callbackUrl: searchParams.get("callbackUrl") || "/",
              })
            }
            className="form-button"
            style={styles.googleButton}
            disabled={formLoading || resendLoading}
          >
            <svg
              width="18"
              height="18"
              viewBox="0 0 24 24"
              style={{ marginRight: "8px" }}
            >
              {/* Google Icon SVG */}
              <path
                fill="#EA4335"
                d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"
              ></path>
              <path
                fill="#34A853"
                d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"
              ></path>
              <path
                fill="#4A90E2"
                d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"
              ></path>
              <path
                fill="#FBBC05"
                d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"
              ></path>
              <path fill="none" d="M1 1h22v22H1z"></path>
            </svg>
            {t("signInWithGoogle")}
          </button>
        )}

        {providers?.google && providers?.credentials && (
          <div style={styles.divider}>
            <span style={styles.line}></span>
            <span style={{ padding: "0 10px" }}>{t("Or")}</span>
            <span style={styles.line}></span>
          </div>
        )}

        {providers?.credentials && (
          <form
            onSubmit={handleCredentialsSignIn}
            style={styles.form}
            className="form"
          >
            <div>
              <input
                id="email"
                name="email"
                type="email"
                autoComplete="email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                required
                style={styles.input}
                placeholder="Email address"
                disabled={formLoading || resendLoading}
                className="form-input"
              />
            </div>
            <div>
              <input
                id="password"
                name="password"
                type="password"
                autoComplete="current-password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                required
                style={styles.input}
                placeholder="Password"
                disabled={formLoading || resendLoading}
                className="form-input"
              />
            </div>
            <button
              type="submit"
              className="form-button"
              style={styles.primaryButton}
              disabled={formLoading || resendLoading}
            >
              {formLoading ? t("loginInProgress") : t("signInWithEmail")}
            </button>
          </form>
        )}
        <p style={{ marginTop: "25px", fontSize: "0.9em", color: "grey" }}>
          {t("noAccount")}{" "}
          <Link
            href="/auth/register"
            style={{
              color: "#0070f3",
              textDecoration: "none",
              fontWeight: "bold",
            }}
          >
            {t("createAccount")}
          </Link>
        </p>
      </div>
    </div>
  );
}
