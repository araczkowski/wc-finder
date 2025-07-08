# CSV to SQL Converter

Skrypt konwertuje wszystkie pliki CSV znajdujące się w podanym folderze do plików SQL o tej samej nazwie.

## Użycie

```bash
node scripts/csv-to-sql.js <folder_csv> [opcje]
```

## Opcje

- `--output-dir, -o <folder>` - Folder wyjściowy SQL (domyślnie: ./output)
- `--user-id <uuid>` - UUID użytkownika dla importowanych danych
- `--created-by <email>` - Email użytkownika dla importowanych danych
- `--help, -h` - Pokaż pomoc

## Przykłady użycia

### Podstawowe użycie
```bash
node scripts/csv-to-sql.js ./csv-files
```

### Z niestandardowym folderem wyjściowym
```bash
node scripts/csv-to-sql.js ./csv-files -o ./sql-output
```

### Z niestandardowym użytkownikiem
```bash
node scripts/csv-to-sql.js ./csv-files --user-id "12345678-1234-1234-1234-123456789012" --created-by "admin@example.com"
```

### Używając npm script
```bash
npm run csv-to-sql-folder ./csv-files -o ./output
```

## Format CSV

Skrypt obsługuje format CSV z następującymi kolumnami:

| Kolumna | Nazwa | Opis |
|---------|-------|------|
| 0 | input_id | Google Place ID |
| 2 | title | Nazwa lokalizacji |
| 4 | category | Typ miejsca |
| 5 | address | Adres |
| 11 | review_rating | Ocena (1-5) |
| 13 | latitude | Szerokość geograficzna |
| 14 | longitude | Długość geograficzna |
| 19 | thumbnail | URL zdjęcia głównego |
| 23 | images | JSON array ze zdjęciami |

## Przykład działania

```bash
$ node scripts/csv-to-sql.js scraper/csv -o output

Znaleziono 12 plików CSV w folderze: scraper/csv
Folder wyjściowy SQL: output
User ID: cac878bb-3f77-42a7-9221-919238bfae76
Created by: public@sviete.pl

[1/12] Przetwarzanie: restaurants.csv
✅ Przetworzono: 1500 lokalizacji WC, pominięto: 2 wierszy
📄 Plik SQL zapisany jako: output/restaurants.sql

[2/12] Przetwarzanie: cafes.csv
✅ Przetworzono: 800 lokalizacji WC, pominięto: 1 wierszy
📄 Plik SQL zapisany jako: output/cafes.sql

🎉 Konwersja wszystkich plików zakończona!
📊 Statystyki ogólne:
   - Przetworzono plików CSV: 12
   - Błędy: 0
   - Lokalizacje WC: 15000
   - Pominięte wiersze: 10
   - Zdjęcia: 45000
📁 Pliki SQL zapisane w: output
```

## Generowane pliki SQL

Każdy plik SQL zawiera:
- Komentarze z metadanymi (data, plik źródłowy, użytkownik)
- Instrukcje INSERT dla tabeli `wcs`
- Instrukcje INSERT dla tabeli `wc_photos`
- Obsługę błędów PostgreSQL
- Podsumowanie

## Przykład wygenerowanego SQL

```sql
-- Import WC data from CSV
-- Generated on: 2024-07-08T07:41:51.652Z
-- Source file: csv-files/restaurants.csv
-- User ID: cac878bb-3f77-42a7-9221-919238bfae76
-- Created by: public@sviete.pl

DO $$
DECLARE
l_context text;
BEGIN

-- WC #1: McDonald's
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'McDonald''s', 'ul. Przykładowa 1, 00-001 Warszawa', 'https://example.com/image.jpg', 'abc123', 4.2, ST_Point(21.0, 52.0)::GEOGRAPHY, 'Restauracja fast food', NOW(), NOW());

-- Photos for WC: McDonald's
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://example.com/photo1.jpg', NOW(), NOW()
FROM wcs WHERE name = 'McDonald''s' AND address = 'ul. Przykładowa 1, 00-001 Warszawa' AND created_by = 'public@sviete.pl' LIMIT 1;

EXCEPTION WHEN OTHERS THEN
RAISE NOTICE 'Error Name:%', SQLERRM;
RAISE NOTICE 'Error State:%', SQLSTATE;
GET STACKED DIAGNOSTICS l_context = PG_EXCEPTION_CONTEXT;
RAISE NOTICE 'ERROR:%', l_context;
END;
$$;
```

## Import do Supabase

1. Otwórz Supabase SQL Editor
2. Skopiuj zawartość każdego pliku SQL z folderu wyjściowego
3. Wklej i wykonaj zapytanie
4. Sprawdź logi w przypadku błędów

## Wymagania

- Node.js
- Pakiet `csv-parse`
- Tabele `wcs` i `wc_photos` w bazie danych
- Użytkownik o podanym UUID musi istnieć w tabeli `auth.users`

## Obsługa błędów

Skrypt automatycznie:
- Pomija wiersze bez nazwy
- Pomija wiersze bez współrzędnych
- Sanitizuje ciągi znaków (escape SQL)
- Parsuje JSON ze zdjęciami
- Loguje wszystkie pominięte wiersze

## Struktury tabel

### Tabela `wcs`
```sql
CREATE TABLE wcs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES auth.users(id),
    created_by TEXT,
    name TEXT NOT NULL,
    address TEXT,
    image_url TEXT,
    google_place_id TEXT,
    rating DECIMAL(2,1),
    location GEOGRAPHY(POINT),
    place_type TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

### Tabela `wc_photos`
```sql
CREATE TABLE wc_photos (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    wc_id UUID REFERENCES wcs(id) ON DELETE CASCADE,
    user_id UUID REFERENCES auth.users(id),
    photo TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```
