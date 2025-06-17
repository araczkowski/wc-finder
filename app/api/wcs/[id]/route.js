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
      .select("user_id, image_url") // Select current image_url for deletion logic
      .eq("id", wcId)
      .single();

    if (fetchError) {
      console.error(
        "API WCS PUT: Error fetching WC for ownership/update:",
        fetchError,
      );
      return NextResponse.json(
        { message: "WC not found or error fetching existing data." },
        { status: fetchError.code === "PGRST116" ? 404 : 500 },
      );
    }
    if (!existingWc) {
      return NextResponse.json({ message: "WC not found." }, { status: 404 });
    }
    if (existingWc.user_id !== userId) {
      return NextResponse.json(
        { message: "Forbidden: You are not authorized to edit this WC." },
        { status: 403 },
      );
    }
    // --- End Authorization ---

    let finalImageUrl = existingWc.image_url; // Initialize with image URL from DB

    // 1. Handle new image file upload
    if (imageFile) {
      const newFilePath = `${userId}/${Date.now()}_${imageFile.name}`; // Unique path
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

    // --- Prepare data for DB update ---
    const wcDataToUpdate = {
      name: jsonData.name ? jsonData.name.trim() : existingWc.name,
      location:
        jsonData.location !== undefined
          ? jsonData.location
            ? jsonData.location.trim()
            : null
          : existingWc.location,
      rating:
        jsonData.rating !== undefined && jsonData.rating !== null
          ? parseInt(jsonData.rating, 10)
          : null,
      image_url: finalImageUrl,
      updated_at: new Date().toISOString(), // Always update the timestamp
    };

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
    const { data: updatedDbWc, error: updateDbError } = await supabase
      .from("wcs")
      .update(wcDataToUpdate)
      .eq("id", wcId)
      .select()
      .single();

    if (updateDbError) {
      console.error("API WCS PUT: Supabase DB update error:", updateDbError);
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
    if (wcToDelete.user_id !== userId) {
      return NextResponse.json(
        { message: "Forbidden: You are not authorized to delete this WC." },
        { status: 403 },
      );
    }

    // If image exists, delete from Supabase Storage
    if (wcToDelete.image_url) {
      const imagePath = getPathFromSupabaseUrl(wcToDelete.image_url);
      if (imagePath) {
        console.log("API WCS DELETE: Deleting image from storage:", imagePath);
        const { error: storageDeleteError } = await supabase.storage
          .from(BUCKET_NAME)
          .remove([imagePath]);
        if (storageDeleteError) {
          // Log error but proceed with DB deletion, as DB integrity is more critical.
          console.warn(
            "API WCS DELETE: Failed to delete image from storage, but proceeding with DB record deletion:",
            storageDeleteError.message,
          );
        }
      }
    }

    // Delete from database
    const { error: dbDeleteError } = await supabase
      .from("wcs")
      .delete()
      .eq("id", wcId);

    if (dbDeleteError) {
      console.error("API WCS DELETE: Supabase DB delete error:", dbDeleteError);
      throw new Error(`Database deletion failed: ${dbDeleteError.message}`);
    }

    return NextResponse.json(
      { message: "WC deleted successfully." },
      { status: 200 },
    ); // Or 204 No Content
  } catch (err) {
    console.error("API WCS DELETE: Unexpected error during WC deletion:", err);
    return NextResponse.json(
      { message: err.message || "An unexpected server error occurred." },
      { status: 500 },
    );
  }
}
