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
  const label = getPlaceTypeLabel(placeType || "toilet", pl);

  if (showIcon && showText) {
    return (
      <span
        className={`icon-text place-type-icon ${className}`}
        style={{ color: "white", ...textStyle }}
      >
        {getPlaceTypeIcon(placeType || "toilet", {
          size: iconSize,
          ...iconProps,
        })}
        <span style={{ color: "white", ...textStyle }}>{label}</span>
      </span>
    );
  }

  if (showIcon) {
    return (
      <span className={`place-type-icon ${className}`} title={label}>
        {getPlaceTypeIcon(placeType || "toilet", {
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
