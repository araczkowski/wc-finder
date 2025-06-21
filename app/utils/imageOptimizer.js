/**
 * Image optimization utility for compressing images before upload
 * Supports configurable parameters for easy adjustment
 */

// Default optimization parameters - easy to modify
export const IMAGE_OPTIMIZATION_CONFIG = {
  // Maximum dimensions
  maxWidth: 1200,
  maxHeight: 1200,

  // Quality settings (0.1 to 1.0)
  quality: 0.8,

  // Output format
  outputFormat: "image/jpeg", // 'image/jpeg' or 'image/webp'

  // Maximum file size in bytes (2MB default)
  maxFileSize: 2 * 1024 * 1024,

  // Whether to preserve EXIF data (false for smaller files)
  preserveExif: false,

  // Background color for transparent images when converting to JPEG
  backgroundColor: "#FFFFFF",
};

// Specialized configs for different use cases
export const WC_THUMBNAIL_CONFIG = {
  maxWidth: 400,
  maxHeight: 400,
  quality: 0.9,
  outputFormat: "image/jpeg",
  maxFileSize: 500 * 1024, // 500KB
  preserveExif: false,
  backgroundColor: "#FFFFFF",
};

export const WC_GALLERY_CONFIG = {
  maxWidth: 800,
  maxHeight: 800,
  quality: 0.85,
  outputFormat: "image/jpeg",
  maxFileSize: 1 * 1024 * 1024, // 1MB
  preserveExif: false,
  backgroundColor: "#FFFFFF",
};

export const WC_MAIN_IMAGE_CONFIG = {
  maxWidth: 1200,
  maxHeight: 1200,
  quality: 0.8,
  outputFormat: "image/jpeg",
  maxFileSize: 2 * 1024 * 1024, // 2MB
  preserveExif: false,
  backgroundColor: "#FFFFFF",
};

/**
 * Optimizes an image file by compressing and resizing it
 * @param {File} file - The original image file
 * @param {Object} config - Optional configuration overrides
 * @returns {Promise<File>} - The optimized image file
 */
export async function optimizeImage(file, config = {}) {
  // Merge default config with provided config
  const finalConfig = { ...IMAGE_OPTIMIZATION_CONFIG, ...config };

  return new Promise((resolve, reject) => {
    // Check if file is an image
    if (!file.type.startsWith("image/")) {
      reject(new Error("File is not an image"));
      return;
    }

    // If file is already small enough, return as is
    if (file.size <= finalConfig.maxFileSize) {
      console.log(
        "[ImageOptimizer] File already within size limit, returning original",
      );
      resolve(file);
      return;
    }

    const canvas = document.createElement("canvas");
    const ctx = canvas.getContext("2d");
    const img = new Image();

    img.onload = () => {
      try {
        // Calculate new dimensions while maintaining aspect ratio
        const { width: newWidth, height: newHeight } = calculateNewDimensions(
          img.width,
          img.height,
          finalConfig.maxWidth,
          finalConfig.maxHeight,
        );

        // Set canvas dimensions
        canvas.width = newWidth;
        canvas.height = newHeight;

        // Fill background if converting to JPEG (no transparency support)
        if (finalConfig.outputFormat === "image/jpeg") {
          ctx.fillStyle = finalConfig.backgroundColor;
          ctx.fillRect(0, 0, newWidth, newHeight);
        }

        // Draw and resize image
        ctx.drawImage(img, 0, 0, newWidth, newHeight);

        // Convert to blob with compression
        canvas.toBlob(
          (blob) => {
            if (!blob) {
              reject(new Error("Failed to compress image"));
              return;
            }

            // Create new file with optimized blob
            const optimizedFile = new File(
              [blob],
              getOptimizedFileName(file.name, finalConfig.outputFormat),
              {
                type: finalConfig.outputFormat,
                lastModified: Date.now(),
              },
            );

            console.log("[ImageOptimizer] Optimization complete:", {
              originalSize: formatFileSize(file.size),
              optimizedSize: formatFileSize(optimizedFile.size),
              compression:
                ((1 - optimizedFile.size / file.size) * 100).toFixed(1) + "%",
              originalDimensions: `${img.width}x${img.height}`,
              newDimensions: `${newWidth}x${newHeight}`,
            });

            resolve(optimizedFile);
          },
          finalConfig.outputFormat,
          finalConfig.quality,
        );
      } catch (error) {
        reject(new Error(`Image optimization failed: ${error.message}`));
      }
    };

    img.onerror = () => {
      reject(new Error("Failed to load image"));
    };

    // Start loading the image
    img.src = URL.createObjectURL(file);
  });
}

/**
 * Calculates new dimensions while maintaining aspect ratio
 * @param {number} originalWidth
 * @param {number} originalHeight
 * @param {number} maxWidth
 * @param {number} maxHeight
 * @returns {Object} New width and height
 */
function calculateNewDimensions(
  originalWidth,
  originalHeight,
  maxWidth,
  maxHeight,
) {
  let { width, height } = { width: originalWidth, height: originalHeight };

  // Calculate scaling factor
  const widthRatio = maxWidth / width;
  const heightRatio = maxHeight / height;
  const scalingFactor = Math.min(widthRatio, heightRatio, 1); // Don't upscale

  // Apply scaling
  width = Math.round(width * scalingFactor);
  height = Math.round(height * scalingFactor);

  return { width, height };
}

/**
 * Generates optimized filename based on output format
 * @param {string} originalName
 * @param {string} outputFormat
 * @returns {string} New filename
 */
function getOptimizedFileName(originalName, outputFormat) {
  const nameWithoutExtension = originalName.replace(/\.[^/.]+$/, "");
  const extension =
    outputFormat === "image/jpeg"
      ? "jpg"
      : outputFormat === "image/webp"
        ? "webp"
        : "jpg";
  return `${nameWithoutExtension}_optimized.${extension}`;
}

/**
 * Formats file size for display
 * @param {number} bytes
 * @returns {string} Formatted size
 */
function formatFileSize(bytes) {
  if (bytes === 0) return "0 Bytes";
  const k = 1024;
  const sizes = ["Bytes", "KB", "MB", "GB"];
  const i = Math.floor(Math.log(bytes) / Math.log(k));
  return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + " " + sizes[i];
}

/**
 * Optimizes multiple images
 * @param {FileList|Array<File>} files
 * @param {Object} config
 * @returns {Promise<Array<File>>} Array of optimized files
 */
export async function optimizeImages(files, config = {}) {
  const fileArray = Array.from(files);
  const promises = fileArray.map((file) => optimizeImage(file, config));

  try {
    const optimizedFiles = await Promise.all(promises);
    return optimizedFiles;
  } catch (error) {
    throw new Error(`Batch optimization failed: ${error.message}`);
  }
}

/**
 * Validates image file before optimization
 * @param {File} file
 * @param {Object} config
 * @returns {Object} Validation result
 */
export function validateImageFile(file, config = {}) {
  const finalConfig = { ...IMAGE_OPTIMIZATION_CONFIG, ...config };

  const errors = [];

  // Check if it's an image
  if (!file.type.startsWith("image/")) {
    errors.push("File must be an image");
  }

  // Check supported formats
  const supportedFormats = [
    "image/jpeg",
    "image/jpg",
    "image/png",
    "image/webp",
    "image/gif",
  ];
  if (!supportedFormats.includes(file.type)) {
    errors.push("Unsupported image format. Please use JPEG, PNG, WebP, or GIF");
  }

  // Check file size (before optimization)
  const maxUploadSize = finalConfig.maxFileSize * 5; // Allow 5x the target size for pre-optimization
  if (file.size > maxUploadSize) {
    errors.push(
      `File is too large. Maximum size: ${formatFileSize(maxUploadSize)}`,
    );
  }

  return {
    isValid: errors.length === 0,
    errors,
  };
}

/**
 * Creates a preview URL for the optimized image
 * @param {File} file
 * @returns {string} Object URL for preview
 */
export function createImagePreview(file) {
  return URL.createObjectURL(file);
}

/**
 * Cleans up preview URL to prevent memory leaks
 * @param {string} previewUrl
 */
export function cleanupImagePreview(previewUrl) {
  if (previewUrl && previewUrl.startsWith("blob:")) {
    URL.revokeObjectURL(previewUrl);
  }
}

/**
 * Creates a transformed Supabase image URL with size parameters
 * This is useful for thumbnails and optimized display
 * @param {string} originalUrl - Original Supabase image URL
 * @param {Object} options - Transformation options
 * @returns {string} Transformed URL
 */
export function createTransformedSupabaseUrl(originalUrl, options = {}) {
  if (!originalUrl) return originalUrl;

  const {
    width,
    height,
    quality = 80,
    format = "webp", // webp, jpeg, png
    resize = "cover", // cover, contain, fill
  } = options;

  // If no transformations specified, return original
  if (!width && !height) return originalUrl;

  try {
    const url = new URL(originalUrl);
    const params = new URLSearchParams();

    if (width) params.set("width", width.toString());
    if (height) params.set("height", height.toString());
    if (quality) params.set("quality", quality.toString());
    if (format) params.set("format", format);
    if (resize) params.set("resize", resize);

    // Add transform parameters to the URL
    const transformParams = params.toString();
    if (transformParams) {
      url.search = url.search
        ? `${url.search}&${transformParams}`
        : `?${transformParams}`;
    }

    return url.toString();
  } catch (error) {
    console.warn("[ImageOptimizer] Failed to create transformed URL:", error);
    return originalUrl;
  }
}

/**
 * Common transformation presets for different use cases
 */
export const SUPABASE_IMAGE_PRESETS = {
  THUMBNAIL: {
    width: 200,
    height: 200,
    quality: 85,
    format: "webp",
    resize: "cover",
  },
  GALLERY: {
    width: 800,
    height: 600,
    quality: 80,
    format: "webp",
    resize: "contain",
  },
  PREVIEW: {
    width: 400,
    height: 300,
    quality: 85,
    format: "webp",
    resize: "cover",
  },
  FULL: {
    width: 1200,
    height: 900,
    quality: 75,
    format: "webp",
    resize: "contain",
  },
};

/**
 * Helper function to get optimized image URL for specific use cases
 * @param {string} originalUrl - Original Supabase image URL
 * @param {string} preset - Preset name from SUPABASE_IMAGE_PRESETS
 * @returns {string} Optimized URL
 */
export function getOptimizedSupabaseUrl(originalUrl, preset = "PREVIEW") {
  const presetConfig = SUPABASE_IMAGE_PRESETS[preset];
  if (!presetConfig) {
    console.warn(`[ImageOptimizer] Unknown preset: ${preset}`);
    return originalUrl;
  }

  return createTransformedSupabaseUrl(originalUrl, presetConfig);
}
