import { format } from "date-fns";

/**
 * Formats a timestamp into a human-readable string.
 * @param timestamp - The ISO timestamp string or Date object to format.
 * @param pattern - Optional custom pattern (defaults to "PPPpp").
 * @returns A formatted date string.
 */
export function formatDateTime(
  timestamp: string | Date,
  pattern = "PPPpp"
): string {
  const date = typeof timestamp === "string" ? new Date(timestamp) : timestamp;
  return format(date, pattern);
}


// Converts a duration in milliseconds into a human-readable string in hours and minutes 
export const formatDuration = (milli: number): string => {
  const totalSeconds = Math.floor(milli / 1000);
  const hours = Math.floor(totalSeconds / 3600);
  const minutes = Math.floor((totalSeconds % 3600) / 60);

  return `${hours}h ${minutes}m`;
};