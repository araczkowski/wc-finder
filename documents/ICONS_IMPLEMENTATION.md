# Implementacja Lucide Icons w WC Finder

## Instalacja

```bash
npm install lucide-react
```

## Import i użycie

### 1. Podstawowy import
```javascript
import { MapPin, Camera, Star, Navigation, Home, Search, Plus } from 'lucide-react'
```

### 2. Przykłady użycia w komponentach

#### W głównej nawigacji (layout.js)
```javascript
import { Home, Plus, MapPin, User } from 'lucide-react'

<nav>
  <Link href="/">
    <Home size={20} />
    Strona główna
  </Link>
  <Link href="/wc/add">
    <Plus size={20} />
    Dodaj WC
  </Link>
</nav>
```

#### W formularzu dodawania WC (add/page.js)
```javascript
import { Camera, MapPin, Star, Navigation } from 'lucide-react'

// Przycisk dodania zdjęcia
<button type="button" onClick={() => document.getElementById("imageFile").click()}>
  <Camera size={18} />
  Dodaj zdjęcie
</button>

// Przycisk GPS
<button type="button" onClick={getCurrentLocation}>
  <Navigation size={16} />
  GPS
</button>

// Ikona lokalizacji
<div>
  <MapPin size={16} />
  <span>Lokalizacja wykryta</span>
</div>
```

#### W liście WC (page.js)
```javascript
import { Star, MapPin, Edit, Eye } from 'lucide-react'

// Ocena gwiazdkami
<div className="rating">
  {[...Array(rating)].map((_, i) => (
    <Star key={i} size={16} fill="currentColor" />
  ))}
</div>

// Przycisk edycji
<Link href={`/wc/edit/${wc.id}`}>
  <Edit size={16} />
  Edytuj
</Link>
```

#### W widoku WC (view/page.js)
```javascript
import { Camera, Star, MapPin, Edit, Trash2 } from 'lucide-react'

// Przycisk dodania zdjęć
<button onClick={() => document.getElementById("wcPhotos").click()}>
  <Camera size={18} />
  Dodaj zdjęcia
</button>

// Przycisk usuwania (dla admina)
<button onClick={handleDelete}>
  <Trash2 size={16} />
  Usuń WC
</button>
```

#### Ikony dla typów miejsc
```javascript
import { 
  Home,           // toilet
  Building,       // public_toilet
  Camera,         // tourist_attraction
  ShoppingBag,    // shopping_mall
  Utensils,       // restaurant
  Coffee,         // cafe
  Wine,           // bar
  Trees,          // park
  Train,          // train_station
  Navigation,     // subway_station
  Bus,            // bus_station
  Plane,          // airport
  Fuel,           // gas_station
  BookOpen,       // library
  Palette,        // museum
  Film,           // movie_theater
  Building2,      // city_hall
  ShoppingCart,   // supermarket
  Store           // department_store
} from 'lucide-react'

// Funkcja mapująca typ miejsca na ikonę
export const getPlaceTypeIcon = (placeType, size = 16) => {
  const iconProps = { size, className: "inline mr-1" }
  
  switch (placeType) {
    case 'toilet': return <Home {...iconProps} />
    case 'public_toilet': return <Building {...iconProps} />
    case 'tourist_attraction': return <Camera {...iconProps} />
    case 'shopping_mall': return <ShoppingBag {...iconProps} />
    case 'restaurant': return <Utensils {...iconProps} />
    case 'cafe': return <Coffee {...iconProps} />
    case 'bar': return <Wine {...iconProps} />
    case 'park': return <Trees {...iconProps} />
    case 'train_station': return <Train {...iconProps} />
    case 'subway_station': return <Navigation {...iconProps} />
    case 'bus_station': return <Bus {...iconProps} />
    case 'airport': return <Plane {...iconProps} />
    case 'gas_station': return <Fuel {...iconProps} />
    case 'library': return <BookOpen {...iconProps} />
    case 'museum': return <Palette {...iconProps} />
    case 'movie_theater': return <Film {...iconProps} />
    case 'city_hall': return <Building2 {...iconProps} />
    case 'supermarket': return <ShoppingCart {...iconProps} />
    case 'department_store': return <Store {...iconProps} />
    default: return <Home {...iconProps} />
  }
}
```

### 3. Stylowanie ikon

#### W globals.css
```css
/* Klasy pomocnicze dla ikon */
.icon-button {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  padding: 0.5rem 1rem;
  border-radius: 4px;
  background-color: #007bff;
  color: white;
  border: none;
  cursor: pointer;
  transition: background-color 0.2s ease;
}

.icon-button:hover {
  background-color: #0056b3;
}

.icon-text {
  display: flex;
  align-items: center;
  gap: 0.25rem;
}

.rating-stars {
  display: flex;
  gap: 0.125rem;
  color: #ffc107;
}

.location-indicator {
  display: flex;
  align-items: center;
  gap: 0.25rem;
  font-size: 0.9rem;
  color: #28a745;
  padding: 0.25rem 0.5rem;
  background-color: #f8f9fa;
  border-radius: 4px;
  border: 1px solid #28a745;
}
```

### 4. Przykład użycia w komponencie

```javascript
// components/PlaceTypeDisplay.js
import { getPlaceTypeIcon } from '../utils/placeTypes'
import { getPlaceTypeLabel } from '../utils/placeTypes'
import { pl } from '../locales/pl'

export default function PlaceTypeDisplay({ placeType, showIcon = true, size = 16 }) {
  const label = getPlaceTypeLabel(placeType, pl)
  
  return (
    <span className="icon-text">
      {showIcon && getPlaceTypeIcon(placeType, size)}
      {label}
    </span>
  )
}
```

### 5. Aktualizacja istniejących komponentów

#### W głównej liście WC (page.js)
```javascript
import { Star, MapPin } from 'lucide-react'
import PlaceTypeDisplay from './components/PlaceTypeDisplay'

// Zastąp zwykły tekst place_type:
<div className="table-cell fourth-cell">
  <PlaceTypeDisplay placeType={wc.place_type} />
</div>

// Dodaj ikony do ratingu:
<div className="rating-stars">
  {[...Array(Math.min(wc.rating, 10))].map((_, i) => (
    <Star key={i} size={14} fill="currentColor" />
  ))}
  <span className="ml-1">({wc.rating}/10)</span>
</div>
```

### 6. Przydatne ikony dla WC Finder

```javascript
// Nawigacja
Home, Plus, Search, Menu, X, ArrowLeft, ArrowRight

// Lokalizacja
MapPin, Navigation, Compass, Map, GPS

// Multimedia
Camera, Image, Upload, Download, Eye, EyeOff

// Akcje
Edit, Trash2, Save, Cancel, Check, X, RefreshCw

// Oceny
Star, Heart, ThumbsUp, ThumbsDown

// Użytkownicy
User, Users, UserPlus, LogIn, LogOut

// Informacje
Info, AlertCircle, CheckCircle, XCircle, HelpCircle

// Transport i miejsca
Car, Bike, Walk, Train, Bus, Plane, Building, Home, Store
```

### 7. Konfiguracja domyślnych props

```javascript
// utils/iconConfig.js
export const defaultIconProps = {
  size: 16,
  strokeWidth: 2,
  className: "inline-block"
}

export const largeIconProps = {
  size: 24,
  strokeWidth: 2,
  className: "inline-block"
}

export const smallIconProps = {
  size: 14,
  strokeWidth: 2,
  className: "inline-block"
}
```

## Zalety Lucide Icons:

1. **Lekkie**: Tylko ikony których używasz są importowane
2. **Spójne**: Wszystkie ikony mają ten sam styl
3. **Skalowalne**: SVG, idealne do responsywnych aplikacji
4. **Kolorowanie**: Łatwe stylowanie przez CSS
5. **React-friendly**: Komponenty React, nie fonty
6. **Dostępność**: Wbudowane atrybuty accessibility

## Implementacja w istniejącej aplikacji:

1. Zainstaluj: `npm install lucide-react`
2. Dodaj PlaceTypeDisplay komponent
3. Zaktualizuj utils/placeTypes.js o funkcję getPlaceTypeIcon
4. Stopniowo zastępuj emoji i tekst ikonami
5. Dodaj style CSS dla lepszego wyglądu