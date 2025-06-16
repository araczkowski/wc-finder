import { createClient } from '@supabase/supabase-js';
import { NextResponse } from 'next/server';

export async function POST(request) {
  let reqBody;
  try {
    reqBody = await request.json();
  } catch (error) {
    return NextResponse.json({ message: 'Invalid JSON body.' }, { status: 400 });
  }

  const { email, password, name } = reqBody;

  if (!email || !password) {
    return NextResponse.json(
      { message: 'Email and password are required.' },
      { status: 400 }
    );
  }
  if (password.length < 8) {
    // This is a basic example; consider more robust password policies
    return NextResponse.json(
      { message: 'Password must be at least 8 characters long.' },
      { status: 400 }
    );
  }

  const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

  if (!supabaseUrl || !supabaseAnonKey) {
    console.error('Supabase URL or Anon Key is not defined in environment variables.');
    return NextResponse.json(
      { message: 'Server configuration error. Please try again later.' },
      { status: 500 }
    );
  }

  const supabase = createClient(supabaseUrl, supabaseAnonKey);

  // You can customize the redirect URL for the confirmation email
  // const confirmationRedirectUrl = `${new URL(request.url).origin}/auth/signin?status=email_confirmed`;

  const { data, error } = await supabase.auth.signUp({
    email: email,
    password: password,
    options: {
      data: {
        // Supabase stores this in user_metadata.
        // The NextAuth adapter, when user logs in, can pick this up.
        // Common practice is 'full_name' or 'name'.
        // Let's use 'name' to align with what NextAuth might expect for user.name
        name: name || '',
      },
      // If you want the confirmation email link to redirect the user to a specific page after successful confirmation:
      // emailRedirectTo: confirmationRedirectUrl,
    },
  });

  if (error) {
    console.error('Supabase signUp error:', error.message);
    // Map Supabase specific errors to more generic messages if needed
    if (error.message.toLowerCase().includes('user already registered')) {
        return NextResponse.json({ message: 'This email address is already registered.' }, { status: 409 }); // 409 Conflict
    }
    if (error.message.toLowerCase().includes('rate limit exceeded')) {
        return NextResponse.json({ message: 'Too many requests. Please try again later.' }, { status: 429 });
    }
    // For other errors, use the message from Supabase or a generic one
    return NextResponse.json(
      { message: error.message || 'An unexpected error occurred during registration.' },
      { status: error.status || 500 } // Use Supabase error status if available, otherwise 500
    );
  }

  // data.user contains the user object (id, email, etc.) from supabase.auth.users
  // data.session will be null if email confirmation is required by your Supabase project settings
  // and the email has not yet been confirmed.
  // If email confirmation is disabled, data.session will contain an active session.

  let responseMessage = 'Account registration initiated.';

  if (data.user && data.user.identities && data.user.identities.length === 0) {
    // This can happen if "Confirm email" is OFF, but "Enable phone confirmations" is ON and no phone was provided.
    // Or other scenarios where sign up seems to complete but user object is not fully formed for login.
    // In most email/password cases with "Confirm email" ON, this path won't be hit if data.user is present.
     responseMessage = 'Account created, but requires further steps for activation. Please check for confirmation instructions.';
  } else if (data.user && !data.session && data.user.email_confirmed_at === null) {
    // Standard case when "Confirm email" is ON in Supabase settings
    responseMessage = 'Account created successfully. Please check your email to confirm your registration.';
  } else if (data.user && data.session) {
    // This case occurs if "Confirm email" is OFF in Supabase settings, or if using a flow that auto-confirms.
    responseMessage = 'Account created successfully and you are now signed in.';
    // Note: This API route itself doesn't establish a NextAuth session.
    // The client would typically then try to sign in via CredentialsProvider using NextAuth,
    // which would validate against Supabase and establish the NextAuth session.
  } else if (data.user) {
    // A user object was returned, but session status is unclear or doesn't fit above.
    // This could happen if "Confirm email" is ON but for some reason data.session isn't explicitly null.
    // Check email_confirmed_at as the source of truth.
     if (data.user.email_confirmed_at === null) {
        responseMessage = 'Account created. Please check your email to confirm your registration.';
     } else {
        responseMessage = 'Account created successfully.';
     }
  }


  return NextResponse.json(
    {
      message: responseMessage,
      // Avoid sending back the full user or session object from here unless specifically needed by the client
      // and ensure no sensitive data is exposed.
      // userId: data.user?.id, // Example: if client needs the ID
    },
    { status: 201 } // 201 Created
  );
}
