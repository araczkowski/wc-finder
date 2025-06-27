#!/usr/bin/env node

/**
 * WC Finder Storage Cleanup Script
 *
 * This script removes all files from Supabase storage buckets:
 * - wc-images: Main WC images
 * - wc-photos: Additional WC photos
 *
 * WARNING: This operation is irreversible!
 * Make sure you have backups before running this script.
 *
 * Usage:
 * node scripts/cleanup-storage.js
 *
 * Environment variables required:
 * - SUPABASE_URL
 * - SUPABASE_SERVICE_ROLE_KEY
 */

const { createClient } = require('@supabase/supabase-js');
const path = require('path');
const fs = require('fs');

// ANSI color codes for console output
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
};

// Helper function for colored console output
function log(message, color = 'white') {
  console.log(`${colors[color]}${message}${colors.reset}`);
}

// Load environment variables
function loadEnvFile() {
  const envPath = path.join(__dirname, '..', '.env.local');

  if (fs.existsSync(envPath)) {
    const envContent = fs.readFileSync(envPath, 'utf8');
    const envLines = envContent.split('\n');

    envLines.forEach(line => {
      const trimmed = line.trim();
      if (trimmed && !trimmed.startsWith('#')) {
        const [key, ...valueParts] = trimmed.split('=');
        if (key && valueParts.length > 0) {
          const value = valueParts.join('=').replace(/^["']|["']$/g, '');
          process.env[key.trim()] = value;
        }
      }
    });

    log('✓ Loaded environment variables from .env.local', 'green');
  } else {
    log('⚠ .env.local file not found, using system environment variables', 'yellow');
  }
}

// Validate required environment variables
function validateEnvironment() {
  const required = ['SUPABASE_URL', 'SUPABASE_SERVICE_ROLE_KEY'];
  const missing = required.filter(key => !process.env[key]);

  if (missing.length > 0) {
    log('❌ Missing required environment variables:', 'red');
    missing.forEach(key => log(`   - ${key}`, 'red'));
    log('\nPlease set these variables in your .env.local file or environment.', 'red');
    process.exit(1);
  }

  log('✓ All required environment variables found', 'green');
}

// Initialize Supabase client
function initializeSupabase() {
  const supabaseUrl = process.env.SUPABASE_URL;
  const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

  return createClient(supabaseUrl, supabaseServiceKey, {
    auth: {
      autoRefreshToken: false,
      persistSession: false
    }
  });
}

// List all files in a bucket
async function listBucketFiles(supabase, bucketName) {
  try {
    const { data, error } = await supabase.storage
      .from(bucketName)
      .list('', {
        limit: 1000,
        sortBy: { column: 'name', order: 'asc' }
      });

    if (error) {
      if (error.message.includes('not found') || error.message.includes('does not exist')) {
        return { files: [], error: null };
      }
      throw error;
    }

    // Recursively get all files including in subdirectories
    const allFiles = [];

    for (const item of data || []) {
      if (item.metadata && item.metadata.size !== undefined) {
        // It's a file
        allFiles.push(item.name);
      } else {
        // It might be a directory, list its contents
        try {
          const { data: subData, error: subError } = await supabase.storage
            .from(bucketName)
            .list(item.name, {
              limit: 1000,
              sortBy: { column: 'name', order: 'asc' }
            });

          if (!subError && subData) {
            subData.forEach(subItem => {
              if (subItem.metadata && subItem.metadata.size !== undefined) {
                allFiles.push(`${item.name}/${subItem.name}`);
              }
            });
          }
        } catch (subErr) {
          // Ignore subdirectory errors, continue with other files
        }
      }
    }

    return { files: allFiles, error: null };
  } catch (error) {
    return { files: [], error };
  }
}

// Delete files from bucket
async function deleteBucketFiles(supabase, bucketName, files) {
  if (files.length === 0) {
    return { deletedCount: 0, errors: [] };
  }

  // Delete in batches to avoid rate limits
  const batchSize = 50;
  const batches = [];

  for (let i = 0; i < files.length; i += batchSize) {
    batches.push(files.slice(i, i + batchSize));
  }

  let deletedCount = 0;
  const errors = [];

  for (let i = 0; i < batches.length; i++) {
    const batch = batches[i];
    log(`   Deleting batch ${i + 1}/${batches.length} (${batch.length} files)...`, 'cyan');

    try {
      const { data, error } = await supabase.storage
        .from(bucketName)
        .remove(batch);

      if (error) {
        errors.push({ batch: i + 1, error: error.message });
        log(`   ⚠ Batch ${i + 1} failed: ${error.message}`, 'yellow');
      } else {
        deletedCount += batch.length;
        log(`   ✓ Batch ${i + 1} completed`, 'green');
      }
    } catch (err) {
      errors.push({ batch: i + 1, error: err.message });
      log(`   ❌ Batch ${i + 1} error: ${err.message}`, 'red');
    }

    // Small delay between batches
    if (i < batches.length - 1) {
      await new Promise(resolve => setTimeout(resolve, 100));
    }
  }

  return { deletedCount, errors };
}

// Clean up a single bucket
async function cleanupBucket(supabase, bucketName) {
  log(`\n🗂️  Processing bucket: ${bucketName}`, 'bright');

  // List files
  log('   📋 Listing files...', 'cyan');
  const { files, error: listError } = await listBucketFiles(supabase, bucketName);

  if (listError) {
    log(`   ❌ Error listing files: ${listError.message}`, 'red');
    return false;
  }

  if (files.length === 0) {
    log('   ✓ Bucket is already empty', 'green');
    return true;
  }

  log(`   📁 Found ${files.length} files`, 'blue');

  // Show first few files as preview
  const preview = files.slice(0, 5);
  preview.forEach(file => log(`      - ${file}`, 'white'));
  if (files.length > 5) {
    log(`      ... and ${files.length - 5} more files`, 'white');
  }

  // Delete files
  log(`   🗑️  Deleting ${files.length} files...`, 'cyan');
  const { deletedCount, errors } = await deleteBucketFiles(supabase, bucketName, files);

  if (errors.length > 0) {
    log(`   ⚠ Deleted ${deletedCount}/${files.length} files with ${errors.length} errors`, 'yellow');
    errors.forEach(err => log(`      Error in batch ${err.batch}: ${err.error}`, 'red'));
    return false;
  } else {
    log(`   ✅ Successfully deleted all ${deletedCount} files`, 'green');
    return true;
  }
}

// Main cleanup function
async function cleanupStorage() {
  log('🧹 WC Finder Storage Cleanup Script', 'bright');
  log('=====================================', 'bright');

  // Load environment
  loadEnvFile();
  validateEnvironment();

  // Initialize Supabase
  log('\n🔌 Connecting to Supabase...', 'cyan');
  const supabase = initializeSupabase();
  log('✓ Connected to Supabase', 'green');

  // Buckets to clean
  const buckets = ['wc-images', 'wc-photos'];

  // Warning
  log('\n⚠️  WARNING: This will permanently delete ALL files from storage buckets!', 'yellow');
  log('   Buckets to clean:', 'yellow');
  buckets.forEach(bucket => log(`   - ${bucket}`, 'yellow'));

  // In a real script, you might want to add confirmation prompt here
  // For automation, we'll proceed directly

  log('\n🚀 Starting cleanup process...', 'bright');

  const results = [];

  // Clean each bucket
  for (const bucketName of buckets) {
    const success = await cleanupBucket(supabase, bucketName);
    results.push({ bucket: bucketName, success });
  }

  // Summary
  log('\n📊 Cleanup Summary', 'bright');
  log('==================', 'bright');

  results.forEach(result => {
    const status = result.success ? '✅ SUCCESS' : '❌ FAILED';
    const color = result.success ? 'green' : 'red';
    log(`${status}: ${result.bucket}`, color);
  });

  const allSuccess = results.every(r => r.success);

  if (allSuccess) {
    log('\n🎉 All storage buckets cleaned successfully!', 'green');
    log('You can now run the database cleanup script.', 'green');
  } else {
    log('\n⚠️  Some buckets had errors. Check the logs above.', 'yellow');
    log('You may need to manually clean some files.', 'yellow');
  }

  log('\nNext steps:', 'bright');
  log('1. Run database cleanup: database/cleanup_all_data.sql', 'cyan');
  log('2. Verify cleanup with verification queries', 'cyan');
  log('3. Consider running setup script if starting fresh', 'cyan');
}

// Error handling
process.on('unhandledRejection', (reason, promise) => {
  log(`❌ Unhandled Rejection at: ${promise}`, 'red');
  log(`Reason: ${reason}`, 'red');
  process.exit(1);
});

process.on('uncaughtException', (error) => {
  log(`❌ Uncaught Exception: ${error.message}`, 'red');
  log(error.stack, 'red');
  process.exit(1);
});

// Run the cleanup
if (require.main === module) {
  cleanupStorage().catch(error => {
    log(`❌ Cleanup failed: ${error.message}`, 'red');
    console.error(error);
    process.exit(1);
  });
}

module.exports = { cleanupStorage };
