import { getPlaceTypeIcon, getPlaceTypeLabel } from "../utils/placeTypes";
import { pl } from "../locales/pl";

export default function PlaceTypeDisplay({
  placeType,
  showIcon = true,
  showText = false,
  iconSize = 16,
  className = "",
  iconProps = {},
}) {
  const label = getPlaceTypeLabel(placeType || "toilet", pl);

  if (showIcon && showText) {
    return (
      <span className={`icon-text place-type-icon ${className}`}>
        {getPlaceTypeIcon(placeType || "toilet", {
          size: iconSize,
          ...iconProps,
        })}
        <span>{label}</span>
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
    return <span className={className}>{label}</span>;
  }

  return null;
}
