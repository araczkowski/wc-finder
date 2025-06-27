import React, { useState, useRef, useEffect } from "react";
import { ChevronDown } from "lucide-react";
import { getPlaceTypeOptions, getPlaceTypeIcon } from "../utils/placeTypes";

const PlaceTypeSelect = ({
  value,
  onChange,
  translations,
  disabled = false,
  required = false,
  placeholder = "Wybierz typ miejsca",
}) => {
  const [isOpen, setIsOpen] = useState(false);
  const [focusedIndex, setFocusedIndex] = useState(-1);
  const selectRef = useRef(null);
  const optionsRef = useRef([]);

  const options = getPlaceTypeOptions(translations);
  const selectedOption = options.find((option) => option.value === value);

  // Close dropdown when clicking outside
  useEffect(() => {
    const handleClickOutside = (event) => {
      if (selectRef.current && !selectRef.current.contains(event.target)) {
        setIsOpen(false);
        setFocusedIndex(-1);
      }
    };

    document.addEventListener("mousedown", handleClickOutside);
    return () => document.removeEventListener("mousedown", handleClickOutside);
  }, []);

  // Handle keyboard navigation
  const handleKeyDown = (event) => {
    if (disabled) return;

    switch (event.key) {
      case "Enter":
      case " ":
        event.preventDefault();
        if (isOpen && focusedIndex >= 0) {
          handleOptionSelect(options[focusedIndex]);
        } else {
          setIsOpen(!isOpen);
        }
        break;
      case "Escape":
        setIsOpen(false);
        setFocusedIndex(-1);
        break;
      case "ArrowDown":
        event.preventDefault();
        if (!isOpen) {
          setIsOpen(true);
        } else {
          setFocusedIndex((prev) => (prev < options.length - 1 ? prev + 1 : 0));
        }
        break;
      case "ArrowUp":
        event.preventDefault();
        if (isOpen) {
          setFocusedIndex((prev) => (prev > 0 ? prev - 1 : options.length - 1));
        }
        break;
    }
  };

  const handleOptionSelect = (option) => {
    onChange(option.value);
    setIsOpen(false);
    setFocusedIndex(-1);
  };

  const styles = {
    container: {
      position: "relative",
      width: "100%",
    },
    trigger: {
      display: "flex",
      alignItems: "center",
      justifyContent: "space-between",
      width: "100%",
      padding: "12px 16px",
      border: "1px solid #d1d5db",
      borderRadius: "8px",
      backgroundColor: disabled ? "#f9fafb" : "#ffffff",
      cursor: disabled ? "not-allowed" : "pointer",
      fontSize: "16px",
      minHeight: "48px",
      boxSizing: "border-box",
      transition: "all 0.2s ease",
      outline: "none",
      color: disabled ? "#9ca3af" : "#374151",
    },
    triggerFocused: {
      borderColor: "#3b82f6",
      boxShadow: "0 0 0 3px rgba(59, 130, 246, 0.1)",
    },
    triggerContent: {
      display: "flex",
      alignItems: "center",
      gap: "8px",
      flex: 1,
    },
    placeholder: {
      color: "#9ca3af",
    },
    chevron: {
      transition: "transform 0.2s ease",
      transform: isOpen ? "rotate(180deg)" : "rotate(0deg)",
      color: "#6b7280",
    },
    dropdown: {
      position: "absolute",
      top: "100%",
      left: 0,
      right: 0,
      zIndex: 50,
      marginTop: "4px",
      backgroundColor: "#ffffff",
      border: "1px solid #d1d5db",
      borderRadius: "8px",
      boxShadow:
        "0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05)",
      maxHeight: "240px",
      overflowY: "auto",
    },
    option: {
      display: "flex",
      alignItems: "center",
      gap: "12px",
      padding: "12px 16px",
      cursor: "pointer",
      fontSize: "16px",
      color: "#374151",
      transition: "background-color 0.2s ease",
    },
    optionHovered: {
      backgroundColor: "#f3f4f6",
    },
    optionSelected: {
      backgroundColor: "#eff6ff",
      color: "#1d4ed8",
    },
    optionIcon: {
      flexShrink: 0,
    },
    optionText: {
      flex: 1,
    },
  };

  return (
    <div style={styles.container} ref={selectRef}>
      <div
        style={{
          ...styles.trigger,
          ...(isOpen ? styles.triggerFocused : {}),
        }}
        onClick={() => !disabled && setIsOpen(!isOpen)}
        onKeyDown={handleKeyDown}
        tabIndex={disabled ? -1 : 0}
        role="combobox"
        aria-expanded={isOpen}
        aria-haspopup="listbox"
        aria-controls="place-type-options"
        aria-required={required}
      >
        <div style={styles.triggerContent}>
          {selectedOption ? (
            <>
              <span style={styles.optionIcon}>
                {getPlaceTypeIcon(selectedOption.value, { size: 20 })}
              </span>
              <span>{selectedOption.label}</span>
            </>
          ) : (
            <span style={styles.placeholder}>{placeholder}</span>
          )}
        </div>
        <ChevronDown size={20} style={styles.chevron} />
      </div>

      {isOpen && (
        <div style={styles.dropdown} role="listbox" id="place-type-options">
          {options.map((option, index) => (
            <div
              key={option.value}
              ref={(el) => (optionsRef.current[index] = el)}
              style={{
                ...styles.option,
                ...(index === focusedIndex ? styles.optionHovered : {}),
                ...(option.value === value ? styles.optionSelected : {}),
              }}
              onClick={() => handleOptionSelect(option)}
              onMouseEnter={() => setFocusedIndex(index)}
              role="option"
              aria-selected={option.value === value}
            >
              <span style={styles.optionIcon}>
                {getPlaceTypeIcon(option.value, { size: 20 })}
              </span>
              <span style={styles.optionText}>{option.label}</span>
            </div>
          ))}
        </div>
      )}
    </div>
  );
};

export default PlaceTypeSelect;
