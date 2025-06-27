import { Star } from "lucide-react";

export default function RatingDisplay({
  rating,
  maxRating = 10,
  showNumeric = true,
  size = 16,
  className = "",
  emptyColor = "#e4e5e9",
  fillColor = "#ffc107",
}) {
  // Ensure rating is within bounds
  const normalizedRating = Math.max(0, Math.min(rating || 0, maxRating));

  // Calculate how many stars to show (out of 5 stars for 10-point scale)
  const starCount = 5;
  const starsToFill = Math.round((normalizedRating / maxRating) * starCount);

  return (
    <div className={`rating-stars ${className}`}>
      {[...Array(starCount)].map((_, index) => (
        <Star
          key={index}
          size={size}
          fill={index < starsToFill ? fillColor : "none"}
          color={index < starsToFill ? fillColor : emptyColor}
        />
      ))}
      {showNumeric && (
        <span className="rating-numeric ml-1">
          ({normalizedRating}/{maxRating})
        </span>
      )}
    </div>
  );
}
