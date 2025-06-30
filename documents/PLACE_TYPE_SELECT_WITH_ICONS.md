# PlaceTypeSelect Component Documentation

## Overview

The `PlaceTypeSelect` component is a custom dropdown select component that displays place types with their corresponding icons from Lucide React. It replaces the standard HTML `<select>` element with a more visually appealing and accessible interface.

## Features

- **Visual Icons**: Each place type option displays its corresponding Lucide icon
- **Keyboard Navigation**: Full keyboard support (Arrow keys, Enter, Escape, Space)
- **Accessibility**: ARIA-compliant with proper roles and attributes
- **Custom Styling**: Consistent design that matches the application theme
- **Click Outside**: Closes dropdown when clicking outside the component
- **Hover States**: Visual feedback for option selection
- **Disabled State**: Proper handling of disabled state

## Usage

### Basic Implementation

```javascript
import PlaceTypeSelect from '../components/PlaceTypeSelect';
import { pl } from '../locales/pl';

function MyComponent() {
  const [placeType, setPlaceType] = useState('toilet');

  return (
    <PlaceTypeSelect
      value={placeType}
      onChange={setPlaceType}
      translations={pl}
      required={true}
      placeholder="Wybierz typ miejsca"
    />
  );
}
```

### Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `value` | `string` | - | Current selected value |
| `onChange` | `function` | - | Callback when selection changes |
| `translations` | `object` | - | Translation object containing place type labels |
| `disabled` | `boolean` | `false` | Whether the select is disabled |
| `required` | `boolean` | `false` | Whether the field is required |
| `placeholder` | `string` | `"Wybierz typ miejsca"` | Placeholder text when no option is selected |

## Implementation Details

### Files Modified

1. **Created**: `app/components/PlaceTypeSelect.js` - Main component
2. **Modified**: `app/wc/add/page.js` - Added to WC creation form
3. **Modified**: `app/wc/edit/[id]/page.js` - Added to WC editing form

### Dependencies

- `lucide-react` - For icons (ChevronDown and place type icons)
- `../utils/placeTypes` - For place type utilities and icon mapping

## Visual Examples

### Closed State
```
[🚽 Toaleta                    ▼]
```

### Open State
```
[🚽 Toaleta                    ▲]
┌─────────────────────────────────┐
│ 🚽 Toaleta                     │
│ 🏢 Toaleta publiczna           │
│ 📷 Atrakcja turystyczna        │
│ 🛍️ Centrum handlowe            │
│ 🍽️ Restauracja                 │
│ ☕ Kawiarnia                   │
│ 🍷 Bar                         │
│ 🌳 Park                        │
│ 🚂 Dworzec kolejowy            │
└─────────────────────────────────┘
```

## Place Type Icons Mapping

| Place Type | Icon | Lucide Component |
|------------|------|------------------|
| `toilet` | 🚽 | `Toilet` |
| `public_toilet` | 🏢 | `Building` |
| `tourist_attraction` | 📷 | `Camera` |
| `shopping_mall` | 🛍️ | `ShoppingBag` |
| `restaurant` | 🍽️ | `Utensils` |
| `cafe` | ☕ | `Coffee` |
| `bar` | 🍷 | `Wine` |
| `park` | 🌳 | `Trees` |
| `train_station` | 🚂 | `Train` |
| `subway_station` | 🧭 | `Navigation` |
| `bus_station` | 🚌 | `Bus` |
| `airport` | ✈️ | `Plane` |
| `gas_station` | ⛽ | `Fuel` |
| `library` | 📖 | `BookOpen` |
| `museum` | 🎨 | `Palette` |
| `movie_theater` | 🎬 | `Film` |
| `city_hall` | 🏛️ | `Building2` |
| `supermarket` | 🛒 | `ShoppingCart` |
| `department_store` | 🏪 | `Store` |

## Keyboard Navigation

| Key | Action |
|-----|--------|
| `Enter` / `Space` | Toggle dropdown or select focused option |
| `Escape` | Close dropdown |
| `Arrow Down` | Move focus to next option / Open dropdown |
| `Arrow Up` | Move focus to previous option |

## Accessibility Features

- **ARIA Roles**: `combobox` for trigger, `listbox` for dropdown, `option` for items
- **ARIA Attributes**: 
  - `aria-expanded`: Indicates dropdown state
  - `aria-controls`: Links trigger to dropdown
  - `aria-selected`: Indicates selected option
  - `aria-required`: Indicates required field
- **Keyboard Navigation**: Full keyboard support
- **Focus Management**: Proper focus handling and visual indicators

## Styling

The component uses inline styles for consistency across the application:

- **Colors**: Uses standard gray palette for borders, backgrounds, and text
- **Spacing**: Consistent padding and margins
- **Typography**: 16px font size for better readability
- **Shadows**: Subtle shadows for depth perception
- **Transitions**: Smooth animations for hover and focus states

## Benefits Over Standard Select

1. **Visual Enhancement**: Icons make options instantly recognizable
2. **Better UX**: Custom styling and hover effects
3. **Accessibility**: Better screen reader support
4. **Consistency**: Matches application design system
5. **Extensibility**: Easy to add more features or styling

## Performance Considerations

- **Icon Rendering**: Icons are rendered on-demand, no performance impact
- **Event Handling**: Efficient event delegation and cleanup
- **Memory Management**: Proper cleanup of event listeners
- **Rendering**: Minimal re-renders with proper state management

## Browser Compatibility

- **Modern Browsers**: Full support in Chrome, Firefox, Safari, Edge
- **Mobile**: Touch-friendly interface
- **Screen Readers**: Compatible with NVDA, JAWS, VoiceOver

## Future Enhancements

Potential improvements that could be added:

1. **Search/Filter**: Type to filter options
2. **Grouping**: Group related place types
3. **Custom Icons**: Support for custom icon sets
4. **Multi-select**: Support for multiple selections
5. **Virtualization**: For large option lists
6. **Theming**: Support for different color themes