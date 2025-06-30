# Web Scraping Import Feature

## Opis funkcjonalności

Funkcja "Pobieranie WC" pozwala administratorom importować dane o toaletach i innych miejscach z darmowych źródeł danych (OpenStreetMap + web scraping) bezpośrednio do bazy danych aplikacji WC Finder.

## Dostęp

Funkcja jest dostępna tylko dla administratora (`admin@sviete.pl`) poprzez:
- Menu użytkownika → "📥 Pobieranie WC"
- Bezpośredni URL: `/admin/import-wc`

## Konfiguracja

### 1. Instalacja zależności

Aby korzystać z funkcji importu, musisz zainstalować bibliotekę cheerio:

```bash
npm install cheerio
```

lub

```bash
yarn add cheerio
```

**Nie jest wymagany żaden API Key** - funkcja używa darmowych źródeł danych.

### 2. Migracja bazy danych

Uruchom skrypt SQL aby dodać wymaganą kolumnę do tabeli `wcs`:

```sql
-- Wykonaj w Supabase SQL Editor
\i database/add_google_place_id_column.sql
```

Lub ręcznie:

```sql
ALTER TABLE wcs ADD COLUMN IF NOT EXISTS google_place_id TEXT;
CREATE INDEX IF NOT EXISTS idx_wcs_google_place_id ON wcs(google_place_id);
COMMENT ON COLUMN wcs.google_place_id IS 'Google Maps place ID for places imported from Google Maps API';
ALTER TABLE wcs ADD CONSTRAINT unique_google_place_id UNIQUE (google_place_id);
```

## Użycie

### Parametry wyszukiwania

1. **Coordinates** - Podaj w formacie `szerokość,długość` (np. `52.2297,21.0122`)
2. **Promień** - Zasięg wyszukiwania w kilometrach (0.1-50)
3. **Typ miejsca** - Wybierz z dostępnych typów (dla admin@sviete.pl dostępna opcja "* Wszystkie typy"):
   - Toaleta
   - Toaleta publiczna
   - Atrakcja turystyczna
   - Centrum handlowe
   - Restauracja
   - Kawiarnia
   - Bar
   - Park
   - Stacja kolejowa
   - Dworzec metra
   - Dworzec autobusowy
   - Lotnisko
   - Stacja benzynowa
   - Biblioteka
   - Muzeum
   - Kino
   - Ratusz
   - Supermarket
   - Dom towarowy

### Proces importu

Po naciśnięciu przycisku "Pobierz":

1. System najpierw wywołuje OpenStreetMap Overpass API (darmowe)
2. Jeśli wyników jest mało, dodatkowo wykonuje web scraping Google Maps
3. Usuwa duplikaty na podstawie nazwy i lokalizacji
4. Sprawdza czy miejsce już istnieje w bazie (po unikalnym identyfikatorze)
5. Dodaje nowe miejsca do tabel:
   - `wcs` - podstawowe dane (nazwa, adres, współrzędne, wygenerowana ocena)
   - `wc_ratings` - podstawowa ocena (6-9 zakres)
   - `wc_tags` - automatycznie generowane tagi na podstawie nazwy i opisu

### Automatyczne tagowanie

System automatycznie dodaje tagi na podstawie analizy tekstu (nazwa + opis):

- **"darmowa"** - jeśli tekst zawiera "darmow", "bezpłat", "free"
- **"płatna"** - jeśli tekst zawiera "płat", "koszt", "paid"
- **"dostępnaDlaNiepełnosprawnych"** - jeśli tekst zawiera "niepełnosprawnych", "disabled", "wheelchair"
- **"przewijak"** - jeśli tekst zawiera "przewijak", "baby", "dzieci"

## Wyniki importu

Po zakończeniu importu wyświetlane są statystyki:
- 📍 Znaleziono miejsc
- ✅ Dodano nowych WC
- ⚠️ Pominięto duplikatów
- 🖼️ Dodano zdjęć
- ⭐ Dodano ocen
- 🏷️ Dodano tagów

## Ograniczenia

1. **Duplikaty** - System pomija miejsca z podobną nazwą i lokalizacją
2. **Zdjęcia** - Obecnie nieobsługiwane (brak kosztów API)
3. **Rate Limiting** - Opóźnienia między zapytaniami aby uniknąć blokady
4. **Promień** - Maksymalny promień wyszukiwania: 50km
5. **Dostęp** - Tylko administrator może importować dane
6. **Źródła danych** - Zależność od dostępności OpenStreetMap i możliwości scrapingu
7. **Import wszystkich typów** - Opcja "* Wszystkie typy" dostępna tylko dla admin@sviete.pl

## Bezpieczeństwo

- Funkcja dostępna tylko dla `admin@sviete.pl`
- Wszystkie dane są weryfikowane przed zapisem
- Import nie modyfikuje istniejących rekordów
- Używa Supabase service role key dla operacji na bazie

## Troubleshooting

### Błąd "Failed to scrape data"
- Sprawdź połączenie internetowe
- Może wystąpić czasowa blokada IP - spróbuj ponownie za kilka minut
- OpenStreetMap Overpass API może być przeciążone

### Błąd "Database configuration error"
- Sprawdź konfigurację Supabase (`SUPABASE_URL`, `SUPABASE_SERVICE_ROLE_KEY`)

### Błąd "OpenStreetMap API error"
- Overpass API może być czasowo niedostępne
- Sprawdź status na: https://overpass-api.de/
- Spróbuj użyć mniejszego promienia wyszukiwania

### Błąd "Invalid coordinates format"
- Użyj formatu: `szerokość,długość` (np. `52.2297,21.0122`)
- Użyj kropki jako separatora dziesiętnego
- Spacje są dozwolone (np. `52.2297, 21.0122`)
- Można wklejać precyzyjne współrzędne z Google Maps

## Koszty

Importowanie danych jest **całkowicie darmowe**:
- OpenStreetMap API: bezpłatne
- Web scraping: bezpłatne
- Brak limitów API do płacenia
- Jedyne ograniczenie: fair use policy dla rate limiting

**Oszczędności**: W porównaniu z Google Places API (~$50-100 za 1000 miejsc), ta implementacja jest w 100% darmowa.