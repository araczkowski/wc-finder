#!/usr/bin/env node

const crypto = require('crypto');

/**
 * Generate a secure NEXTAUTH_SECRET for NextAuth.js
 * This script creates a cryptographically secure random string
 * suitable for JWT encryption/decryption
 */

function generateNextAuthSecret() {
  // Generate 32 bytes (256 bits) of random data
  const randomBytes = crypto.randomBytes(32);

  // Convert to base64 string
  const secret = randomBytes.toString('base64');

  return secret;
}

function main() {
  console.log('🔐 NextAuth Secret Generator');
  console.log('=' .repeat(50));

  const secret = generateNextAuthSecret();

  console.log('\n✅ Generated NEXTAUTH_SECRET:');
  console.log(`${secret}`);

  console.log('\n📝 How to use:');
  console.log('1. Copy the secret above');
  console.log('2. Add to .env.local (development):');
  console.log(`   NEXTAUTH_SECRET=${secret}`);
  console.log('3. Add to Vercel (production):');
  console.log('   - Go to Vercel Dashboard');
  console.log('   - Project Settings → Environment Variables');
  console.log(`   - Set: NEXTAUTH_SECRET = ${secret}`);
  console.log('4. Restart your development server');
  console.log('5. Redeploy your production app');

  console.log('\n⚠️  Important:');
  console.log('- Use the SAME secret in both development and production');
  console.log('- Keep this secret private and secure');
  console.log('- Clear browser cookies after changing the secret');

  console.log('\n🔄 To generate a new secret, run:');
  console.log('   node generate-secret.js');

  console.log('\n📚 More info:');
  console.log('   https://next-auth.js.org/configuration/options#secret');
}

// Run if called directly
if (require.main === module) {
  main();
}

module.exports = { generateNextAuthSecret };
