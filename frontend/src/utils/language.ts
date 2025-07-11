const languageMap: Record<string, string> = {
  "en": "English",
  "en-US": "English",
  "de": "German",
  "de-de": "German",
  "fr": "French",
};

export function languageLabel(code: string): string {
  return languageMap[code.toLowerCase()] || code.toUpperCase();
}
