const languageMap: Record<string, string> = {
  en: "English",
  "en-US": "English",
  "de": "German",
  "de-DE": "German",
  fr: "French",
};

export function languageLabel(code: string): string {
  return languageMap[code] || code.toUpperCase();
}
