"use client";

import { useState, useEffect, useRef, useCallback } from "react";

const AddressAutocomplete = ({
  value,
  onChange,
  onCoordinatesChange,
  onBlur,
  placeholder = "Wpisz adres...",
  disabled = false,
  style = {},
  className = "",
  required = false,
}) => {
  const [suggestions, setSuggestions] = useState([]);
  const [isLoading, setIsLoading] = useState(false);
  const [showSuggestions, setShowSuggestions] = useState(false);
  const [selectedIndex, setSelectedIndex] = useState(-1);
  const [geocodingStatus, setGeocodingStatus] = useState("");
  const [debugInfo, setDebugInfo] = useState("");
  const [addressFromSuggestion, setAddressFromSuggestion] = useState(false);
  const [isGeocoding, setIsGeocoding] = useState(false);

  const inputRef = useRef(null);
  const suggestionsRef = useRef(null);
  const debounceRef = useRef(null);
  const geocodingTimeoutRef = useRef(null);
  const autocompleteService = useRef(null);
  const geocoder = useRef(null);
  const placesService = useRef(null);

  const addDebugInfo = (message) => {
    console.log(`[AddressAutocomplete] ${message}`);
    // setDebugInfo(message);
    // setTimeout(() => setDebugInfo(""), 30000);
  };

  // Initialize Google Maps services
  useEffect(() => {
    const initializeGoogleMaps = () => {
      if (window.google && window.google.maps) {
        autocompleteService.current =
          new window.google.maps.places.AutocompleteService();
        geocoder.current = new window.google.maps.Geocoder();
        // Create a dummy div for PlacesService (required by Google Maps API)
        const dummyDiv = document.createElement("div");
        placesService.current = new window.google.maps.places.PlacesService(
          dummyDiv,
        );
        addDebugInfo("Google Maps services initialized");
      } else {
        addDebugInfo("Google Maps not available, using fallback");
      }
    };

    // Check if Google Maps is already loaded
    if (window.google && window.google.maps) {
      initializeGoogleMaps();
    } else {
      // Add event listener for when Google Maps loads
      window.addEventListener("google-maps-loaded", initializeGoogleMaps);

      // Load Google Maps if not already loading
      if (!document.querySelector('script[src*="maps.googleapis.com"]')) {
        loadGoogleMapsScript();
      }
    }

    return () => {
      window.removeEventListener("google-maps-loaded", initializeGoogleMaps);
      if (debounceRef.current) {
        clearTimeout(debounceRef.current);
      }
      if (geocodingTimeoutRef.current) {
        clearTimeout(geocodingTimeoutRef.current);
      }
    };
  }, []);

  const loadGoogleMapsScript = () => {
    const script = document.createElement("script");
    const apiKey = process.env.NEXT_PUBLIC_GOOGLE_MAPS_API_KEY;

    if (!apiKey) {
      console.warn(
        "Google Maps API key not found. Address autocomplete will use fallback method.",
      );
      return;
    }

    script.src = `https://maps.googleapis.com/maps/api/js?key=${apiKey}&libraries=places&language=pl&region=PL`;
    script.onload = () => {
      window.dispatchEvent(new Event("google-maps-loaded"));
    };
    script.onerror = () => {
      console.error("Failed to load Google Maps API");
    };
    document.head.appendChild(script);
  };

  // Fallback geocoding using Nominatim (OpenStreetMap)
  const fallbackGeocode = async (address) => {
    try {
      const response = await fetch(
        `https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(address)}&limit=1&addressdetails=1&countrycodes=pl`,
      );

      if (response.ok) {
        const data = await response.json();
        if (data && data.length > 0) {
          const result = data[0];
          return {
            lat: parseFloat(result.lat),
            lng: parseFloat(result.lon),
            formatted_address: result.display_name,
          };
        }
      }
    } catch (error) {
      console.error("Nominatim geocoding error:", error);
    }
    return null;
  };

  // Fallback address suggestions using Nominatim
  const fallbackSuggestions = async (input) => {
    try {
      const response = await fetch(
        `https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(input)}&limit=5&addressdetails=1&countrycodes=pl`,
      );

      if (response.ok) {
        const data = await response.json();
        return data.map((item, index) => ({
          place_id: `nominatim_${index}`,
          description: item.display_name,
          structured_formatting: {
            main_text: item.name || item.display_name.split(",")[0],
            secondary_text: item.display_name
              .split(",")
              .slice(1)
              .join(",")
              .trim(),
          },
        }));
      }
    } catch (error) {
      console.error("Nominatim suggestions error:", error);
    }
    return [];
  };

  // Get address suggestions
  const getSuggestions = useCallback(async (input) => {
    if (!input || input.length < 3) {
      setSuggestions([]);
      setShowSuggestions(false);
      return;
    }

    setIsLoading(true);

    // Try Google Places first
    if (autocompleteService.current) {
      try {
        const request = {
          input: input,
          componentRestrictions: { country: ["pl"] },
          types: ["address"],
          language: "pl",
        };

        autocompleteService.current.getPlacePredictions(
          request,
          (predictions, status) => {
            if (
              status === window.google.maps.places.PlacesServiceStatus.OK &&
              predictions
            ) {
              setSuggestions(predictions);
              setShowSuggestions(true);
              setIsLoading(false);
            } else {
              // Fallback to Nominatim
              fallbackSuggestions(input).then((fallbackResults) => {
                setSuggestions(fallbackResults);
                setShowSuggestions(fallbackResults.length > 0);
                setIsLoading(false);
              });
            }
          },
        );
      } catch (error) {
        console.error("Google Places error:", error);
        // Fallback to Nominatim
        const fallbackResults = await fallbackSuggestions(input);
        setSuggestions(fallbackResults);
        setShowSuggestions(fallbackResults.length > 0);
        setIsLoading(false);
      }
    } else {
      // Use Nominatim fallback
      const fallbackResults = await fallbackSuggestions(input);
      setSuggestions(fallbackResults);
      setShowSuggestions(fallbackResults.length > 0);
      setIsLoading(false);
    }
  }, []);

  // Geocode address to coordinates only (don't update address text) - immediate callback
  const geocodeAddressForCoordinates = async (address) => {
    if (!address || !address.trim()) {
      console.log(`[AddressAutocomplete] Empty address, skipping geocoding`);
      return;
    }

    console.log(
      `[AddressAutocomplete] Geocoding for coordinates only: ${address}`,
    );
    setGeocodingStatus("Pobieranie współrzędnych...");
    addDebugInfo(`Geocoding: ${address}`);

    // Try Google Geocoding first
    if (geocoder.current) {
      console.log("[AddressAutocomplete] Using Google Geocoding");
      try {
        geocoder.current.geocode(
          { address: address, region: "pl" },
          (results, status) => {
            console.log(
              `[AddressAutocomplete] Google Geocoding status: ${status}`,
            );
            if (status === "OK" && results[0]) {
              const location = results[0].geometry.location;
              const coordinates = {
                lat: location.lat(),
                lng: location.lng(),
              };
              console.log(
                `[AddressAutocomplete] Google coordinates:`,
                coordinates,
              );
              if (onCoordinatesChange) {
                console.log(
                  `[AddressAutocomplete] Calling onCoordinatesChange with:`,
                  coordinates,
                );
                onCoordinatesChange(coordinates);
                addDebugInfo(
                  `✓ GPS: ${coordinates.lat.toFixed(6)}, ${coordinates.lng.toFixed(6)}`,
                );
              } else {
                console.warn(
                  `[AddressAutocomplete] onCoordinatesChange callback not provided`,
                );
              }
              setGeocodingStatus("✓ Współrzędne pobrane (Google)");
              setTimeout(() => setGeocodingStatus(""), 2000);
            } else {
              console.log(
                "[AddressAutocomplete] Google failed, trying Nominatim",
              );
              // Fallback to Nominatim
              fallbackGeocode(address).then((result) => {
                if (result && onCoordinatesChange) {
                  const coords = { lat: result.lat, lng: result.lng };
                  console.log(
                    `[AddressAutocomplete] Nominatim coordinates:`,
                    coords,
                  );
                  onCoordinatesChange(coords);
                  addDebugInfo(
                    `✓ GPS: ${coords.lat.toFixed(6)}, ${coords.lng.toFixed(6)} (Nominatim)`,
                  );
                  setGeocodingStatus("✓ Współrzędne pobrane (Nominatim)");
                  setTimeout(() => setGeocodingStatus(""), 2000);
                } else {
                  setGeocodingStatus("⚠ Nie udało się pobrać współrzędnych");
                  addDebugInfo("❌ Geocoding failed");
                  setTimeout(() => setGeocodingStatus(""), 3000);
                  if (!onCoordinatesChange) {
                    console.warn(
                      `[AddressAutocomplete] onCoordinatesChange callback not provided for Nominatim fallback`,
                    );
                  }
                }
              });
            }
          },
        );
      } catch (error) {
        console.error("Google Geocoding error:", error);
        // Fallback to Nominatim
        const result = await fallbackGeocode(address);
        if (result && onCoordinatesChange) {
          const coords = { lat: result.lat, lng: result.lng };
          console.log(
            `[AddressAutocomplete] Nominatim fallback coordinates:`,
            coords,
          );
          onCoordinatesChange(coords);
          addDebugInfo(
            `✓ GPS: ${coords.lat.toFixed(6)}, ${coords.lng.toFixed(6)} (Fallback)`,
          );
          setGeocodingStatus("✓ Współrzędne pobrane (fallback)");
          setTimeout(() => setGeocodingStatus(""), 2000);
        } else {
          setGeocodingStatus("⚠ Nie udało się pobrać współrzędnych");
          addDebugInfo("❌ Geocoding failed");
          setTimeout(() => setGeocodingStatus(""), 3000);
          if (!onCoordinatesChange) {
            console.warn(
              `[AddressAutocomplete] onCoordinatesChange callback not provided for fallback`,
            );
          }
        }
      }
    } else {
      console.log("[AddressAutocomplete] Using Nominatim only");
      // Use Nominatim fallback
      const result = await fallbackGeocode(address);
      if (result && onCoordinatesChange) {
        const coords = { lat: result.lat, lng: result.lng };
        console.log(
          `[AddressAutocomplete] Nominatim-only coordinates:`,
          coords,
        );
        onCoordinatesChange(coords);
        addDebugInfo(
          `✓ GPS: ${coords.lat.toFixed(6)}, ${coords.lng.toFixed(6)} (Nominatim)`,
        );
        setGeocodingStatus("✓ Współrzędne pobrane (Nominatim)");
        setTimeout(() => setGeocodingStatus(""), 2000);
      } else {
        setGeocodingStatus("⚠ Nie udało się pobrać współrzędnych");
        addDebugInfo("❌ Geocoding failed");
        setTimeout(() => setGeocodingStatus(""), 3000);
        if (!onCoordinatesChange) {
          console.warn(
            `[AddressAutocomplete] onCoordinatesChange callback not provided for Nominatim-only`,
          );
        }
      }
    }
  };

  // Geocode address to coordinates only (delayed callback for manual input)
  const geocodeAddressDelayed = async (address) => {
    if (!address || !address.trim()) {
      console.log(`[AddressAutocomplete] Empty address, skipping geocoding`);
      return;
    }

    // Prevent multiple geocoding calls
    if (isGeocoding) {
      console.log(
        `[AddressAutocomplete] Geocoding already in progress, skipping`,
      );
      return;
    }

    // Clear any existing timeout
    if (geocodingTimeoutRef.current) {
      clearTimeout(geocodingTimeoutRef.current);
    }

    setIsGeocoding(true);
    console.log(
      `[AddressAutocomplete] Geocoding (delayed) for coordinates: ${address}`,
    );
    setGeocodingStatus("Pobieranie współrzędnych...");
    addDebugInfo(`Geocoding (delayed): ${address}`);

    // Try Google Geocoding first
    if (geocoder.current) {
      console.log("[AddressAutocomplete] Using Google Geocoding (delayed)");
      try {
        geocoder.current.geocode(
          { address: address, region: "pl" },
          (results, status) => {
            console.log(
              `[AddressAutocomplete] Google Geocoding status (delayed): ${status}`,
            );
            if (status === "OK" && results[0]) {
              const location = results[0].geometry.location;
              const coordinates = {
                lat: location.lat(),
                lng: location.lng(),
              };
              console.log(
                `[AddressAutocomplete] Google coordinates (delayed):`,
                coordinates,
              );

              // Delay the callback by 500ms to avoid rapid updates
              geocodingTimeoutRef.current = setTimeout(() => {
                if (onCoordinatesChange) {
                  console.log(
                    `[AddressAutocomplete] Calling delayed onCoordinatesChange with:`,
                    coordinates,
                  );
                  onCoordinatesChange(coordinates);
                  addDebugInfo(
                    `✓ GPS: ${coordinates.lat.toFixed(6)}, ${coordinates.lng.toFixed(6)} (delayed)`,
                  );
                } else {
                  console.warn(
                    `[AddressAutocomplete] onCoordinatesChange callback not provided (delayed)`,
                  );
                }
                setIsGeocoding(false);
              }, 500);

              setGeocodingStatus("✓ Współrzędne pobrane (Google)");
              setTimeout(() => setGeocodingStatus(""), 2000);
            } else {
              console.log(
                "[AddressAutocomplete] Google failed (delayed), trying Nominatim",
              );
              setIsGeocoding(false);
              // Fallback to Nominatim
              fallbackGeocode(address).then((result) => {
                if (result && onCoordinatesChange) {
                  const coords = { lat: result.lat, lng: result.lng };
                  console.log(
                    `[AddressAutocomplete] Nominatim coordinates (delayed):`,
                    coords,
                  );

                  // Delay the callback by 500ms
                  geocodingTimeoutRef.current = setTimeout(() => {
                    onCoordinatesChange(coords);
                    addDebugInfo(
                      `✓ GPS: ${coords.lat.toFixed(6)}, ${coords.lng.toFixed(6)} (Nominatim, delayed)`,
                    );
                    setIsGeocoding(false);
                  }, 500);

                  setGeocodingStatus("✓ Współrzędne pobrane (Nominatim)");
                  setTimeout(() => setGeocodingStatus(""), 2000);
                } else {
                  setGeocodingStatus("⚠ Nie udało się pobrać współrzędnych");
                  addDebugInfo("❌ Geocoding failed (delayed)");
                  setTimeout(() => setGeocodingStatus(""), 3000);
                  setIsGeocoding(false);
                  if (!onCoordinatesChange) {
                    console.warn(
                      `[AddressAutocomplete] onCoordinatesChange callback not provided for Nominatim fallback (delayed)`,
                    );
                  }
                }
              });
            }
          },
        );
      } catch (error) {
        console.error("Google Geocoding error (delayed):", error);
        // Fallback to Nominatim
        const result = await fallbackGeocode(address);
        if (result && onCoordinatesChange) {
          const coords = { lat: result.lat, lng: result.lng };
          console.log(
            `[AddressAutocomplete] Nominatim fallback coordinates (delayed):`,
            coords,
          );

          // Delay the callback by 500ms
          setTimeout(() => {
            onCoordinatesChange(coords);
            addDebugInfo(
              `✓ GPS: ${coords.lat.toFixed(6)}, ${coords.lng.toFixed(6)} (Fallback, delayed)`,
            );
          }, 500);

          setGeocodingStatus("✓ Współrzędne pobrane (fallback)");
          setTimeout(() => setGeocodingStatus(""), 2000);
        } else {
          setGeocodingStatus("⚠ Nie udało się pobrać współrzędnych");
          addDebugInfo("❌ Geocoding failed (delayed)");
          setTimeout(() => setGeocodingStatus(""), 3000);
          if (!onCoordinatesChange) {
            console.warn(
              `[AddressAutocomplete] onCoordinatesChange callback not provided for fallback (delayed)`,
            );
          }
        }
      }
    } else {
      // No Google Geocoding available, use Nominatim directly
      console.log("[AddressAutocomplete] Using Nominatim directly (delayed)");
      const result = await fallbackGeocode(address);
      if (result && onCoordinatesChange) {
        const coords = { lat: result.lat, lng: result.lng };
        console.log(
          `[AddressAutocomplete] Nominatim coordinates (delayed):`,
          coords,
        );

        // Delay the callback by 500ms
        geocodingTimeoutRef.current = setTimeout(() => {
          onCoordinatesChange(coords);
          addDebugInfo(
            `✓ GPS: ${coords.lat.toFixed(6)}, ${coords.lng.toFixed(6)} (Nominatim direct, delayed)`,
          );
          setIsGeocoding(false);
        }, 500);

        setGeocodingStatus("✓ Współrzędne pobrane (Nominatim)");
        setTimeout(() => setGeocodingStatus(""), 2000);
      } else {
        setGeocodingStatus("⚠ Nie udało się pobrać współrzędnych");
        addDebugInfo("❌ Geocoding failed (delayed)");
        setTimeout(() => setGeocodingStatus(""), 3000);
        setIsGeocoding(false);
        if (!onCoordinatesChange) {
          console.warn(
            `[AddressAutocomplete] onCoordinatesChange callback not provided for Nominatim direct (delayed)`,
          );
        }
      }
    }
  };

  // Geocode address to coordinates (legacy function for manual typing)
  const geocodeAddress = async (address) => {
    if (!address || !address.trim()) {
      console.log(`[AddressAutocomplete] Empty address, skipping geocoding`);
      return;
    }

    console.log(`[AddressAutocomplete] Geocoding address: ${address}`);
    setGeocodingStatus("Pobieranie współrzędnych...");
    addDebugInfo(`Geocoding: ${address}`);

    // Try Google Geocoding first
    if (geocoder.current) {
      console.log("[AddressAutocomplete] Using Google Geocoding");
      try {
        geocoder.current.geocode(
          { address: address, region: "pl" },
          (results, status) => {
            console.log(
              `[AddressAutocomplete] Google Geocoding status: ${status}`,
            );
            if (status === "OK" && results[0]) {
              const location = results[0].geometry.location;
              const coordinates = {
                lat: location.lat(),
                lng: location.lng(),
              };
              console.log(
                `[AddressAutocomplete] Google coordinates:`,
                coordinates,
              );
              if (onCoordinatesChange) {
                console.log(
                  `[AddressAutocomplete] Calling onCoordinatesChange with:`,
                  coordinates,
                );
                onCoordinatesChange(coordinates);
                addDebugInfo(
                  `✓ GPS: ${coordinates.lat.toFixed(6)}, ${coordinates.lng.toFixed(6)}`,
                );
              } else {
                console.warn(
                  `[AddressAutocomplete] onCoordinatesChange callback not provided`,
                );
              }
              setGeocodingStatus("✓ Współrzędne pobrane (Google)");
              setTimeout(() => setGeocodingStatus(""), 2000);
            } else {
              console.log(
                "[AddressAutocomplete] Google failed, trying Nominatim",
              );
              // Fallback to Nominatim
              fallbackGeocode(address).then((result) => {
                if (result && onCoordinatesChange) {
                  const coords = { lat: result.lat, lng: result.lng };
                  console.log(
                    `[AddressAutocomplete] Nominatim coordinates:`,
                    coords,
                  );
                  onCoordinatesChange(coords);
                  addDebugInfo(
                    `✓ GPS: ${coords.lat.toFixed(6)}, ${coords.lng.toFixed(6)} (Nominatim)`,
                  );
                  setGeocodingStatus("✓ Współrzędne pobrane (Nominatim)");
                  setTimeout(() => setGeocodingStatus(""), 2000);
                } else {
                  setGeocodingStatus("⚠ Nie udało się pobrać współrzędnych");
                  addDebugInfo("❌ Geocoding failed");
                  setTimeout(() => setGeocodingStatus(""), 3000);
                  if (!onCoordinatesChange) {
                    console.warn(
                      `[AddressAutocomplete] onCoordinatesChange callback not provided for Nominatim fallback`,
                    );
                  }
                }
              });
            }
          },
        );
      } catch (error) {
        console.error("Google Geocoding error:", error);
        // Fallback to Nominatim
        const result = await fallbackGeocode(address);
        if (result && onCoordinatesChange) {
          const coords = { lat: result.lat, lng: result.lng };
          console.log(
            `[AddressAutocomplete] Nominatim fallback coordinates:`,
            coords,
          );
          onCoordinatesChange(coords);
          addDebugInfo(
            `✓ GPS: ${coords.lat.toFixed(6)}, ${coords.lng.toFixed(6)} (Fallback)`,
          );
          setGeocodingStatus("✓ Współrzędne pobrane (fallback)");
          setTimeout(() => setGeocodingStatus(""), 2000);
        } else {
          setGeocodingStatus("⚠ Nie udało się pobrać współrzędnych");
          addDebugInfo("❌ Geocoding failed");
          setTimeout(() => setGeocodingStatus(""), 3000);
          if (!onCoordinatesChange) {
            console.warn(
              `[AddressAutocomplete] onCoordinatesChange callback not provided for fallback`,
            );
          }
        }
      }
    } else {
      console.log("[AddressAutocomplete] Using Nominatim only");
      // Use Nominatim fallback
      const result = await fallbackGeocode(address);
      if (result && onCoordinatesChange) {
        const coords = { lat: result.lat, lng: result.lng };
        console.log(
          `[AddressAutocomplete] Nominatim-only coordinates:`,
          coords,
        );
        onCoordinatesChange(coords);
        addDebugInfo(
          `✓ GPS: ${coords.lat.toFixed(6)}, ${coords.lng.toFixed(6)} (Nominatim)`,
        );
        setGeocodingStatus("✓ Współrzędne pobrane (Nominatim)");
        setTimeout(() => setGeocodingStatus(""), 2000);
      } else {
        setGeocodingStatus("⚠ Nie udało się pobrać współrzędnych");
        addDebugInfo("❌ Geocoding failed");
        setTimeout(() => setGeocodingStatus(""), 3000);
        if (!onCoordinatesChange) {
          console.warn(
            `[AddressAutocomplete] onCoordinatesChange callback not provided for Nominatim-only`,
          );
        }
      }
    }
  };

  // Handle input change with debouncing
  const handleInputChange = (e) => {
    const newValue = e.target.value;
    onChange(newValue);
    setSelectedIndex(-1);
    setGeocodingStatus("");
    setAddressFromSuggestion(false); // Reset flag when user types manually

    // Clear previous timeout
    if (debounceRef.current) {
      clearTimeout(debounceRef.current);
    }

    // Debounce suggestions
    debounceRef.current = setTimeout(() => {
      getSuggestions(newValue);
    }, 300);
  };

  // Handle suggestion selection
  const handleSuggestionClick = (suggestion) => {
    const selectedAddress = suggestion.description;
    console.log(`[AddressAutocomplete] Selected address: ${selectedAddress}`);

    // Mark that this address came from suggestion selection
    setAddressFromSuggestion(true);

    // Update address field immediately
    if (onChange) {
      console.log(
        `[AddressAutocomplete] Calling onChange with: ${selectedAddress}`,
      );
      onChange(selectedAddress);
    } else {
      console.warn(`[AddressAutocomplete] onChange callback not provided`);
    }

    // Hide suggestions
    setShowSuggestions(false);
    setSuggestions([]);
    setSelectedIndex(-1);
    addDebugInfo(`Selected: ${selectedAddress}`);

    // Geocode the selected address to get coordinates, but don't change the address text
    geocodeAddressForCoordinates(selectedAddress);
  };

  // Handle keyboard navigation
  const handleKeyDown = (e) => {
    if (!showSuggestions || suggestions.length === 0) {
      // If Enter is pressed and no suggestions, try to geocode current value with delay
      if (e.key === "Enter" && value.trim()) {
        e.preventDefault();
        geocodeAddressDelayed(value.trim());
      }
      return;
    }

    switch (e.key) {
      case "ArrowDown":
        e.preventDefault();
        setSelectedIndex((prev) =>
          prev < suggestions.length - 1 ? prev + 1 : 0,
        );
        break;
      case "ArrowUp":
        e.preventDefault();
        setSelectedIndex((prev) =>
          prev > 0 ? prev - 1 : suggestions.length - 1,
        );
        break;
      case "Enter":
        e.preventDefault();
        if (selectedIndex >= 0 && suggestions[selectedIndex]) {
          handleSuggestionClick(suggestions[selectedIndex]);
        } else if (value.trim()) {
          geocodeAddressDelayed(value.trim());
          setShowSuggestions(false);
        }
        break;
      case "Escape":
        setShowSuggestions(false);
        setSelectedIndex(-1);
        inputRef.current?.blur();
        break;
    }
  };

  // Handle input blur
  const handleBlur = (e) => {
    // Don't hide suggestions immediately - give time for click events
    setTimeout(() => {
      setShowSuggestions(false);
      setSelectedIndex(-1);

      // If user typed manually (not from suggestion) and field has value, geocode it with delay
      if (!addressFromSuggestion && value && value.trim()) {
        console.log(
          `[AddressAutocomplete] Manual input detected on blur: ${value}`,
        );
        geocodeAddressDelayed(value.trim());
      }

      // Call parent onBlur if provided
      if (onBlur) {
        onBlur(e);
      }
    }, 300);
  };

  // Handle input focus
  const handleFocus = () => {
    if (suggestions.length > 0) {
      setShowSuggestions(true);
    }
  };

  return (
    <div style={{ position: "relative", width: "100%" }}>
      <textarea
        ref={inputRef}
        type="text"
        value={value}
        onChange={handleInputChange}
        onKeyDown={handleKeyDown}
        onBlur={handleBlur}
        onFocus={handleFocus}
        placeholder={placeholder}
        disabled={disabled}
        required={required}
        className={className}
        style={{
          width: "100%",
          padding: "0.75rem",
          borderRadius: "4px",
          border: "1px solid #ddd",
          fontSize: "1rem",
          boxSizing: "border-box",
          transition: "border-color 0.2s ease",
          ...style,
        }}
        autoComplete="off"
      />

      {/* Loading indicator */}
      {isLoading && (
        <div
          style={{
            position: "absolute",
            right: "10px",
            top: "50%",
            transform: "translateY(-50%)",
            fontSize: "0.9rem",
            color: "#666",
          }}
        >
          ⏳
        </div>
      )}

      {/* Suggestions dropdown */}
      {showSuggestions && suggestions.length > 0 && (
        <div
          ref={suggestionsRef}
          style={{
            position: "absolute",
            top: "100%",
            left: 0,
            right: 0,
            backgroundColor: "white",
            border: "1px solid #ddd",
            borderTop: "none",
            borderRadius: "0 0 4px 4px",
            maxHeight: "200px",
            overflowY: "auto",
            zIndex: 1000,
            boxShadow: "0 2px 8px rgba(0,0,0,0.1)",
          }}
        >
          {suggestions.map((suggestion, index) => (
            <div
              key={suggestion.place_id}
              onMouseDown={(e) => {
                e.preventDefault();
                e.stopPropagation();
                console.log(
                  `[AddressAutocomplete] Mouse down on suggestion:`,
                  suggestion.description,
                );
                handleSuggestionClick(suggestion);
              }}
              style={{
                padding: "0.75rem",
                cursor: "pointer",
                borderBottom:
                  index < suggestions.length - 1 ? "1px solid #eee" : "none",
                backgroundColor:
                  index === selectedIndex ? "#f0f8ff" : "transparent",
                transition: "background-color 0.1s ease",
              }}
              onMouseEnter={() => setSelectedIndex(index)}
            >
              <div style={{ fontWeight: "500", color: "#333" }}>
                {suggestion.structured_formatting?.main_text ||
                  suggestion.description.split(",")[0]}
              </div>
              {suggestion.structured_formatting?.secondary_text && (
                <div
                  style={{
                    fontSize: "0.85rem",
                    color: "#666",
                    marginTop: "2px",
                  }}
                >
                  {suggestion.structured_formatting.secondary_text}
                </div>
              )}
            </div>
          ))}
        </div>
      )}

      {/* Geocoding status */}
      {geocodingStatus && (
        <div
          style={{
            fontSize: "0.85rem",
            marginTop: "4px",
            color: geocodingStatus.includes("✓")
              ? "#28a745"
              : geocodingStatus.includes("⚠")
                ? "#ffc107"
                : "#007bff",
            fontWeight: "500",
          }}
        >
          {geocodingStatus}
        </div>
      )}

      {/* Debug info */}
      {debugInfo && process.env.NODE_ENV === "development" && (
        <div
          style={{
            fontSize: "0.75rem",
            marginTop: "2px",
            color: "#6c757d",
            fontStyle: "italic",
          }}
        >
          {debugInfo}
        </div>
      )}
    </div>
  );
};

export default AddressAutocomplete;
