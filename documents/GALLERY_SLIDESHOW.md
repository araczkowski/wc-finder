# Gallery Slideshow - Dokumentacja

## Przegląd

System Gallery Slideshow w WC Finder automatycznie wyświetla zdjęcia z galerii jako slideshow na stronie głównej, gdy główne zdjęcie WC nie jest dostępne w `wc-images`, ale istnieją zdjęcia w galerii `wc-photos`.

## Funkcjonalności

### 🖼️ **Automatyczne Fallback**
- Jeśli WC nie ma głównego zdjęcia (`image_url`), system automatycznie pobiera zdjęcia z galerii
- Pierwsze zdjęcie z galerii staje się głównym zdjęciem
- Wszystkie zdjęcia z galerii są dostępne w slideshow

### 🎬 **Slideshow**
- **Automatyczne przełączanie**: Co 3 sekundy
- **Nawigacja ręczna**: Strzałki lewo/prawo, swipe na mobile
- **Nawigacja klawiaturą**: Strzałki, spacja (pauza), escape (wyjście)
- **Wskaźniki**: Kropki na dole, licznik zdjęć, status auto-play
- **Touch/Swipe**: Obsługa gestów na urządzeniach dotykowych

## Implementacja

### API Endpoint (`/api/wcs`)
```javascript
// Pobiera zdjęcia z galerii jeśli brak głównego zdjęcia
const enhancedWcs = await Promise.all(
  (wcs || []).map(async (wc) => {
    if (wc.image_url) {
      return wc; // Już ma główne zdjęcie
    }

    // Pobierz zdjęcia z galerii
    const { data: photos } = await supabase
      .from("wc_photos")
      .select("photo")
      .eq("wc_id", wc.id)
      .order("created_at", { ascending: true });

    if (photos && photos.length > 0) {
      return {
        ...wc,
        gallery_photos: photos.map(p => p.photo),
        image_url: photos[0].photo, // Pierwsze jako główne
      };
    }

    return wc;
  })
);
```

### Komponent ImageSlideshow
```javascript
import ImageSlideshow from './components/ImageSlideshow';

// Użycie w komponencie
<ImageSlideshow
  images={wc.gallery_photos || [wc.image_url]}
  alt={wc.name}
  className="thumbnail-in-table"
  width={400}
  height={400}
/>
```

## Struktura Danych

### WC Object (rozszerzony)
```javascript
{
  id: "uuid",
  name: "Nazwa WC",
  image_url: "url-głównego-zdjęcia", // null jeśli brak
  gallery_photos: [                   // dodawane automatycznie
    "url-zdjęcia-1",
    "url-zdjęcia-2",
    "url-zdjęcia-3"
  ],
  // ... inne pola
}
```

## Nawigacja

### 🖱️ **Mysz/Desktop**
- **Strzałki**: Kliknij lewy/prawy przycisk nawigacji
- **Kropki**: Kliknij na kropkę aby przejść do konkretnego zdjęcia
- **Auto-play**: Kliknij ikonę ▶/⏸ aby włączyć/wyłączyć

### ⌨️ **Klawiatura**
- **←/→**: Nawigacja między zdjęciami
- **Spacja**: Pauza/wznowienie auto-play
- **Escape**: Wyjście z focusa slideshow

### 📱 **Touch/Mobile**
- **Swipe lewo**: Następne zdjęcie
- **Swipe prawo**: Poprzednie zdjęcie
- **Tap na strzałki**: Nawigacja
- **Tap na kropki**: Przejście do konkretnego zdjęcia

## Responsywność

### Mobile (≤767px)
- Mniejsze przyciski nawigacji (25x25px)
- Mniejsze kropki wskaźników (6x6px)
- Zmniejszona czcionka liczników
- Optimized touch targets

### Desktop (≥768px)
- Większe przyciski nawigacji (30x30px)
- Hover effects na przyciskach
- Większe kropki wskaźników (8x8px)
- Wsparcie dla klawiatury

## Stany Slideshow

### Pojedyncze zdjęcie
```javascript
// Wyświetla zwykły Image component
if (images.length === 1) {
  return <Image src={images[0]} ... />;
}
```

### Wiele zdjęć
```javascript
// Wyświetla pełny slideshow z:
// - Nawigacją
// - Wskaźnikami
// - Auto-play
// - Touch support
```

### Brak zdjęć
```javascript
// Wyświetla placeholder
<div className="thumbnail-placeholder">
  Brak zdjęcia
</div>
```

## Konfiguracja

### Ustawienia Auto-play
```javascript
// W ImageSlideshow.js
const AUTOPLAY_INTERVAL = 3000; // 3 sekundy
const MANUAL_PAUSE_DURATION = 5000; // 5 sekund po ręcznej nawigacji
```

### Ustawienia Touch
```javascript
const minSwipeDistance = 50; // Minimalna odległość swipe (px)
```

### Style CSS
```css
/* Główne style w globals.css */
.slideshow-container { /* Kontener slideshow */ }
.slideshow-nav { /* Przyciski nawigacji */ }
.slideshow-dots { /* Kropki wskaźników */ }
.slideshow-counter { /* Licznik zdjęć */ }
.slideshow-autoplay-indicator { /* Wskaźnik auto-play */ }
```

## Dostępność (Accessibility)

### ARIA Labels
- `role="img"` na kontenerze slideshow
- `aria-label` z opisem zawartości
- `title` na przyciskach nawigacji

### Keyboard Navigation
- `tabIndex={0}` dla focusa klawiatury
- Wskaźnik aktywnego focusa
- Instrukcje nawigacji po naciśnięciu focus

### Screen Readers
- Opisowe alt text dla każdego zdjęcia
- Informacje o pozycji w slideshow

## Wydajność

### Lazy Loading
- Obrazy ładowane przez Next.js Image component
- Automatyczna optymalizacja rozmiaru
- WebP format gdy dostępny

### Memory Management
- useCallback dla funkcji nawigacji
- Proper cleanup event listeners
- Efficient re-renders

## Przykłady Użycia

### Podstawowe użycie
```javascript
<ImageSlideshow
  images={["url1.jpg", "url2.jpg", "url3.jpg"]}
  alt="Galeria WC"
  className="thumbnail-in-table"
  width={400}
  height={400}
/>
```

### Z pojedynczym zdjęciem
```javascript
<ImageSlideshow
  images={["single-image.jpg"]}
  alt="WC Główne zdjęcie"
  className="thumbnail-in-table"
  width={400}
  height={400}
/>
```

### Bez zdjęć
```javascript
<ImageSlideshow
  images={[]}
  alt="WC"
  className="thumbnail-in-table"
  width={400}
  height={400}
/>
// Wyświetli placeholder "Brak zdjęcia"
```

## Zachowanie Slideshow

### Auto-play
- ✅ **Włączone domyślnie**: Automatyczne przełączanie co 3s
- ⏸️ **Pauzuje po interakcji**: Po ręcznej nawigacji pauzuje na 5s
- 🔄 **Powrót do auto-play**: Automatycznie po 5s bezczynności
- 🎯 **Toggle manual**: Kliknięcie ikony ▶/⏸ lub spacja

### Nawigacja
- 🔄 **Cykliczność**: Po ostatnim zdjęciu przechodzi do pierwszego
- ⚡ **Responsywność**: Natychmiastowa reakcja na input
- 📱 **Touch-friendly**: Optimized for mobile gestures

### Wskaźniki
- 📍 **Pozycja**: Kropki pokazują aktualną pozycję
- 🔢 **Licznik**: "2/5" pokazuje aktualne/całkowite
- ▶ **Status**: Ikona pokazuje stan auto-play

## Rozwiązywanie Problemów

### Slideshow nie pokazuje się
- ✅ Sprawdź czy `images` array nie jest pusty
- ✅ Sprawdź czy URLs zdjęć są prawidłowe
- ✅ Sprawdź console pod kątem błędów ładowania

### Auto-play nie działa
- ✅ Sprawdź czy więcej niż 1 zdjęcie
- ✅ Sprawdź czy `isAutoPlaying` state jest true
- ✅ Sprawdź czy nie ma konfliktów z event listeners

### Touch/swipe nie działa
- ✅ Sprawdź czy urządzenie obsługuje touch events
- ✅ Sprawdź minimalne odległości swipe
- ✅ Sprawdź czy touch handlers są properly attached

### Klawiatura nie działa
- ✅ Sprawdź czy slideshow ma focus (`isFocused` state
