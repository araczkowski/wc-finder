import { NextRequest, NextResponse } from "next/server";
import { getServerSession } from "next-auth/next";
import { authOptions } from "../auth/[...nextauth]/route";
import { createClient } from "@supabase/supabase-js";

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !supabaseServiceKey) {
  console.error("Missing Supabase environment variables for wc-photos API");
}

const supabase = createClient(supabaseUrl, supabaseServiceKey);

// GET /api/wc-photos?wc_id={id} - Get all photos for a specific WC
export async function GET(request) {
  try {
    console.log("[wc-photos GET] Starting photo fetch");

    const { searchParams } = new URL(request.url);
    const wcId = searchParams.get("wc_id");

    console.log("[wc-photos GET] WC ID:", wcId);

    if (!wcId) {
      console.log("[wc-photos GET] Missing wc_id parameter");
      return NextResponse.json(
        { error: "wc_id parameter is required" },
        { status: 400 },
      );
    }

    console.log("[wc-photos GET] Attempting to fetch photos from database");

    // Fetch photos (no session required for viewing)
    const { data: photos, error } = await supabase
      .from("wc_photos")
      .select("id, wc_id, user_id, photo, created_at, updated_at")
      .eq("wc_id", wcId)
      .order("created_at", { ascending: false });

    console.log("[wc-photos GET] Database query result:", {
      photos: photos || [],
      error: error || null,
      photoCount: photos?.length || 0,
    });

    if (error) {
      console.error("[wc-photos GET] Database error:", error);
      return NextResponse.json(
        { error: `Failed to fetch photos: ${error.message}` },
        { status: 500 },
      );
    }

    console.log(
      "[wc-photos GET] Successfully fetched photos:",
      photos?.length || 0,
    );

    return NextResponse.json({
      success: true,
      photos: photos || [],
      count: photos?.length || 0,
    });
  } catch (error) {
    console.error("[wc-photos GET] Unexpected error:", error);
    return NextResponse.json(
      { error: `Internal server error: ${error.message}` },
      { status: 500 },
    );
  }
}

// POST /api/wc-photos - Upload a new photo for a WC
export async function POST(request) {
  try {
    console.log("[wc-photos POST] Starting photo upload process");

    const session = await getServerSession(authOptions);

    if (!session || !session.user?.id) {
      console.log("[wc-photos POST] Authentication failed", { session });
      return NextResponse.json(
        { error: "Authentication required" },
        { status: 401 },
      );
    }

    console.log("[wc-photos POST] User authenticated:", session.user.id);

    const formData = await request.formData();
    const wcId = formData.get("wc_id");
    const imageFile = formData.get("photo");

    console.log("[wc-photos POST] Form data parsed:", {
      wcId,
      imageFileName: imageFile?.name,
      imageFileSize: imageFile?.size,
      imageFileType: imageFile?.type,
    });

    if (!wcId) {
      console.log("[wc-photos POST] Missing wc_id");
      return NextResponse.json({ error: "wc_id is required" }, { status: 400 });
    }

    if (!imageFile || !(imageFile instanceof File)) {
      console.log("[wc-photos POST] Invalid image file:", { imageFile });
      return NextResponse.json(
        { error: "Photo file is required" },
        { status: 400 },
      );
    }

    // Validate file type
    const allowedTypes = ["image/jpeg", "image/jpg", "image/png", "image/webp"];
    if (!allowedTypes.includes(imageFile.type)) {
      console.log("[wc-photos POST] Invalid file type:", imageFile.type);
      return NextResponse.json(
        { error: "Only JPEG, PNG, and WebP images are allowed" },
        { status: 400 },
      );
    }

    // Validate file size (max 5MB)
    const maxSize = 5 * 1024 * 1024; // 5MB in bytes
    if (imageFile.size > maxSize) {
      console.log("[wc-photos POST] File too large:", imageFile.size);
      return NextResponse.json(
        { error: "File size must be less than 5MB" },
        { status: 400 },
      );
    }

    console.log("[wc-photos POST] File validation passed");

    // Verify WC exists
    const { data: wc, error: wcError } = await supabase
      .from("wcs")
      .select("id")
      .eq("id", wcId)
      .single();

    if (wcError || !wc) {
      console.log("[wc-photos POST] WC not found:", { wcId, wcError });
      return NextResponse.json({ error: "WC not found" }, { status: 404 });
    }

    console.log("[wc-photos POST] WC verified:", wc.id);

    // Generate unique filename
    const fileExtension = imageFile.name.split(".").pop();
    const timestamp = Date.now();
    const fileName = `${wcId}/${session.user.id}_${timestamp}.${fileExtension}`;

    // Upload to Supabase Storage
    console.log("[wc-photos POST] Attempting storage upload:", fileName);
    const { data: uploadData, error: uploadError } = await supabase.storage
      .from("wc-photos")
      .upload(fileName, imageFile, {
        cacheControl: "3600",
        upsert: false,
      });

    if (uploadError) {
      console.error("[wc-photos POST] Storage upload error:", uploadError);
      return NextResponse.json(
        { error: `Failed to upload photo: ${uploadError.message}` },
        { status: 500 },
      );
    }

    console.log("[wc-photos POST] Storage upload successful:", uploadData);

    // Get public URL for the uploaded file
    const { data: urlData } = supabase.storage
      .from("wc-photos")
      .getPublicUrl(fileName);

    if (!urlData?.publicUrl) {
      return NextResponse.json(
        { error: "Failed to get photo URL" },
        { status: 500 },
      );
    }

    // Save photo record to database
    console.log("[wc-photos POST] Attempting database insert:", {
      wc_id: wcId,
      user_id: session.user.id,
      photo: urlData.publicUrl,
    });

    const { data: photoRecord, error: dbError } = await supabase
      .from("wc_photos")
      .insert({
        wc_id: wcId,
        user_id: session.user.id,
        photo: urlData.publicUrl,
      })
      .select()
      .single();

    if (dbError) {
      console.error("[wc-photos POST] Database insert error:", dbError);

      // Clean up uploaded file if database insert fails
      await supabase.storage.from("wc-photos").remove([fileName]);

      return NextResponse.json(
        { error: `Failed to save photo record: ${dbError.message}` },
        { status: 500 },
      );
    }

    console.log("[wc-photos POST] Database insert successful:", photoRecord);

    return NextResponse.json({
      success: true,
      message: "Photo uploaded successfully",
      photo: photoRecord,
    });
  } catch (error) {
    console.error("[wc-photos POST] Unexpected error:", error);
    return NextResponse.json(
      { error: `Internal server error: ${error.message}` },
      { status: 500 },
    );
  }
}
