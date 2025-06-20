#!/usr/bin/env node

/**
 * OAuth Google and Supabase Connection Debug Script
 *
 * This script helps debug OAuth Google login and Supabase user creation issues.
 * Run with: node test-oauth-debug.js
 */

require('dotenv').config({ path: '.env.local' });
const { createClient } = require('@supabase/supabase-js');

console.log('🔍 OAuth Google & Supabase Debug Script');
console.log('========================================\n');

// Test 1: Check Environment Variables
console.log('1. CHECKING ENVIRONMENT VARIABLES...');
const requiredVars = [
  'NEXTAUTH_SECRET',
  'NEXTAUTH_URL',
  'GOOGLE_CLIENT_ID',
  'GOOGLE_CLIENT_SECRET',
  'SUPABASE_URL',
  'SUPABASE_SERVICE_ROLE_KEY',
  'NEXT_PUBLIC_SUPABASE_URL',
  'NEXT_PUBLIC_SUPABASE_ANON_KEY'
];

let envStatus = true;
requiredVars.forEach(varName => {
  const value = process.env[varName];
  if (value) {
    console.log(`✅ ${varName}: ${varName.includes('SECRET') || varName.includes('KEY') ? '***HIDDEN***' : value}`);
  } else {
    console.log(`❌ ${varName}: NOT SET`);
    envStatus = false;
  }
});

if (!envStatus) {
  console.log('\n❌ Some environment variables are missing!');
  console.log('Create .env.local file with all required variables.');
  process.exit(1);
}

console.log('\n2. TESTING SUPABASE CONNECTION...');

// Test 2: Supabase Connection
async function testSupabaseConnection() {
  try {
    const supabaseUrl = process.env.SUPABASE_URL;
    const supabaseServiceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

    if (!supabaseUrl || !supabaseServiceRoleKey) {
      throw new Error('Missing Supabase credentials');
    }

    const supabase = createClient(supabaseUrl, supabaseServiceRoleKey);

    // Test basic connection
    const { data: testData, error: testError } = await supabase
      .from('wcs')
      .select('count(*)', { count: 'exact' })
      .limit(1);

    if (testError) {
      console.log(`❌ Supabase connection failed: ${testError.message}`);
      return false;
    }

    console.log('✅ Supabase connection successful');
    console.log(`📊 WCS table records count: ${testData?.[0]?.count || 'Unknown'}`);

    return supabase;
  } catch (error) {
    console.log(`❌ Supabase connection error: ${error.message}`);
    return false;
  }
}

// Test 3: Auth Admin API
async function testAuthAdminAPI(supabase) {
  console.log('\n3. TESTING AUTH ADMIN API...');

  try {
    // Test listUsers function
    const { data: usersList, error: listError } = await supabase.auth.admin.listUsers();

    if (listError) {
      console.log(`❌ Admin listUsers failed: ${listError.message}`);
      return false;
    }

    console.log('✅ Admin listUsers successful');
    console.log(`👥 Total users in auth: ${usersList?.users?.length || 0}`);

    // Show sample of users (without sensitive data)
    if (usersList?.users?.length > 0) {
      console.log('\n📋 Sample users:');
      usersList.users.slice(0, 3).forEach((user, index) => {
        console.log(`   ${index + 1}. ID: ${user.id}`);
        console.log(`      Email: ${user.email}`);
        console.log(`      Confirmed: ${user.email_confirmed_at ? 'Yes' : 'No'}`);
        console.log(`      Provider: ${user.app_metadata?.provider || 'Unknown'}`);
      });
    }

    return true;
  } catch (error) {
    console.log(`❌ Auth Admin API error: ${error.message}`);
    return false;
  }
}

// Test 4: Test User Creation (Dry Run)
async function testUserCreation(supabase) {
  console.log('\n4. TESTING USER CREATION (DRY RUN)...');

  const testEmail = `test-oauth-${Date.now()}@example.com`;
  const testUserData = {
    email: testEmail,
    email_confirm: true,
    user_metadata: {
      name: 'Test OAuth User',
      provider: 'google',
    }
  };

  try {
    console.log(`🧪 Attempting to create test user: ${testEmail}`);

    const { data: newUser, error: createError } = await supabase.auth.admin.createUser(testUserData);

    if (createError) {
      console.log(`❌ User creation failed: ${createError.message}`);
      return false;
    }

    if (!newUser?.user?.id) {
      console.log('❌ User creation returned no ID');
      return false;
    }

    console.log('✅ Test user created successfully');
    console.log(`   User ID: ${newUser.user.id}`);
    console.log(`   Email: ${newUser.user.email}`);

    // Clean up test user
    console.log('🧹 Cleaning up test user...');
    const { error: deleteError } = await supabase.auth.admin.deleteUser(newUser.user.id);

    if (deleteError) {
      console.log(`⚠️  Failed to delete test user: ${deleteError.message}`);
      console.log(`   You may need to manually delete user: ${newUser.user.id}`);
    } else {
      console.log('✅ Test user cleaned up successfully');
    }

    return true;
  } catch (error) {
    console.log(`❌ User creation test error: ${error.message}`);
    return false;
  }
}

// Test 5: Check Database Tables
async function testDatabaseTables(supabase) {
  console.log('\n5. CHECKING DATABASE TABLES...');

  const tables = ['wcs', 'wc_rating', 'wc_photos'];

  for (const tableName of tables) {
    try {
      const { data, error } = await supabase
        .from(tableName)
        .select('count(*)', { count: 'exact' })
        .limit(1);

      if (error) {
        console.log(`❌ Table '${tableName}': ${error.message}`);
      } else {
        console.log(`✅ Table '${tableName}': ${data?.[0]?.count || 0} records`);
      }
    } catch (error) {
      console.log(`❌ Table '${tableName}': ${error.message}`);
    }
  }
}

// Test 6: Check for temp_ user_id records
async function checkTempUserIds(supabase) {
  console.log('\n6. CHECKING FOR TEMPORARY USER IDs...');

  const tables = ['wcs', 'wc_rating', 'wc_photos'];
  let foundTempIds = false;

  for (const tableName of tables) {
    try {
      const { data, error } = await supabase
        .from(tableName)
        .select('user_id')
        .like('user_id', 'temp_%')
        .limit(10);

      if (error) {
        console.log(`❌ Error checking ${tableName}: ${error.message}`);
      } else if (data && data.length > 0) {
        console.log(`⚠️  Found ${data.length} temp user_id records in '${tableName}':`);
        data.forEach((record, index) => {
          console.log(`   ${index + 1}. ${record.user_id}`);
        });
        foundTempIds = true;
      } else {
        console.log(`✅ No temp user_id records in '${tableName}'`);
      }
    } catch (error) {
      console.log(`❌ Error checking ${tableName}: ${error.message}`);
    }
  }

  if (foundTempIds) {
    console.log('\n⚠️  CLEANUP NEEDED:');
    console.log('   Found temporary user_id records that should be cleaned up.');
    console.log('   These records prevent proper OAuth functionality.');
    console.log('   Run cleanup SQL commands to remove them.');
  }
}

// Main execution
async function main() {
  const supabase = await testSupabaseConnection();

  if (!supabase) {
    console.log('\n❌ Cannot proceed - Supabase connection failed');
    process.exit(1);
  }

  const authOk = await testAuthAdminAPI(supabase);
  if (!authOk) {
    console.log('\n❌ Cannot proceed - Auth Admin API failed');
    process.exit(1);
  }

  await testUserCreation(supabase);
  await testDatabaseTables(supabase);
  await checkTempUserIds(supabase);

  console.log('\n========================================');
  console.log('🎯 DEBUG SUMMARY:');
  console.log('1. If all tests pass ✅, OAuth should work correctly');
  console.log('2. If Auth Admin API fails ❌, check SUPABASE_SERVICE_ROLE_KEY');
  console.log('3. If temp user_id records found ⚠️, run cleanup SQL');
  console.log('4. If table errors ❌, run database migration scripts');
  console.log('\n📚 Next steps:');
  console.log('   - Test OAuth login in browser');
  console.log('   - Check Vercel logs for any remaining errors');
  console.log('   - Verify Google Cloud Console redirect URIs');
}

// Run the tests
main().catch(error => {
  console.error('\n💥 Script failed:', error.message);
  process.exit(1);
});
