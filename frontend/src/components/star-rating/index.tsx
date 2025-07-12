import { cn } from "@/lib/utils";
import { Star } from "lucide-react";

const StarRating = ({ rating, of = 5 }: { rating?: number; of?: number }) => {
  const filledStars = rating !== undefined ? Math.round(rating) : 0;
  const emptyStarts =
    rating !== undefined && of !== undefined ? Math.round(of - rating) : 5;
  return (
    <div
      className={cn(
        "flex fill-blue-500 text-blue-500",
        rating === undefined ? "text-gray-400" : ""
      )}
    >
      {new Array(filledStars).fill(null).map((_, i) => (
        <Star key={i} height={18} width={18} fill="1" />
      ))}
      {new Array(emptyStarts).fill(null).map((_, i) => (
        <Star key={i + filledStars} height={18} width={18} />
      ))}
    </div>
  );
};

export default StarRating;
