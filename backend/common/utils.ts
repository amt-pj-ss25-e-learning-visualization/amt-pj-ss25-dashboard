import { ISO8601Duration } from "./types";

const MILLISECOND_MAP = {
  H: 60 * 60 * 1000,
  M: 60 * 1000,
  S: 1000,
} as const;
/**
 * Parses ISO8601 durations into milliseconds, assuming values only after T
 */
export const parseISO8601 = (duration?: ISO8601Duration) => {
  if (duration === undefined) return 0;
  let milliseconds = 0;
  for (const match of [...duration.matchAll(/(\d+)([?:H|M|S])/g)]) {
    milliseconds +=
      parseInt(match[1]) *
      MILLISECOND_MAP[match[2] as keyof typeof MILLISECOND_MAP];
  }
  return milliseconds;
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

/**
 * Recursively removes specified fields from an object properties (nested object or array).
 * This function is being used to remove fields that are not needed in an API response,
 * @param obj - The object to process.
 * @param fields - The fields to remove.
 * @returns A object with the specified fields removed.
 */
export function omitFields(obj: any, fields: string[]): any {
  const object =
    obj && typeof obj.get === "function" ? obj.get({ object: true }) : obj;

  if (Array.isArray(object)) {
    return object.map((item) => omitFields(item, fields));
  } else if (object instanceof Date) {
    return object;
  } else if (object && typeof object === "object") {
    const result: any = {};
    for (const key in object) {
      if (!fields.includes(key)) {
        result[key] = omitFields(object[key], fields);
      }
    }
    return result;
  }

  return object;
}

export const forgettingEffect = (timeSince: number, reps: number = 1) =>
  (reps * 1.84) / ((Math.log10(timeSince) ^ 1.25) + reps * 1.84);

export const sum = (...nums: number[]) => {
  return nums.reduce((prev, curr) => prev + curr, 0);
};

export const mean = (...nums: number[]) => {
  return sum(...nums) / nums.length;
};
