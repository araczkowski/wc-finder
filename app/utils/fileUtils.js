// Helper function to sanitize filename for Supabase storage
export const sanitizeFilename = (filename) => {
  if (!filename) return "";

  // Replace Polish characters with ASCII equivalents
  const polishChars = {
    ą: "a",
    ć: "c",
    ę: "e",
    ł: "l",
    ń: "n",
    ó: "o",
    ś: "s",
    ź: "z",
    ż: "z",
    Ą: "A",
    Ć: "C",
    Ę: "E",
    Ł: "L",
    Ń: "N",
    Ó: "O",
    Ś: "S",
    Ź: "Z",
    Ż: "Z",
  };

  let sanitized = filename;

  // Replace Polish characters
  Object.keys(polishChars).forEach((polish) => {
    sanitized = sanitized.replace(new RegExp(polish, "g"), polishChars[polish]);
  });

  // Remove or replace other problematic characters for URL safety
  sanitized = sanitized
    .replace(/[^a-zA-Z0-9.-_]/g, "_") // Replace non-alphanumeric chars (except dots, dashes, underscores) with underscore
    .replace(/_{2,}/g, "_") // Replace multiple consecutive underscores with single underscore
    .replace(/^_+|_+$/g, ""); // Remove leading/trailing underscores

  return sanitized;
};

// Helper function to generate a unique filename for uploads
export const generateUniqueFilename = (originalFilename, userId, prefix = "") => {
  const sanitizedName = sanitizeFilename(originalFilename);
  const timestamp = Date.now();
  const prefixPart = prefix ? `${prefix}/` : "";

  // Extract file extension
  const parts = sanitizedName.split(".");
  const extension = parts.length > 1 ? parts.pop() : "jpg";
  const nameWithoutExt = parts.join(".");

  // Generate unique filename
  return `${prefixPart}${userId}/${timestamp}_${nameWithoutExt}.${extension}`;
};
