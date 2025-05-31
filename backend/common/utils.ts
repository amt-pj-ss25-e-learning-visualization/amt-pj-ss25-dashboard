import { ISO8601Duration } from "./types";

/**
 * Assumes time specified only for M
 */
export const parseISO8601 = (duration?: ISO8601Duration) => {
  if (duration === undefined) return 0;
  const tIndex = duration.indexOf("T");
  return parseInt(duration.slice(tIndex + 1, -1));
};

export const isUUID = (id: string) =>
  /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i.test(id);

export const groupBy = <T extends Record<string, any>>(
  array: T[],
  key: string
) => {
  const result: { [K: string]: T[] } = {};
  for (const item of array) {
    if (!result[item[key]]) {
      result[item[key]] = [item];
    } else {
      result[item[key]] = [...result[item[key]], item];
    }
  }
  return result;
};
