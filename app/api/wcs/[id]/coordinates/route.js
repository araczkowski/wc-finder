import { NextResponse } from "next/server";
import { getServerSession } from "next-auth/next";
import { authOptions } from "../../../auth/[...nextauth]/route";
import { createClient } from "@supabase/supabase-js";

export async function GET(request, { params }) {
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
      { message: "Unauthorized: You must be logged in to access coordinates." },
      { status: 401 },
    );
  }

  const supabaseUrl = process.env.SUPABASE_URL;
  const supabaseServiceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

  if (!supabaseUrl || !supabaseServiceRoleKey) {
    console.error(
      "API WCS Coordinates GET: Supabase URL or Service Role Key is not defined.",
    );
    return NextResponse.json(
      { message: "Server configuration error." },
      { status: 500 },
    );
  }

  const supabase = createClient(supabaseUrl, supabaseServiceRoleKey);

  try {
    // Use PostGIS function to extract coordinates
    const { data, error } = await supabase.rpc("get_wc_coordinates", {
      p_wc_id: wcId,
    });

    if (error) {
      console.error(
        "API WCS Coordinates GET: Error getting coordinates:",
        error,
      );
      return NextResponse.json(
        { message: "Failed to get coordinates.", error: error.message },
        { status: 500 },
      );
    }

    if (!data || data.length === 0) {
      return NextResponse.json(
        { message: "No coordinates found for this WC." },
        { status: 404 },
      );
    }

    const coordinates = data[0];
    return NextResponse.json(
      {
        latitude: coordinates.latitude,
        longitude: coordinates.longitude,
      },
      { status: 200 },
    );
  } catch (err) {
    console.error(
      "API WCS Coordinates GET: Unexpected error getting coordinates:",
      err,
    );
    return NextResponse.json(
      { message: err.message || "An unexpected server error occurred." },
      { status: 500 },
    );
  }
}
