# Optymalizacja Obrazów w WC Finder

## Przegląd

WC Finder automatycznie optymalizuje wszystkie przesyłane obrazy przed wysłaniem do Supabase Storage, co skutkuje szybszym przesyłaniem, mniejszym zużyciem danych i lepszą wydajnością aplikacji.

## Funkcjonalności

### Automatyczna Optymalizacja
- **Kompresja**: Automatyczne zmniejszanie rozmiaru plików obrazów
- **Zmiana rozmiaru**: Dostosowanie wymiarów do optymalnych rozmiarów
- **Konwersja formatu**: Konwersja do JPEG dla lepszej kompatybilności
- **Walidacja**: Sprawdzanie poprawności i obsługiwanych formatów

### Typy Obrazów

#### 1. Główne zdjęcie WC (`WC_MAIN_IMAGE_CONFIG`)
- **Maksymalne wymiary**: 1200x1200px
- **Jakość**: 80%
- **Format wyjściowy**: JPEG
- **Maksymalny rozmiar**: 2MB
- **Użycie**: Główne zdjęcie toalety na stronie dodawania WC

#### 2. Zdjęcia galerii (`WC_GALLERY_CONFIG`)
- **Maksymalne wymiary**: 800x800px
- **Jakość**: 85%
- **Format wyjściowy**: JPEG
- **Maksymalny rozmiar**: 1MB
- **Użycie**: Dodatkowe zdjęcia w galerii na stronach view/edit

#### 3. Miniatury (`WC_THUMBNAIL_CONFIG`)
- **Maksymalne wymiary**: 400x400px
- **Jakość**: 90%
- **Format wyjściowy**: JPEG
- **Maksymalny rozmiar**: 500KB
- **Użycie**: Małe podglądy na liście WC

## Obsługiwane Formaty

### Formaty wejściowe
- JPEG/JPG
- PNG
- WebP
- GIF

### Format wyjściowy
- JPEG (domyślnie dla wszystkich typów)

## Proces Optymalizacji

1. **Walidacja** - Sprawdzenie czy plik jest obrazem i czy format jest obsługiwany
2. **Sprawdzenie rozmiaru** - Jeśli plik jest już wystarczająco mały, optymalizacja zostaje pominięta
3. **Zmiana rozmiaru** - Zachowanie proporcji przy zmniejszaniu wymiarów
4. **Kompresja** - Zastosowanie kompresji JPEG z określoną jakością
5. **Konwersja nazwy** - Dodanie sufiksu `_optimized` do nazwy pliku

## Konfiguracja

### Główna konfiguracja (`IMAGE_OPTIMIZATION_CONFIG`)
```javascript
export const IMAGE_OPTIMIZATION_CONFIG = {
  maxWidth: 1200,
  maxHeight: 1200,
  quality: 0.8,
  outputFormat: "image/jpeg",
  maxFileSize: 2 * 1024 * 1024, // 2MB
  preserveExif: false,
  backgroundColor: "#FFFFFF"
};
```

### Modyfikacja parametrów

Aby zmienić parametry optymalizacji, edytuj odpowiednie konfiguracje w pliku `/app/utils/imageOptimizer.js`:

```javascript
// Dla głównych zdjęć WC
export const WC_MAIN_IMAGE_CONFIG = {
  maxWidth: 1200,        // Zmień szerokość
  maxHeight: 1200,       // Zmień wysokość
  quality: 0.8,          // Jakość: 0.1-1.0
  outputFormat: "image/jpeg",
  maxFileSize: 2 * 1024 * 1024, // Maksymalny rozmiar
  preserveExif: false,
  backgroundColor: "#FFFFFF"
};

// Dla zdjęć galerii
export const WC_GALLERY_CONFIG = {
  maxWidth: 800,
  maxHeight: 800,
  quality: 0.85,
  // ... inne parametry
};
```

## Informacje dla Użytkownika

### Feedback podczas optymalizacji
- Wskaźnik postępu podczas optymalizacji
- Informacje o oszczędności miejsca
- Porównanie rozmiarów przed i po optymalizacji

### Przykład wyświetlanej informacji:
```
✅ Zdjęcie zoptymalizowane!
📦 Rozmiar: 3.2 MB → 850 KB
💾 Oszczędność: 2.35 MB (73.4%)
```

## API

### Główne funkcje

#### `optimizeImage(file, config)`
Optymalizuje pojedynczy obraz.

**Parametry:**
- `file` (File) - Plik obrazu do optymalizacji
- `config` (Object) - Opcjonalna konfiguracja (nadpisuje domyślną)

**Zwraca:** Promise<File> - Zoptymalizowany plik

#### `optimizeImages(files, config)`
Optymalizuje wiele obrazów jednocześnie.

**Parametry:**
- `files` (FileList|Array) - Lista plików do optymalizacji
- `config` (Object) - Opcjonalna konfiguracja

**Zwraca:** Promise<Array<File>> - Tablica zoptymalizowanych plików

#### `validateImageFile(file, config)`
Waliduje plik obrazu przed optymalizacją.

**Parametry:**
- `file` (File) - Plik do walidacji
- `config` (Object) - Opcjonalna konfiguracja

**Zwraca:** Object - Wynik walidacji

```javascript
{
  isValid: boolean,
  errors: string[]
}
```

## Przykłady Użycia

### Optymalizacja pojedynczego obrazu
```javascript
import { optimizeImage, WC_MAIN_IMAGE_CONFIG } from '../utils/imageOptimizer';

const handleFileChange = async (e) => {
  const file = e.target.files[0];
  if (file) {
    try {
      const optimizedFile = await optimizeImage(file, WC_MAIN_IMAGE_CONFIG);
      setSelectedFile(optimizedFile);
    } catch (error) {
      console.error('Optimization failed:', error);
    }
  }
};
```

### Optymalizacja wielu obrazów
```javascript
import { optimizeImages, WC_GALLERY_CONFIG } from '../utils/imageOptimizer';

const handleMultipleFiles = async (e) => {
  const files = Array.from(e.target.files);
  try {
    const optimizedFiles = await optimizeImages(files, WC_GALLERY_CONFIG);
    setSelectedFiles(optimizedFiles);
  } catch (error) {
    console.error('Batch optimization failed:', error);
  }
};
```

### Walidacja przed optymalizacją
```javascript
import { validateImageFile } from '../utils/imageOptimizer';

const handleFileSelection = (file) => {
  const validation = validateImageFile(file);
  if (!validation.isValid) {
    setError(`Validation failed: ${validation.errors.join(', ')}`);
    return;
  }
  // Proceed with optimization...
};
```

## Wydajność

### Korzyści
- **Szybsze przesyłanie**: Mniejsze pliki = szybszy upload
- **Oszczędność danych**: Średnio 60-80% redukcji rozmiaru
- **Lepsza wydajność**: Szybsze ładowanie obrazów w aplikacji
- **Oszczędność miejsca**: Mniejsze zużycie storage w Supabase

### Przykładowe oszczędności
- **Zdjęcie z telefonu (4MB)** → **Zoptymalizowane (800KB)** = 80% oszczędności
- **Screenshot (2MB)** → **Zoptymalizowany (400KB)** = 80% oszczędności
- **PNG z przezroczystością (1.5MB)** → **JPEG (300KB)** = 80% oszczędności

## Rozwiązywanie Problemów

### Częste problemy

#### Błąd: "File is not an image"
- **Przyczyna**: Wysyłany plik nie jest obrazem
- **Rozwiązanie**: Sprawdź czy plik ma poprawny format (JPEG, PNG, WebP, GIF)

#### Błąd: "Unsupported image format"
- **Przyczyna**: Format obrazu nie jest obsługiwany
- **Rozwiązanie**: Konwertuj obraz do obsługiwanego formatu

#### Błąd: "File is too large"
- **Przyczyna**: Plik przekracza maksymalny dozwolony rozmiar przed optymalizacją
- **Rozwiązanie**: Zmniejsz rozmiar pliku lub zwiększ limit w konfiguracji

#### Błąd: "Failed to compress image"
- **Przyczyna**: Błąd podczas procesu kompresji
- **Rozwiązanie**: Sprawdź czy obraz nie jest uszkodzony

### Debugowanie

Włącz logi w konsoli przeglądarki, aby zobaczyć szczegóły procesu optymalizacji:

```javascript
console.log('[ImageOptimizer] Optimization complete:', {
  originalSize: '3.2 MB',
  optimizedSize: '850 KB',
  compression: '73.4%',
  originalDimensions: '4000x3000',
  newDimensions: '1200x900'
});
```

## Bezpieczeństwo

- **Walidacja po stronie klienta**: Sprawdzanie typu i rozmiaru pliku
- **Walidacja po stronie serwera**: Dodatkowa weryfikacja w API
- **Oczyszczanie metadanych**: Usuwanie danych EXIF dla prywatności
- **Bezpieczne nazwy plików**: Generowanie unikalnych nazw plików

## Przyszłe Rozszerzenia

### Planowane funkcjonalności
- **Format WebP**: Wsparcie dla WebP jako format wyjściowy
- **Progresywne JPEG**: Lepsze ładowanie obrazów
- **Automatyczna detekcja jakości**: Dynamiczne dostosowanie kompresji
- **Transformacje po stronie serwera**: Supabase Image Transformations
- **Batch processing**: Optymalizacja w tle dla lepszej wydajności

### Konfiguracja zaawansowana
```javascript
// Przyszła konfiguracja
export const ADVANCED_CONFIG = {
  autoQuality: true,          // Automatyczna jakość
  progressiveJpeg: true,      // Progresywny JPEG
  webpFallback: true,         // WebP z fallback do JPEG
  serverSideTransform: true   // Transformacje po stronie serwera
};
```
