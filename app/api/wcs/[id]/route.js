import { NextResponse } from "next/server";
import { getServerSession } from "next-auth/next";
import { authOptions } from "../../auth/[...nextauth]/route"; // Adjust path if your authOptions are elsewhere
import { createClient } from "@supabase/supabase-js";

const BUCKET_NAME = "wc-images"; // Define your bucket name centrally

// Helper function to parse FormData
async function parseFormData(request) {
  const formData = await request.formData();
  const jsonDataString = formData.get("jsonData");
  if (!jsonDataString || typeof jsonDataString !== "string") {
    throw new Error("Missing or invalid jsonData in FormData");
  }
  let jsonData;
  try {
    jsonData = JSON.parse(jsonDataString);
  } catch (e) {
    throw new Error("Invalid JSON format in jsonData");
  }
  const imageFile = formData.get("imageFile"); // This will be a File object or null
  return { jsonData, imageFile };
}

// Helper function to sanitize filename for Supabase storage
const sanitizeFilename = (filename) => {
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

// Helper function to extract storage path from public URL
const getPathFromSupabaseUrl = (url) => {
  if (!url || typeof url !== "string") return null;
  try {
    const urlObject = new URL(url);
    // Example: https://<project_ref>.supabase.co/storage/v1/object/public/<bucket_name>/<path_to_file>
    const pathSegment = `/storage/v1/object/public/${BUCKET_NAME}/`;
    const pathStartIndex = urlObject.pathname.indexOf(pathSegment);

    if (pathStartIndex === -1) {
      console.warn(
        "getPathFromSupabaseUrl: Could not find standard Supabase public URL path segment:",
        url,
      );
      const parts = urlObject.pathname.split(`/${BUCKET_NAME}/`);
      return parts.length > 1 ? decodeURIComponent(parts[1]) : null;
    }
    return decodeURIComponent(
      urlObject.pathname.substring(pathStartIndex + pathSegment.length),
    );
  } catch (e) {
    console.error("getPathFromSupabaseUrl: Error parsing URL:", e, "URL:", url);
    return null;
  }
};

export async function PUT(request, { params }) {
  const wcId = params?.id;
  if (!wcId) {
    return NextResponse.json(
      { message: "WC ID is required in the URL path." },
      { status: 400 },
    );
  }

  const session = await getServerSession(authOptions);
  if (!session || !session.user || !session.user.id) {
    return NextResponse.json(
      { message: "Unauthorized: You must be logged in to update a WC." },
      { status: 401 },
    );
  }
  const userId = session.user.id;
  const isAdmin = session.user.email === "admin@sviete.pl";

  const supabaseUrl = process.env.SUPABASE_URL;
  const supabaseServiceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

  if (!supabaseUrl || !supabaseServiceRoleKey) {
    console.error(
      "API WCS PUT: Supabase URL or Service Role Key is not defined.",
    );
    return NextResponse.json(
      { message: "Server configuration error." },
      { status: 500 },
    );
  }
  const supabase = createClient(supabaseUrl, supabaseServiceRoleKey);

  try {
    const { jsonData, imageFile } = await parseFormData(request);
    // jsonData contains: { name, location, rating, current_image_url_on_client, remove_image }
    // current_image_url_on_client is what the client thought was the current URL before edits,
    // useful for client-side previews, but for deletion, we should use the DB's current URL.

    // --- Authorization & Fetch Current State: Get existing WC from DB ---
    const { data: existingWc, error: fetchError } = await supabase
      .from("wcs")
      .select("user_id, image_url, name, location, address, rating, place_type") // Select all fields needed for update
      .eq("id", wcId)
      .single();

    if (fetchError) {
      console.error(
        "API WCS PUT: Error fetching WC for ownership/update:",
        fetchError,
      );
      console.error("API WCS PUT: WC ID:", wcId);
      console.error("API WCS PUT: Supabase error code:", fetchError.code);
      console.error("API WCS PUT: Supabase error message:", fetchError.message);
      console.error("API WCS PUT: Supabase error details:", fetchError.details);
      return NextResponse.json(
        {
          message: "WC not found or error fetching existing data.",
          error: fetchError.message,
          code: fetchError.code,
        },
        { status: fetchError.code === "PGRST116" ? 404 : 500 },
      );
    }
    if (!existingWc) {
      return NextResponse.json({ message: "WC not found." }, { status: 404 });
    }
    // Check authorization: owner or admin can edit
    if (existingWc.user_id !== userId && !isAdmin) {
      return NextResponse.json(
        { message: "Forbidden: You are not authorized to edit this WC." },
        { status: 403 },
      );
    }
    // --- End Authorization ---

    let finalImageUrl = existingWc.image_url; // Initialize with image URL from DB

    // 1. Handle new image file upload
    if (imageFile) {
      const sanitizedFileName = sanitizeFilename(imageFile.name);
      const newFilePath = `${userId}/${Date.now()}_${sanitizedFileName}`; // Unique path with sanitized filename
      const { data: uploadData, error: uploadError } = await supabase.storage
        .from(BUCKET_NAME)
        .upload(newFilePath, imageFile, { upsert: false });

      if (uploadError) {
        console.error(
          "API WCS PUT: Supabase Storage upload error:",
          uploadError,
        );
        throw new Error(`Failed to upload new image: ${uploadError.message}`);
      }

      const { data: publicUrlData } = supabase.storage
        .from(BUCKET_NAME)
        .getPublicUrl(uploadData.path);

      if (!publicUrlData || !publicUrlData.publicUrl) {
        throw new Error("Failed to get public URL for new image after upload.");
      }
      finalImageUrl = publicUrlData.publicUrl;

      // If a new image was uploaded AND an old one existed in DB, delete the old one from storage
      if (existingWc.image_url) {
        const oldPath = getPathFromSupabaseUrl(existingWc.image_url);
        if (oldPath && oldPath !== newFilePath) {
          // Check if path is valid and different
          console.log("API WCS PUT: Deleting old image from storage:", oldPath);
          const { error: deleteOldError } = await supabase.storage
            .from(BUCKET_NAME)
            .remove([oldPath]);
          if (deleteOldError) {
            console.warn(
              "API WCS PUT: Failed to delete old image from storage, but proceeding with update:",
              deleteOldError.message,
            );
          }
        }
      }
    }
    // 2. Handle explicit image removal (if no new file was uploaded but user wants to remove)
    else if (jsonData.remove_image && existingWc.image_url) {
      const oldPath = getPathFromSupabaseUrl(existingWc.image_url);
      if (oldPath) {
        console.log(
          "API WCS PUT: Explicitly removing image from storage:",
          oldPath,
        );
        const { error: deleteError } = await supabase.storage
          .from(BUCKET_NAME)
          .remove([oldPath]);
        if (deleteError) {
          console.warn(
            "API WCS PUT: Failed to delete image marked for removal from storage:",
            deleteError.message,
          );
          // Depending on requirements, you might want to throw an error here or just log
        }
      }
      finalImageUrl = null; // Set image_url to null in DB
    }
    // If no new file uploaded AND not explicitly removing, finalImageUrl remains existingWc.image_url (no change to image)

    // Validate place_type if provided
    const validPlaceTypes = [
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

    if (jsonData.place_type && !validPlaceTypes.includes(jsonData.place_type)) {
      return NextResponse.json(
        { message: "Invalid place type provided." },
        { status: 400 },
      );
    }

    // --- Prepare data for DB update ---
    let wcDataToUpdate = {
      name: jsonData.name ? jsonData.name.trim() : existingWc.name,
      address:
        jsonData.address !== undefined
          ? jsonData.address
            ? jsonData.address.trim()
            : null
          : existingWc.address || null,
      rating:
        jsonData.rating !== undefined && jsonData.rating !== null
          ? parseInt(jsonData.rating, 10)
          : null,
      place_type: jsonData.place_type || existingWc.place_type || "toilet",
      image_url: finalImageUrl,
      updated_at: new Date().toISOString(), // Always update the timestamp
    };

    // Handle PostGIS location update separately
    let needsLocationUpdate = false;
    let locationLat = null;
    let locationLng = null;

    if (jsonData.location !== undefined) {
      console.log(
        "API WCS PUT: Processing location:",
        jsonData.location,
        "Type:",
        typeof jsonData.location,
      );
      if (jsonData.location && typeof jsonData.location === "string") {
        const trimmedLocation = jsonData.location.trim();
        console.log("API WCS PUT: Trimmed location:", trimmedLocation);
        const coords = trimmedLocation.split(",");
        console.log(
          "API WCS PUT: Split coords:",
          coords,
          "Length:",
          coords.length,
        );
        if (coords.length === 2) {
          const lat = parseFloat(coords[0].trim());
          const lng = parseFloat(coords[1].trim());
          console.log(
            "API WCS PUT: Parsed lat:",
            lat,
            "lng:",
            lng,
            "lat isNaN:",
            isNaN(lat),
            "lng isNaN:",
            isNaN(lng),
          );
          if (!isNaN(lat) && !isNaN(lng)) {
            needsLocationUpdate = true;
            locationLat = lat;
            locationLng = lng;
            console.log(
              "API WCS PUT: Will update location with lat:",
              locationLat,
              "lng:",
              locationLng,
            );
          } else {
            console.error(
              "API WCS PUT: Invalid coordinates - lat or lng is NaN",
            );
          }
        } else {
          console.error(
            "API WCS PUT: Invalid coordinates format - expected 2 parts, got:",
            coords.length,
          );
        }
      } else if (jsonData.location === null || jsonData.location === "") {
        console.log("API WCS PUT: Setting location to null");
        // Set location to null
        wcDataToUpdate.location = null;
      }
    }

    console.log("API WCS PUT: Update data:", wcDataToUpdate);
    console.log("API WCS PUT: Existing WC data:", existingWc);

    // Basic validation for updated values
    if (
      wcDataToUpdate.rating !== null &&
      (wcDataToUpdate.rating < 1 || wcDataToUpdate.rating > 10)
    ) {
      return NextResponse.json(
        { message: "Rating must be between 1 and 10, or null." },
        { status: 400 },
      );
    }
    if (!wcDataToUpdate.name) {
      return NextResponse.json(
        { message: "Name cannot be empty." },
        { status: 400 },
      );
    }

    // --- Update database record ---
    let updatedDbWc, updateDbError;

    if (needsLocationUpdate) {
      console.log(
        "API WCS PUT: Using WKT POINT format for location:",
        `${locationLat},${locationLng}`,
      );

      // Use WKT POINT format that PostGIS understands
      const wktPoint = `POINT(${locationLng} ${locationLat})`;
      console.log("API WCS PUT: WKT Point:", wktPoint);

      // Update with PostGIS WKT format
      wcDataToUpdate.location = wktPoint;
    }

    // Single update operation
    const { data, error } = await supabase
      .from("wcs")
      .update(wcDataToUpdate)
      .eq("id", wcId)
      .select()
      .single();
    updatedDbWc = data;
    updateDbError = error;

    if (updateDbError) {
      console.error("API WCS PUT: Supabase DB update error:", updateDbError);
      console.error("API WCS PUT: Error details:", {
        message: updateDbError.message,
        details: updateDbError.details,
        hint: updateDbError.hint,
        code: updateDbError.code,
      });
      throw new Error(`Database update failed: ${updateDbError.message}`);
    }

    return NextResponse.json(updatedDbWc, { status: 200 });
  } catch (err) {
    console.error("API WCS PUT: Error in PUT handler:", err);
    return NextResponse.json(
      { message: err.message || "An unexpected server error occurred." },
      { status: 500 },
    );
  }
}

export async function DELETE(request, { params }) {
  const wcId = params?.id;
  if (!wcId) {
    return NextResponse.json(
      { message: "WC ID is required." },
      { status: 400 },
    );
  }

  const session = await getServerSession(authOptions);
  if (!session || !session.user || !session.user.id) {
    return NextResponse.json({ message: "Unauthorized." }, { status: 401 });
  }
  const userId = session.user.id;
  const isAdmin = session.user.email === "admin@sviete.pl";

  const supabaseUrl = process.env.SUPABASE_URL;
  const supabaseServiceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

  if (!supabaseUrl || !supabaseServiceRoleKey) {
    console.error(
      "API WCS DELETE: Supabase URL or Service Role Key is not defined.",
    );
    return NextResponse.json(
      { message: "Server configuration error." },
      { status: 500 },
    );
  }
  const supabase = createClient(supabaseUrl, supabaseServiceRoleKey);

  try {
    // Fetch WC to verify ownership and get image_url for deletion from storage
    const { data: wcToDelete, error: fetchError } = await supabase
      .from("wcs")
      .select("user_id, image_url")
      .eq("id", wcId)
      .single();

    if (fetchError) {
      console.error(
        "API WCS DELETE: Error fetching WC for deletion:",
        fetchError,
      );
      return NextResponse.json(
        { message: "WC not found or error fetching." },
        { status: fetchError.code === "PGRST116" ? 404 : 500 },
      );
    }
    if (!wcToDelete) {
      return NextResponse.json({ message: "WC not found." }, { status: 404 });
    }

    // Check authorization: owner or admin can delete
    if (wcToDelete.user_id !== userId && !isAdmin) {
      return NextResponse.json(
        { message: "Forbidden: You are not authorized to delete this WC." },
        { status: 403 },
      );
    }

    // Get all related photos to delete from storage
    const { data: photosToDelete, error: photosError } = await supabase
      .from("wc_photos")
      .select("photo")
      .eq("wc_id", wcId);

    if (photosError) {
      console.warn(
        "API WCS DELETE: Error fetching photos for deletion:",
        photosError,
      );
    }

    // Delete main WC image from storage if exists
    const imagesToDelete = [];
    if (wcToDelete.image_url) {
      const imagePath = getPathFromSupabaseUrl(wcToDelete.image_url);
      if (imagePath) {
        imagesToDelete.push(imagePath);
      }
    }

    // Add all photo URLs to deletion list
    if (photosToDelete && photosToDelete.length > 0) {
      photosToDelete.forEach((photo) => {
        const photoPath = getPathFromSupabaseUrl(photo.photo);
        if (photoPath) {
          imagesToDelete.push(photoPath);
        }
      });
    }

    // Delete all images from storage
    if (imagesToDelete.length > 0) {
      console.log(
        "API WCS DELETE: Deleting images from storage:",
        imagesToDelete,
      );
      const { error: storageDeleteError } = await supabase.storage
        .from(BUCKET_NAME)
        .remove(imagesToDelete);
      if (storageDeleteError) {
        console.warn(
          "API WCS DELETE: Failed to delete some images from storage, but proceeding with DB record deletion:",
          storageDeleteError.message,
        );
      }
    }

    // Delete WC from database (CASCADE will automatically delete related records)
    const { error: dbDeleteError } = await supabase
      .from("wcs")
      .delete()
      .eq("id", wcId);

    if (dbDeleteError) {
      console.error("API WCS DELETE: Supabase DB delete error:", dbDeleteError);
      throw new Error(`Database deletion failed: ${dbDeleteError.message}`);
    }

    return NextResponse.json(
      { message: "WC and all related data deleted successfully." },
      { status: 200 },
    );
  } catch (err) {
    console.error("API WCS DELETE: Unexpected error during WC deletion:", err);
    return NextResponse.json(
      { message: err.message || "An unexpected server error occurred." },
      { status: 500 },
    );
  }
}
