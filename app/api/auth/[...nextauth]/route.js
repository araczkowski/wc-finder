import NextAuth from "next-auth";
import GoogleProvider from "next-auth/providers/google";
import CredentialsProvider from "next-auth/providers/credentials";
import { SupabaseAdapter } from "@next-auth/supabase-adapter";
import { createClient } from "@supabase/supabase-js";
import jwt from "jsonwebtoken"; // Ensure this is installed: npm install jsonwebtoken

export const authOptions = {
  adapter: SupabaseAdapter({
    url: process.env.SUPABASE_URL,
    secret: process.env.SUPABASE_SERVICE_ROLE_KEY,
  }),
  providers: [
    GoogleProvider({
      clientId: process.env.GOOGLE_CLIENT_ID,
      clientSecret: process.env.GOOGLE_CLIENT_SECRET,
    }),
    CredentialsProvider({
      name: "Email and Password",
      credentials: {
        email: { label: "Email", type: "email", placeholder: "your@email.com" },
        password: { label: "Password", type: "password" },
      },
      async authorize(credentials, req) {
        if (!credentials?.email || !credentials.password) {
          console.error(
            "[NextAuth Authorize] Credentials missing email or password",
          );
          throw new Error("Email and password are required.");
        }

        console.log(
          `[NextAuth Authorize] Attempting to sign in user: ${credentials.email}`,
        );

        // Ensure NEXT_PUBLIC_SUPABASE_URL and NEXT_PUBLIC_SUPABASE_ANON_KEY are defined
        const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
        const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

        if (!supabaseUrl || !supabaseAnonKey) {
          console.error(
            "[NextAuth Authorize] Supabase URL or Anon Key is not defined in environment variables for client-side operations.",
          );
          throw new Error("Server configuration error for Supabase client.");
        }

        const supabase = createClient(supabaseUrl, supabaseAnonKey);

        const { data, error } = await supabase.auth.signInWithPassword({
          email: credentials.email,
          password: credentials.password,
        });

        if (error) {
          // Log the full Supabase error object for detailed diagnostics
          console.error(
            "[NextAuth Authorize] Supabase SignIn Error:",
            JSON.stringify(error, null, 2),
          );

          if (error.message.includes("Invalid login credentials")) {
            throw new Error("CredentialsSignin"); // NextAuth default error for bad credentials
          }
          // Check for "Email not confirmed" specifically. Supabase error might be "User not found" or similar
          // if email_confirmed_at is null AND you have RLS policies preventing unconfirmed users from being "found"
          // by certain queries, though signInWithPassword usually gives a more direct error.
          if (error.message.toLowerCase().includes("email not confirmed")) {
            console.warn(
              `[NextAuth Authorize] Supabase signInWithPassword error explicitly stated 'email not confirmed' for ${credentials.email}.`,
            );
            // Even with this error, we might still get a data.user object.
            // The check for !data.user.email_confirmed_at later is the definitive one if data.user exists.
            // If data.user does NOT exist and this error occurred, then we throw EmailNotConfirmed.
            if (!data?.user) {
              throw new Error("EmailNotConfirmed");
            }
          }
          // If no user data is returned with the error, it's safer to throw a generic auth failed
          // unless it's a specific handled error like CredentialsSignin.
          if (
            !data?.user &&
            !error.message.includes("Invalid login credentials")
          ) {
            throw new Error("AuthenticationFailed");
          }
        }

        if (data?.user) {
          // Log the entire user object received from Supabase
          console.log(
            "[NextAuth Authorize] Supabase user data received:",
            JSON.stringify(data.user, null, 2),
          );
          console.log(`[NextAuth Authorize] User ID: ${data.user.id}`);
          console.log(`[NextAuth Authorize] User Email: ${data.user.email}`);
          console.log(
            `[NextAuth Authorize] User email_confirmed_at: ${data.user.email_confirmed_at} (Type: ${typeof data.user.email_confirmed_at})`,
          );
          console.log(
            `[NextAuth Authorize] User created_at: ${data.user.created_at}`,
          );
          console.log(
            `[NextAuth Authorize] User last_sign_in_at: ${data.user.last_sign_in_at}`,
          );
          console.log(
            `[NextAuth Authorize] User user_metadata:`,
            JSON.stringify(data.user.user_metadata, null, 2),
          );

          // The crucial check:
          // Supabase sets email_confirmed_at to a timestamp string when confirmed.
          // It's null or undefined if not confirmed.
          if (!data.user.email_confirmed_at) {
            console.warn(
              `[NextAuth Authorize] Based on 'email_confirmed_at' field (value: ${data.user.email_confirmed_at}), email for ${data.user.email} is NOT confirmed. Throwing EmailNotConfirmed error.`,
            );
            throw new Error("EmailNotConfirmed");
          }

          console.log(
            `[NextAuth Authorize] Email for ${data.user.email} IS confirmed (email_confirmed_at: ${data.user.email_confirmed_at}). Proceeding with user object creation for NextAuth.`,
          );
          return {
            id: data.user.id,
            email: data.user.email,
            name:
              data.user.user_metadata?.name ||
              data.user.user_metadata?.full_name ||
              data.user.email, // Fallback to email if name is not in metadata
            // image: data.user.user_metadata?.avatar_url, // If you store avatar URLs in metadata
          };
        }

        // If Supabase signInWithPassword errored and specifically said "Email not confirmed",
        // and for some reason data.user was also null (unlikely with this specific error but covering bases).
        if (
          error &&
          error.message.toLowerCase().includes("email not confirmed")
        ) {
          console.warn(
            `[NextAuth Authorize] Fallback: Supabase error was 'email not confirmed' and no data.user object for ${credentials.email}.`,
          );
          throw new Error("EmailNotConfirmed");
        }
        // If there was an error not specifically handled and no user data.
        if (error) {
          console.error(
            `[NextAuth Authorize] Fallback: Unhandled Supabase error for ${credentials.email} and no user data. Error: ${error.message}`,
          );
          throw new Error("AuthenticationFailed");
        }

        console.warn(
          "[NextAuth Authorize] No user data returned from Supabase and no specific error handled. Returning null. This path should ideally not be reached.",
        );
        return null; // Fallback, should not be reached if error or data.user handles all cases.
      },
    }),
  ],
  session: {
    strategy: "jwt",
  },
  pages: {
    signIn: "/auth/signin",
    // error: '/auth/error', // A custom error page can be useful
  },
  callbacks: {
    async jwt({ token, user, account, profile, isNewUser }) {
      // `user` object is what's returned from `authorize` or OAuth profile
      if (user) {
        token.id = user.id; // Ensure Supabase user ID is in the JWT `sub` and custom `id`
      }
      return token;
    },
    async session({ session, token, user }) {
      // `token` is the JWT token from the `jwt` callback
      if (token?.id && session.user) {
        session.user.id = token.id;
      }
      return session;
    },
  },
  // secret: process.env.NEXTAUTH_SECRET, // Already required by NextAuth
  // debug: process.env.NODE_ENV === 'development', // Enable for more NextAuth logs
};

const handler = NextAuth(authOptions);

export { handler as GET, handler as POST };
