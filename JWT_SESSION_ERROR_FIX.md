# JWT Session Error Fix - "decryption operation failed"

Ten błąd występuje gdy NextAuth.js nie może zdekryptować JWT session token z powodu problemów z `NEXTAUTH_SECRET`.

## Problem

```
[next-auth][error][JWT_SESSION_ERROR] 
decryption operation failed
```

## Przyczyny

1. **Różne NEXTAUTH_SECRET** między środowiskami (dev/prod)
2. **Brakujący NEXTAUTH_SECRET** w jednym ze środowisk  
3. **Stare cookies** z poprzednim kluczem
4. **Nieprawidłowy format** klucza

## Rozwiązanie krok po kroku

### 1. Wygeneruj nowy NEXTAUTH_SECRET

```bash
# W terminalu
openssl rand -base64 32
```

Przykładowy wynik:
```
K7+rX9mZ2nP4qW8vB1xR3zQ5yT6uE9hS0cV7mN4jL8kA
```

### 2. Ustaw ten sam klucz w obu środowiskach

#### Development (.env.local):
```bash
NEXTAUTH_SECRET=K7+rX9mZ2nP4qW8vB1xR3zQ5yT6uE9hS0cV7mN4jL8kA
NEXTAUTH_URL=http://localhost:3000
```

#### Production (Vercel):
1. Idź do Vercel Dashboard
2. Project Settings → Environment Variables
3. Dodaj/edytuj:
   ```
   NEXTAUTH_SECRET = K7+rX9mZ2nP4qW8vB1xR3zQ5yT6uE9hS0cV7mN4jL8kA
   NEXTAUTH_URL = https://wc-finder.vercel.app
   ```

### 3. Wyczyść cookies i sesje

#### W przeglądarce:
1. **F12** → **Application** → **Storage**
2. Usuń wszystkie cookies dla:
   - `localhost:3000`
   - `wc-finder.vercel.app`
3. **Clear Site Data** dla obu domen

#### Lub użyj trybu incognito dla testów

### 4. Restart środowisk

#### Development:
```bash
# Zatrzymaj serwer (Ctrl+C)
npm run dev
```

#### Production:
1. W Vercel: **Deployments** → **Redeploy**
2. Lub push do GitHub (auto-deploy)

### 5. Testowanie

#### Krok po kroku test:
1. **Otwórz tryb incognito**
2. **Idź na stronę** (localhost lub vercel)
3. **Kliknij "Zaloguj się"**
4. **Wybierz Google OAuth**
5. **Sprawdź czy nie ma błędów JWT**

## Dodatkowe rozwiązania

### Jeśli błąd nadal występuje:

#### 1. Sprawdź logi szczegółowo
```bash
# W Vercel
vercel logs --follow

# W development
# Sprawdź terminal gdzie działa npm run dev
```

#### 2. Temporary debug mode
```javascript
// W app/api/auth/[...nextauth]/route.js
export const authOptions = {
  // ... inne ustawienia
  debug: true, // Dodaj tymczasowo
  logger: {
    error(code, metadata) {
      console.error(code, metadata)
    },
    warn(code) {
      console.warn(code)
    },
    debug(code, metadata) {
      console.debug(code, metadata)
    }
  }
}
```

#### 3. Upewnij się o encoding
```bash
# NEXTAUTH_SECRET musi być base64
echo "K7+rX9mZ2nP4qW8vB1xR3zQ5yT6uE9hS0cV7mN4jL8kA" | base64 -d
# Powinno zwrócić binary data bez błędów
```

## Checklist weryfikacji

- [ ] `NEXTAUTH_SECRET` jest identyczny w dev i prod
- [ ] Klucz ma co najmniej 32 znaki
- [ ] Cookies zostały wyczyszczone
- [ ] Serwer dev został zrestartowany
- [ ] Aplikacja prod została zredployowana
- [ ] Brak cached sessions w przeglądarce
- [ ] Environment variables są ustawione w Vercel

## Typowe błędy

### ❌ Różne klucze
```bash
# Development
NEXTAUTH_SECRET=abc123

# Production  
NEXTAUTH_SECRET=xyz789
```

### ✅ Identyczne klucze
```bash
# Development & Production
NEXTAUTH_SECRET=K7+rX9mZ2nP4qW8vB1xR3zQ5yT6uE9hS0cV7mN4jL8kA
```

### ❌ Za krótki klucz
```bash
NEXTAUTH_SECRET=abc123  # Za krótki!
```

### ✅ Prawidłowy klucz
```bash
NEXTAUTH_SECRET=K7+rX9mZ2nP4qW8vB1xR3zQ5yT6uE9hS0cV7mN4jL8kA  # 44+ znaki
```

## Po naprawie

Po wykonaniu tych kroków:

1. **OAuth Google** powinien działać bezproblemowo
2. **Session** powinny być prawidłowo szyfrowane/deszyfrowane
3. **Nie powinno być błędów JWT** w logach

## Wsparcie

Jeśli problem nadal występuje:
- Sprawdź [NextAuth.js JWT Guide](https://next-auth.js.org/configuration/options#jwt)
- Sprawdź [Vercel Environment Variables](https://vercel.com/docs/concepts/projects/environment-variables)
- Upewnij się że używasz najnowszej wersji NextAuth.js