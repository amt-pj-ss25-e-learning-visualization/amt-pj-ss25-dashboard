import { useEffect, useState } from "react";

export function useApi<T>(url: string, options?: RequestInit) {
  const [data, setData] = useState<T | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<Error | null>(null);

  useEffect(() => {
    //TODO: Temp fix since BE doesnt work
    const useMock = true;

    async function fetchData() {
      try {
        setLoading(true);
        if (useMock) {
          const mock = await import(`./mock${url}`);
          setData(mock.default);
        } else {
          const res = await fetch(url, options);
          if (!res.ok) throw new Error(`Request failed: ${res.status}`);
          const json = await res.json();
          setData(json);
        }
      } catch (err) {
        setError(err as Error);
      } finally {
        setLoading(false);
      }
    }

    fetchData();
  }, [url]);

  return { data, loading, error };
}
