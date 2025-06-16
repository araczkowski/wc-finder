import { createClient } from '@supabase/supabase-js';
import { NextResponse } from 'next/server';

export async function POST(request) {
  let reqBody;
  try {
    reqBody = await request.json();
  } catch (error) {
    return NextResponse.json({ message: 'Invalid JSON body.' }, { status: 400 });
  }

  const { email } = reqBody;

  if (!email) {
    return NextResponse.json(
      { message: 'Email is required.' },
      { status: 400 }
    );
  }

  const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

  if (!supabaseUrl || !supabaseAnonKey) {
    console.error('[Resend Confirmation] Supabase URL or Anon Key is not defined in environment variables.');
    return NextResponse.json(
      { message: 'Server configuration error. Please try again later.' },
      { status: 500 }
    );
  }

  const supabase = createClient(supabaseUrl, supabaseAnonKey);

  // You might want to customize the redirect URL for the confirmation email if needed
  // const confirmationRedirectUrl = `${new URL(request.url).origin}/auth/signin?status=email_resent_and_confirmed`;

  const { data, error } = await supabase.auth.resend({
    type: 'signup', // Use 'signup' for resending confirmation for new accounts
    email: email,
    // options: { // Optional: if you need to specify a redirect for the newly sent email
    //   emailRedirectTo: confirmationRedirectUrl,
    // }
  });

  if (error) {
    console.error('[Resend Confirmation] Supabase resend error:', JSON.stringify(error, null, 2));
    // Provide a more generic error message to the client for security
    // You can log the specific error for debugging
    let errorMessage = 'Failed to resend confirmation email. Please try again later.';
    if (error.message && error.message.toLowerCase().includes('rate limit exceeded')) {
        errorMessage = 'Too many requests to resend email. Please try again in a few minutes.';
        return NextResponse.json({ message: errorMessage }, { status: 429 });
    }
    // Supabase might return specific errors if the user doesn't exist or is already confirmed,
    // but often it will succeed even if the user is already confirmed or doesn't exist to prevent email enumeration.
    // The behavior can depend on Supabase project settings.
    // For simplicity, we assume a general failure if an error occurs.
    return NextResponse.json(
      { message: errorMessage, details: error.message }, // Include details for server logging, not necessarily for client
      { status: error.status || 500 }
    );
  }

  // If Supabase's resend method doesn't error, it's generally considered successful from an API perspective.
  // The user should check their email. `data` is often null or { user: null, session: null } for resend.
  console.log('[Resend Confirmation] Supabase resend successful for email:', email, 'Data:', JSON.stringify(data, null, 2));

  return NextResponse.json(
    { message: 'If an account exists for this email and it is not yet confirmed, a new confirmation email has been sent. Please check your inbox (and spam folder).' },
    { status: 200 }
  );
}
