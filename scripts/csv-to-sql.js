#!/usr/bin/env node

const fs = require("fs");
const path = require("path");
const { parse } = require("csv-parse/sync");

// Place type mapping from CSV values to our database enum
const PLACE_TYPE_MAPPING = {
  restaurant: "restaurant",
  cafe: "cafe",
  bar: "bar",
  shopping_mall: "shopping_mall",
  department_store: "department_store",
  supermarket: "supermarket",
  gas_station: "gas_station",
  park: "park",
  tourist_attraction: "tourist_attraction",
  train_station: "train_station",
  subway_station: "subway_station",
  bus_station: "bus_station",
  airport: "airport",
  library: "library",
  museum: "museum",
  movie_theater: "movie_theater",
  city_hall: "city_hall",
  toilet: "toilet",
  public_toilet: "public_toilet",
  // Fallback mappings for common variations
  food: "restaurant",
  lodging: "tourist_attraction",
  establishment: "toilet",
  point_of_interest: "tourist_attraction",
  transit_station: "train_station",
  health: "toilet",
  store: "supermarket",
  // Poland.csv specific mappings
  "public bathroom": "public_toilet",
  "public restroom": "public_toilet",
  restroom: "toilet",
  bathroom: "toilet",
};

// Default user ID for imported data (should be replaced with actual admin user ID)
const DEFAULT_USER_ID = "cac878bb-3f77-42a7-9221-919238bfae76";
const DEFAULT_CREATED_BY = "admin@sviete.pl";

function printUsage() {
  console.log(`
Użycie: node csv-to-sql.js <plik_csv> [opcje]

Opcje:
  --output, -o <plik>     Plik wyjściowy SQL (domyślnie: import.sql)
  --user-id <uuid>        UUID użytkownika dla importowanych danych
  --created-by <email>    Email użytkownika dla importowanych danych
  --help, -h              Pokaż tę pomoc

Przykład:
  node csv-to-sql.js dane_wc.csv -o import_wc.sql
  node csv-to-sql.js dane_wc.csv --user-id "12345678-1234-1234-1234-123456789012"

Mapowanie kolumn CSV (poland.csv format):
  Kolumna 0  -> wcs.google_place_id (input_id)
  Kolumna 2  -> wcs.name (title)
  Kolumna 4  -> wcs.place_type (category - mapowane)
  Kolumna 5  -> wcs.address (address)
  Kolumna 12 -> wcs.rating (review_rating - pomnożone przez 2)
  Kolumna 13 -> latitude
  Kolumna 14 -> longitude
  Kolumna 20 -> wcs.image_url (thumbnail)
  Kolumna 23 -> wc_photos (images JSON array)
`);
}

function sanitizeString(str) {
  if (!str || str === "NULL" || str === "") return null;
  return str.replace(/'/g, "''").trim();
}

function sanitizeNumber(num) {
  if (!num || num === "NULL" || num === "") return null;
  const parsed = parseFloat(num);
  return isNaN(parsed) ? null : parsed;
}

function mapPlaceType(originalType) {
  if (!originalType || originalType === "NULL" || originalType === "") {
    return "toilet";
  }

  const type = originalType.toLowerCase().trim();
  return PLACE_TYPE_MAPPING[type] || "toilet";
}

function findImagesColumn(row) {
  // Look for images JSON in the row
  for (let i = 20; i < row.length; i++) {
    const cell = row[i];
    if (cell && cell.includes("[{") && cell.includes("image")) {
      return cell;
    }
  }
  return row[23] || ""; // fallback to column 23
}

function parsePhotosFromJson(jsonStr) {
  if (!jsonStr || jsonStr === "NULL" || jsonStr === "") return [];

  try {
    const parsed = JSON.parse(jsonStr);
    if (Array.isArray(parsed)) {
      // Extract image URLs from poland.csv format: [{"title":"All","image":"url"}, ...]
      return parsed
        .map((item) => {
          if (typeof item === "string" && item.startsWith("http")) {
            return item;
          }
          if (
            item &&
            item.image &&
            typeof item.image === "string" &&
            item.image.startsWith("http")
          ) {
            return item.image;
          }
          return null;
        })
        .filter(Boolean);
    }
    return [];
  } catch (error) {
    console.warn(`Nie można sparsować JSON zdjęć: ${jsonStr}`);
    return [];
  }
}

function generateWcInsert(row, userId, createdBy, wcIndex) {
  // Handle potential CSV parsing issues by finding the correct columns
  const googlePlaceId = sanitizeString(row[0]); // input_id
  const name = sanitizeString(row[2]); // title
  const placeType = mapPlaceType(row[3]); // category (kolumna D)
  const address = sanitizeString(row[4]); // address

  // Find rating column - may shift due to JSON content
  let rating = null;
  let latitude = null;
  let longitude = null;
  let imageUrl = null;

  // Try to find numeric latitude/longitude to locate correct columns
  for (let i = 10; i < Math.min(20, row.length); i++) {
    const val = sanitizeNumber(row[i]);
    if (val && val >= 49 && val <= 55) {
      // Poland latitude range
      latitude = val;
      longitude = sanitizeNumber(row[i + 1]);
      if (longitude && longitude >= 14 && longitude <= 25) {
        // Poland longitude range
        // Found coordinates, try to find rating nearby
        for (let j = Math.max(0, i - 5); j < i; j++) {
          const ratingVal = sanitizeNumber(row[j]);
          if (ratingVal && ratingVal >= 0 && ratingVal <= 5) {
            rating = ratingVal;
            break;
          }
        }
        // Look for image URL after coordinates
        for (let k = i + 2; k < Math.min(i + 8, row.length); k++) {
          const urlVal = sanitizeString(row[k]);
          if (
            urlVal &&
            urlVal.startsWith("http") &&
            urlVal.includes("google")
          ) {
            imageUrl = urlVal;
            break;
          }
        }
        break;
      }
    }
  }

  // Fallback to original indices if smart detection fails
  if (!latitude) {
    rating = sanitizeNumber(row[12]); // kolumna L - review_rating
    latitude = sanitizeNumber(row[13]);
    longitude = sanitizeNumber(row[14]);
    imageUrl = sanitizeString(row[19]); // kolumna T - thumbnail
  }

  // Walidacja wymaganych pól
  if (!name) {
    console.warn(
      `Pominięto wiersz bez nazwy: ${JSON.stringify(row.slice(0, 5))}`,
    );
    return null;
  }

  if (!latitude || !longitude) {
    console.warn(`Pominięto wiersz bez współrzędnych: ${name}`);
    return null;
  }

  // Przygotowanie wartości
  const nameValue = name ? `'${name}'` : "NULL";
  const addressValue = address ? `'${address}'` : "NULL";
  const imageUrlValue = imageUrl ? `'${imageUrl}'` : "NULL";
  const googlePlaceIdValue = googlePlaceId ? `'${googlePlaceId}'` : "NULL";
  const ratingValue = rating
    ? Math.min(10, Math.max(1, Math.round(rating * 2)))
    : "NULL";
  const locationValue = `ST_Point(${longitude}, ${latitude})::GEOGRAPHY`;

  return {
    sql: `INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('${userId}', '${createdBy}', ${nameValue}, ${addressValue}, ${imageUrlValue}, ${googlePlaceIdValue}, ${ratingValue}, ${locationValue}, '${placeType}', NOW(), NOW());`,
    wcIndex: wcIndex,
    photos: parsePhotosFromJson(findImagesColumn(row)), // images - find dynamically
  };
}

function generatePhotoInserts(wcName, wcAddress, photos, userId, createdBy) {
  if (!photos || photos.length === 0) return [];

  const sanitizedName = sanitizeString(wcName);
  const sanitizedAddress = sanitizeString(wcAddress);

  return photos
    .map((photoUrl, index) => {
      const sanitizedUrl = sanitizeString(photoUrl);
      if (!sanitizedUrl) return null;

      return `INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, '${userId}', '${sanitizedUrl}', NOW(), NOW()
FROM wcs
WHERE name = '${sanitizedName}' AND address = '${sanitizedAddress}' AND created_by = '${createdBy}'
LIMIT 1;`;
    })
    .filter(Boolean);
}

function main() {
  const args = process.argv.slice(2);

  if (args.length === 0 || args.includes("--help") || args.includes("-h")) {
    printUsage();
    process.exit(0);
  }

  const csvFile = args[0];
  let outputFile = "import.sql";
  let userId = DEFAULT_USER_ID;
  let createdBy = DEFAULT_CREATED_BY;

  // Parse arguments
  for (let i = 1; i < args.length; i++) {
    if (args[i] === "--output" || args[i] === "-o") {
      outputFile = args[++i];
    } else if (args[i] === "--user-id") {
      userId = args[++i];
    } else if (args[i] === "--created-by") {
      createdBy = args[++i];
    }
  }

  if (!fs.existsSync(csvFile)) {
    console.error(`Błąd: Plik CSV nie istnieje: ${csvFile}`);
    process.exit(1);
  }

  console.log(`Przetwarzanie pliku CSV: ${csvFile}`);
  console.log(`Plik wyjściowy SQL: ${outputFile}`);
  console.log(`User ID: ${userId}`);
  console.log(`Created by: ${createdBy}`);

  try {
    // Read and parse CSV with proper JSON handling
    const csvContent = fs.readFileSync(csvFile, "utf-8");
    const records = parse(csvContent, {
      skip_empty_lines: true,
      trim: true,
      relax_column_count: true,
      quote: '"',
      escape: '"',
      columns: false,
    });

    console.log(`Znaleziono ${records.length} wierszy w pliku CSV`);

    // Generate SQL
    const sqlStatements = [];
    const photoStatements = [];
    let processedCount = 0;
    let skippedCount = 0;

    // Add header comment
    sqlStatements.push(`-- Import WC data from CSV`);
    sqlStatements.push(`-- Generated on: ${new Date().toISOString()}`);
    sqlStatements.push(`-- Source file: ${csvFile}`);
    sqlStatements.push(`-- User ID: ${userId}`);
    sqlStatements.push(`-- Created by: ${createdBy}`);
    sqlStatements.push("");
    sqlStatements.push("BEGIN;");
    sqlStatements.push("");

    // Process each row
    for (let i = 0; i < records.length; i++) {
      const row = records[i];

      // Skip header row if it looks like headers
      if (
        i === 0 &&
        (row[0] === "input_id" ||
          row[0] === "place_id" ||
          row[0] === "google_place_id")
      ) {
        console.log("Pominięto wiersz nagłówka");
        continue;
      }

      const wcInsert = generateWcInsert(
        row,
        userId,
        createdBy,
        processedCount + 1,
      );

      if (wcInsert) {
        sqlStatements.push(
          `-- WC #${processedCount + 1}: ${row[2] || "Unnamed"}`,
        );
        sqlStatements.push(wcInsert.sql);
        sqlStatements.push("");

        // Generate photo inserts
        const photoInserts = generatePhotoInserts(
          row[2] || "Unnamed",
          row[5] || "",
          wcInsert.photos,
          userId,
          createdBy,
        );
        if (photoInserts.length > 0) {
          photoStatements.push(`-- Photos for WC: ${row[2] || "Unnamed"}`);
          photoStatements.push(...photoInserts);
          photoStatements.push("");
        }

        processedCount++;
      } else {
        skippedCount++;
      }
    }

    // Add photo inserts after WC inserts
    if (photoStatements.length > 0) {
      sqlStatements.push("-- WC Photos");
      sqlStatements.push(...photoStatements);
    }

    sqlStatements.push("COMMIT;");
    sqlStatements.push("");
    sqlStatements.push(
      `-- Summary: ${processedCount} WC locations processed, ${skippedCount} skipped`,
    );

    // Write SQL file
    fs.writeFileSync(outputFile, sqlStatements.join("\n"));

    console.log(`\n✅ Konwersja zakończona pomyślnie!`);
    console.log(`📊 Statystyki:`);
    console.log(`   - Przetworzono: ${processedCount} lokalizacji WC`);
    console.log(`   - Pominięto: ${skippedCount} wierszy`);
    console.log(`   - Wygenerowano: ${photoStatements.length} insertów zdjęć`);
    console.log(`📄 Plik SQL zapisany jako: ${outputFile}`);
    console.log(`\n💡 Aby zaimportować dane do Supabase:`);
    console.log(`   1. Otwórz Supabase SQL Editor`);
    console.log(`   2. Wklej zawartość pliku ${outputFile}`);
    console.log(`   3. Wykonaj zapytanie`);
    console.log(
      `\n⚠️  Uwaga: Upewnij się, że User ID ${userId} istnieje w tabeli auth.users`,
    );
  } catch (error) {
    console.error(`❌ Błąd podczas przetwarzania: ${error.message}`);
    process.exit(1);
  }
}

if (require.main === module) {
  main();
}

module.exports = { generateWcInsert, generatePhotoInserts, mapPlaceType };
