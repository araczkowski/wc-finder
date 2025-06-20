import { useState, useEffect, useCallback } from "react";

export const useInfiniteScroll = (fetchFunction, initialLimit = 5) => {
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(false);
  const [loadingMore, setLoadingMore] = useState(false);
  const [error, setError] = useState(null);
  const [hasMore, setHasMore] = useState(true);
  const [page, setPage] = useState(0);
  const [initialized, setInitialized] = useState(false);

  // Reset function to start over
  const reset = useCallback(() => {
    setData([]);
    setPage(0);
    setHasMore(true);
    setError(null);
    setInitialized(false);
  }, []);

  // Load initial data
  const loadInitialData = useCallback(async () => {
    if (loading || initialized) return;

    setLoading(true);
    setError(null);
    setInitialized(true);

    try {
      const result = await fetchFunction(0, initialLimit);
      setData(result.data || []);
      setHasMore(result.pagination?.hasMore || false);
      setPage(1);
    } catch (err) {
      setError(err.message || "Failed to load data");
      setData([]);
      setInitialized(false);
    } finally {
      setLoading(false);
    }
  }, [fetchFunction, initialLimit, loading, initialized]);

  // Load more data
  const loadMore = useCallback(async () => {
    if (loadingMore || !hasMore || loading) return;

    setLoadingMore(true);
    setError(null);

    try {
      const result = await fetchFunction(page, initialLimit);
      setData((prevData) => [...prevData, ...(result.data || [])]);
      setHasMore(result.pagination?.hasMore || false);
      setPage((prevPage) => prevPage + 1);
    } catch (err) {
      setError(err.message || "Failed to load more data");
    } finally {
      setLoadingMore(false);
    }
  }, [fetchFunction, page, initialLimit, loadingMore, hasMore, loading]);

  // Scroll handler
  useEffect(() => {
    const handleScroll = () => {
      if (
        window.innerHeight + document.documentElement.scrollTop >=
        document.documentElement.offsetHeight - 1000 // Trigger 1000px before bottom
      ) {
        loadMore();
      }
    };

    window.addEventListener("scroll", handleScroll);
    return () => window.removeEventListener("scroll", handleScroll);
  }, [loadMore]);

  return {
    data,
    loading,
    loadingMore,
    error,
    hasMore,
    loadInitialData,
    loadMore,
    reset,
  };
};
