"use client";

import { useEffect, useState, useRef, useCallback } from "react";

export const useGoogleMaps = () => {
  const [isLoaded, setIsLoaded] = useState(false);
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState(null);
  const scriptRef = useRef(null);

  const handleScriptLoad = useCallback(() => {
    setIsLoaded(true);
    setIsLoading(false);
    setError(null);
  }, []);

  const handleScriptError = useCallback(() => {
    setIsLoaded(false);
    setIsLoading(false);
    setError("Failed to load Google Maps API");
  }, []);

  const loadGoogleMapsScript = useCallback(() => {
    const apiKey = process.env.NEXT_PUBLIC_GOOGLE_MAPS_API_KEY;

    if (!apiKey) {
      setError("Google Maps API key not found in environment variables");
      return;
    }

    setIsLoading(true);
    setError(null);

    const script = document.createElement("script");
    script.src = `https://maps.googleapis.com/maps/api/js?key=${apiKey}&libraries=places&language=pl&region=PL`;
    script.async = true;
    script.defer = true;

    script.addEventListener("load", handleScriptLoad);
    script.addEventListener("error", handleScriptError);

    scriptRef.current = script;
    document.head.appendChild(script);
  }, [handleScriptLoad, handleScriptError]);

  useEffect(() => {
    // Check if Google Maps is already loaded
    if (window.google && window.google.maps) {
      setIsLoaded(true);
      return;
    }

    // Check if script is already loading
    const existingScript = document.querySelector(
      'script[src*="maps.googleapis.com"]',
    );
    if (existingScript) {
      setIsLoading(true);
      existingScript.addEventListener("load", handleScriptLoad);
      existingScript.addEventListener("error", handleScriptError);
      return;
    }

    // Load Google Maps script
    loadGoogleMapsScript();

    return () => {
      if (scriptRef.current) {
        scriptRef.current.removeEventListener("load", handleScriptLoad);
        scriptRef.current.removeEventListener("error", handleScriptError);
      }
    };
  }, [loadGoogleMapsScript, handleScriptLoad, handleScriptError]);

  return {
    isLoaded,
    isLoading,
    error,
    googleMaps: isLoaded ? window.google?.maps : null,
  };
};

export const useGeocoding = () => {
  const { isLoaded, googleMaps } = useGoogleMaps();
  const geocoderRef = useRef(null);

  useEffect(() => {
    if (isLoaded && googleMaps && !geocoderRef.current) {
      geocoderRef.current = new googleMaps.Geocoder();
    }
  }, [isLoaded, googleMaps]);

  const geocodeAddress = async (address) => {
    return new Promise((resolve, reject) => {
      if (!geocoderRef.current) {
        // Fallback to Nominatim
        fallbackGeocode(address).then(resolve).catch(reject);
        return;
      }

      geocoderRef.current.geocode(
        {
          address: address,
          region: "pl",
          componentRestrictions: { country: "PL" },
        },
        (results, status) => {
          if (status === "OK" && results && results[0]) {
            const location = results[0].geometry.location;
            resolve({
              lat: location.lat(),
              lng: location.lng(),
              formatted_address: results[0].formatted_address,
              place_id: results[0].place_id,
            });
          } else {
            // Fallback to Nominatim
            fallbackGeocode(address).then(resolve).catch(reject);
          }
        },
      );
    });
  };

  const reverseGeocode = async (lat, lng) => {
    return new Promise((resolve, reject) => {
      if (!geocoderRef.current) {
        // Fallback to Nominatim
        fallbackReverseGeocode(lat, lng).then(resolve).catch(reject);
        return;
      }

      geocoderRef.current.geocode(
        {
          location: { lat, lng },
          region: "pl",
        },
        (results, status) => {
          if (status === "OK" && results && results[0]) {
            resolve({
              formatted_address: results[0].formatted_address,
              place_id: results[0].place_id,
              address_components: results[0].address_components,
            });
          } else {
            // Fallback to Nominatim
            fallbackReverseGeocode(lat, lng).then(resolve).catch(reject);
          }
        },
      );
    });
  };

  return {
    geocodeAddress,
    reverseGeocode,
    isReady: isLoaded && !!geocoderRef.current,
  };
};

export const usePlacesAutocomplete = () => {
  const { isLoaded, googleMaps } = useGoogleMaps();
  const autocompleteServiceRef = useRef(null);

  useEffect(() => {
    if (isLoaded && googleMaps && !autocompleteServiceRef.current) {
      autocompleteServiceRef.current =
        new googleMaps.places.AutocompleteService();
    }
  }, [isLoaded, googleMaps]);

  const getPlacePredictions = async (input, options = {}) => {
    return new Promise((resolve, reject) => {
      if (!autocompleteServiceRef.current) {
        // Fallback to Nominatim
        fallbackPlacePredictions(input).then(resolve).catch(reject);
        return;
      }

      const request = {
        input,
        componentRestrictions: { country: ["pl"] },
        types: ["address"],
        language: "pl",
        ...options,
      };

      autocompleteServiceRef.current.getPlacePredictions(
        request,
        (predictions, status) => {
          if (
            status === googleMaps.places.PlacesServiceStatus.OK &&
            predictions
          ) {
            resolve(predictions);
          } else {
            // Fallback to Nominatim
            fallbackPlacePredictions(input).then(resolve).catch(reject);
          }
        },
      );
    });
  };

  return {
    getPlacePredictions,
    isReady: isLoaded && !!autocompleteServiceRef.current,
  };
};

// Fallback functions using Nominatim (OpenStreetMap)
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
          place_id: `nominatim_${result.place_id}`,
        };
      }
    }
    throw new Error("No results found");
  } catch (error) {
    throw new Error(`Geocoding failed: ${error.message}`);
  }
};

const fallbackReverseGeocode = async (lat, lng) => {
  try {
    const response = await fetch(
      `https://nominatim.openstreetmap.org/reverse?format=json&lat=${lat}&lon=${lng}&zoom=18&addressdetails=1`,
    );

    if (response.ok) {
      const data = await response.json();
      if (data && data.display_name) {
        return {
          formatted_address: data.display_name,
          place_id: `nominatim_${data.place_id}`,
          address_components: data.address || {},
        };
      }
    }
    throw new Error("No results found");
  } catch (error) {
    throw new Error(`Reverse geocoding failed: ${error.message}`);
  }
};

const fallbackPlacePredictions = async (input) => {
  try {
    const response = await fetch(
      `https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(input)}&limit=5&addressdetails=1&countrycodes=pl`,
    );

    if (response.ok) {
      const data = await response.json();
      return data.map((item, index) => ({
        place_id: `nominatim_${item.place_id || index}`,
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
    return [];
  } catch (error) {
    console.error("Nominatim suggestions error:", error);
    return [];
  }
};
