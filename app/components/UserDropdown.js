"use client";

import { useState, useRef, useEffect } from "react";
import { signOut } from "next-auth/react";
import Link from "next/link";
import Image from "next/image";

const UserDropdown = ({ session }) => {
  const [isOpen, setIsOpen] = useState(false);
  const dropdownRef = useRef(null);

  // Close dropdown when clicking outside
  useEffect(() => {
    const handleClickOutside = (event) => {
      if (dropdownRef.current && !dropdownRef.current.contains(event.target)) {
        setIsOpen(false);
      }
    };

    document.addEventListener("mousedown", handleClickOutside);
    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, []);

  // Close dropdown on escape key
  useEffect(() => {
    const handleEscapeKey = (event) => {
      if (event.key === "Escape") {
        setIsOpen(false);
      }
    };

    if (isOpen) {
      document.addEventListener("keydown", handleEscapeKey);
      return () => {
        document.removeEventListener("keydown", handleEscapeKey);
      };
    }
  }, [isOpen]);

  const handleSignOut = async () => {
    setIsOpen(false);
    // Clear session flag from localStorage to reset login state
    if (typeof window !== "undefined") {
      localStorage.removeItem("hasLoggedInThisSession");
    }
    await signOut();
  };

  const toggleDropdown = () => {
    setIsOpen(!isOpen);
  };

  if (!session?.user) {
    return null;
  }

  return (
    <div className="user-dropdown" ref={dropdownRef}>
      {/* User info trigger */}
      <button
        onClick={toggleDropdown}
        className="user-dropdown-trigger"
        aria-expanded={isOpen}
        aria-haspopup="true"
        title="Menu użytkownika"
      >
        <div className="user-info">
          <Image
            src={session.user.image || "/icons/person-searching-wc.svg"}
            alt="Avatar użytkownika"
            width={32}
            height={32}
            className="user-image"
          />
          <span className="user-name">
            {session.user.name || session.user.email}
          </span>
          <svg
            className={`dropdown-arrow ${isOpen ? "open" : ""}`}
            width="12"
            height="12"
            viewBox="0 0 12 12"
            fill="currentColor"
          >
            <path d="M6 8L2 4h8L6 8z" />
          </svg>
        </div>
      </button>

      {/* Dropdown menu */}
      {isOpen && (
        <div className="user-dropdown-menu">
          <div className="dropdown-header">
            <div className="user-email">{session.user.email}</div>
            <div className="user-role">
              {session.user.email === "admin@sviete.pl" && (
                <span className="admin-badge">Administrator</span>
              )}
            </div>
          </div>

          <div className="dropdown-divider"></div>

          <div className="dropdown-items">
            <Link
              href="/about"
              className="dropdown-item"
              onClick={() => setIsOpen(false)}
            >
              <svg
                width="16"
                height="16"
                viewBox="0 0 16 16"
                fill="currentColor"
              >
                <path
                  d="M10,16c1.105,0,2,0.895,2,2v8c0,1.105-0.895,2-2,2H8v4h16v-4h-1.992c-1.102,0-2-0.895-2-2L20,12H8
				v4H10z"
                />
              </svg>
              O aplikacji
            </Link>

            <button
              onClick={handleSignOut}
              className="dropdown-item logout-item"
            >
              <svg
                width="16"
                height="16"
                viewBox="0 0 16 16"
                fill="currentColor"
              >
                <path
                  fillRule="evenodd"
                  d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"
                />
                <path
                  fillRule="evenodd"
                  d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"
                />
              </svg>
              Wyloguj się
            </button>
          </div>
        </div>
      )}
    </div>
  );
};

export default UserDropdown;
