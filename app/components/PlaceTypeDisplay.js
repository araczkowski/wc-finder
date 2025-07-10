import { getPlaceTypeIcon, getPlaceTypeLabel } from "../utils/placeTypes";
import { pl } from "../locales/pl";

export default function PlaceTypeDisplay({
  placeType,
  showIcon = true,
  showText = false,
  iconSize = 16,
  className = "",
  iconProps = {},
  textStyle = {},
}) {
  const label = getPlaceTypeLabel(placeType || "map-pin-house", pl);

  if (showIcon && showText) {
    return (
      <span
        className={`icon-text place-type-icon ${className}`}
        style={{ color: "rgb(52, 73, 94)", ...textStyle }}
      >
        {getPlaceTypeIcon(placeType || "map-pin-house", {
          size: iconSize,
          ...iconProps,
        })}
        <span style={{ color: "rgb(52, 73, 94)", ...textStyle }}>{label}</span>
      </span>
    );
  }

  if (showIcon) {
    return (
      <span className={`place-type-icon ${className}`} title={label}>
        {getPlaceTypeIcon(placeType || "map-pin-house", {
          size: iconSize,
          ...iconProps,
        })}
      </span>
    );
  }

  if (showText) {
    return (
      <span className={className} style={{ color: "#333", ...textStyle }}>
        {label}
      </span>
    );
  }

  return null;
}
