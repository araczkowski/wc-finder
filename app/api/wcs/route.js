import { NextResponse } from "next/server";
import { getServerSession } from "next-auth/next";
import { authOptions } from "../auth/[...nextauth]/route"; // Ensure this path is correct
import { createClient } from "@supabase/supabase-js";

export async function GET(request) {
  const session = await getServerSession(authOptions);

  if (!session || !session.user || !session.user.id) {
    return NextResponse.json(
      { message: "Unauthorized: You must be logged in to view WCs." },
      { status: 401 },
    );
  }

  const { searchParams } = new URL(request.url);
  const page = parseInt(searchParams.get("page") || "0", 10);
  const limit = parseInt(searchParams.get("limit") || "5", 10);
  const userLat = parseFloat(searchParams.get("lat"));
  const userLng = parseFloat(searchParams.get("lng"));

  // Validate pagination parameters
  if (page < 0 || limit < 1 || limit > 50) {
    return NextResponse.json(
      {
        message:
          "Invalid pagination parameters. Page must be >= 0, limit must be 1-50.",
      },
      { status: 400 },
    );
  }

  const offset = page * limit;
  const hasUserLocation = !isNaN(userLat) && !isNaN(userLng);

  const supabaseUrl = process.env.SUPABASE_URL;
  const supabaseServiceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

  if (!supabaseUrl || !supabaseServiceRoleKey) {
    console.error(
      "API WCS GET: Supabase URL or Service Role Key is not defined in .env.local. Ensure these are correctly set.",
    );
    return NextResponse.json(
      { message: "Server configuration error. Please try again later." },
      { status: 500 },
    );
  }

  const supabase = createClient(supabaseUrl, supabaseServiceRoleKey);

  try {
    // First get the total count
    const { count } = await supabase
      .from("wcs")
      .select("*", { count: "exact", head: true });

    // Check if offset exceeds available records
    if (count !== null && offset >= count) {
      return NextResponse.json(
        {
          data: [],
          pagination: {
            page,
            limit,
            total: count,
            totalPages: Math.ceil(count / limit),
            hasMore: false,
          },
        },
        { status: 200 },
      );
    }

    let query;
    let wcs;
    let error;

    // If user location is provided, use PostGIS for distance-based sorting
    if (hasUserLocation) {
      // Use improved PostGIS function that returns coordinates directly
      const { data, error: sqlError } = await supabase.rpc(
        "get_wcs_by_distance",
        {
          user_lat: userLat,
          user_lng: userLng,
          page_offset: offset,
          page_limit: limit,
        },
      );

      if (sqlError) {
        console.error(
          "PostGIS query failed, falling back to regular query:",
          sqlError,
        );
        console.error(
          "PostGIS error details:",
          JSON.stringify(sqlError, null, 2),
        );
        // Fallback to regular query without distance sorting
        query = supabase
          .from("wcs")
          .select("*")
          .order("created_at", { ascending: false });
        const result = await query.range(offset, offset + limit - 1);
        wcs = result.data;
        error = result.error;
        console.log(
          "Fallback query result - sample WC:",
          wcs?.[0]
            ? {
                id: wcs[0].id,
                name: wcs[0].name,
                google_place_id: wcs[0].google_place_id,
                has_google_place_id: !!wcs[0].google_place_id,
              }
            : "No WCs",
        );
      } else {
        wcs = data;
        error = null;
        console.log(
          "PostGIS query successful - sample WC with coordinates:",
          wcs?.[0]
            ? {
                id: wcs[0].id,
                name: wcs[0].name,
                lat: wcs[0].lat,
                lng: wcs[0].lng,
                distance_km: wcs[0].distance_km,
                google_place_id: wcs[0].google_place_id,
                has_google_place_id: !!wcs[0].google_place_id,
              }
            : "No WCs",
        );

        // If new PostGIS function doesn't return coordinates, extract them manually
        if (
          wcs &&
          wcs.length > 0 &&
          (wcs[0].lat === undefined || wcs[0].lng === undefined)
        ) {
          console.log(
            "PostGIS function doesn't return coordinates, extracting manually...",
          );
          try {
            const coordinatePromises = wcs.map(async (wc) => {
              if (wc.id) {
                try {
                  const { data: coords } = await supabase.rpc(
                    "get_wc_coordinates",
                    { p_wc_id: wc.id },
                  );
                  return coords && coords.length > 0
                    ? {
                        id: wc.id,
                        lat: coords[0].latitude,
                        lng: coords[0].longitude,
                      }
                    : { id: wc.id, lat: null, lng: null };
                } catch (err) {
                  console.warn(
                    `Failed to get coordinates for WC ${wc.id}:`,
                    err,
                  );
                  return { id: wc.id, lat: null, lng: null };
                }
              }
              return { id: wc.id, lat: null, lng: null };
            });

            const allCoordinates = await Promise.all(coordinatePromises);
            const coordMap = {};
            allCoordinates.forEach((coord) => {
              coordMap[coord.id] = { lat: coord.lat, lng: coord.lng };
            });

            // Add coordinates to WC data
            wcs = wcs.map((wc) => ({
              ...wc,
              lat: coordMap[wc.id]?.lat || null,
              lng: coordMap[wc.id]?.lng || null,
            }));

            console.log(
              "Manually extracted coordinates for",
              wcs.length,
              "WCs",
            );
          } catch (coordErr) {
            console.warn("Could not extract coordinates manually:", coordErr);
          }
        }

        // Check if PostGIS function is missing place_type and fallback to supplement it
        if (wcs && wcs.length > 0 && wcs[0].place_type === undefined) {
          try {
            // Get WC IDs from PostGIS result
            const wcIds = wcs.map((wc) => wc.id);

            // Fetch place_type data for these WCs using regular query
            const { data: placeTypeData, error: placeTypeError } =
              await supabase
                .from("wcs")
                .select("id, place_type")
                .in("id", wcIds);

            if (!placeTypeError && placeTypeData) {
              // Create a map of id -> place_type
              const placeTypeMap = {};
              placeTypeData.forEach((wc) => {
                placeTypeMap[wc.id] = wc.place_type || "toilet";
              });

              // Add place_type to PostGIS results
              wcs = wcs.map((wc) => ({
                ...wc,
                place_type: placeTypeMap[wc.id] || "toilet",
              }));
            } else {
              // Set default place_type for all records
              wcs = wcs.map((wc) => ({
                ...wc,
                place_type: "toilet",
              }));
            }
          } catch (supplementErr) {
            // Set default place_type for all records
            wcs = wcs.map((wc) => ({
              ...wc,
              place_type: "toilet",
            }));
          }
        }
      }
    } else {
      console.log("No user location provided, using regular query");
      // Use regular query and extract coordinates manually
      query = supabase
        .from("wcs")
        .select("*")
        .order("created_at", { ascending: false });
      const result = await query.range(offset, offset + limit - 1);
      wcs = result.data;
      error = result.error;

      console.log(
        "Regular query result - sample WC:",
        wcs?.[0]
          ? {
              id: wcs[0].id,
              name: wcs[0].name,
              google_place_id: wcs[0].google_place_id,
              has_google_place_id: !!wcs[0].google_place_id,
            }
          : "No WCs",
      );

      // Extract coordinates for regular query
      if (wcs && wcs.length > 0) {
        try {
          console.log("Extracting coordinates for", wcs.length, "WCs...");
          const coordinatePromises = wcs.map(async (wc) => {
            if (wc.id) {
              try {
                const { data: coords } = await supabase.rpc(
                  "get_wc_coordinates",
                  { p_wc_id: wc.id },
                );
                return coords && coords.length > 0
                  ? {
                      id: wc.id,
                      lat: coords[0].latitude,
                      lng: coords[0].longitude,
                    }
                  : { id: wc.id, lat: null, lng: null };
              } catch (err) {
                console.warn(`Failed to get coordinates for WC ${wc.id}:`, err);
                return { id: wc.id, lat: null, lng: null };
              }
            }
            return { id: wc.id, lat: null, lng: null };
          });

          const allCoordinates = await Promise.all(coordinatePromises);
          const coordMap = {};
          allCoordinates.forEach((coord) => {
            coordMap[coord.id] = { lat: coord.lat, lng: coord.lng };
          });

          // Add coordinates to WC data
          wcs = wcs.map((wc) => ({
            ...wc,
            lat: coordMap[wc.id]?.lat || null,
            lng: coordMap[wc.id]?.lng || null,
          }));

          console.log("Successfully extracted coordinates for WCs");
        } catch (coordErr) {
          console.warn(
            "Could not extract coordinates for regular query:",
            coordErr,
          );
          // Add null coordinates as fallback
          wcs = wcs.map((wc) => ({
            ...wc,
            lat: null,
            lng: null,
          }));
        }
      }
    }

    if (error) {
      console.error(
        "API WCS GET: Supabase fetch error:",
        JSON.stringify(error, null, 2),
      );
      return NextResponse.json(
        { message: `Failed to fetch WCs: ${error.message}` },
        { status: 500 },
      );
    }

    // Enhance WCs with gallery photos, tags and combine with main image
    const enhancedWcs = await Promise.all(
      (wcs || []).map(async (wc) => {
        // Distance is already calculated by PostGIS if user location was provided
        // and included in the wc object as distance_km field
        // For non-PostGIS queries, distance_km will be undefined

        // Fetch gallery photos and tags for this WC
        try {
          const [photosResult, tagsResult] = await Promise.all([
            supabase
              .from("wc_photos")
              .select("photo")
              .eq("wc_id", wc.id)
              .order("created_at", { ascending: true }),
            supabase
              .from("wc_tags")
              .select("tag, user_id")
              .eq("wc_id", wc.id)
              .order("created_at", { ascending: true }),
          ]);

          const { data: photos, error: photoError } = photosResult;
          const { data: tags, error: tagsError } = tagsResult;

          // Process tags
          let tagCounts = {};
          if (!tagsError && tags && tags.length > 0) {
            tags.forEach((tagRecord) => {
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
          }
          const wcTags = Object.values(tagCounts);

          if (!photoError && photos && photos.length > 0) {
            // Combine main image with gallery photos
            const allImages = [];

            // Add main image first if it exists
            if (wc.image_url) {
              allImages.push(wc.image_url);
            }

            // Add gallery photos
            photos.forEach((photo) => {
              // Avoid duplicates if main image is also in gallery
              if (!allImages.includes(photo.photo)) {
                allImages.push(photo.photo);
              }
            });

            return {
              ...wc,
              gallery_photos: allImages,
              image_url: allImages[0], // Use first image as main display
              has_multiple_images: allImages.length > 1,
              distance: wc.distance_km !== undefined ? wc.distance_km : null,
              tags: wcTags,
            };
          } else {
            // No gallery photos, return with main image only
            return {
              ...wc,
              gallery_photos: wc.image_url ? [wc.image_url] : [],
              has_multiple_images: false,
              distance: wc.distance_km !== undefined ? wc.distance_km : null,
              tags: wcTags,
            };
          }
        } catch (fetchError) {
          console.error(
            "Error fetching gallery photos or tags for WC:",
            wc.id,
            fetchError,
          );
          // Return with main image only and no tags on error
          return {
            ...wc,
            gallery_photos: wc.image_url ? [wc.image_url] : [],
            has_multiple_images: false,
            distance: wc.distance_km !== undefined ? wc.distance_km : null,
            tags: [],
          };
        }
      }),
    );

    // Data is already sorted by PostGIS if user location was provided
    // No additional sorting needed here

    const hasMore = count > offset + limit;
    const totalPages = Math.ceil(count / limit);

    return NextResponse.json(
      {
        data: enhancedWcs,
        pagination: {
          page,
          limit,
          total: count,
          totalPages,
          hasMore,
        },
        sorted_by_distance: hasUserLocation,
        user_location: hasUserLocation ? { lat: userLat, lng: userLng } : null,
      },
      { status: 200 },
    );
  } catch (err) {
    console.error("API WCS GET: Unexpected error during WC fetch:", err);
    return NextResponse.json(
      { message: "An unexpected server error occurred." },
      { status: 500 },
    );
  }
}

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

  const { name, location, address, image_url, rating, place_type } = reqBody;

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

  // Validate place_type
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

  // Validate place_type if provided (make it optional for now)
  if (
    place_type &&
    (typeof place_type !== "string" || !validPlaceTypes.includes(place_type))
  ) {
    return NextResponse.json(
      { message: "Place type must be one of the valid types if provided." },
      { status: 400 },
    );
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

  // Parse location coordinates if provided
  let locationGeo = null;
  if (location && typeof location === "string") {
    const coords = location.trim().split(",");
    if (coords.length === 2) {
      const lat = parseFloat(coords[0].trim());
      const lng = parseFloat(coords[1].trim());
      if (!isNaN(lat) && !isNaN(lng)) {
        // Create PostGIS Point using ST_Point(longitude, latitude)
        locationGeo = `ST_Point(${lng}, ${lat})::geography`;
      }
    }
  }

  const wcDataToInsert = {
    user_id: userLoginId, // userLoginId is session.user.id (UUID)
    created_by: session.user.email, // Store the user's email in created_by
    name: name.trim(),
    address: address && typeof address === "string" ? address.trim() : null,
    image_url:
      image_url && typeof image_url === "string" ? image_url.trim() : null,
    rating:
      rating !== null && rating !== undefined ? parseInt(rating, 10) : null,
    place_type: place_type || "toilet",
    // 'created_at' and 'updated_at' are assumed to be handled by Supabase table defaults/triggers if set up
  };

  try {
    let newWc, insertError;

    if (locationGeo) {
      try {
        // Try RPC call to insert with PostGIS location
        const { data, error } = await supabase.rpc("insert_wc_with_location", {
          p_user_id: wcDataToInsert.user_id,
          p_created_by: wcDataToInsert.created_by,
          p_name: wcDataToInsert.name,
          p_address: wcDataToInsert.address,
          p_image_url: wcDataToInsert.image_url,
          p_rating: wcDataToInsert.rating,
          p_place_type: wcDataToInsert.place_type || "toilet",
          p_longitude: parseFloat(location.trim().split(",")[1]),
          p_latitude: parseFloat(location.trim().split(",")[0]),
        });
        newWc = data;
        insertError = error;
      } catch (rpcError) {
        console.warn(
          "RPC function not found, falling back to raw SQL insert:",
          rpcError,
        );
        // Fallback: try raw SQL insert with PostGIS
        const coords = location.trim().split(",");
        const lat = parseFloat(coords[0].trim());
        const lng = parseFloat(coords[1].trim());

        const { data, error } = await supabase
          .from("wcs")
          .insert({
            ...wcDataToInsert,
            location: `POINT(${lng} ${lat})`,
          })
          .select()
          .single();
        newWc = data;
        insertError = error;
      }
    } else {
      try {
        // Try RPC call for insert without location
        const { data, error } = await supabase.rpc(
          "insert_wc_without_location",
          {
            p_user_id: wcDataToInsert.user_id,
            p_created_by: wcDataToInsert.created_by,
            p_name: wcDataToInsert.name,
            p_address: wcDataToInsert.address,
            p_image_url: wcDataToInsert.image_url,
            p_rating: wcDataToInsert.rating,
            p_place_type: wcDataToInsert.place_type,
          },
        );
        newWc = data;
        insertError = error;
      } catch (rpcError) {
        console.warn(
          "RPC function not found, falling back to regular insert:",
          rpcError,
        );
        // Fallback: regular insert without place_type if column doesn't exist
        const wcDataForFallback = { ...wcDataToInsert };
        delete wcDataForFallback.place_type; // Remove place_type as fallback

        const { data, error } = await supabase
          .from("wcs")
          .insert(wcDataForFallback)
          .select()
          .single();
        newWc = data;
        insertError = error;
      }
    }

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
