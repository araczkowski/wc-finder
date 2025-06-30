#!/usr/bin/env node

const fs = require("fs");
const path = require("path");
const { spawn } = require("child_process");

// Configuration for Poland data import
const POLAND_CONFIG = {
  csvFile: "scraper/poland.csv",
  outputFile: "imports/poland_wc_import.sql",
  userId: "00000000-0000-0000-0000-000000000000", // Default admin user
  createdBy: "admin@sviete.pl",
  batchSize: 500, // Process in batches to avoid memory issues
};

function printUsage() {
  console.log(`
🇵🇱 Import Poland WC Data - Skrypt importu danych toalet z poland.csv

Użycie: node scripts/import-poland-data.js [opcje]

Opcje:
  --user-id <uuid>        UUID użytkownika dla importowanych danych
  --created-by <email>    Email użytkownika dla importowanych danych
  --output, -o <plik>     Plik wyjściowy SQL
  --batch-size <liczba>   Rozmiar batcha (domyślnie: 500)
  --preview               Pokaż tylko pierwsze 10 rekordów
  --validate              Tylko walidacja pliku CSV
  --help, -h              Pokaż tę pomoc

Przykłady:
  # Standardowy import
  npm run import-poland

  # Import z custom user ID
  node scripts/import-poland-data.js --user-id "real-admin-uuid"

  # Podgląd pierwszych rekordów
  node scripts/import-poland-data.js --preview

  # Walidacja pliku
  node scripts/import-poland-data.js --validate

Mapowanie danych Poland.csv:
  ✅ input_id (A) → google_place_id
  ✅ title (C) → name
  ✅ category (D) → place_type (auto-mapowane na enum)
  ✅ address (E) → address
  ✅ review_rating (L) → rating (×2, ograniczone 1-10)
  ✅ latitude/longitude (M/N) → PostGIS location
  ✅ thumbnail (T) → image_url
  ✅ images JSON (X) → wc_photos (parsowane)

Statystyki pliku poland.csv:
  📊 ~1,400+ rekordów toalet w Polsce
  🖼️ ~9,000+ zdjęć do importu
  📍 Głównie: Wrocław, Warszawa, Kraków, Gdańsk
`);
}

function validateCsvFile() {
  console.log("🔍 Walidacja pliku poland.csv...");

  if (!fs.existsSync(POLAND_CONFIG.csvFile)) {
    console.error(`❌ Błąd: Plik ${POLAND_CONFIG.csvFile} nie istnieje`);
    console.log(
      "💡 Upewnij się, że plik poland.csv znajduje się w katalogu scraper/",
    );
    process.exit(1);
  }

  try {
    const stats = fs.statSync(POLAND_CONFIG.csvFile);
    console.log(
      `📄 Rozmiar pliku: ${(stats.size / 1024 / 1024).toFixed(2)} MB`,
    );

    const content = fs.readFileSync(POLAND_CONFIG.csvFile, "utf-8");
    const lines = content.split("\n").length;
    console.log(`📝 Liczba linii: ${lines}`);

    // Check header
    const firstLine = content.split("\n")[0];
    const expectedHeaders = [
      "input_id",
      "title",
      "category",
      "address",
      "review_rating",
      "latitude",
      "longitude",
      "thumbnail",
      "images",
    ];

    const hasRequiredHeaders = expectedHeaders.every((header) =>
      firstLine.includes(header),
    );

    if (hasRequiredHeaders) {
      console.log("✅ Nagłówki CSV są poprawne");
    } else {
      console.warn("⚠️ Niektóre oczekiwane nagłówki mogą brakować");
    }

    return true;
  } catch (error) {
    console.error(`❌ Błąd podczas walidacji: ${error.message}`);
    return false;
  }
}

function createOutputDirectory() {
  const outputDir = path.dirname(POLAND_CONFIG.outputFile);
  if (!fs.existsSync(outputDir)) {
    fs.mkdirSync(outputDir, { recursive: true });
    console.log(`📁 Utworzono katalog: ${outputDir}`);
  }
}

function runCsvToSql(options = {}) {
  return new Promise((resolve, reject) => {
    const args = [
      "scripts/csv-to-sql.js",
      POLAND_CONFIG.csvFile,
      "-o",
      options.outputFile || POLAND_CONFIG.outputFile,
      "--user-id",
      options.userId || POLAND_CONFIG.userId,
      "--created-by",
      options.createdBy || POLAND_CONFIG.createdBy,
    ];

    console.log(`🚀 Uruchamianie konwersji CSV → SQL...`);
    console.log(`📁 Wejście: ${POLAND_CONFIG.csvFile}`);
    console.log(
      `📁 Wyjście: ${options.outputFile || POLAND_CONFIG.outputFile}`,
    );

    const childProcess = spawn("node", args, {
      stdio: "inherit",
      cwd: process.cwd(),
    });

    childProcess.on("close", (code) => {
      if (code === 0) {
        resolve();
      } else {
        reject(new Error(`Proces zakończył się z kodem: ${code}`));
      }
    });

    childProcess.on("error", (error) => {
      reject(error);
    });
  });
}

function showPreview() {
  console.log("👀 Podgląd danych z poland.csv (pierwsze 5 rekordów):\n");

  try {
    const content = fs.readFileSync(POLAND_CONFIG.csvFile, "utf-8");
    const lines = content.split("\n");
    const headers = lines[0].split(",");

    // Find relevant column indices
    const titleIdx = headers.findIndex((h) => h.includes("title"));
    const categoryIdx = headers.findIndex((h) => h.includes("category"));
    const addressIdx = headers.findIndex((h) => h.includes("address"));
    const ratingIdx = headers.findIndex((h) => h.includes("review_rating"));

    console.log("📋 Mapowanie kolumn:");
    console.log(`   title (kolumna ${titleIdx}) → name`);
    console.log(`   category (kolumna ${categoryIdx}) → place_type`);
    console.log(`   address (kolumna ${addressIdx}) → address`);
    console.log(`   review_rating (kolumna ${ratingIdx}) → rating\n`);

    for (let i = 1; i <= Math.min(6, lines.length - 1); i++) {
      const cols = lines[i].split(",");
      if (cols.length > Math.max(titleIdx, categoryIdx, addressIdx)) {
        console.log(`${i}. 🚽 ${cols[titleIdx]?.replace(/"/g, "")}`);
        console.log(`   📍 ${cols[addressIdx]?.replace(/"/g, "")}`);
        console.log(`   🏷️ ${cols[categoryIdx]?.replace(/"/g, "")}`);
        console.log(`   ⭐ ${cols[ratingIdx] || "brak oceny"}`);
        console.log("");
      }
    }
  } catch (error) {
    console.error(`❌ Błąd podczas podglądu: ${error.message}`);
  }
}

function showImportInstructions(outputFile) {
  console.log(`
🎉 Import danych z poland.csv zakończony pomyślnie!

📁 Wygenerowany plik SQL: ${outputFile}

📋 Następne kroki:

1️⃣ Przygotuj użytkownika admin w Supabase:
   Otwórz Supabase SQL Editor i wykonaj:

   INSERT INTO auth.users (id, email, created_at, updated_at, email_confirmed_at)
   VALUES (
     '${POLAND_CONFIG.userId}',
     '${POLAND_CONFIG.createdBy}',
     NOW(),
     NOW(),
     NOW()
   ) ON CONFLICT (id) DO NOTHING;

2️⃣ Zaimportuj dane WC:
   Otwórz Supabase SQL Editor
   Skopiuj całą zawartość pliku: ${outputFile}
   Wykonaj zapytanie (może potrwać 2-5 minut)

3️⃣ Sprawdź wyniki:
   SELECT COUNT(*) FROM wcs WHERE created_by = '${POLAND_CONFIG.createdBy}';
   SELECT COUNT(*) FROM wc_photos
   JOIN wcs ON wc_photos.wc_id = wcs.id
   WHERE wcs.created_by = '${POLAND_CONFIG.createdBy}';

💡 Wskazówki:
   - Import może potrwać kilka minut ze względu na dużą ilość zdjęć
   - Po imporcie sprawdź logi Supabase pod kątem błędów
   - Można importować dane partiami jeśli wystąpią problemy

🗺️ Dane zawierają toalety z całej Polski, głównie:
   • Wrocław i okolice
   • Warszawa
   • Kraków
   • Gdańsk
   • Inne miasta w Polsce
`);
}

async function main() {
  const args = process.argv.slice(2);

  if (args.includes("--help") || args.includes("-h")) {
    printUsage();
    process.exit(0);
  }

  console.log("🇵🇱 Import Poland WC Data - Skrypt importu toalet z Polski\n");

  // Parse arguments
  let userId = POLAND_CONFIG.userId;
  let createdBy = POLAND_CONFIG.createdBy;
  let outputFile = POLAND_CONFIG.outputFile;
  let isPreview = false;
  let isValidateOnly = false;

  for (let i = 0; i < args.length; i++) {
    if (args[i] === "--user-id") {
      userId = args[++i];
    } else if (args[i] === "--created-by") {
      createdBy = args[++i];
    } else if (args[i] === "--output" || args[i] === "-o") {
      outputFile = args[++i];
    } else if (args[i] === "--preview") {
      isPreview = true;
    } else if (args[i] === "--validate") {
      isValidateOnly = true;
    }
  }

  // Validate CSV file
  if (!validateCsvFile()) {
    process.exit(1);
  }

  if (isValidateOnly) {
    console.log("✅ Walidacja zakończona pomyślnie");
    process.exit(0);
  }

  if (isPreview) {
    showPreview();
    process.exit(0);
  }

  try {
    // Create output directory
    createOutputDirectory();

    // Run conversion
    await runCsvToSql({
      userId,
      createdBy,
      outputFile,
    });

    // Show success message and instructions
    showImportInstructions(outputFile);
  } catch (error) {
    console.error(`❌ Błąd podczas importu: ${error.message}`);
    process.exit(1);
  }
}

if (require.main === module) {
  main();
}

module.exports = { validateCsvFile, showPreview, POLAND_CONFIG };
