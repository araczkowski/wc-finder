"use client";

import { useState, useEffect, createContext, useContext } from "react";
import { pl } from "../locales/pl";

// Translation context
const TranslationContext = createContext();

// Available languages
const LANGUAGES = {
  pl: pl,
  // en: en, // Can be added later
};

// Translation provider component
export const TranslationProvider = ({ children, defaultLanguage = "pl" }) => {
  const [currentLanguage, setCurrentLanguage] = useState(defaultLanguage);
  const [translations, setTranslations] = useState(LANGUAGES[defaultLanguage]);

  useEffect(() => {
    // Load language from localStorage if available
    const savedLanguage = localStorage.getItem("preferred-language");
    if (savedLanguage && LANGUAGES[savedLanguage]) {
      setCurrentLanguage(savedLanguage);
      setTranslations(LANGUAGES[savedLanguage]);
    }
  }, []);

  const changeLanguage = (language) => {
    if (LANGUAGES[language]) {
      setCurrentLanguage(language);
      setTranslations(LANGUAGES[language]);
      localStorage.setItem("preferred-language", language);
    }
  };

  const t = (key, variables = {}) => {
    let translation = translations[key] || key;

    // Replace variables in translation
    Object.keys(variables).forEach((variable) => {
      translation = translation.replace(`{${variable}}`, variables[variable]);
    });

    return translation;
  };

  const value = {
    currentLanguage,
    changeLanguage,
    t,
    translations,
    availableLanguages: Object.keys(LANGUAGES),
  };

  return (
    <TranslationContext.Provider value={value}>
      {children}
    </TranslationContext.Provider>
  );
};

// Hook to use translations
export const useTranslation = () => {
  const context = useContext(TranslationContext);

  if (!context) {
    throw new Error("useTranslation must be used within a TranslationProvider");
  }

  return context;
};

// Helper function for components not wrapped in provider
export const createTranslationFunction = (language = "pl") => {
  const translations = LANGUAGES[language] || LANGUAGES.pl;

  return (key, variables = {}) => {
    let translation = translations[key] || key;

    // Replace variables in translation
    Object.keys(variables).forEach((variable) => {
      translation = translation.replace(`{${variable}}`, variables[variable]);
    });

    return translation;
  };
};
