"use client";

import { useState, useEffect } from "react";
import { useSession } from "next-auth/react";
import { Plus, X, Tag, Coins, Heart, Baby, Accessibility } from "lucide-react";

// Tag configuration with icons and colors
const TAG_CONFIG = {
  płatna: {
    icon: Coins,
    color: "#dc3545",
    bgColor: "#fff5f5",
    borderColor: "#fecaca",
  },
  darmowa: {
    icon: Heart,
    color: "#28a745",
    bgColor: "#f0fff4",
    borderColor: "#c6f6d5",
  },
  przewijak: {
    icon: Baby,
    color: "#17a2b8",
    bgColor: "#f0fdff",
    borderColor: "#b3f0ff",
  },
  dostępnaDlaNiepełnosprawnych: {
    icon: Accessibility,
    color: "#6f42c1",
    bgColor: "#f8f5ff",
    borderColor: "#d6d1f5",
  },
};

const WCTags = ({ wcId, isEditable = false, onTagsChange }) => {
  const { data: session } = useSession();
  const [tags, setTags] = useState([]);
  const [availableTags, setAvailableTags] = useState([]);
  const [loading, setLoading] = useState(true);
  const [addingTag, setAddingTag] = useState(false);
  const [showTagSelector, setShowTagSelector] = useState(false);
  const [recentlyAddedTag, setRecentlyAddedTag] = useState(null);

  useEffect(() => {
    if (wcId) {
      fetchTags();
    }
  }, [wcId]);

  const fetchTags = async () => {
    try {
      setLoading(true);
      const response = await fetch(`/api/wc-tags?wc_id=${wcId}`);
      const data = await response.json();

      if (response.ok) {
        setTags(data.tags || []);
        setAvailableTags(data.availableTags || []);
        if (onTagsChange) {
          onTagsChange(data.tags || []);
        }
      } else {
        console.error("Error fetching tags:", data.message);
      }
    } catch (error) {
      console.error("Error fetching tags:", error);
    } finally {
      setLoading(false);
    }
  };

  const addTag = async (tagName, event) => {
    console.log("WCTags: addTag function called", {
      wcId,
      tagName,
      hasEvent: !!event,
    });
    if (event) {
      event.preventDefault();
      event.stopPropagation();
    }
    if (!session?.user?.id) {
      alert("Musisz być zalogowany, aby dodać tag");
      return;
    }

    try {
      setAddingTag(true);
      const response = await fetch("/api/wc-tags", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          wc_id: wcId,
          tag: tagName,
        }),
      });

      const data = await response.json();

      if (response.ok) {
        await fetchTags(); // Refresh tags
        // Show success feedback
        setRecentlyAddedTag(tagName);
        setTimeout(() => setRecentlyAddedTag(null), 2000);
        // Keep selector open - don't close automatically
        // It will close automatically if no more tags are available
      } else {
        alert(data.message || "Błąd podczas dodawania tagu");
      }
    } catch (error) {
      console.error("Error adding tag:", error);
      alert("Błąd podczas dodawania tagu");
    } finally {
      setAddingTag(false);
    }
  };

  const removeTag = async (tagName, event) => {
    console.log("WCTags: removeTag function called", {
      wcId,
      tagName,
      hasEvent: !!event,
    });
    if (event) {
      event.preventDefault();
      event.stopPropagation();
    }
    if (!session?.user?.id) {
      alert("Musisz być zalogowany, aby usunąć tag");
      return;
    }

    try {
      const response = await fetch(
        `/api/wc-tags?wc_id=${wcId}&tag=${encodeURIComponent(tagName)}`,
        {
          method: "DELETE",
        },
      );

      const data = await response.json();

      if (response.ok) {
        await fetchTags(); // Refresh tags
      } else {
        alert(data.message || "Błąd podczas usuwania tagu");
      }
    } catch (error) {
      console.error("Error removing tag:", error);
      alert("Błąd podczas usuwania tagu");
    }
  };

  const canUserRemoveTag = (tag) => {
    return session?.user?.id && tag.users.includes(session.user.id);
  };

  const getAvailableTagsToAdd = () => {
    const currentTags = tags.map((t) => t.tag);
    const userTags = tags
      .filter((t) => t.users.includes(session?.user?.id || ""))
      .map((t) => t.tag);
    const available = availableTags.filter((tag) => !userTags.includes(tag));

    // Auto-close selector if no more tags available after a short delay
    if (available.length === 0 && showTagSelector && !recentlyAddedTag) {
      setTimeout(() => setShowTagSelector(false), 1500);
    }

    return available;
  };

  if (loading) {
    return (
      <div style={styles.container}>
        <div style={styles.loadingText}>Ładowanie tagów...</div>
      </div>
    );
  }

  return (
    <div style={styles.container}>
      <div style={styles.header}>
        <Tag size={18} style={styles.headerIcon} />
        <span style={styles.headerText}>Tagi</span>
        {isEditable && session?.user?.id && (
          <button
            type="button"
            onClick={(e) => {
              console.log("WCTags: Add button clicked", {
                wcId,
                showTagSelector,
              });
              e.preventDefault();
              e.stopPropagation();
              setShowTagSelector(!showTagSelector);
            }}
            style={{
              ...styles.addButton,
              ...(showTagSelector ? styles.addButtonActive : {}),
            }}
            disabled={addingTag}
          >
            <Plus size={16} />
          </button>
        )}
      </div>

      <div style={styles.tagsContainer}>
        {tags.length === 0 ? (
          <div style={styles.noTags}>Brak tagów. Byłeś tam? Dodaj je!</div>
        ) : (
          tags.map((tagData) => {
            const config = TAG_CONFIG[tagData.tag] || TAG_CONFIG["darmowa"];
            const IconComponent = config.icon;
            const canRemove = isEditable && canUserRemoveTag(tagData);

            return (
              <div
                key={tagData.tag}
                style={{
                  ...styles.tagChip,
                  backgroundColor: config.bgColor,
                  borderColor: config.borderColor,
                  color: config.color,
                }}
              >
                <IconComponent size={14} style={styles.tagIcon} />
                <span style={styles.tagText}>#{tagData.tag}</span>
                {tagData.count > 1 && (
                  <span style={styles.tagCount}>({tagData.count})</span>
                )}
                {canRemove && (
                  <button
                    type="button"
                    onClick={(e) => {
                      console.log("WCTags: Remove tag button clicked", {
                        wcId,
                        tag: tagData.tag,
                      });
                      removeTag(tagData.tag, e);
                    }}
                    style={styles.removeTagButton}
                    title="Usuń swój tag"
                  >
                    <X size={12} />
                  </button>
                )}
              </div>
            );
          })
        )}
      </div>

      {showTagSelector && isEditable && session?.user?.id && (
        <div style={styles.tagSelector}>
          <div style={styles.tagSelectorHeader}>
            <span>
              Wybierz tag do dodania ({getAvailableTagsToAdd().length}{" "}
              dostępnych):
            </span>
            <button
              type="button"
              onClick={(e) => {
                e.preventDefault();
                e.stopPropagation();
                setShowTagSelector(false);
              }}
              style={styles.closeSelectorButton}
              title="Zamknij wybór tagów"
            >
              <X size={14} />
            </button>
          </div>
          <div style={styles.availableTagsContainer}>
            {getAvailableTagsToAdd().map((tagName) => {
              const config = TAG_CONFIG[tagName] || TAG_CONFIG["darmowa"];
              const IconComponent = config.icon;

              return (
                <button
                  type="button"
                  key={tagName}
                  onClick={(e) => {
                    console.log("WCTags: Add specific tag button clicked", {
                      wcId,
                      tagName,
                    });
                    addTag(tagName, e);
                  }}
                  disabled={addingTag}
                  style={{
                    ...styles.availableTagButton,
                    backgroundColor: config.bgColor,
                    borderColor: config.borderColor,
                    color: config.color,
                    opacity: addingTag ? 0.6 : 1,
                    transform:
                      recentlyAddedTag === tagName ? "scale(0.95)" : "scale(1)",
                    transition: "all 0.2s ease",
                  }}
                >
                  <IconComponent size={14} style={styles.tagIcon} />
                  <span>#{tagName}</span>
                  {recentlyAddedTag === tagName && (
                    <span style={{ marginLeft: "0.5rem", fontSize: "0.75rem" }}>
                      ✓
                    </span>
                  )}
                </button>
              );
            })}
          </div>
          {getAvailableTagsToAdd().length === 0 && (
            <div style={styles.noAvailableTags}>
              ✅ Dodałeś już wszystkie dostępne tagi
              {recentlyAddedTag && (
                <div
                  style={{
                    fontSize: "0.8rem",
                    marginTop: "0.5rem",
                    opacity: 0.8,
                  }}
                >
                  Lista zamknie się automatycznie za chwilę...
                </div>
              )}
            </div>
          )}
        </div>
      )}
    </div>
  );
};

const styles = {
  container: {
    marginBottom: "1rem",
  },
  header: {
    display: "flex",
    alignItems: "center",
    marginBottom: "0.75rem",
    gap: "0.5rem",
  },
  headerIcon: {
    color: "#666",
  },
  headerText: {
    fontSize: "1rem",
    fontWeight: "600",
    color: "#333",
    flex: 1,
  },
  addButton: {
    background: "#007bff",
    color: "white",
    border: "none",
    borderRadius: "50%",
    width: "28px",
    height: "28px",
    display: "flex",
    alignItems: "center",
    justifyContent: "center",
    cursor: "pointer",
    transition: "all 0.2s ease",
  },
  addButtonActive: {
    background: "#dc3545",
    transform: "rotate(45deg)",
  },
  loadingText: {
    color: "#666",
    fontStyle: "italic",
    fontSize: "0.9rem",
  },
  tagsContainer: {
    display: "flex",
    flexWrap: "wrap",
    gap: "0.5rem",
    marginBottom: "0.5rem",
  },
  noTags: {
    color: "#999",
    fontStyle: "italic",
    fontSize: "0.9rem",
  },
  tagChip: {
    display: "flex",
    alignItems: "center",
    gap: "0.25rem",
    padding: "0.375rem 0.75rem",
    borderRadius: "20px",
    border: "1px solid",
    fontSize: "0.875rem",
    fontWeight: "500",
    transition: "all 0.2s ease",
  },
  tagIcon: {
    flexShrink: 0,
  },
  tagText: {
    whiteSpace: "nowrap",
  },
  tagCount: {
    fontSize: "0.75rem",
    opacity: 0.8,
    marginLeft: "0.25rem",
  },
  removeTagButton: {
    background: "none",
    border: "none",
    cursor: "pointer",
    padding: "2px",
    marginLeft: "0.25rem",
    borderRadius: "50%",
    display: "flex",
    alignItems: "center",
    justifyContent: "center",
    opacity: 0.7,
    transition: "all 0.2s ease",
    width: "18px",
    height: "18px",
  },
  tagSelector: {
    marginTop: "1rem",
    padding: "1rem",
    backgroundColor: "#f8f9fa",
    borderRadius: "8px",
    border: "1px solid #e9ecef",
  },
  tagSelectorHeader: {
    fontSize: "0.9rem",
    fontWeight: "600",
    color: "#333",
    marginBottom: "0.75rem",
    display: "flex",
    justifyContent: "space-between",
    alignItems: "center",
  },
  closeSelectorButton: {
    background: "none",
    border: "none",
    cursor: "pointer",
    padding: "4px",
    borderRadius: "50%",
    display: "flex",
    alignItems: "center",
    justifyContent: "center",
    opacity: 0.7,
    transition: "all 0.2s ease",
    width: "24px",
    height: "24px",
  },
  availableTagsContainer: {
    display: "flex",
    flexWrap: "wrap",
    gap: "0.5rem",
  },
  availableTagButton: {
    display: "flex",
    alignItems: "center",
    gap: "0.25rem",
    padding: "0.5rem 0.75rem",
    borderRadius: "20px",
    border: "1px solid",
    fontSize: "0.875rem",
    fontWeight: "500",
    cursor: "pointer",
    transition: "all 0.2s ease",
    background: "white",
  },
  noAvailableTags: {
    color: "#666",
    fontStyle: "italic",
    fontSize: "0.9rem",
    textAlign: "center",
    padding: "1rem",
  },
};

export default WCTags;
