import { url } from "@/lib/utils";
import { useEffect, useState } from "react";

export function useApi<T>(
  paths: (string | undefined)[],
  options?: RequestInit
) {
  const [data, setData] = useState<T | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<Error | null>(null);
  const baseURL = import.meta.env.VITE_SERVER;

  useEffect(() => {
    async function fetchData() {
      if (paths.some((p) => p === undefined)) return;
      try {
        setLoading(true);
        const res = await fetch(url(baseURL, ...(paths as string[])), options);
        if (!res.ok) throw new Error(`Request failed: ${res.status}`);
        const json = await res.json();
        setData(json);
      } catch (err) {
        setError(err as Error);
      } finally {
        setLoading(false);
      }
    }

    fetchData();
  }, [...paths]);

  return { data, loading, error };
}
