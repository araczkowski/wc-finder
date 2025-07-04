import { NextResponse } from "next/server";
import { getServerSession } from "next-auth/next";
import { authOptions } from "../../auth/[...nextauth]/route";
import { createClient } from "@supabase/supabase-js";

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !supabaseServiceKey) {
  console.error("Missing Supabase environment variables");
}

const supabase = createClient(supabaseUrl, supabaseServiceKey, {
  auth: {
    autoRefreshToken: false,
    persistSession: false,
  },
});

// GET /api/wc-ratings/[id] - Get a specific rating
export async function GET(request, { params }) {
  try {
    const session = await getServerSession(authOptions);
    if (!session?.user?.id) {
      return NextResponse.json(
        { error: "Authentication required" },
        { status: 401 },
      );
    }

    const ratingId = params.id;

    const { data: rating, error } = await supabase
      .from("wc_rating")
      .select(
        `
        id,
        wc_id,
        rating,
        comment,
        created_at,
        updated_at,
        user_id,
        auth.users!wc_rating_user_id_fkey(email)
      `,
      )
      .eq("id", ratingId)
      .single();

    if (error || !rating) {
      return NextResponse.json({ error: "Rating not found" }, { status: 404 });
    }

    return NextResponse.json({ rating });
  } catch (error) {
    console.error("GET /api/wc-ratings/[id] error:", error);
    return NextResponse.json(
      { error: "Internal server error" },
      { status: 500 },
    );
  }
}

// PUT /api/wc-ratings/[id] - Update a specific rating
export async function PUT(request, { params }) {
  try {
    const session = await getServerSession(authOptions);
    if (!session?.user?.id) {
      return NextResponse.json(
        { error: "Authentication required" },
        { status: 401 },
      );
    }

    const ratingId = params.id;
    const body = await request.json();
    const { rating, comment } = body;

    // Validate rating range
    if (rating && (rating < 1 || rating > 5 || !Number.isInteger(rating))) {
      return NextResponse.json(
        { error: "Rating must be an integer between 1 and 5" },
        { status: 400 },
      );
    }

    // Check if rating exists and belongs to the user
    const { data: existingRating } = await supabase
      .from("wc_rating")
      .select("user_id")
      .eq("id", ratingId)
      .single();

    if (!existingRating) {
      return NextResponse.json({ error: "Rating not found" }, { status: 404 });
    }

    if (existingRating.user_id !== session.user.id) {
      return NextResponse.json(
        { error: "You can only update your own ratings" },
        { status: 403 },
      );
    }

    // Update the rating
    const updateData = {
      updated_at: new Date().toISOString(),
    };

    if (rating !== undefined) updateData.rating = rating;
    if (comment !== undefined) updateData.comment = comment || null;

    const { data, error } = await supabase
      .from("wc_rating")
      .update(updateData)
      .eq("id", ratingId)
      .select()
      .single();

    if (error) {
      console.error("Error updating rating:", error);
      return NextResponse.json(
        { error: "Failed to update rating" },
        { status: 500 },
      );
    }

    return NextResponse.json({
      data,
      message: "Rating updated successfully",
    });
  } catch (error) {
    console.error("PUT /api/wc-ratings/[id] error:", error);
    return NextResponse.json(
      { error: "Internal server error" },
      { status: 500 },
    );
  }
}

// DELETE /api/wc-ratings/[id] - Delete a specific rating
export async function DELETE(request, { params }) {
  try {
    const session = await getServerSession(authOptions);
    if (!session?.user?.id) {
      return NextResponse.json(
        { error: "Authentication required" },
        { status: 401 },
      );
    }

    const ratingId = params.id;

    // Check if rating exists and belongs to the user
    const { data: existingRating } = await supabase
      .from("wc_rating")
      .select("user_id")
      .eq("id", ratingId)
      .single();

    if (!existingRating) {
      return NextResponse.json({ error: "Rating not found" }, { status: 404 });
    }

    if (existingRating.user_id !== session.user.id) {
      return NextResponse.json(
        { error: "You can only delete your own ratings" },
        { status: 403 },
      );
    }

    // Delete the rating
    const { error } = await supabase
      .from("wc_rating")
      .delete()
      .eq("id", ratingId);

    if (error) {
      console.error("Error deleting rating:", error);
      return NextResponse.json(
        { error: "Failed to delete rating" },
        { status: 500 },
      );
    }

    return NextResponse.json({
      message: "Rating deleted successfully",
    });
  } catch (error) {
    console.error("DELETE /api/wc-ratings/[id] error:", error);
    return NextResponse.json(
      { error: "Internal server error" },
      { status: 500 },
    );
  }
}
