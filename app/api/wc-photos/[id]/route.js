import { NextRequest, NextResponse } from "next/server";
import { getServerSession } from "next-auth/next";
import { authOptions } from "../../auth/[...nextauth]/route";
import { createClient } from "@supabase/supabase-js";

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !supabaseServiceKey) {
  console.error(
    "Missing Supabase environment variables for wc-photos/[id] API",
  );
}

const supabase = createClient(supabaseUrl, supabaseServiceKey);

// DELETE /api/wc-photos/[id] - Delete a specific photo (only by owner)
export async function DELETE(request, { params }) {
  try {
    const session = await getServerSession(authOptions);

    if (!session || !session.user?.id) {
      return NextResponse.json(
        { error: "Authentication required" },
        { status: 401 },
      );
    }

    const photoId = params?.id;

    if (!photoId) {
      return NextResponse.json(
        { error: "Photo ID is required" },
        { status: 400 },
      );
    }

    // First, get the photo record to verify ownership and get the file path
    const { data: photo, error: fetchError } = await supabase
      .from("wc_photos")
      .select("*")
      .eq("id", photoId)
      .single();

    if (fetchError || !photo) {
      return NextResponse.json({ error: "Photo not found" }, { status: 404 });
    }

    // Check if the current user is the owner of the photo or admin
    const isAdmin = session.user.email === "admin@sviete.pl";
    if (photo.user_id !== session.user.id && !isAdmin) {
      return NextResponse.json(
        { error: "You can only delete your own photos" },
        { status: 403 },
      );
    }

    // Extract the file path from the photo URL
    let filePath = null;
    try {
      const url = new URL(photo.photo);
      const pathParts = url.pathname.split("/");
      // Assuming URL structure: /storage/v1/object/public/wc-photos/filepath
      const bucketIndex = pathParts.indexOf("wc-photos");
      if (bucketIndex !== -1 && bucketIndex < pathParts.length - 1) {
        filePath = pathParts.slice(bucketIndex + 1).join("/");
      }
    } catch (urlError) {
      console.error("Error parsing photo URL:", urlError);
    }

    // Delete the photo record from database
    const { error: deleteError } = await supabase
      .from("wc_photos")
      .delete()
      .eq("id", photoId);

    if (deleteError) {
      console.error("Error deleting photo record:", deleteError);
      return NextResponse.json(
        { error: "Failed to delete photo record" },
        { status: 500 },
      );
    }

    // Delete the file from Supabase Storage if we have a valid file path
    if (filePath) {
      const { error: storageError } = await supabase.storage
        .from("wc-photos")
        .remove([filePath]);

      if (storageError) {
        console.error("Error deleting photo from storage:", storageError);
        // Note: We don't return an error here because the database record is already deleted
        // The orphaned file in storage is less critical than the database consistency
      }
    }

    return NextResponse.json({
      success: true,
      message: "Photo deleted successfully",
    });
  } catch (error) {
    console.error("Unexpected error in DELETE /api/wc-photos/[id]:", error);
    return NextResponse.json(
      { error: "Internal server error" },
      { status: 500 },
    );
  }
}

// GET /api/wc-photos/[id] - Get a specific photo by ID
export async function GET(request, { params }) {
  try {
    const photoId = params?.id;

    if (!photoId) {
      return NextResponse.json(
        { error: "Photo ID is required" },
        { status: 400 },
      );
    }

    // Fetch the photo (simplified query)
    const { data: photo, error } = await supabase
      .from("wc_photos")
      .select("id, wc_id, user_id, photo, created_at, updated_at")
      .eq("id", photoId)
      .single();

    if (error || !photo) {
      return NextResponse.json({ error: "Photo not found" }, { status: 404 });
    }

    return NextResponse.json({
      success: true,
      photo: photo,
    });
  } catch (error) {
    console.error("Unexpected error in GET /api/wc-photos/[id]:", error);
    return NextResponse.json(
      { error: "Internal server error" },
      { status: 500 },
    );
  }
}
