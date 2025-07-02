# Keywords-Postal Codes Generator

Skrypt do generowania macierzy kombinacji słów kluczowych z kodami pocztowymi.

## Opis

Skrypt `generate-keywords-postal-codes.js` łączy:
- **Słowa kluczowe** z pliku `scraper/keywords.txt`
- **Kody pocztowe** z pierwszej kolumny pliku `scraper/Lista-kodów-pocztowych.csv`

I tworzy wszystkie możliwe kombinacje w formacie: `"Słowo kluczowe w Kod-pocztowy"`

## Użycie

```bash
# Standardowe uruchomienie
npm run generate-keywords

# Lub bezpośrednio
node scripts/generate-keywords-postal-codes.js
```

## Pliki wejściowe

### `scraper/keywords.txt`
```
Toaleta
Toaleta publiczna
Centrum handlowe
Restauracja
Kawiarnia
Bar
Stacja kolejowa
Dworzec metra
Dworzec autobusowy
Lotnisko
Stacja benzynowa
```

### `scraper/Lista-kodów-pocztowych.csv`
```csv
Kod;Województwo;Powiat;Gmina;Komentarz
00-001;mazowieckie;Warszawa;Warszawa;całe miasto jako 1 kształt
05-070;mazowieckie;miński;Sulejówek;
...
```

## Plik wyjściowy

### `scraper/keywords-postal-codes.txt`
```
# Keyword-Postal Code Combinations
# Generated on: 2025-07-02T07:00:06.590Z
# Total combinations: 44044
# Format: "Keyword w PostalCode"

Toaleta w 00-001
Toaleta w 05-070
Toaleta w 05-071
Toaleta publiczna w 00-001
Toaleta publiczna w 05-070
Centrum handlowe w 00-001
Centrum handlowe w 05-070
...
```

## Statystyki

Z obecnymi danymi:
- **11 słów kluczowych** × **4,004 kody pocztowe** = **44,044 kombinacje**
- Rozmiar pliku: ~1.3 MB
- Czas generowania: ~5-10 sekund

## Konfiguracja

Możesz modyfikować ustawienia w pliku `scripts/generate-keywords-postal-codes.js`:

```javascript
const CONFIG = {
  postalCodesFile: 'scraper/Lista-kodów-pocztowych.csv',
  keywordsFile: 'scraper/keywords.txt',
  outputFile: 'scraper/keywords-postal-codes.txt',
  separator: ' w ',
  encoding: 'utf-8'
};
```

## Zastosowania

Wygenerowane kombinacje można użyć do:
- **SEO** - długi ogon słów kluczowych dla różnych lokalizacji
- **Wyszukiwanie** - rozszerzone zapytania lokalizacyjne
- **Content marketing** - tematy dla treści lokalnych
- **Google Ads** - szczegółowe targetowanie geograficzne

## Przykłady zastosowania

### 1. Wyszukiwanie lokalne
```
"Toaleta w 00-001" -> Warszawa
"Centrum handlowe w 50-001" -> Wrocław
"Restauracja w 30-001" -> Kraków
```

### 2. SEO długi ogon
```
"Toaleta publiczna w 80-001" -> Gdańsk
"Stacja benzynowa w 40-001" -> Katowice
"Dworzec kolejowy w 90-001" -> Łódź
```

### 3. Targetowanie reklam
```
"Bar w 70-001" -> Szczecin
"Kawiarnia w 15-001" -> Białystok
"Lotnisko w 60-001" -> Poznań
```

## Rozszerzanie

### Dodawanie nowych słów kluczowych
Edytuj `scraper/keywords.txt`:
```
Toaleta
Toaleta publiczna
Hotel         # <- nowe
Hostel        # <- nowe
Camping       # <- nowe
```

### Zmiana separatora
Modyfikuj `CONFIG.separator` w skrypcie:
```javascript
separator: ' w ',     // "Toaleta w 00-001"
separator: ' - ',     // "Toaleta - 00-001"  
separator: ' near ',  // "Toaleta near 00-001"
```

## Troubleshooting

### Błąd: "Postal codes file not found"
```bash
# Sprawdź czy plik istnieje
ls -la scraper/Lista-kodów-pocztowych.csv
```

### Błąd: "Keywords file not found"
```bash
# Sprawdź czy plik istnieje
ls -la scraper/keywords.txt
```

### Plik wyjściowy jest pusty
- Sprawdź format CSV (separator `;`)
- Sprawdź kodowanie plików (UTF-8)
- Sprawdź czy pliki wejściowe mają zawartość

## Przykłady użycia w aplikacji

### Import do bazy danych
```sql
-- Przykład importu do tabeli search_keywords
CREATE TABLE search_keywords (
  id SERIAL PRIMARY KEY,
  keyword TEXT NOT NULL,
  postal_code VARCHAR(6) NOT NULL,
  full_text TEXT NOT NULL
);

-- Import z pliku (przykład)
COPY search_keywords(full_text) 
FROM 'keywords-postal-codes.txt' 
DELIMITER E'\n';
```

### Użycie w wyszukiwaniu
```javascript
// Przykład filtrowania wyników
const searchResults = allResults.filter(result => 
  keywordPostalCombinations.some(combo => 
    result.description.toLowerCase().includes(combo.toLowerCase())
  )
);
```

## Historia zmian

- **v1.0.0** - Pierwsza wersja skryptu
- Kombinacje 11 słów kluczowych × 4,004 kody pocztowe
- Format: "Słowo w Kod"
- Separator: " w "