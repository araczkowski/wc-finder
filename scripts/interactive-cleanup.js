#!/usr/bin/env node

/**
 * Interactive WC Finder Data Cleanup Script
 *
 * This script provides an interactive way to clean up all data from WC Finder:
 * - Database tables (wcs, wc_tags, wc_photos, wc_ratings)
 * - Storage buckets (wc-images, wc-photos)
 *
 * Features:
 * - Interactive confirmation prompts
 * - Step-by-step cleanup process
 * - Safety checks and warnings
 * - Detailed progress reporting
 *
 * Usage:
 * node scripts/interactive-cleanup.js
 */

const readline = require('readline');
const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');

// ANSI color codes
const colors = {
  red: '\x1b[31m',
  green: '\x1b[32m',
  yellow: '\x1b[33m',
  blue: '\x1b[34m',
  magenta: '\x1b[35m',
  cyan: '\x1b[36m',
  white: '\x1b[37m',
  reset: '\x1b[0m',
  bright: '\x1b[1m',
  dim: '\x1b[2m',
};

// Helper functions
function log(message, color = 'white') {
  console.log(`${colors[color]}${message}${colors.reset}`);
}

function logHeader(message) {
  console.log('\n' + '='.repeat(60));
  log(message, 'bright');
  console.log('='.repeat(60));
}

function logStep(step, message) {
  log(`\n[${step}] ${message}`, 'cyan');
}

function logSuccess(message) {
  log(`✅ ${message}`, 'green');
}

function logWarning(message) {
  log(`⚠️  ${message}`, 'yellow');
}

function logError(message) {
  log(`❌ ${message}`, 'red');
}

// Create readline interface
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Promisify readline question
function question(prompt) {
  return new Promise((resolve) => {
    rl.question(prompt, resolve);
  });
}

// Check if environment is set up
function checkEnvironment() {
  const envPath = path.join(__dirname, '..', '.env.local');

  if (!fs.existsSync(envPath)) {
    logError('.env.local file not found!');
    log('Please create .env.local with your Supabase credentials.', 'red');
    return false;
  }

  // Check if cleanup scripts exist
  const storageScript = path.join(__dirname, 'cleanup-storage.js');
  const sqlScript = path.join(__dirname, '..', 'database', 'cleanup_all_data.sql');

  if (!fs.existsSync(storageScript)) {
    logError('Storage cleanup script not found!');
    log(`Expected: ${storageScript}`, 'red');
    return false;
  }

  if (!fs.existsSync(sqlScript)) {
    logError('SQL cleanup script not found!');
    log(`Expected: ${sqlScript}`, 'red');
    return false;
  }

  return true;
}

// Show warning and get confirmation
async function showWarningAndConfirm() {
  logHeader('🚨 DANGER ZONE 🚨');

  logWarning('This script will PERMANENTLY DELETE ALL DATA from:');
  console.log();
  log('📊 Database Tables:', 'yellow');
  log('   • wcs (all WC records)', 'white');
  log('   • wc_tags (all tags)', 'white');
  log('   • wc_photos (all photo records)', 'white');
  log('   • wc_ratings (all ratings)', 'white');

  console.log();
  log('🗂️  Storage Buckets:', 'yellow');
  log('   • wc-images (all WC images)', 'white');
  log('   • wc-photos (all additional photos)', 'white');

  console.log();
  logError('THIS OPERATION CANNOT BE UNDONE!');
  logWarning('Make sure you have backups before proceeding.');

  console.log();
  const confirm1 = await question('Do you want to proceed? (type "yes" to continue): ');

  if (confirm1.toLowerCase() !== 'yes') {
    log('Operation cancelled by user.', 'yellow');
    return false;
  }

  console.log();
  logWarning('Are you absolutely sure? This will delete EVERYTHING!');
  const confirm2 = await question('Type "DELETE ALL DATA" to confirm: ');

  if (confirm2 !== 'DELETE ALL DATA') {
    log('Operation cancelled. Confirmation text did not match.', 'yellow');
    return false;
  }

  return true;
}

// Execute storage cleanup
async function cleanupStorage() {
  logStep('1', 'Cleaning up storage buckets...');

  try {
    // Check if cleanup-storage.js exists
    const scriptPath = path.join(__dirname, 'cleanup-storage.js');

    log('Executing storage cleanup script...', 'cyan');
    execSync(`node "${scriptPath}"`, {
      stdio: 'inherit',
      cwd: path.join(__dirname, '..')
    });

    logSuccess('Storage cleanup completed!');
    return true;
  } catch (error) {
    logError(`Storage cleanup failed: ${error.message}`);
    log('You may need to manually delete files from Supabase storage.', 'yellow');
    return false;
  }
}

// Show database cleanup instructions
async function showDatabaseInstructions() {
  logStep('2', 'Database cleanup instructions');

  log('The storage cleanup is done. Now you need to clean the database.', 'cyan');
  console.log();

  log('📋 Next steps:', 'bright');
  log('1. Open Supabase Dashboard', 'white');
  log('2. Go to SQL Editor', 'white');
  log('3. Create a new query', 'white');
  log('4. Copy and paste the content from:', 'white');
  log(`   ${path.join(__dirname, '..', 'database', 'cleanup_all_data.sql')}`, 'cyan');
  log('5. Review the script carefully', 'white');
  log('6. Execute the script', 'white');

  console.log();
  logWarning('The SQL script includes verification queries to confirm cleanup.');

  const continuePrompt = await question('\nPress Enter when you have completed the database cleanup...');

  return true;
}

// Verify cleanup
async function verifyCleanup() {
  logStep('3', 'Cleanup verification');

  log('To verify the cleanup was successful, run these queries in Supabase:', 'cyan');
  console.log();

  log('-- Check database tables', 'dim');
  log('SELECT count(*) as wcs_count FROM wcs;', 'white');
  log('SELECT count(*) as tags_count FROM wc_tags;', 'white');
  log('SELECT count(*) as photos_count FROM wc_photos;', 'white');
  log('SELECT count(*) as ratings_count FROM wc_ratings;', 'white');

  console.log();
  log('-- Check storage buckets', 'dim');
  log("SELECT count(*) as storage_files FROM storage.objects WHERE bucket_id IN ('wc-images', 'wc-photos');", 'white');

  console.log();
  log('All counts should be 0 (zero) if cleanup was successful.', 'yellow');
}

// Show recovery information
async function showRecoveryInfo() {
  logHeader('🔄 Recovery Information');

  log('If you need to restore data after cleanup:', 'cyan');
  console.log();

  log('📊 Database Recovery:', 'bright');
  log('   • Restore from your database backup', 'white');
  log('   • Re-run setup script: database/setup_wc_tags_complete.sql', 'white');

  console.log();
  log('🗂️  Storage Recovery:', 'bright');
  log('   • Re-upload images to wc-images bucket', 'white');
  log('   • Re-upload photos to wc-photos bucket', 'white');
  log('   • Update database records with new image URLs', 'white');

  console.log();
  log('🚀 Fresh Start:', 'bright');
  log('   • Run database/setup_wc_tags_complete.sql for clean setup', 'white');
  log('   • Create storage buckets if they were deleted', 'white');
  log('   • Set up proper RLS policies', 'white');
}

// Main cleanup process
async function runInteractiveCleanup() {
  try {
    logHeader('🧹 WC Finder Interactive Cleanup');

    // Check environment
    if (!checkEnvironment()) {
      logError('Environment check failed. Please fix the issues above.');
      rl.close();
      process.exit(1);
    }

    logSuccess('Environment check passed.');

    // Show warning and get confirmation
    const confirmed = await showWarningAndConfirm();

    if (!confirmed) {
      log('\nCleanup cancelled. No data was deleted.', 'green');
      rl.close();
      return;
    }

    logHeader('🚀 Starting Cleanup Process');

    // Step 1: Clean storage
    const storageSuccess = await cleanupStorage();

    if (!storageSuccess) {
      logWarning('Storage cleanup had issues, but continuing...');
    }

    // Step 2: Database cleanup instructions
    await showDatabaseInstructions();

    // Step 3: Verification
    await verifyCleanup();

    // Show recovery info
    await showRecoveryInfo();

    logHeader('✅ Cleanup Process Complete');

    logSuccess('Interactive cleanup completed!');
    log('Remember to verify the cleanup using the queries provided above.', 'cyan');

  } catch (error) {
    logError(`Cleanup process failed: ${error.message}`);
    console.error(error);
  } finally {
    rl.close();
  }
}

// Handle script interruption
process.on('SIGINT', () => {
  console.log('\n');
  logWarning('Cleanup interrupted by user.');
  rl.close();
  process.exit(0);
});

// Error handling
process.on('unhandledRejection', (reason, promise) => {
  logError(`Unhandled Rejection: ${reason}`);
  rl.close();
  process.exit(1);
});

process.on('uncaughtException', (error) => {
  logError(`Uncaught Exception: ${error.message}`);
  rl.close();
  process.exit(1);
});

// Run the interactive cleanup
if (require.main === module) {
  runInteractiveCleanup();
}

module.exports = { runInteractiveCleanup };
