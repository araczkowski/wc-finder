// Place types configuration for the WC Finder application
// This file contains the list of available place types and their translations

export const PLACE_TYPES = [
  "toilet",
  "public_toilet",
  "tourist_attraction",
  "shopping_mall",
  "restaurant",
  "cafe",
  "bar",
  "park",
  "train_station",
  "subway_station",
  "bus_station",
  "airport",
  "gas_station",
  "library",
  "museum",
  "movie_theater",
  "city_hall",
  "supermarket",
  "department_store",
];

// Default place type
export const DEFAULT_PLACE_TYPE = "toilet";

// Function to get place type options for select components
export const getPlaceTypeOptions = (translations) => {
  return PLACE_TYPES.map((type) => ({
    value: type,
    label: translations.placeTypes[type] || type,
  }));
};

// Function to get translated place type label
export const getPlaceTypeLabel = (placeType, translations) => {
  if (!placeType) {
    placeType = DEFAULT_PLACE_TYPE;
  }
  return (
    translations.placeTypes[placeType] ||
    translations.placeTypes[DEFAULT_PLACE_TYPE] ||
    placeType
  );
};

// Function to validate place type
export const isValidPlaceType = (placeType) => {
  return PLACE_TYPES.includes(placeType);
};
