import { NextResponse } from "next/server";
import { getServerSession } from "next-auth/next";
import { authOptions } from "../auth/[...nextauth]/route"; // Ensure this path is correct
import { createClient } from "@supabase/supabase-js";

export async function POST(request) {
  const session = await getServerSession(authOptions);

  if (!session || !session.user || !session.user.id) {
    return NextResponse.json(
      { message: "Unauthorized: You must be logged in to add a WC." },
      { status: 401 },
    );
  }

  const userLoginId = session.user.id; // This is the user's UUID

  let reqBody;
  try {
    reqBody = await request.json();
  } catch (error) {
    console.error("API WCS POST: Error parsing JSON body:", error);
    return NextResponse.json(
      { message: "Invalid JSON body." },
      { status: 400 },
    );
  }

  const { name, location, address, image_url, rating } = reqBody;

  // Validate required fields
  if (!name || typeof name !== "string" || name.trim() === "") {
    return NextResponse.json(
      { message: "Name is required and must be a non-empty string." },
      { status: 400 },
    );
  }

  // Validate optional fields
  if (
    location !== undefined &&
    location !== null &&
    typeof location !== "string"
  ) {
    return NextResponse.json(
      { message: "Location must be a string if provided, or null." },
      { status: 400 },
    );
  }
  if (
    address !== undefined &&
    address !== null &&
    typeof address !== "string"
  ) {
    return NextResponse.json(
      { message: "Address must be a string if provided, or null." },
      { status: 400 },
    );
  }
  if (
    image_url !== undefined &&
    image_url !== null &&
    typeof image_url !== "string"
  ) {
    return NextResponse.json(
      { message: "Image URL must be a string if provided, or null." },
      { status: 400 },
    );
  }
  if (image_url && image_url.trim() !== "") {
    // Only validate if not empty
    try {
      new URL(image_url); // Basic URL validation
    } catch (_) {
      return NextResponse.json(
        { message: "Image URL must be a valid URL if provided." },
        { status: 400 },
      );
    }
  }

  if (rating !== null && rating !== undefined) {
    const numericRating = Number(rating);
    if (
      isNaN(numericRating) ||
      numericRating < 1 ||
      numericRating > 10 || // Consistent with 1-10 star UI
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
      "API WCS POST: Supabase URL or Service Role Key is not defined in .env.local. Ensure these are correctly set.",
    );
    return NextResponse.json(
      { message: "Server configuration error. Please try again later." },
      { status: 500 },
    );
  }

  const supabase = createClient(supabaseUrl, supabaseServiceRoleKey);

  const wcDataToInsert = {
    user_id: userLoginId, // userLoginId is session.user.id (UUID)
    created_by: session.user.email, // Store the user's email in created_by
    name: name.trim(),
    location: location && typeof location === "string" ? location.trim() : null,
    address: address && typeof address === "string" ? address.trim() : null,
    image_url:
      image_url && typeof image_url === "string" ? image_url.trim() : null,
    rating:
      rating !== null && rating !== undefined ? parseInt(rating, 10) : null,
    // 'created_at' and 'updated_at' are assumed to be handled by Supabase table defaults/triggers if set up
  };

  try {
    const { data: newWc, error: insertError } = await supabase
      .from("wcs")
      .insert(wcDataToInsert)
      .select() // Optionally return the inserted row
      .single(); // Expecting a single row to be inserted and returned

    if (insertError) {
      console.error(
        "API WCS POST: Supabase insert error:",
        JSON.stringify(insertError, null, 2),
      );
      // Provide more specific error messages based on Supabase error codes if needed
      if (insertError.code === "23514") {
        // Check constraint violation (e.g., rating out of range)
        return NextResponse.json(
          { message: `Failed to add WC: Invalid data. ${insertError.message}` },
          { status: 400 },
        );
      }
      // Handle other potential database constraint violations (e.g., '23505' for unique_violation, '23503' for foreign_key_violation)
      if (insertError.code && insertError.code.startsWith("23")) {
        return NextResponse.json(
          { message: `Database error: ${insertError.message}` },
          { status: 409 }, // 409 Conflict for DB constraint issues
        );
      }
      return NextResponse.json(
        { message: `Failed to add WC: ${insertError.message}` },
        { status: 500 },
      );
    }

    if (!newWc) {
      // This case should ideally not be hit if insertError is null and .single() is used.
      console.error(
        "API WCS POST: Supabase insert succeeded but returned no data.",
      );
      return NextResponse.json(
        {
          message: "Failed to add WC: No data returned after insert operation.",
        },
        { status: 500 },
      );
    }

    console.log("API WCS POST: WC created successfully:", newWc);
    return NextResponse.json(newWc, { status: 201 }); // 201 Created
  } catch (err) {
    console.error("API WCS POST: Unexpected error during WC creation:", err);
    return NextResponse.json(
      { message: "An unexpected server error occurred." },
      { status: 500 },
    );
  }
}
