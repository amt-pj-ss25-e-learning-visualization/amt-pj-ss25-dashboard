import { clsx, type ClassValue } from "clsx";
import { twMerge } from "tailwind-merge";

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}

export function url(basePath: string, ...paths: string[]) {
  const pieces = [];
  for (const path of paths) {
    const from = path.startsWith("/") ? 1 : undefined;
    const to = path.endsWith("/") ? -1 : undefined;
    pieces.push(...path.slice(from, to).split("/"));
  }
  const base = basePath.endsWith("/") ? basePath.slice(0, -1) : basePath;
  return [base, ...pieces].join("/");
}
