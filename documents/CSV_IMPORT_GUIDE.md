# Przewodnik Importu CSV do SQL - WC Finder

## Przegląd

Skrypt `csv-to-sql.js` konwertuje dane WC z plików CSV na zapytania SQL gotowe do importu do bazy danych Supabase. Automatycznie mapuje kolumny CSV na odpowiednie pola w bazie danych i obsługuje zarówno podstawowe dane WC jak i dodatkowe zdjęcia.

## Instalacja i Uruchomienie

### Wymagania
- Node.js (wersja 14+)
- Zainstalowane zależności: `npm install`

### Podstawowe użycie
```bash
# Konwertuj plik CSV na SQL
node scripts/csv-to-sql.js dane_wc.csv

# Lub używając npm script
npm run csv-to-sql dane_wc.csv
```

### Opcje zaawansowane
```bash
# Określ plik wyjściowy
node scripts/csv-to-sql.js dane_wc.csv -o import_wc_2024.sql

# Ustaw UUID użytkownika (ważne dla produkcji)
node scripts/csv-to-sql.js dane_wc.csv --user-id "12345678-1234-1234-1234-123456789012"

# Ustaw email twórcy danych
node scripts/csv-to-sql.js dane_wc.csv --created-by "admin@twojadomena.pl"

# Wszystkie opcje razem
node scripts/csv-to-sql.js dane_wc.csv \
  -o import_prod.sql \
  --user-id "12345678-1234-1234-1234-123456789012" \
  --created-by "admin@twojadomena.pl"
```

## Mapowanie Kolumn CSV

Skrypt odczytuje kolumny CSV zgodnie z poniższym mapowaniem:

| Kolumna CSV | Pole w bazie | Opis | Transformacja |
|-------------|--------------|------|---------------|
| 1 | `wcs.google_place_id` | Google Places ID | Bezpośrednie |
| 3 | `wcs.name` | Nazwa miejsca | Sanityzacja apostrofów |
| 4 | `wcs.place_type` | Typ miejsca | Mapowanie na enum |
| 5 | `wcs.address` | Adres | Sanityzacja apostrofów |
| 12 | `wcs.rating` | Ocena | Pomnożenie przez 2, ograniczenie 1-10 |
| 14 | `wcs.location` (latitude) | Szerokość geograficzna | PostGIS GEOGRAPHY |
| 15 | `wcs.location` (longitude) | Długość geograficzna | PostGIS GEOGRAPHY |
| 20 | `wcs.image_url` | URL głównego zdjęcia | Bezpośrednie |
| 24 | `wc_photos.photo` | JSON array zdjęć | Parsowanie JSON → osobne rekordy |

## Typy Miejsc

Skrypt mapuje różne typy miejsc na wartości enum w bazie danych:

### Główne typy
- `restaurant` → Restauracje
- `cafe` → Kawiarnie
- `toilet` / `public_toilet` → Toalety publiczne
- `park` → Parki
- `shopping_mall` → Centra handlowe
- `gas_station` → Stacje benzynowe
- `train_station` / `subway_station` / `bus_station` → Stacje transportu
- `airport` → Lotniska
- `library` → Biblioteki
- `museum` → Muzea

### Mapowanie fallback
- `food` → `restaurant`
- `establishment` → `toilet`
- `point_of_interest` → `tourist_attraction`
- `store` → `supermarket`
- Nieznane typy → `toilet` (domyślne)

## Format Pliku CSV

### Przykładowa struktura CSV
```csv
place_id,col2,name,place_type,address,col6,col7,col8,col9,col10,col11,rating,col13,latitude,longitude,col16,col17,col18,col19,image_url,col21,col22,col23,photos_json
ChIJN1t_tDeuEmsRUsoyG83frY4,data,McDonald's Centrum,restaurant,"ul. Krakowska 12, Warszawa",,,,,,,4.2,,52.2297,21.0122,,,,,https://example.com/image.jpg,,,,"[""https://photo1.jpg"",""https://photo2.jpg""]"
```

### Wymagane pola
- **Kolumna 3 (name)**: Nazwa miejsca - wymagana
- **Kolumny 14,15 (lat,lng)**: Współrzędne - wymagane
- Pozostałe pola są opcjonalne

### Format zdjęć (kolumna 24)
```json
["https://example.com/photo1.jpg", "https://example.com/photo2.jpg"]
```
- Musi być poprawnym JSON array
- URLs muszą zaczynać się od "http"
- Puste: `[]`, `null`, lub puste pole

## Walidacja Danych

### Automatyczne filtry
- ✅ Wiersze bez nazwy są pomijane
- ✅ Wiersze bez współrzędnych są pomijane
- ✅ Niepoprawne JSONy zdjęć są ignorowane
- ✅ URLs zdjęć są walidowane
- ✅ Rating jest ograniczony do 1-10

### Sanityzacja
- Apostrofy w tekstach są escapowane
- Puste wartości konwertowane na NULL
- Typy miejsc mapowane na dozwolone wartości

## Wygenerowany SQL

### Struktura pliku wyjściowego
```sql
-- Nagłówek z metadanymi
-- Transakcja BEGIN;

-- Sekcja WC locations
SET @wc_id_1 = gen_random_uuid();
INSERT INTO wcs (...) VALUES (...);

-- Sekcja WC Photos
INSERT INTO wc_photos (...) VALUES (...);

-- Zakończenie transakcji
COMMIT;
```

### Użyte funkcje PostgreSQL
- `gen_random_uuid()` - generowanie UUID
- `ST_Point(lng, lat)::GEOGRAPHY` - geometria PostGIS
- `NOW()` - timestamp bieżący

## Import do Supabase

### Krok 1: Przygotowanie użytkownika
```sql
-- Sprawdź czy użytkownik istnieje
SELECT id, email FROM auth.users WHERE id = 'YOUR_USER_ID';

-- Lub utwórz użytkownika testowego (development)
INSERT INTO auth.users (id, email, created_at, updated_at)
VALUES ('00000000-0000-0000-0000-000000000000', 'admin@sviete.pl', NOW(), NOW());
```

### Krok 2: Import danych
1. Otwórz Supabase SQL Editor
2. Wklej całą zawartość wygenerowanego pliku SQL
3. Wykonaj zapytanie
4. Sprawdź logi pod kątem błędów

### Krok 3: Weryfikacja
```sql
-- Sprawdź ilość zaimportowanych WC
SELECT COUNT(*) FROM wcs WHERE created_by = 'admin@sviete.pl';

-- Sprawdź zdjęcia
SELECT COUNT(*) FROM wc_photos 
JOIN wcs ON wc_photos.wc_id = wcs.id 
WHERE wcs.created_by = 'admin@sviete.pl';

-- Przykładowe dane
SELECT name, place_type, address, rating FROM wcs LIMIT 5;
```

## Przykłady Użycia

### Scenariusz 1: Import danych testowych
```bash
# Przygotuj plik test_data.csv
node scripts/csv-to-sql.js test_data.csv -o test_import.sql
```

### Scenariusz 2: Import produkcyjny
```bash
# Użyj prawdziwego UUID admin usera
node scripts/csv-to-sql.js production_data.csv \
  -o production_import.sql \
  --user-id "real-admin-uuid-here" \
  --created-by "admin@yourcompany.com"
```

### Scenariusz 3: Import z wieloma plikami
```bash
# Stwórz osobne pliki dla różnych regionów
node scripts/csv-to-sql.js warsaw_wc.csv -o warsaw_import.sql
node scripts/csv-to-sql.js krakow_wc.csv -o krakow_import.sql
node scripts/csv-to-sql.js gdansk_wc.csv -o gdansk_import.sql
```

## Troubleshooting

### Częste błędy

#### 1. "Pominięto wiersz bez nazwy"
```
Przyczyna: Kolumna 3 (name) jest pusta
Rozwiązanie: Upewnij się, że wszystkie wiersze mają nazwę w kolumnie 3
```

#### 2. "Pominięto wiersz bez współrzędnych"
```
Przyczyna: Kolumny 14 lub 15 (lat/lng) są puste lub niepoprawne
Rozwiązanie: Sprawdź format współrzędnych (liczby dziesiętne)
```

#### 3. "Nie można sparsować JSON zdjęć"
```
Przyczyna: Niepoprawny format JSON w kolumnie 24
Rozwiązanie: Sprawdź składnię JSON, użyj [] dla pustych list
```

### Sprawdzanie logów
```bash
# Uruchom z pełnymi logami
node scripts/csv-to-sql.js dane.csv 2>&1 | tee import.log
```

### Walidacja pliku CSV
```bash
# Sprawdź liczbę kolumn
head -1 dane.csv | tr ',' '\n' | wc -l

# Powinno zwrócić co najmniej 24
```

## Rozszerzenia

### Dodawanie nowych typów miejsc
Edytuj `PLACE_TYPE_MAPPING` w `scripts/csv-to-sql.js`:

```javascript
const PLACE_TYPE_MAPPING = {
  // ... istniejące mapowania
  'new_type': 'new_type',
  'alias': 'existing_type'
};
```

### Dodawanie nowych kolumn
1. Zmodyfikuj funkcję `generateWcInsert()`
2. Zaktualizuj zapytanie INSERT
3. Dodaj walidację w `sanitizeString()` lub `sanitizeNumber()`

### Custom transformacje
```javascript
function customTransform(value) {
  // Twoja logika transformacji
  return transformedValue;
}
```

## Performance i Limity

### Zalecenia
- ✅ Pliki do 10,000 wierszy: szybkie przetwarzanie
- ⚠️ Pliki 10,000-100,000 wierszy: może trwać kilka minut
- ❌ Pliki ponad 100,000 wierszy: rozważ podział na mniejsze części

### Optymalizacja
```bash
# Podziel duże pliki
split -l 5000 big_file.csv small_file_

# Przetwórz każdy osobno
for file in small_file_*; do
  node scripts/csv-to-sql.js "$file" -o "${file}.sql"
done
```

## Bezpieczeństwo

### Dane wrażliwe
- ❌ Nie umieszczaj prawdziwych UUID użytkowników w commitach
- ❌ Nie commituj plików CSV z rzeczywistymi danymi
- ✅ Używaj zmiennych środowiskowych dla UUID produkcyjnych
- ✅ Testuj na danych anonimowych

### SQL Injection
Skrypt automatycznie sanityzuje:
- Apostrofy w stringach (`'` → `''`)
- Sprawdza typy numeryczne
- Waliduje formaty URL

## Wsparcie

### Zgłaszanie błędów
Jeśli napotkasz problemy:
1. Sprawdź format pliku CSV
2. Uruchom z przykładowymi danymi
3. Sprawdź logi błędów
4. Zgłoś issue z przykładowymi danymi (zanonimizowanymi)

### Rozwój
Skrypt jest częścią projektu WC Finder i może być rozszerzany o nowe funkcje zgodnie z potrzebami aplikacji.