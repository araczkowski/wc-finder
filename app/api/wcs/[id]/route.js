import { NextResponse } from "next/server";
import { getServerSession } from "next-auth/next";
import { authOptions } from "../../auth/[...nextauth]/route"; // Corrected path to authOptions
import { createClient } from "@supabase/supabase-js";

export async function PUT(request, { params }) {
  const wcId = params?.id;
  if (!wcId) {
    return NextResponse.json(
      { message: "WC ID is missing from URL." },
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

  let reqBody;
  try {
    reqBody = await request.json();
  } catch (error) {
    console.error("API_WCS_PUT: Error parsing JSON body:", error);
    return NextResponse.json(
      { message: "Invalid JSON body." },
      { status: 400 },
    );
  }

  const { name, location, image_url, rating } = reqBody;

  // Basic validation for updated fields
  if (name !== undefined && (typeof name !== "string" || name.trim() === "")) {
    return NextResponse.json(
      { message: "Name must be a non-empty string if provided." },
      { status: 400 },
    );
  }
  if (
    location !== undefined &&
    location !== null &&
    typeof location !== "string"
  ) {
    return NextResponse.json(
      { message: "Location must be a string or null." },
      { status: 400 },
    );
  }
  if (
    image_url !== undefined &&
    image_url !== null &&
    typeof image_url !== "string"
  ) {
    return NextResponse.json(
      { message: "Image URL must be a string or null." },
      { status: 400 },
    );
  }
  if (image_url && typeof image_url === "string" && image_url.trim() !== "") {
    try {
      new URL(image_url);
    } catch (_) {
      return NextResponse.json(
        { message: "Image URL must be a valid URL if provided." },
        { status: 400 },
      );
    }
  }
  if (rating !== undefined && rating !== null) {
    const numericRating = Number(rating);
    if (
      isNaN(numericRating) ||
      numericRating < 1 ||
      numericRating > 10 ||
      !Number.isInteger(numericRating)
    ) {
      return NextResponse.json(
        { message: "Rating must be an integer between 1 and 10, or null." },
        { status: 400 },
      );
    }
  }

  const supabaseUrl = process.env.SUPABASE_URL;
  const supabaseServiceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

  if (!supabaseUrl || !supabaseServiceRoleKey) {
    console.error(
      "API_WCS_PUT: Supabase URL or Service Role Key is not defined in environment variables.",
    );
    return NextResponse.json(
      { message: "Server configuration error. Please try again later." },
      { status: 500 },
    );
  }

  const supabase = createClient(supabaseUrl, supabaseServiceRoleKey, {
    // It's good practice to specify auth schema for admin clients,
    // though service_role key bypasses RLS anyway.
    auth: { schema: "auth" },
  });

  try {
    // First, verify ownership by fetching the existing WC
    const { data: existingWc, error: fetchError } = await supabase
      .from("wcs")
      .select("user_id")
      .eq("id", wcId)
      .single();

    if (fetchError) {
      if (fetchError.code === "PGRST116") {
        // "JWSError JWSInvalidSignature" or other auth issues if using anon key by mistake
        return NextResponse.json({ message: "WC not found." }, { status: 404 });
      }
      console.error(
        "API_WCS_PUT: Supabase fetch error for ownership check:",
        JSON.stringify(fetchError, null, 2),
      );
      return NextResponse.json(
        { message: `Error fetching WC: ${fetchError.message}` },
        { status: 500 },
      );
    }

    if (!existingWc) {
      return NextResponse.json({ message: "WC not found." }, { status: 404 });
    }

    if (existingWc.user_id !== userId) {
      return NextResponse.json(
        { message: "Forbidden: You do not own this WC." },
        { status: 403 },
      );
    }

    // If ownership is verified, proceed with the update
    const wcDataToUpdate = {};
    if (name !== undefined) wcDataToUpdate.name = name.trim();
    if (location !== undefined)
      wcDataToUpdate.location = location ? location.trim() : null;
    if (image_url !== undefined)
      wcDataToUpdate.image_url = image_url ? image_url.trim() : null;
    if (rating !== undefined)
      wcDataToUpdate.rating = rating ? parseInt(rating, 10) : null;

    // Only update if there are fields to update
    if (Object.keys(wcDataToUpdate).length === 0) {
      return NextResponse.json(
        { message: "No fields provided for update." },
        { status: 400 },
      );
    }

    // Always set updated_at, either manually or rely on DB trigger
    wcDataToUpdate.updated_at = new Date().toISOString();

    const { data: updatedData, error: updateError } = await supabase
      .from("wcs")
      .update(wcDataToUpdate)
      .eq("id", wcId)
      .select()
      .single();

    if (updateError) {
      console.error(
        "API_WCS_PUT: Supabase update error:",
        JSON.stringify(updateError, null, 2),
      );
      if (updateError.code === "23514") {
        // check_violation
        return NextResponse.json(
          {
            message: `Failed to update WC: Invalid data. ${updateError.message}`,
          },
          { status: 400 },
        );
      }
      return NextResponse.json(
        { message: `Failed to update WC: ${updateError.message}` },
        { status: 500 },
      );
    }

    if (!updatedData) {
      console.error(
        "API_WCS_PUT: Supabase update succeeded but returned no data.",
      );
      return NextResponse.json(
        { message: "Failed to update WC: No data returned after update." },
        { status: 500 },
      );
    }

    console.log("API_WCS_PUT: WC updated successfully:", updatedData);
    return NextResponse.json(updatedData, { status: 200 });
  } catch (err) {
    console.error("API_WCS_PUT: Unexpected error during WC update:", err);
    return NextResponse.json(
      { message: "An unexpected server error occurred." },
      { status: 500 },
    );
  }
}

export async function DELETE(request, { params }) {
  const wcId = params?.id;
  if (!wcId) {
    return NextResponse.json(
      { message: "WC ID is missing from URL." },
      { status: 400 },
    );
  }

  const session = await getServerSession(authOptions);
  if (!session || !session.user || !session.user.id) {
    return NextResponse.json(
      { message: "Unauthorized: You must be logged in to delete a WC." },
      { status: 401 },
    );
  }
  const userId = session.user.id;

  const supabaseUrl = process.env.SUPABASE_URL;
  const supabaseServiceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

  if (!supabaseUrl || !supabaseServiceRoleKey) {
    console.error(
      "API_WCS_DELETE: Supabase URL or Service Role Key is not defined.",
    );
    return NextResponse.json(
      { message: "Server configuration error." },
      { status: 500 },
    );
  }

  const supabase = createClient(supabaseUrl, supabaseServiceRoleKey);

  try {
    // Verify ownership before deleting
    const { data: existingWc, error: fetchError } = await supabase
      .from("wcs")
      .select("user_id")
      .eq("id", wcId)
      .single();

    if (fetchError) {
      if (fetchError.code === "PGRST116") {
        return NextResponse.json({ message: "WC not found." }, { status: 404 });
      }
      console.error(
        "API_WCS_DELETE: Supabase fetch error for ownership check:",
        JSON.stringify(fetchError, null, 2),
      );
      return NextResponse.json(
        { message: `Error fetching WC: ${fetchError.message}` },
        { status: 500 },
      );
    }

    if (!existingWc) {
      return NextResponse.json({ message: "WC not found." }, { status: 404 });
    }

    if (existingWc.user_id !== userId) {
      return NextResponse.json(
        { message: "Forbidden: You do not own this WC." },
        { status: 403 },
      );
    }

    // Proceed with deletion
    const { error: deleteError } = await supabase
      .from("wcs")
      .delete()
      .eq("id", wcId);

    if (deleteError) {
      console.error(
        "API_WCS_DELETE: Supabase delete error:",
        JSON.stringify(deleteError, null, 2),
      );
      return NextResponse.json(
        { message: `Failed to delete WC: ${deleteError.message}` },
        { status: 500 },
      );
    }

    console.log("API_WCS_DELETE: WC deleted successfully, ID:", wcId);
    return NextResponse.json(
      { message: "WC deleted successfully." },
      { status: 200 },
    ); // Or 204 No Content
  } catch (err) {
    console.error("API_WCS_DELETE: Unexpected error during WC deletion:", err);
    return NextResponse.json(
      { message: "An unexpected server error occurred." },
      { status: 500 },
    );
  }
}
