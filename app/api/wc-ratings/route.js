import { NextResponse } from "next/server";
import { getServerSession } from "next-auth/next";
import { authOptions } from "../auth/[...nextauth]/route";
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

// GET /api/wc-ratings - Get all ratings for a specific WC
export async function GET(request) {
  try {
    console.log("[wc-ratings GET] Starting ratings fetch");

    const { searchParams } = new URL(request.url);
    const wcId = searchParams.get("wc_id");

    console.log("[wc-ratings GET] WC ID:", wcId);

    if (!wcId) {
      console.log("[wc-ratings GET] Missing wc_id parameter");
      return NextResponse.json(
        { error: "wc_id parameter is required" },
        { status: 400 },
      );
    }

    console.log("[wc-ratings GET] Attempting to fetch ratings from database");

    // Get all ratings for the specified WC (simplified query without user info)
    const { data: ratings, error } = await supabase
      .from("wc_rating")
      .select("id, rating, comment, created_at, updated_at, user_id")
      .eq("wc_id", wcId)
      .order("created_at", { ascending: false });

    console.log("[wc-ratings GET] Database query result:", {
      ratings: ratings || [],
      error: error || null,
      ratingCount: ratings?.length || 0,
    });

    if (error) {
      console.error("Error fetching WC ratings:", error);
      return NextResponse.json(
        { error: "Failed to fetch ratings" },
        { status: 500 },
      );
    }

    // Add simple user email (will improve later)
    const ratingsWithEmails = (ratings || []).map((rating) => ({
      ...rating,
      user_email: `user-${rating.user_id.slice(0, 8)}`, // Show first 8 chars of user ID
    }));

    console.log("[API] Fetched ratings:", {
      wcId,
      ratingsCount: ratings?.length || 0,
      ratingsData: ratingsWithEmails,
    });

    // Calculate average rating
    const averageRating =
      ratings.length > 0
        ? ratings.reduce((sum, r) => sum + r.rating, 0) / ratings.length
        : 0;

    return NextResponse.json({
      ratings: ratingsWithEmails,
      averageRating: Math.round(averageRating * 10) / 10,
      totalRatings: ratings?.length || 0,
    });
  } catch (error) {
    console.error("GET /api/wc-ratings error:", error);
    return NextResponse.json(
      { error: "Internal server error" },
      { status: 500 },
    );
  }
}

// POST /api/wc-ratings - Create or update a rating
// POST /api/wc-ratings - Create a new rating for a WC
export async function POST(request) {
  try {
    console.log("[wc-ratings POST] Starting rating creation");

    const session = await getServerSession(authOptions);
    if (!session?.user?.id) {
      console.log("[wc-ratings POST] No session found");
      return NextResponse.json(
        { error: "Authentication required" },
        { status: 401 },
      );
    }

    const body = await request.json();
    const { wc_id, rating, comment } = body;

    // Validate required fields
    if (!wc_id || !rating) {
      return NextResponse.json(
        { error: "wc_id and rating are required" },
        { status: 400 },
      );
    }

    // Validate rating range
    if (rating < 1 || rating > 10 || !Number.isInteger(rating)) {
      return NextResponse.json(
        { error: "Rating must be an integer between 1 and 10" },
        { status: 400 },
      );
    }

    // Check if WC exists
    const { data: wcExists } = await supabase
      .from("wcs")
      .select("id")
      .eq("id", wc_id)
      .single();

    if (!wcExists) {
      return NextResponse.json({ error: "WC not found" }, { status: 404 });
    }

    // Check if user already has a rating for this WC
    const { data: existingRating } = await supabase
      .from("wc_rating")
      .select("id")
      .eq("wc_id", wc_id)
      .eq("user_id", session.user.id)
      .single();

    let result;

    if (existingRating) {
      // Update existing rating
      const { data, error } = await supabase
        .from("wc_rating")
        .update({
          rating,
          comment: comment || null,
          updated_at: new Date().toISOString(),
        })
        .eq("id", existingRating.id)
        .select()
        .single();

      if (error) {
        console.error("Error updating rating:", error);
        return NextResponse.json(
          { error: "Failed to update rating" },
          { status: 500 },
        );
      }

      result = { data, message: "Rating updated successfully" };
    } else {
      // Create new rating
      const { data, error } = await supabase
        .from("wc_rating")
        .insert({
          wc_id,
          user_id: session.user.id,
          rating,
          comment: comment || null,
        })
        .select()
        .single();

      if (error) {
        console.error("Error creating rating:", error);
        return NextResponse.json(
          { error: "Failed to create rating" },
          { status: 500 },
        );
      }

      result = { data, message: "Rating created successfully" };
    }

    return NextResponse.json(result, { status: existingRating ? 200 : 201 });
  } catch (error) {
    console.error("POST /api/wc-ratings error:", error);
    return NextResponse.json(
      { error: "Internal server error" },
      { status: 500 },
    );
  }
}

// DELETE /api/wc-ratings - Delete a rating
export async function DELETE(request) {
  try {
    const session = await getServerSession(authOptions);
    if (!session?.user?.id) {
      return NextResponse.json(
        { error: "Authentication required" },
        { status: 401 },
      );
    }

    const { searchParams } = new URL(request.url);
    const ratingId = searchParams.get("rating_id");
    const wcId = searchParams.get("wc_id");

    if (!ratingId && !wcId) {
      return NextResponse.json(
        { error: "Either rating_id or wc_id parameter is required" },
        { status: 400 },
      );
    }

    let deleteQuery = supabase
      .from("wc_rating")
      .delete()
      .eq("user_id", session.user.id);

    if (ratingId) {
      deleteQuery = deleteQuery.eq("id", ratingId);
    } else {
      deleteQuery = deleteQuery.eq("wc_id", wcId);
    }

    const { error } = await deleteQuery;

    if (error) {
      console.error("Error deleting rating:", error);
      return NextResponse.json(
        { error: "Failed to delete rating" },
        { status: 500 },
      );
    }

    return NextResponse.json(
      { message: "Rating deleted successfully" },
      { status: 200 },
    );
  } catch (error) {
    console.error("DELETE /api/wc-ratings error:", error);
    return NextResponse.json(
      { error: "Internal server error" },
      { status: 500 },
    );
  }
}
