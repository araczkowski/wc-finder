# Supabase Adapter Error Fix - "The schema must be one of the following: public, graphql_public"

Ten błąd występuje gdy NextAuth.js próbuje używać Supabase Adapter z niewłaściwą konfiguracją schematu bazy danych.

## Problem

```
[next-auth][error][adapter_error_getUserByAccount] 
The schema must be one of the following: public, graphql_public {
  code: 'PGRST106',
  details: null,
  hint: null,
  message: 'The schema must be one of the following: public, graphql_public'
}
```

## Przyczyny

1. **Supabase Adapter** próbuje dostać się do schematu `auth` lub `nextauth`
2. **RLS (Row Level Security)** blokuje dostęp do niewłaściwego schematu
3. **Brak wymaganych tabel** NextAuth w schemacie `public`
4. **Nieprawidłowa konfiguracja** Supabase projektu

## Rozwiązanie (Zalecane): Usuń Supabase Adapter

Ponieważ używasz własnego systemu uwierzytelniania z Credentials Provider i Supabase Auth, nie potrzebujesz Supabase Adapter.

### 1. Usuń Supabase Adapter z konfiguracji

```javascript
// PRZED (z błędem)
import { SupabaseAdapter } from "@next-auth/supabase-adapter";

export const authOptions = {
  adapter: SupabaseAdapter({
    url: process.env.SUPABASE_URL,
    secret: process.env.SUPABASE_SERVICE_ROLE_KEY,
  }),
  // ... reszta konfiguracji
};

// PO (naprawione)
export const authOptions = {
  // Usuń adapter całkowicie
  // ... reszta konfiguracji
};
```

### 2. Zaktualizuj callbacks dla OAuth

```javascript
export const authOptions = {
  providers: [
    GoogleProvider({
      clientId: process.env.GOOGLE_CLIENT_ID,
      clientSecret: process.env.GOOGLE_CLIENT_SECRET,
    }),
    CredentialsProvider({
      // ... twoja konfiguracja credentials
    }),
  ],
  callbacks: {
    async jwt({ token, user, account, profile }) {
      if (user) {
        // Obsługa OAuth (Google)
        if (account?.provider === "google" && profile) {
          try {
            const supabase = createClient(
              process.env.SUPABASE_URL,
              process.env.SUPABASE_SERVICE_ROLE_KEY
            );

            // Sprawdź/utwórz użytkownika w Supabase Auth
            const { data: authUser, error: authError } = 
              await supabase.auth.admin.getUserByEmail(profile.email);

            if (authError || !authUser.user) {
              // Utwórz nowego użytkownika
              const { data: newUser, error: createError } = 
                await supabase.auth.admin.createUser({
                  email: profile.email,
                  email_confirm: true,
                  user_metadata: {
                    name: profile.name,
                    picture: profile.picture,
                    provider: "google",
                  },
                });

              if (!createError && newUser.user) {
                token.id = newUser.user.id;
              }
            } else {
              token.id = authUser.user.id;
            }
          } catch (error) {
            console.error("Error handling OAuth user:", error);
          }
        } else {
          // Obsługa Credentials
          token.id = user.id;
        }

        token.email = user.email;
        token.name = user.name;
        token.picture = user.image;
      }
      return token;
    },
    async session({ session, token }) {
      if (token?.id && session.user) {
        session.user.id = token.id;
      }
      return session;
    },
  },
};
```

### 3. Sprawdź konfigurację Supabase

Upewnij się, że masz poprawne zmienne środowiskowe:

```bash
# .env.local (development)
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key

# Vercel (production)
# Te same zmienne w Environment Variables
```

## Alternatywne rozwiązanie: Konfiguracja z Adapter

Jeśli koniecznie chcesz używać Supabase Adapter:

### 1. Utwórz wymagane tabele

```sql
-- Wykonaj w Supabase SQL Editor
-- Tabele NextAuth w schemacie public

CREATE TABLE accounts (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  type TEXT NOT NULL,
  provider TEXT NOT NULL,
  provider_account_id TEXT NOT NULL,
  refresh_token TEXT,
  access_token TEXT,
  expires_at BIGINT,
  token_type TEXT,
  scope TEXT,
  id_token TEXT,
  session_state TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(provider, provider_account_id)
);

CREATE TABLE sessions (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  expires TIMESTAMP WITH TIME ZONE NOT NULL,
  session_token TEXT NOT NULL UNIQUE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE verification_tokens (
  identifier TEXT NOT NULL,
  token TEXT NOT NULL,
  expires TIMESTAMP WITH TIME ZONE NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  PRIMARY KEY (identifier, token)
);

-- Włącz RLS
ALTER TABLE accounts ENABLE ROW LEVEL SECURITY;
ALTER TABLE sessions ENABLE ROW LEVEL SECURITY;
ALTER TABLE verification_tokens ENABLE ROW LEVEL SECURITY;

-- Dodaj polityki RLS
CREATE POLICY "Users can view own accounts" ON accounts FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can view own sessions" ON sessions FOR SELECT USING (auth.uid() = user_id);
```

### 2. Zaktualizuj konfigurację Adapter

```javascript
export const authOptions = {
  adapter: SupabaseAdapter({
    url: process.env.SUPABASE_URL,
    secret: process.env.SUPABASE_SERVICE_ROLE_KEY,
    // Dodaj konfigurację schematu jeśli potrzebna
  }),
  // ... reszta konfiguracji
};
```

## Weryfikacja

Po implementacji sprawdź:

1. **Brak błędów adapter** w logach Vercel
2. **OAuth Google** działa poprawnie
3. **Credentials login** nadal funkcjonuje
4. **Session management** działa prawidłowo

## Zalety usunięcia Adapter

✅ **Prostsze** - mniej kodu do debugowania
✅ **Mniej zależności** - nie potrzebujesz dodatkowych tabel
✅ **Pełna kontrola** - zarządzasz użytkownikami jak chcesz
✅ **Kompatybilność** - działa z istniejącą konfiguracją Supabase Auth

## Wady

❌ **Więcej kodu** - musisz obsłużyć OAuth manualnie
❌ **Brak automatyzacji** - nie ma gotowych funkcji NextAuth

## Debugowanie

Jeśli nadal masz problemy:

```javascript
// Dodaj do authOptions
debug: true,
logger: {
  error(code, metadata) {
    console.error("[NextAuth Error]", code, metadata);
  },
  warn(code) {
    console.warn("[NextAuth Warn]", code);
  },
  debug(code, metadata) {
    console.debug("[NextAuth Debug]", code, metadata);
  }
}
```

## Testowanie

1. **Wyczyść cookies** w przeglądarce
2. **Wypróbuj Google OAuth** - powinno działać bez błędów
3. **Sprawdź Credentials login** - powinno nadal działać
4. **Sprawdź logi Vercel** - brak błędów adapter

## Wsparcie

- [NextAuth.js bez Adapter](https://next-auth.js.org/configuration/providers/oauth)
- [Supabase Auth Admin API](https://supabase.com/docs/reference/javascript/auth-admin-api)
- [NextAuth.js Callbacks](https://next-auth.js.org/configuration/callbacks)