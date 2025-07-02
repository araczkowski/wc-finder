#!/usr/bin/env node

/**
 * Generate Keywords-Postal Codes Matrix Script
 *
 * This script reads:
 * - First column (postal codes) from Lista-kodów-pocztowych.csv
 * - Keywords from keywords.txt
 *
 * And generates a matrix combining each keyword with each postal code
 * using the format: "Keyword w PostalCode"
 *
 * Usage:
 * node scripts/generate-keywords-postal-codes.js
 */

const fs = require("fs");
const path = require("path");
const { parse } = require("csv-parse/sync");

// Configuration
const CONFIG = {
  postalCodesFile: "scraper/Lista-kodów-pocztowych.csv",
  keywordsFile: "scraper/keywords.txt",
  outputFile: "scraper/keywords-postal-codes.txt",
  separator: " w ",
  encoding: "utf-8",
};

// ANSI color codes for console output
const colors = {
  red: "\x1b[31m",
  green: "\x1b[32m",
  yellow: "\x1b[33m",
  blue: "\x1b[34m",
  cyan: "\x1b[36m",
  white: "\x1b[37m",
  reset: "\x1b[0m",
  bright: "\x1b[1m",
};

function log(message, color = "white") {
  console.log(`${colors[color]}${message}${colors.reset}`);
}

function logHeader(message) {
  console.log("\n" + "=".repeat(60));
  log(message, "bright");
  console.log("=".repeat(60));
}

function logStep(step, message) {
  log(`\n[${step}] ${message}`, "cyan");
}

function logSuccess(message) {
  log(`✅ ${message}`, "green");
}

function logError(message) {
  log(`❌ ${message}`, "red");
}

function logWarning(message) {
  log(`⚠️  ${message}`, "yellow");
}

// Read postal codes from CSV file (first column)
function readPostalCodes() {
  logStep(1, "Reading postal codes from CSV...");

  if (!fs.existsSync(CONFIG.postalCodesFile)) {
    throw new Error(`Postal codes file not found: ${CONFIG.postalCodesFile}`);
  }

  try {
    const csvContent = fs.readFileSync(CONFIG.postalCodesFile, CONFIG.encoding);
    const records = parse(csvContent, {
      columns: true,
      skip_empty_lines: true,
      delimiter: ";",
    });

    // Extract postal codes from first column (assuming it's named 'Kod')
    const postalCodes = records
      .map((record) => Object.values(record)[0]) // Get first column value
      .filter((code) => code && code.trim()) // Remove empty values
      .map((code) => code.trim()); // Trim whitespace

    log(`📋 Found ${postalCodes.length} postal codes`, "blue");

    // Show first few postal codes as preview
    const preview = postalCodes.slice(0, 5);
    preview.forEach((code) => log(`   - ${code}`, "white"));
    if (postalCodes.length > 5) {
      log(`   ... and ${postalCodes.length - 5} more codes`, "white");
    }

    return postalCodes;
  } catch (error) {
    throw new Error(`Error reading postal codes: ${error.message}`);
  }
}

// Read keywords from text file
function readKeywords() {
  logStep(2, "Reading keywords from text file...");

  if (!fs.existsSync(CONFIG.keywordsFile)) {
    throw new Error(`Keywords file not found: ${CONFIG.keywordsFile}`);
  }

  try {
    const content = fs.readFileSync(CONFIG.keywordsFile, CONFIG.encoding);
    const keywords = content
      .split("\n")
      .map((line) => line.trim())
      .filter((line) => line && !line.startsWith("#")); // Remove empty lines and comments

    log(`📝 Found ${keywords.length} keywords`, "blue");

    // Show all keywords as preview
    keywords.forEach((keyword) => log(`   - ${keyword}`, "white"));

    return keywords;
  } catch (error) {
    throw new Error(`Error reading keywords: ${error.message}`);
  }
}

// Generate keyword-postal code combinations
function generateCombinations(keywords, postalCodes) {
  logStep(3, "Generating keyword-postal code combinations...");

  const combinations = [];

  for (const keyword of keywords) {
    for (const postalCode of postalCodes) {
      const combination = `${keyword}${CONFIG.separator}${postalCode}`;
      combinations.push(combination);
    }
  }

  log(`🔄 Generated ${combinations.length} combinations`, "blue");
  log(
    `📊 Matrix: ${keywords.length} keywords × ${postalCodes.length} postal codes`,
    "blue",
  );

  return combinations;
}

// Write combinations to output file
function writeCombinations(combinations) {
  logStep(4, "Writing combinations to output file...");

  try {
    // Create output directory if it doesn't exist
    const outputDir = path.dirname(CONFIG.outputFile);
    if (!fs.existsSync(outputDir)) {
      fs.mkdirSync(outputDir, { recursive: true });
      log(`📁 Created directory: ${outputDir}`, "cyan");
    }

    const content = combinations.join("\n");

    fs.writeFileSync(CONFIG.outputFile, content, CONFIG.encoding);

    logSuccess(`Combinations written to: ${CONFIG.outputFile}`);
    log(`💾 File size: ${(content.length / 1024).toFixed(2)} KB`, "blue");

    return true;
  } catch (error) {
    throw new Error(`Error writing combinations: ${error.message}`);
  }
}

// Show preview of generated combinations
function showPreview(combinations) {
  logStep(5, "Preview of generated combinations:");

  console.log();
  const preview = combinations.slice(0, 10);
  preview.forEach((combination, index) => {
    log(`${index + 1}. ${combination}`, "white");
  });

  if (combinations.length > 10) {
    log(`... and ${combinations.length - 10} more combinations`, "white");
  }
}

// Main function
async function main() {
  try {
    logHeader("🔄 Keywords-Postal Codes Matrix Generator");

    log("📁 Input files:", "cyan");
    log(`   Postal codes: ${CONFIG.postalCodesFile}`, "white");
    log(`   Keywords: ${CONFIG.keywordsFile}`, "white");
    log(`📁 Output file: ${CONFIG.outputFile}`, "cyan");
    log(`🔗 Separator: "${CONFIG.separator}"`, "cyan");

    // Read input files
    const postalCodes = readPostalCodes();
    const keywords = readKeywords();

    // Generate combinations
    const combinations = generateCombinations(keywords, postalCodes);

    // Show preview
    showPreview(combinations);

    // Write to output file
    writeCombinations(combinations);

    logHeader("✅ Generation Complete!");

    log("📊 Summary:", "bright");
    log(`   Keywords: ${keywords.length}`, "green");
    log(`   Postal codes: ${postalCodes.length}`, "green");
    log(`   Total combinations: ${combinations.length}`, "green");
    log(`   Output file: ${CONFIG.outputFile}`, "green");

    log("\n💡 Next steps:", "bright");
    log("1. Review the generated file for accuracy", "cyan");
    log("2. Use the combinations for SEO or search purposes", "cyan");
    log("3. Import into your application as needed", "cyan");
  } catch (error) {
    logError(`Generation failed: ${error.message}`);
    console.error(error);
    process.exit(1);
  }
}

// Error handling
process.on("unhandledRejection", (reason, promise) => {
  logError(`Unhandled Rejection: ${reason}`);
  process.exit(1);
});

process.on("uncaughtException", (error) => {
  logError(`Uncaught Exception: ${error.message}`);
  console.error(error);
  process.exit(1);
});

// Run the script
if (require.main === module) {
  main();
}

module.exports = {
  readPostalCodes,
  readKeywords,
  generateCombinations,
  writeCombinations,
  CONFIG,
};
