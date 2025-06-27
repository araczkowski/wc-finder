import { NextResponse } from "next/server";
import { getServerSession } from "next-auth/next";
import { authOptions } from "../auth/[...nextauth]/route";
import { createClient } from "@supabase/supabase-js";

// Predefined available tags
const AVAILABLE_TAGS = [
  "płatna",
  "darmowa",
  "przewijak",
  "dostępnaDlaNiepełnosprawnych",
];

// GET - Fetch tags for a specific WC
export async function GET(request) {
  const { searchParams } = new URL(request.url);
  const wcId = searchParams.get("wc_id");

  if (!wcId) {
    return NextResponse.json(
      { message: "wc_id parameter is required" },
      { status: 400 },
    );
  }

  const supabaseUrl = process.env.SUPABASE_URL;
  const supabaseServiceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

  if (!supabaseUrl || !supabaseServiceRoleKey) {
    console.error("Supabase URL or Service Role Key is not defined");
    return NextResponse.json(
      { message: "Server configuration error" },
      { status: 500 },
    );
  }

  const supabase = createClient(supabaseUrl, supabaseServiceRoleKey);

  try {
    const { data, error } = await supabase
      .from("wc_tags")
      .select("id, tag, user_id, created_at")
      .eq("wc_id", wcId)
      .order("created_at", { ascending: true });

    if (error) {
      console.error("Error fetching WC tags:", error);
      return NextResponse.json(
        { message: "Error fetching tags" },
        { status: 500 },
      );
    }

    // Group tags by tag name and count occurrences
    const tagCounts = {};
    data.forEach((tagRecord) => {
      if (tagCounts[tagRecord.tag]) {
        tagCounts[tagRecord.tag].count += 1;
        tagCounts[tagRecord.tag].users.push(tagRecord.user_id);
      } else {
        tagCounts[tagRecord.tag] = {
          tag: tagRecord.tag,
          count: 1,
          users: [tagRecord.user_id],
        };
      }
    });

    const tagsWithCounts = Object.values(tagCounts);

    return NextResponse.json({
      tags: tagsWithCounts,
      availableTags: AVAILABLE_TAGS,
    });
  } catch (error) {
    console.error("Error in GET /api/wc-tags:", error);
    return NextResponse.json(
      { message: "Internal server error" },
      { status: 500 },
    );
  }
}

// POST - Add a new tag to a WC
export async function POST(request) {
  console.log("WC Tags API POST: Starting request");
  const session = await getServerSession(authOptions);

  console.log("WC Tags API POST: Session check", {
    hasSession: !!session,
    hasUser: !!session?.user,
    hasUserId: !!session?.user?.id,
    userId: session?.user?.id,
  });

  if (!session || !session.user || !session.user.id) {
    console.log("WC Tags API POST: Unauthorized - no session");
    return NextResponse.json(
      { message: "Unauthorized: You must be logged in to add tags" },
      { status: 401 },
    );
  }

  try {
    const { wc_id, tag } = await request.json();
    console.log("WC Tags API POST: Request data", { wc_id, tag });

    if (!wc_id || !tag) {
      console.log("WC Tags API POST: Missing required fields");
      return NextResponse.json(
        { message: "wc_id and tag are required" },
        { status: 400 },
      );
    }

    if (!AVAILABLE_TAGS.includes(tag)) {
      console.log("WC Tags API POST: Invalid tag", {
        tag,
        availableTags: AVAILABLE_TAGS,
      });
      return NextResponse.json(
        {
          message: "Invalid tag. Available tags: " + AVAILABLE_TAGS.join(", "),
        },
        { status: 400 },
      );
    }

    const supabaseUrl = process.env.SUPABASE_URL;
    const supabaseServiceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

    if (!supabaseUrl || !supabaseServiceRoleKey) {
      console.error("Supabase URL or Service Role Key is not defined");
      return NextResponse.json(
        { message: "Server configuration error" },
        { status: 500 },
      );
    }

    const supabase = createClient(supabaseUrl, supabaseServiceRoleKey);

    // Check if WC exists
    console.log("WC Tags API POST: Checking if WC exists", { wc_id });
    const { data: wcData, error: wcError } = await supabase
      .from("wcs")
      .select("id")
      .eq("id", wc_id)
      .single();

    console.log("WC Tags API POST: WC check result", { wcData, wcError });

    if (wcError || !wcData) {
      console.log("WC Tags API POST: WC not found", { wc_id, wcError });
      return NextResponse.json({ message: "WC not found" }, { status: 404 });
    }

    // Check if user already added this tag to this WC
    console.log("WC Tags API POST: Checking for existing tag");
    const { data: existingTag, error: checkError } = await supabase
      .from("wc_tags")
      .select("id")
      .eq("wc_id", wc_id)
      .eq("tag", tag)
      .eq("user_id", session.user.id)
      .single();

    console.log("WC Tags API POST: Existing tag check", {
      existingTag,
      checkError,
    });

    if (checkError && checkError.code !== "PGRST116") {
      // PGRST116 is "not found"
      console.error(
        "WC Tags API POST: Error checking existing tag:",
        checkError,
      );
      return NextResponse.json(
        { message: "Error checking existing tag" },
        { status: 500 },
      );
    }

    if (existingTag) {
      console.log("WC Tags API POST: Tag already exists for this user");
      return NextResponse.json(
        { message: "You have already added this tag to this WC" },
        { status: 409 },
      );
    }

    // Insert new tag
    console.log("WC Tags API POST: Inserting new tag");
    const { data, error } = await supabase
      .from("wc_tags")
      .insert({
        wc_id: wc_id,
        tag: tag,
        user_id: session.user.id,
      })
      .select()
      .single();

    console.log("WC Tags API POST: Insert result", { data, error });

    if (error) {
      console.error("WC Tags API POST: Error inserting WC tag:", error);
      return NextResponse.json(
        { message: "Error adding tag" },
        { status: 500 },
      );
    }

    console.log("WC Tags API POST: Tag added successfully", data);
    return NextResponse.json(
      {
        message: "Tag added successfully",
        tag: data,
      },
      { status: 201 },
    );
  } catch (error) {
    console.error("WC Tags API POST: Unexpected error:", error);
    return NextResponse.json(
      { message: "Internal server error" },
      { status: 500 },
    );
  }
}

// DELETE - Remove a tag from a WC
export async function DELETE(request) {
  const session = await getServerSession(authOptions);

  if (!session || !session.user || !session.user.id) {
    return NextResponse.json(
      { message: "Unauthorized: You must be logged in to remove tags" },
      { status: 401 },
    );
  }

  try {
    const { searchParams } = new URL(request.url);
    const wcId = searchParams.get("wc_id");
    const tag = searchParams.get("tag");

    if (!wcId || !tag) {
      return NextResponse.json(
        { message: "wc_id and tag parameters are required" },
        { status: 400 },
      );
    }

    const supabaseUrl = process.env.SUPABASE_URL;
    const supabaseServiceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

    if (!supabaseUrl || !supabaseServiceRoleKey) {
      console.error("Supabase URL or Service Role Key is not defined");
      return NextResponse.json(
        { message: "Server configuration error" },
        { status: 500 },
      );
    }

    const supabase = createClient(supabaseUrl, supabaseServiceRoleKey);

    // Delete the tag (only if it belongs to the current user)
    const { data, error } = await supabase
      .from("wc_tags")
      .delete()
      .eq("wc_id", wcId)
      .eq("tag", tag)
      .eq("user_id", session.user.id)
      .select();

    if (error) {
      console.error("Error deleting WC tag:", error);
      return NextResponse.json(
        { message: "Error removing tag" },
        { status: 500 },
      );
    }

    if (data.length === 0) {
      return NextResponse.json(
        { message: "Tag not found or you don't have permission to remove it" },
        { status: 404 },
      );
    }

    return NextResponse.json({
      message: "Tag removed successfully",
    });
  } catch (error) {
    console.error("Error in DELETE /api/wc-tags:", error);
    return NextResponse.json(
      { message: "Internal server error" },
      { status: 500 },
    );
  }
}
