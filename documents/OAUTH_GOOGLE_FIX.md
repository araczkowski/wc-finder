# OAuth Google Login Fix - Konfiguracja dla Vercel

Ten dokument opisuje jak naprawić błąd "State cookie was missing" podczas logowania przez Google OAuth na Vercel.

## Problem

Po próbie logowania przez Google OAuth pojawia się błąd:
```
[next-auth][error][OAUTH_CALLBACK_ERROR] State cookie was missing.
```

## Rozwiązanie

### 1. Zmienne środowiskowe w Vercel

W panelu Vercel dodaj następujące zmienne środowiskowe (Settings → Environment Variables):

```bash
# NextAuth Configuration
NEXTAUTH_SECRET=your-secret-here
NEXTAUTH_URL=https://your-app-name.vercel.app

# Google OAuth
GOOGLE_CLIENT_ID=your-google-client-id
GOOGLE_CLIENT_SECRET=your-google-client-secret

# Supabase (jeśli używasz)
SUPABASE_URL=your-supabase-url
SUPABASE_SERVICE_ROLE_KEY=your-supabase-service-role-key
NEXT_PUBLIC_SUPABASE_URL=your-supabase-url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-supabase-anon-key
```

### 2. Generowanie NEXTAUTH_SECRET

```bash
# Wygeneruj bezpieczny klucz
openssl rand -base64 32
```

### 3. Konfiguracja Google Cloud Console

1. Idź do [Google Cloud Console](https://console.cloud.google.com/)
2. Wybierz swój projekt
3. APIs & Services → Credentials
4. Edytuj OAuth 2.0 Client
5. W "Authorized redirect URIs" dodaj:
   ```
   # Dla produkcji (Vercel)
   https://your-app-name.vercel.app/api/auth/callback/google
   
   # Dla lokalnego developmentu
   http://localhost:3000/api/auth/callback/google
   ```

**Uwaga**: Bez dodania localhost URI, OAuth nie będzie działać lokalnie!

### 4. Konfiguracja NextAuth (już zaimplementowana)

Plik `app/api/auth/[...nextauth]/route.js` zawiera już poprawioną konfigurację:

- ✅ Dodano `trustHost: true`
- ✅ Konfiguracja cookies dla produkcji
- ✅ Bezpieczne nazwy cookies z prefiksami `__Secure-` i `__Host-`
- ✅ Poprawne ustawienia `sameSite` i `secure`
- ✅ State i nonce cookies z maksymalnym czasem życia

### 5. Weryfikacja konfiguracji

Po wdrożeniu sprawdź:

1. **Zmienne środowiskowe**: Wszystkie zmienne są ustawione w Vercel
2. **URL callback**: Google OAuth ma poprawny redirect URI
3. **HTTPS**: Aplikacja działa na HTTPS (automatycznie na Vercel)
4. **Cookies**: Przeglądarka akceptuje cookies

### 6. Debugowanie

Jeśli problem nadal występuje:

1. **Sprawdź logi Vercel**:
   ```bash
   vercel logs
   ```

2. **Włącz debug mode** (tymczasowo):
   ```javascript
   // W authOptions
   debug: true,
   ```

3. **Sprawdź Network tab** w DevTools podczas logowania

4. **Wyczyść cookies** przeglądarki dla domeny

5. **JWT Session Error - "decryption operation failed"**:
   
   Ten błąd oznacza problem z `NEXTAUTH_SECRET`:
   
   ```bash
   # Wygeneruj nowy klucz
   openssl rand -base64 32
   ```
   
   **Krytyczne**: Użyj TEGO SAMEGO klucza w:
   - `.env.local` (development)
   - Vercel Environment Variables (production)
   
   **Rozwiązanie**:
   - Usuń wszystkie sesje/cookies
   - Wygeneruj nowy `NEXTAUTH_SECRET`
   - Ustaw ten sam klucz w dev i prod
   - Redeploy aplikację
   - Restart local dev server

### 7. Konfiguracja dla lokalnego developmentu

Jeśli testujesz na `localhost:3000`:

1. **Dodaj redirect URI** w Google Console:
   ```
   http://localhost:3000/api/auth/callback/google
   ```

2. **Utwórz plik `.env.local`**:
   ```bash
   NEXTAUTH_SECRET=your-local-secret
   NEXTAUTH_URL=http://localhost:3000
   GOOGLE_CLIENT_ID=your-google-client-id
   GOOGLE_CLIENT_SECRET=your-google-client-secret
   ```

3. **Restart serwera** po dodaniu `.env.local`

**Częste błędy na localhost:**
- ❌ `Error 400: redirect_uri_mismatch` - brak localhost w Google Console
- ❌ `Error 403: access_blocked` - aplikacja nie zweryfikowana (normalnie w dev)

### 8. Typowe przyczyny błędu

- ❌ Brak `NEXTAUTH_SECRET`
- ❌ Niepoprawny `NEXTAUTH_URL`
- ❌ Zły redirect URI w Google Console
- ❌ Problem z cookies (blokada w przeglądarce)
- ❌ Mixed content (HTTP/HTTPS)
- ❌ Brak localhost URI dla lokalnego developmentu

### 9. Testowanie

1. Otwórz aplikację w trybie incognito
2. Spróbuj zalogować się przez Google
3. Sprawdź czy cookies są ustawiane (DevTools → Application → Cookies)

## Dodatkowe informacje

### Bezpieczeństwo cookies

Aplikacja używa różnych nazw cookies dla produkcji i development:

- **Produkcja**: `__Secure-` i `__Host-` prefiksy
- **Development**: standardowe nazwy

### SameSite Policy

Ustawienie `sameSite: "lax"` zapewnia kompatybilność z OAuth flow przy zachowaniu bezpieczeństwa.

### Autoryzacja Google

Dodano parametry autoryzacji dla lepszej obsługi refresh tokenów:
```javascript
authorization: {
  params: {
    prompt: "consent",
    access_type: "offline",
    response_type: "code",
  },
}
```

## Wsparcie

Jeśli problem nadal występuje, sprawdź:
- [NextAuth.js Documentation](https://next-auth.js.org/)
- [Vercel Deployment Guide](https://vercel.com/guides/nextjs)
- [Google OAuth Setup](https://developers.google.com/identity/protocols/oauth2)