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
