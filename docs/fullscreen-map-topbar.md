# Górna belka na mapie w trybie pełnoekranowym

## Opis funkcjonalności

Gdy mapa jest wyświetlana w trybie pełnoekranowym (po wpisaniu adresu i znalezieniu WC), wyświetlana jest górna belka zawierająca:

- **Logo i nazwę aplikacji** (po lewej stronie)
- **Przycisk "Dodaj WC"** (po prawej stronie) 
- **Menu użytkownika** z avatarem i dropdown (po prawej stronie)

## Implementacja

### Struktura komponentu

```jsx
<div className="map-top-bar" style={{ /* style */ }}>
  {/* Logo i tytuł */}
  <div className="logo">
    <div className="logo-icon">🚾</div>
    <span className="logo-text">WC Finder</span>
  </div>

  {/* Kontrolki po prawej */}
  <div className="controls">
    {/* Przycisk Dodaj WC */}
    <Link href="/wc/add" className="add-wc-btn">
      <Plus className="add-wc-icon" size={16} />
      <span className="add-wc-text">{t("addNewWc")}</span>
    </Link>

    {/* Menu użytkownika */}
    <UserDropdown session={session} />
  </div>
</div>
```

### Style CSS

Belka używa następujących styli:
- `position: absolute` z `top: 0`
- `zIndex: 12` (powyżej mapy, ale poniżej dropdown menu)
- `backgroundColor: rgba(255, 255, 255, 0.95)` z `backdropFilter: blur(10px)`
- `height: 60px` na desktop, `50px` na mobile

### Responsywność

#### Desktop (≥ 900px)
- Pełny tekst "WC Finder" i "Dodaj WC"
- Większe ikony (24px emoji, 16px Plus)
- Padding 20px po bokach

#### Tablet (500px - 899px)
- Pełny tekst, ale mniejsze ikony
- Padding 15px po bokach

#### Mobile (< 500px)
- Mniejsze ikony (20px emoji, 14px Plus)
- Kompaktowy padding (12px po bokach)
- Wysokość belki zmniejszona do 50px

#### Bardzo małe ekrany (< 400px)
- Ukryty tekst "WC Finder"
- Przycisk pokazuje tylko "+" zamiast "Dodaj WC"
- Padding zmniejszony do 10px

## Hook useWindowSize

Do obsługi responsywności używany jest custom hook:

```javascript
const { width, isMobile } = useWindowSize();
```

Hook zwraca:
- `width`, `height` - aktualne wymiary okna
- `isMobile` - true dla ekranów < 500px
- `isTablet` - true dla ekranów 500px-899px  
- `isDesktop` - true dla ekranów ≥ 900px

## Z-index struktura

- **Mapa**: `zIndex: 1`
- **Adres overlay**: `zIndex: 10`
- **Reset button**: `zIndex: 11`
- **Top bar**: `zIndex: 12`
- **User dropdown**: `zIndex: 9999`

## Pozycjonowanie innych elementów

Po dodaniu górnej belki, inne elementy zostały przesunięte:

```javascript
// Adres overlay
top: "80px", // było "20px"

// Reset button  
top: "80px", // było "20px"
```

Na mobile (< 500px):
```css
.map-content-overlay,
.map-reset-button {
  top: 60px !important; /* zamiast 80px */
}
```

## Funkcjonalności

### Przycisk "Dodaj WC"
- Widoczny tylko dla zalogowanych użytkowników (nie dla `public@sviete.pl`)
- Przekierowuje do `/wc/add`
- Używa tłumaczenia `t("addNewWc")`
- Hover efekt z animacją

### Menu użytkownika
- Komponent `UserDropdown` z istniejącymi stylami
- Pokazuje avatar, imię/email użytkownika
- Dropdown z opcjami (O aplikacji, Admin panel, Wyloguj)

## Pliki związane

- **Główny komponent**: `app/page.js` (linie 1484-1590)
- **Hook responsywności**: `app/hooks/useWindowSize.js`
- **Style CSS**: `app/globals.css` (linie 1293-1348)
- **Komponent dropdown**: `app/components/UserDropdown.js`
- **Tłumaczenia**: `app/locales/pl.js`

## Testowanie

Aby przetestować belkę:

1. Zaloguj się do aplikacji
2. Wpisz adres lub użyj GPS
3. Poczekaj aż mapa się wyświetli w trybie pełnoekranowym
4. Sprawdź czy belka jest widoczna na górze
5. Przetestuj responsywność zmieniając rozmiar okna przeglądarki
6. Sprawdź funkcjonalność przycisków i dropdown menu

## Potencjalne ulepszenia

1. **Dodanie przycisku zamknięcia mapy** - powrót do widoku listy
2. **Breadcrumbs** - pokazanie aktualnego adresu w belce
3. **Wyszukiwarka** - możliwość zmiany adresu bez zamykania mapy
4. **Filtrowanie WC** - szybkie filtry w belce (ocena, dostępność, itp.)
5. **Tryb nocny** - przełącznik ciemnego motywu