# OAuth Session Debug Guide - "Session status: unauthenticated" po Google OAuth

Ten przewodnik pomaga w debugowaniu problemów z sesją po pomyślnym logowaniu przez Google OAuth.

## Problem

Po pomyślnym logowaniu przez Google OAuth:
- Użytkownik zostaje przekierowany z powrotem do aplikacji
- W logach pojawia się: `Session status: unauthenticated Session object: Null`
- Aplikacja wyświetla: "Nie udało się załadować WCs"
- Użytkownik nie jest zalogowany mimo pomyślnej autoryzacji

## Przyczyny

1. **JWT Token nie zawiera wymaganych danych**
2. **Błędy w NextAuth callbacks**
3. **Problem z cookies/session storage**
4. **Nieprawidłowa konfiguracja Google Provider**
5. **Błędy w Supabase integration**

## Diagnostyka krok po kroku

### 1. Sprawdź logi NextAuth

Po wdrożeniu z debugowaniem, sprawdź logi Vercel:

```bash
# Szukaj tych logów:
[NextAuth JWT] Called with: { hasUser: true, provider: 'google', ... }
[Google Profile] { sub: '...', name: '...', email: '...' }
[NextAuth JWT] Processing Google OAuth for: user@email.com
[NextAuth Session] Called with: { hasSession: true, hasToken: true, ... }
```

### 2. Sprawdź co zwraca Google Profile

**Oczekiwane dane z Google:**
```json
{
  "sub": "1234567890",
  "name": "Jan Kowalski", 
  "email": "jan@gmail.com",
  "picture": "https://lh3.googleusercontent.com/...",
  "given_name": "Jan",
  "family_name": "Kowalski"
}
```

**Jeśli brakuje danych:**
- Sprawdź scopes w Google Provider
- Sprawdź konfigurację w Google Console

### 3. Sprawdź JWT Token Creation

W logach szukaj:

```
[NextAuth JWT] Final token: {
  id: "uuid-here",
  email: "user@email.com", 
  name: "User Name"
}
```

**Jeśli token.id jest null/undefined:**
- Problem z tworzeniem użytkownika w Supabase
- Sprawdź zmienne środowiskowe SUPABASE_*
- Sprawdź uprawnienia Service Role Key

### 4. Sprawdź Session Creation

W logach szukaj:

```
[NextAuth Session] Final session: {
  userId: "uuid-here",
  userEmail: "user@email.com",
  userName: "User Name"
}
```

**Jeśli session.user.id jest null:**
- Token nie został przekazany do sesji
- Problem w session callback

## Typowe rozwiązania

### 1. Brakujące scopes Google

```javascript
// W app/api/auth/[...nextauth]/route.js
GoogleProvider({
  clientId: process.env.GOOGLE_CLIENT_ID,
  clientSecret: process.env.GOOGLE_CLIENT_SECRET,
  authorization: {
    params: {
      scope: "openid email profile", // ✅ Dodaj explicit scopes
      prompt: "consent",
      access_type: "offline",
      response_type: "code",
    },
  },
}),
```

### 2. Problem z profile mapping

```javascript
GoogleProvider({
  // ... inne ustawienia
  profile(profile) {
    console.log("[Google Profile]", profile); // Debug log
    return {
      id: profile.sub,
      name: profile.name,
      email: profile.email,
      image: profile.picture,
    };
  },
}),
```

### 3. Fallback dla brakującego user.id

```javascript
// W JWT callback
if (!token.id && account?.provider === "google") {
  // Fallback: użyj Google ID jako tymczasowego
  token.id = `google_${profile.sub}`;
  console.warn("[NextAuth JWT] Using fallback ID:", token.id);
}
```

### 4. Sprawdź zmienne środowiskowe

**W Vercel Environment Variables:**
```bash
NEXTAUTH_SECRET=your-secret-here
NEXTAUTH_URL=https://your-app.vercel.app
GOOGLE_CLIENT_ID=your-client-id
GOOGLE_CLIENT_SECRET=your-client-secret
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key
```

**Weryfikacja:**
- Czy wszystkie zmienne są ustawione?
- Czy Service Role Key ma uprawnienia auth.admin?
- Czy Google credentials są poprawne?

### 5. Sprawdź Google Console konfigurację

**Authorized redirect URIs:**
```
https://your-app.vercel.app/api/auth/callback/google
http://localhost:3000/api/auth/callback/google
```

**OAuth consent screen:**
- App name ustawiony
- User support email podany
- Scopes: email, profile, openid

## Zaawansowane debugowanie

### 1. Tymczasowo włącz wszystkie logi

```javascript
// W authOptions
debug: true,
logger: {
  error(code, metadata) {
    console.error(`[NextAuth Error] ${code}:`, metadata);
  },
  warn(code) {
    console.warn(`[NextAuth Warn] ${code}`);
  },
  debug(code, metadata) {
    console.debug(`[NextAuth Debug] ${code}:`, metadata);
  }
}
```

### 2. Sprawdź cookies w przeglądarce

**F12 → Application → Cookies:**
- `next-auth.session-token` (lub `__Secure-next-auth.session-token`)
- `next-auth.csrf-token`
- `next-auth.callback-url`

**Jeśli cookies nie są ustawiane:**
- Problem z konfiguracją cookies
- Sprawdź sameSite/secure settings
- Sprawdź czy domena jest poprawna

### 3. Test z curl

```bash
# Test session endpoint
curl -b "next-auth.session-token=COOKIE_VALUE" \
  https://your-app.vercel.app/api/auth/session
```

### 4. Sprawdź Supabase RLS

```sql
-- W Supabase SQL Editor
SELECT * FROM auth.users WHERE email = 'test@gmail.com';

-- Sprawdź czy użytkownik został utworzony
```

## Checklist rozwiązania

- [ ] Google Profile zwraca wymagane dane (email, name, sub)
- [ ] JWT callback tworzy token z user.id
- [ ] Session callback przekazuje user.id do sesji
- [ ] Zmienne środowiskowe są poprawnie ustawione
- [ ] Supabase Service Role Key ma uprawnienia auth.admin
- [ ] Google OAuth redirect URIs są poprawne
- [ ] Cookies są prawidłowo ustawiane
- [ ] Logi nie pokazują błędów w callbacks

## Szybkie testy

### 1. Test podstawowy

```javascript
// Dodaj do JWT callback
console.log("=== OAUTH DEBUG ===");
console.log("User:", user);
console.log("Account:", account);
console.log("Profile:", profile);
console.log("Token before:", token);
// ... logika callback
console.log("Token after:", token);
console.log("=== END DEBUG ===");
```

### 2. Test sesji

```javascript
// Dodaj do session callback
console.log("=== SESSION DEBUG ===");
console.log("Session before:", session);
console.log("Token:", token);
// ... logika callback
console.log("Session after:", session);
console.log("=== END DEBUG ===");
```

### 3. Test klienta

```javascript
// W komponencie React
useEffect(() => {
  console.log("=== CLIENT SESSION ===");
  console.log("Status:", status);
  console.log("Session:", session);
  console.log("=====================");
}, [status, session]);
```

## Typowe błędy i rozwiązania

### ❌ "Profile is undefined"
```javascript
// Rozwiązanie: Sprawdź scopes i profile mapping
authorization: {
  params: {
    scope: "openid email profile",
  },
}
```

### ❌ "token.id is undefined"
```javascript
// Rozwiązanie: Dodaj fallback w JWT callback
if (!token.id && account?.provider === "google") {
  token.id = `google_${user.id || profile.sub}`;
}
```

### ❌ "Supabase createUser failed"
```javascript
// Rozwiązanie: Sprawdź Service Role Key
const supabase = createClient(url, serviceRoleKey);
// Upewnij się że key ma auth:admin permissions
```

### ❌ "Session unauthenticated after redirect"
```javascript
// Rozwiązanie: Sprawdź session callback
async session({ session, token }) {
  if (token?.id) {
    session.user.id = token.id;
  }
  return session;
}
```

## Po naprawie

Gdy problem zostanie rozwiązany:

1. **Usuń nadmiar logów** z production
2. **Wyłącz debug mode** w NextAuth
3. **Przetestuj flow** od początku do końca
4. **Sprawdź inne funkcje** aplikacji (WC loading, etc.)

## Wsparcie

- [NextAuth.js Debugging](https://next-auth.js.org/configuration/options#debug)
- [Google OAuth Setup](https://developers.google.com/identity/protocols/oauth2)
- [Supabase Auth Admin](https://supabase.com/docs/reference/javascript/auth-admin-api)