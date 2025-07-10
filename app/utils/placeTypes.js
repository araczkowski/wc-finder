// Place types configuration for the WC Finder application
// This file contains the list of available place types and their translations

import {
  Toilet, // toilet
  Building, // public_toilet
  Camera, // tourist_attraction
  ShoppingBag, // shopping_mall
  Utensils, // restaurant
  Coffee, // cafe
  Wine, // bar
  Trees, // park
  Train, // train_station
  Navigation, // subway_station
  Bus, // bus_station
  Plane, // airport
  Fuel, // gas_station
  BookOpen, // library
  Palette, // museum
  Film, // movie_theater
  Building2, // city_hall
  ShoppingCart, // supermarket
  Store, // department_store
} from "lucide-react";

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

// Mapping for Polish place types to English equivalents
export const POLISH_TO_ENGLISH_PLACE_TYPES = {
  "Stacja paliw": "gas_station",
  Restauracja: "restaurant",
  Kawiarnia: "cafe",
  Bar: "bar",
  Park: "park",
  "Dworzec kolejowy": "train_station",
  "Stacja metra": "subway_station",
  "Dworzec autobusowy": "bus_station",
  Lotnisko: "airport",
  Biblioteka: "library",
  Muzeum: "museum",
  Kino: "movie_theater",
  Ratusz: "city_hall",
  Supermarket: "supermarket",
  "Dom towarowy": "department_store",
  "Centrum handlowe": "shopping_mall",
  "Atrakcja turystyczna": "tourist_attraction",
  "Toaleta publiczna": "public_toilet",
  Toaleta: "toilet",
};

// Function to normalize place type (convert Polish to English if needed)
export const normalizePlaceType = (placeType) => {
  if (!placeType) return DEFAULT_PLACE_TYPE;
  return POLISH_TO_ENGLISH_PLACE_TYPES[placeType] || placeType;
};

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

  // First, try to get English equivalent if it's a Polish place type
  const englishType = normalizePlaceType(placeType);

  // If we have a translation for this place type, use it
  if (translations.placeTypes[englishType]) {
    return translations.placeTypes[englishType];
  }

  // If no translation found, return the raw place_type from database
  // instead of falling back to default "toilet" translation
  return placeType;
};

// Function to get place type icon component
export const getPlaceTypeIcon = (placeType, props = {}) => {
  const defaultProps = { size: 16, className: "inline-block", ...props };

  // First, try to get English equivalent if it's a Polish place type
  const englishType = normalizePlaceType(placeType);

  switch (englishType) {
    case "toilet":
      return <Toilet {...defaultProps} />;
    case "public_toilet":
      return <Building {...defaultProps} />;
    case "tourist_attraction":
      return <Camera {...defaultProps} />;
    case "shopping_mall":
      return <ShoppingBag {...defaultProps} />;
    case "restaurant":
      return <Utensils {...defaultProps} />;
    case "cafe":
      return <Coffee {...defaultProps} />;
    case "bar":
      return <Wine {...defaultProps} />;
    case "park":
      return <Trees {...defaultProps} />;
    case "train_station":
      return <Train {...defaultProps} />;
    case "subway_station":
      return <Navigation {...defaultProps} />;
    case "bus_station":
      return <Bus {...defaultProps} />;
    case "airport":
      return <Plane {...defaultProps} />;
    case "gas_station":
      return <Fuel {...defaultProps} />;
    case "library":
      return <BookOpen {...defaultProps} />;
    case "museum":
      return <Palette {...defaultProps} />;
    case "movie_theater":
      return <Film {...defaultProps} />;
    case "city_hall":
      return <Building2 {...defaultProps} />;
    case "supermarket":
      return <ShoppingCart {...defaultProps} />;
    case "department_store":
      return <Store {...defaultProps} />;
    default:
      return <Toilet {...defaultProps} />;
  }
};

// Function to validate place type
export const isValidPlaceType = (placeType) => {
  const normalizedType = normalizePlaceType(placeType);
  return PLACE_TYPES.includes(normalizedType);
};
