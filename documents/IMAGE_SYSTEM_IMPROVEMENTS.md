# Ulepszenia Systemu Obrazów - WC Finder

## Przegląd zmian

System pobierania zdjęć dla importowanych lokalizacji WC został całkowicie przeprojektowany, aby zapewnić lepszą jakość obrazów i bardziej kontekstowe dopasowanie do rzeczywistości.

## Problem

Poprzedni system pobierał zdjęcia które **nie odpowiadały rzeczywistości** - często pokazywał generyczne ikony toalet zamiast rzeczywistych lokalizacji lub nieodpowiednie obrazy.

## Rozwiązanie

### 1. Inteligentny System Kontekstowy

Nowy system analizuje:
- **Nazwę miejsca** - wyodrębnia istotne informacje
- **Typ lokalizacji** - dostosowuje strategię wyszukiwania
- **Adres** - wykorzystuje informacje geograficzne

### 2. Specjalne Traktowanie Toalet

Dla toalet publicznych system:
- Usuwa słowa "toaleta", "WC", "toilet" z zapytań wyszukiwania
- Szuka obrazów **budynku/lokalizacji** zamiast generycznych ikon WC
- Konstruuje zapytania typu: `"nazwa budynku" "adres" miasto`

### 3. Hierarchia Źródeł Obrazów

1. **Bing Images** - próba znalezienia prawdziwych zdjęć lokalizacji
2. **Kontekstowe placeholdery** - wysokiej jakości obrazy z Unsplash
3. **Spójność wizualna** - ta sama lokalizacja = ten sam obraz

### 4. Dedykowane Zestawy Obrazów

Każdy typ miejsca ma własny zestaw kuratorowanych obrazów:

#### Toalety (`toilet`, `public_toilet`)
- Nowoczesne budynki publiczne
- Architektura miejska
- Budynki biurowe

#### Restauracje (`restaurant`)
- Wnętrza restauracji
- Zewnętrzne elewacje lokali gastronomicznych
- Przestrzenie jadalne

#### Kawiarnie (`cafe`)
- Wnętrza kawiarni
- Klimatyczne przestrzenie coffee shopów
- Zewnętrzne tarasy

#### Parki (`park`)
- Tereny zielone
- Parki miejskie
- Przestrzenie rekreacyjne

#### Centra handlowe (`shopping_mall`)
- Wnętrza galerii
- Nowoczesna architektura handlowa
- Przestrzenie komercyjne

#### Stacje benzynowe (`gas_station`)
- Stacje paliw
- Obiekty serwisowe
- Infrastruktura paliwowa

## Implementacja Techniczna

### Usunięte Zależności
- ❌ `images-scraper` - problemy z bezpieczeństwem
- ❌ `playwright` - zbyt ciężkie dla prostego use case
- ❌ `google-images-scraper` - przestarzałe

### Nowe Funkcje

#### `searchContextualPhoto()`
Inteligentne wyszukiwanie kontekstowe z możliwością rozszerzenia o zewnętrzne API.

#### `getDefaultPhotoForPlace()`
Enhanced placeholder system z:
- Wieloma wariantami obrazów dla każdego typu
- Konsystentnym algorytmem wyboru (hash nazwy miejsca)
- Wysokiej jakości obrazami z Unsplash

#### Strategia Fallback
```
1. Kontekstowe wyszukiwanie → 
2. Bing Images → 
3. Kuratorowane placeholdery
```

## Konfiguracja

### Zmienne Środowiskowe
```bash
# Włącz/wyłącz wyszukiwanie obrazów
ENABLE_IMAGE_SEARCH=true

# Timeout dla zapytań (ms)
IMAGE_SEARCH_TIMEOUT=10000

# Maksymalna liczba prób
IMAGE_SEARCH_MAX_RETRIES=3
```

## Zalety Nowego Systemu

### ✅ Spójność Wizualna
- Ta sama lokalizacja zawsze otrzymuje ten sam obraz
- Konsystentny algorytm wyboru oparty na hash nazwy

### ✅ Wysoka Jakość
- Wszystkie placeholdery z wysokiej jakości źródeł (Unsplash)
- Obrazy w rozdzielczości 400x300 z automatyczną optymalizacją

### ✅ Kontekstowość
- Obrazy dopasowane do typu miejsca
- Dla toalet: budynki zamiast ikon WC
- Dla restauracji: prawdziwe wnętrza restauracyjne

### ✅ Różnorodność
- Każdy typ miejsca ma 3+ warianty obrazów
- Unika powtarzalności wizualnej

### ✅ Performance
- Szybkie fallback do lokalnych zasobów
- Brak ciężkich zależności (Playwright, etc.)
- Optymalizacja dla środowiska produkcyjnego

### ✅ Rozszerzalność
- Łatwe dodawanie nowych typów miejsc
- Możliwość integracji z zewnętrznymi API
- Konfiguracja przez zmienne środowiskowe

## Strona Demonstracyjna

Utworzono stronę `/test-images` pokazującą:
- Przykłady obrazów dla różnych typów miejsc
- Jak działa algorytm wyboru obrazów
- Spójność systemu (ta sama nazwa = ten sam obraz)

## Plany Rozwoju

### Przyszłe Ulepszenia
1. **Integracja z Google Street View API** - prawdziwe zdjęcia ulic
2. **Unsplash API** - dynamiczne wyszukiwanie kontekstowych obrazów
3. **Pixabay API** - alternatywne źródło darmowych obrazów
4. **Machine Learning** - automatyczna klasyfikacja jakości obrazów
5. **Cache obrazów** - lokalne przechowywanie popularnych obrazów

### Możliwe Rozszerzenia
- Geolokalizacja obrazów (zdjęcia z tego samego miasta)
- Sezonowe obrazy (różne pory roku)
- User-generated content (zdjęcia od użytkowników)
- AI upscaling dla lepszej jakości

## Migracja

System jest **wstecznie kompatybilny** - nie wymaga zmian w istniejących danych. Nowe lokalizacje automatycznie korzystają z ulepszonego systemu obrazów.

## Testowanie

Przeprowadź test systemu odwiedzając:
```
http://localhost:3000/test-images
```

Strona pokazuje jak system dobiera obrazy dla różnych typów miejsc i pozwala na interaktywne testowanie algorytmu.