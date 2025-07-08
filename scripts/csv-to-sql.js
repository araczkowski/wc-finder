#!/usr/bin/env node

const fs = require("fs");
const path = require("path");
const { parse } = require("csv-parse/sync");

// Default user ID for imported data (should be replaced with actual admin user ID)
const DEFAULT_USER_ID = "cac878bb-3f77-42a7-9221-919238bfae76";
const DEFAULT_CREATED_BY = "public@sviete.pl";

function printUsage() {
  console.log(`
Użycie: node csv-to-sql.js <folder_csv> [opcje]

Opcje:
  --output-dir, -o <folder>  Folder wyjściowy SQL (domyślnie: ./output)
  --user-id <uuid>           UUID użytkownika dla importowanych danych
  --created-by <email>       Email użytkownika dla importowanych danych
  --help, -h                 Pokaż tę pomoc

Przykład:
  node csv-to-sql.js ./csv-files -o ./sql-output
  node csv-to-sql.js ./csv-files --user-id "e21d17a8-f227-4450-b111-e2c2c7980995""

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
  return str
    .replace(/'/g, "''")
    .trim()
    .replace(/(\r\n|\n|\r)/gm, "");
}

function sanitizeNumber(num) {
  if (!num || num === "NULL" || num === "") return null;
  const parsed = parseFloat(num);
  return isNaN(parsed) ? null : parsed;
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
  const placeType = row[3]; // category (kolumna D)
  const address = sanitizeString(row[4]); // address

  // Find rating column - may shift due to JSON content
  let rating = null;
  let latitude = null;
  let longitude = null;
  let imageUrl = null;

  imageUrl = sanitizeString(row[19]);
  latitude = sanitizeNumber(row[13]);
  longitude = sanitizeNumber(row[14]);
  rating = sanitizeNumber(row[11]);

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

  if (name === "Pizzeria GRAN TORINO") {
    console.log("Pizzeria GRAN TORINO rating/: ", rating);
    console.log(
      "Pizzeria GRAN TORINO rating/: ",
      rating,
      // Math.max(Math.min(Math.floor(rating * 2), 10), 1),
    );
  }

  // 5 star rating
  const ratingValue = rating;
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

function processCsvFile(csvFile, outputDir, userId, createdBy) {
  const csvFileName = path.basename(csvFile, ".csv");
  const outputFile = path.join(outputDir, `${csvFileName}.sql`);

  console.log(`Przetwarzanie pliku CSV: ${csvFile}`);
  console.log(`Plik wyjściowy SQL: ${outputFile}`);

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
    sqlStatements.push("DO $$");
    sqlStatements.push("DECLARE");
    sqlStatements.push("l_context text;");
    sqlStatements.push("BEGIN");
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
        sqlStatements.push(`-- WC #${processedCount + 1}`);
        sqlStatements.push(wcInsert.sql);
        sqlStatements.push("");

        // Generate photo inserts
        const photoInserts = generatePhotoInserts(
          row[2] || "Unnamed",
          row[4] || "",
          wcInsert.photos,
          userId,
          createdBy,
        );
        if (photoInserts.length > 0) {
          photoStatements.push(`-- Photos for WC`);
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

    // sqlStatements.push("COMMIT;");
    sqlStatements.push("");
    sqlStatements.push("EXCEPTION WHEN OTHERS THEN");
    sqlStatements.push("RAISE NOTICE 'Error Name:%', SQLERRM;");
    sqlStatements.push("RAISE NOTICE 'Error State:%', SQLSTATE;");
    sqlStatements.push(
      "GET STACKED DIAGNOSTICS l_context = PG_EXCEPTION_CONTEXT;",
    );
    sqlStatements.push("RAISE NOTICE 'ERROR:%', l_context;");
    sqlStatements.push("END;");
    sqlStatements.push("$$;");
    sqlStatements.push("");

    sqlStatements.push(
      `-- Summary: ${processedCount} WC locations processed, ${skippedCount} skipped`,
    );

    // Write SQL file
    fs.writeFileSync(outputFile, sqlStatements.join("\n"));

    console.log(
      `✅ Przetworzono: ${processedCount} lokalizacji WC, pominięto: ${skippedCount} wierszy`,
    );
    console.log(`📄 Plik SQL zapisany jako: ${outputFile}`);

    return { processedCount, skippedCount, photoCount: photoStatements.length };
  } catch (error) {
    console.error(
      `❌ Błąd podczas przetwarzania pliku ${csvFile}: ${error.message}`,
    );
    return {
      processedCount: 0,
      skippedCount: 0,
      photoCount: 0,
      error: error.message,
    };
  }
}

function main() {
  const args = process.argv.slice(2);

  if (args.length === 0 || args.includes("--help") || args.includes("-h")) {
    printUsage();
    process.exit(0);
  }

  const csvFolder = args[0];
  let outputDir = "./output";
  let userId = DEFAULT_USER_ID;
  let createdBy = DEFAULT_CREATED_BY;

  // Parse arguments
  for (let i = 1; i < args.length; i++) {
    if (args[i] === "--output-dir" || args[i] === "-o") {
      outputDir = args[++i];
    } else if (args[i] === "--user-id") {
      userId = args[++i];
    } else if (args[i] === "--created-by") {
      createdBy = args[++i];
    }
  }

  if (!fs.existsSync(csvFolder)) {
    console.error(`Błąd: Folder CSV nie istnieje: ${csvFolder}`);
    process.exit(1);
  }

  const stats = fs.statSync(csvFolder);
  if (!stats.isDirectory()) {
    console.error(`Błąd: ${csvFolder} nie jest folderem`);
    process.exit(1);
  }

  // Create output directory if it doesn't exist
  if (!fs.existsSync(outputDir)) {
    fs.mkdirSync(outputDir, { recursive: true });
    console.log(`Utworzono folder wyjściowy: ${outputDir}`);
  }

  // Find all CSV files in the folder
  const csvFiles = fs
    .readdirSync(csvFolder)
    .filter((file) => file.toLowerCase().endsWith(".csv"))
    .map((file) => path.join(csvFolder, file));

  if (csvFiles.length === 0) {
    console.error(`Błąd: Nie znaleziono plików CSV w folderze: ${csvFolder}`);
    process.exit(1);
  }

  console.log(
    `Znaleziono ${csvFiles.length} plików CSV w folderze: ${csvFolder}`,
  );
  console.log(`Folder wyjściowy SQL: ${outputDir}`);
  console.log(`User ID: ${userId}`);
  console.log(`Created by: ${createdBy}`);
  console.log("");

  // Process each CSV file
  let totalProcessed = 0;
  let totalSkipped = 0;
  let totalPhotos = 0;
  let totalErrors = 0;

  csvFiles.forEach((csvFile, index) => {
    console.log(
      `\n[${index + 1}/${csvFiles.length}] Przetwarzanie: ${path.basename(csvFile)}`,
    );
    const result = processCsvFile(csvFile, outputDir, userId, createdBy);

    totalProcessed += result.processedCount;
    totalSkipped += result.skippedCount;
    totalPhotos += result.photoCount;
    if (result.error) {
      totalErrors++;
    }
  });

  console.log(`\n🎉 Konwersja wszystkich plików zakończona!`);
  console.log(`📊 Statystyki ogólne:`);
  console.log(`   - Przetworzono plików CSV: ${csvFiles.length}`);
  console.log(`   - Błędy: ${totalErrors}`);
  console.log(`   - Lokalizacje WC: ${totalProcessed}`);
  console.log(`   - Pominięte wiersze: ${totalSkipped}`);
  console.log(`   - Zdjęcia: ${totalPhotos}`);
  console.log(`📁 Pliki SQL zapisane w: ${outputDir}`);
  console.log(`\n💡 Aby zaimportować dane do Supabase:`);
  console.log(`   1. Otwórz Supabase SQL Editor`);
  console.log(`   2. Wklej zawartość każdego pliku SQL z folderu ${outputDir}`);
  console.log(`   3. Wykonaj zapytania`);
  console.log(
    `\n⚠️  Uwaga: Upewnij się, że User ID ${userId} istnieje w tabeli auth.users`,
  );
}

if (require.main === module) {
  main();
}

module.exports = { generateWcInsert, generatePhotoInserts };
