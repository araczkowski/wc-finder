# OAuth Google User Creation Fix - Kompletne Rozwiązanie

Ten dokument opisuje jak naprawić problem z dodawaniem użytkowników do Supabase po logowaniu przez Google OAuth, który powoduje błąd UUID: "invalid input syntax for type uuid: \"temp_1750410182561\"".

## Problem

Po zalogowaniu przez Google OAuth użytkownicy nie są poprawnie dodawani do Supabase, co powoduje:

1. **Błąd UUID w logach Vercel:**
   ```
   API WCS POST: Supabase insert error: {
     "code": "22P02",
     "details": null,
     "hint": null,
     "message": "invalid input syntax for type uuid: \"temp_1750410182561\""
   ```

2. **Niemożność zapisywania danych** - użytkownicy nie mogą dodawać WC, ocen, zdjęć

3. **Nieprawidłowe sesje** - system używa tymczasowych ID zamiast prawdziwych UUID

## Przyczyna

W NextAuth callback `jwt`, gdy system nie może stworzyć lub znaleźć użytkownika w Supabase, ustawia fallback:
```javascript
token.id = `temp_${Date.now()}`; // ❌ To powoduje błąd UUID
```

Te tymczasowe ID są później używane jako `user_id` w tabelach bazy danych, które oczekują prawdziwego UUID.

## Rozwiązanie

### Krok 1: Uruchom skrypt diagnostyczny

Najpierw sprawdź obecny stan systemu:

```bash
# Utwórz plik .env.local ze wszystkimi wymaganymi zmiennymi
cp .env.example .env.local
# Edytuj .env.local i uzupełnij wszystkie wartości

# Uruchom skrypt diagnostyczny
node test-oauth-debug.js
```

Ten skrypt sprawdzi:
- ✅ Wszystkie zmienne środowiskowe
- ✅ Połączenie z Supabase
- ✅ Auth Admin API
- ✅ Tworzenie użytkowników
- ✅ Tabele w bazie danych
- ⚠️ Czy są stare temp_ user_id rekordy

### Krok 2: Upewnij się, że główna tabela `wcs` istnieje

Uruchom w Supabase SQL Editor (lub użyj pliku `database/create_wcs_table.sql`):

```sql
-- Create main wcs table for storing WC locations
CREATE TABLE IF NOT EXISTS wcs (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    created_by TEXT NOT NULL,
    name TEXT NOT NULL,
    location TEXT,
    address TEXT,
    image_url TEXT,
    rating INTEGER CHECK (rating >= 1 AND rating <= 10),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_wcs_user_id ON wcs(user_id);
CREATE INDEX IF NOT EXISTS idx_wcs_name ON wcs(name);
CREATE INDEX IF NOT EXISTS idx_wcs_location ON wcs(location);
CREATE INDEX IF NOT EXISTS idx_wcs_created_at ON wcs(created_at);
CREATE INDEX IF NOT EXISTS idx_wcs_address ON wcs USING gin(to_tsvector('english', address));

-- Enable Row Level Security
ALTER TABLE wcs ENABLE ROW LEVEL SECURITY;

-- Create RLS Policies
CREATE POLICY "public_read_wcs" ON wcs FOR SELECT USING (true);
CREATE POLICY "auth_insert_wcs" ON wcs FOR INSERT WITH CHECK (auth.uid() IS NOT NULL);
CREATE POLICY "auth_update_wcs" ON wcs FOR UPDATE USING (auth.uid() = user_id);
CREATE POLICY "auth_delete_wcs" ON wcs FOR DELETE USING (auth.uid() = user_id);

-- Grant permissions
GRANT SELECT ON wcs TO anon;
GRANT ALL ON wcs TO authenticated;
GRANT ALL ON wcs TO service_role;
```

### Krok 3: Sprawdź zmienne środowiskowe

W Vercel Environment Variables sprawdź czy są ustawione:

```bash
# NextAuth
NEXTAUTH_SECRET=your-secret-here
NEXTAUTH_URL=https://your-app.vercel.app

# Google OAuth
GOOGLE_CLIENT_ID=your-google-client-id
GOOGLE_CLIENT_SECRET=your-google-client-secret

# Supabase - KRYTYCZNE dla tworzenia użytkowników
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key  # ⚠️ MUSI BYĆ SERVICE_ROLE, nie ANON
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
```

**KRYTYCZNE:** `SUPABASE_SERVICE_ROLE_KEY` musi być Service Role Key (zaczyna się od `eyJ...`), nie Anon Key!

### Krok 4: Wyczyść stare dane z temp_ ID (jeśli istnieją)

Jeśli skrypt diagnostyczny znalazł stare rekordy z `temp_` user_id:

```bash
# Sprawdź plik cleanup script
cat database/cleanup_temp_user_ids.sql

# Uruchom w Supabase SQL Editor (OSTROŻNIE - usuwa dane!)
# Najpierw przeczytaj cały skrypt i zrób backup
```

**UWAGA**: Skrypt domyślnie używa `ROLLBACK` dla bezpieczeństwa. Aby rzeczywiście usunąć dane:
1. Zrób backup bazy danych
2. Przeczytaj cały skrypt
3. Zmień `ROLLBACK` na `COMMIT`

#### Naprawiony kod NextAuth (już zaimplementowany)

Plik `app/api/auth/[...nextauth]/route.js` został zaktualizowany o:

#### ✅ Eliminacja tymczasowych ID
```javascript
// ❌ PRZED (powodowało błąd UUID)
token.id = `temp_${Date.now()}`;

// ✅ PO (rzuca błąd zamiast tworzyć nieprawidłowe sesje)
throw new Error(`OAuth user creation failed: ${error.message}`);
```

#### ✅ Inteligentne tworzenie użytkowników
```javascript
// Próbuje utworzyć użytkownika, jeśli już istnieje - wyszukuje go
const { data: newUser, error: createError } = await supabase.auth.admin.createUser({
  email: userEmail,
  email_confirm: true,
  user_metadata: { name: userName, picture: userImage, provider: "google" }
});

// Jeśli użytkownik już istnieje, znajdź go w liście
if (createError?.message.includes("already registered")) {
  const { data: usersList } = await supabase.auth.admin.listUsers();
  const existingUser = usersList?.users?.find(user => user.email === userEmail);
  token.id = existingUser.id;
}
```

#### ✅ Walidacja UUID w sesji
```javascript
const uuidRegex = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;

if (typeof token.id === "string" && token.id.startsWith("temp_")) {
  throw new Error("Invalid session: temporary user ID detected");
}

if (typeof token.id === "string" && !uuidRegex.test(token.id)) {
  throw new Error("Invalid session: malformed user ID");
}
```

### Krok 6: Testowanie rozwiązania

#### Test 1: Nowy użytkownik Google OAuth
1. Otwórz aplikację w trybie incognito
2. Zaloguj się przez Google (użyj konta, które nie było wcześniej używane)
3. Sprawdź w Supabase Auth → Users czy użytkownik został dodany
4. Sprawdź w logach czy nie ma błędów "temp_" ID

#### Test 2: Istniejacy użytkownik
1. Zaloguj się kontem Google, które już było używane
2. Sprawdź czy sesja została poprawnie utworzona
3. Spróbuj dodać nowe WC

#### Test 3: Dodawanie danych
1. Po zalogowaniu spróbuj dodać WC
2. Sprawdź czy nie ma błędu UUID w logach
3. Sprawdź czy dane zostały zapisane w bazie

### Krok 7: Debugowanie problemów

#### Problem: "Missing Supabase credentials"
```bash
# Sprawdź czy zmienne są ustawione w Vercel
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_SERVICE_ROLE_KEY=eyJ...  # Musi być service_role!
```

#### Problem: "Failed to create user in Supabase"
1. Sprawdź czy Service Role Key jest prawidłowy
2. Sprawdź uprawnienia w Supabase Dashboard → Settings → API
3. Sprawdź logi Supabase w Dashboard → Logs

#### Problem: "User not found" ale użytkownik istnieje
1. Sprawdź email_confirmed_at w auth.users
2. Sprawdź czy RLS policies nie blokują dostępu
3. Uruchom w SQL Editor:
   ```sql
   SELECT * FROM auth.users WHERE email = 'user@example.com';
   ```

### Krok 8: Czyszczenie starych sesji

Jeśli użytkownicy mają stare sesje z temp_ ID:

```javascript
// Dla użytkowników - wyczyść cookies przeglądarki
// Lub w DevTools → Application → Cookies → usuń wszystkie next-auth cookies
```

```sql
-- W Supabase - usuń nieprawidłowe wpisy (OSTROŻNIE!)
DELETE FROM wcs WHERE user_id ~ '^temp_';
DELETE FROM wc_rating WHERE user_id ~ '^temp_';
DELETE FROM wc_photos WHERE user_id ~ '^temp_';
```

### Krok 9: Monitorowanie

#### Sprawdź logi Vercel:
```bash
vercel logs --follow
```

Szukaj:
- ✅ `[NextAuth JWT] Created user with ID: [UUID]`
- ✅ `[NextAuth JWT] Found existing user with ID: [UUID]`
- ❌ `temp_` - nie powinno już występować
- ❌ `invalid input syntax for type uuid`

#### Sprawdź Supabase Logs:
- Dashboard → Logs → API/Auth
- Szukaj błędów tworzenia użytkowników

## Konfiguracja Google Cloud Console

Upewnij się, że w Google Cloud Console są prawidłowe redirect URIs:

```
# Produkcja
https://your-app.vercel.app/api/auth/callback/google

# Development (jeśli testujesz lokalnie)
http://localhost:3000/api/auth/callback/google
```

## Bezpieczeństwo

### Service Role Key vs Anon Key

```bash
# ✅ Service Role Key (do admin operacji)
SUPABASE_SERVICE_ROLE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...

# ❌ Anon Key (tylko do public operacji)
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

**NIGDY** nie używaj Service Role Key po stronie klienta (`NEXT_PUBLIC_*`)!

### RLS Policies

Tabele mają właściwe polityki RLS:
- **SELECT**: Publiczny dostęp do odczytu
- **INSERT/UPDATE/DELETE**: Tylko dla właścicieli danych

## Oczekiwane rezultaty

Po implementacji rozwiązania:

1. ✅ **Brak błędów UUID** - nie więcej "temp_" ID
2. ✅ **Użytkownicy OAuth są poprawnie tworzeni** w Supabase auth.users
3. ✅ **Sesje zawierają prawdziwe UUID** - możliwość zapisywania danych
4. ✅ **API endpoints działają** - POST /api/wcs, ratings, photos
5. ✅ **Czyste logi** - brak 500 błędów related do UUID

## Automatyczne narzędzia diagnostyczne

### 🔧 Skrypt diagnostyczny
```bash
node test-oauth-debug.js
```
Ten skrypt automatycznie sprawdzi wszystkie aspekty konfiguracji.

### 📊 Skrypt weryfikacji bazy danych
```sql
-- Uruchom w Supabase SQL Editor
\i database/verify_setup.sql
```

### 🧹 Skrypt czyszczenia
```sql
-- UWAGA: Najpierw zrób backup!
\i database/cleanup_temp_user_ids.sql
```

## Wsparcie

Jeśli problem nadal występuje:

1. **Uruchom skrypt diagnostyczny** `node test-oauth-debug.js`
2. **Sprawdź wszystkie zmienne środowiskowe** w Vercel
3. **Uruchom wszystkie SQL skrypty** w Supabase
4. **Wyczyść stare dane** jeśli skrypt je wykrył
5. **Sprawdź logi** Vercel i Supabase
6. **Przetestuj w trybie incognito** z nowym kontem Google

Problem powinien być całkowicie rozwiązany po wykonaniu wszystkich kroków.

### Częste problemy i rozwiązania

| Problem | Rozwiązanie |
|---|---|
| `supabase.auth.admin.getUserByEmail is not a function` | ✅ Już naprawione w kodzie |
| `invalid input syntax for type uuid: "temp_..."` | ✅ Już naprawione + skrypt czyszczący |
| `Missing Supabase credentials` | Sprawdź `SUPABASE_SERVICE_ROLE_KEY` |
| `User creation failed` | Sprawdź uprawnienia Service Role Key |
| Stare temp_ rekordy | Uruchom `cleanup_temp_user_ids.sql` |