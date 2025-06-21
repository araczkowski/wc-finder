import { useState, useEffect, useCallback } from "react";

export const useInfiniteScroll = (fetchFunction, initialLimit = 5) => {
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(false);
  const [loadingMore, setLoadingMore] = useState(false);
  const [error, setError] = useState(null);
  const [hasMore, setHasMore] = useState(true);
  const [page, setPage] = useState(0);
  const [initialized, setInitialized] = useState(false);
  const [totalCount, setTotalCount] = useState(0);
  const [allDataLoaded, setAllDataLoaded] = useState(false);

  // Reset function to start over
  const reset = useCallback(() => {
    setData([]);
    setPage(0);
    setHasMore(true);
    setError(null);
    setInitialized(false);
    setTotalCount(0);
    setAllDataLoaded(false);
  }, []);

  // Load initial data
  const loadInitialData = useCallback(async () => {
    if (loading || initialized) return;

    setLoading(true);
    setError(null);
    setInitialized(true);

    try {
      const result = await fetchFunction(0, initialLimit);
      const newData = result.data || [];
      setData(newData);
      setTotalCount(result.pagination?.total || 0);
      setHasMore(result.pagination?.hasMore || false);
      setAllDataLoaded(!result.pagination?.hasMore);
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
      const newData = result.data || [];
      setData((prevData) => [...prevData, ...newData]);
      setTotalCount(result.pagination?.total || 0);
      setHasMore(result.pagination?.hasMore || false);
      setAllDataLoaded(!result.pagination?.hasMore);
      setPage((prevPage) => prevPage + 1);
    } catch (err) {
      // Handle specific error when no more data is available
      if (
        err.message &&
        (err.message.includes("PGRST103") ||
          err.message.includes("Requested range not satisfiable"))
      ) {
        setHasMore(false);
        setAllDataLoaded(true);
        // Don't set error for this case as it's expected behavior
      } else {
        setError(err.message || "Failed to load more data");
      }
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
    totalCount,
    allDataLoaded,
    loadInitialData,
    loadMore,
    reset,
  };
};
