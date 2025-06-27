"use client";

import { useState, useEffect } from "react";
import { useSession } from "next-auth/react";

export default function TestTagAPI() {
  const { data: session, status } = useSession();
  const [wcId, setWcId] = useState("");
  const [selectedTag, setSelectedTag] = useState("płatna");
  const [result, setResult] = useState("");
  const [loading, setLoading] = useState(false);
  const [existingWCs, setExistingWCs] = useState([]);

  const availableTags = [
    "płatna",
    "darmowa",
    "przewijak",
    "dostępnaDlaNiepełnosprawnych",
  ];

  useEffect(() => {
    fetchExistingWCs();
  }, []);

  const fetchExistingWCs = async () => {
    try {
      const response = await fetch("/api/wcs");
      const data = await response.json();
      if (response.ok && data.data) {
        setExistingWCs(data.data.slice(0, 10)); // First 10 WCs
        if (data.data.length > 0) {
          setWcId(data.data[0].id); // Set first WC as default
        }
      }
    } catch (error) {
      console.error("Error fetching WCs:", error);
    }
  };

  const testAddTag = async () => {
    if (!wcId || !selectedTag) {
      setResult("ERROR: WC ID and tag are required");
      return;
    }

    setLoading(true);
    setResult("Testing add tag...");

    try {
      const response = await fetch("/api/wc-tags", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          wc_id: wcId,
          tag: selectedTag,
        }),
      });

      const data = await response.json();

      setResult(`
ADD TAG RESULT:
Status: ${response.status}
Response: ${JSON.stringify(data, null, 2)}
Time: ${new Date().toLocaleTimeString()}
      `);
    } catch (error) {
      setResult(`ERROR: ${error.message}`);
    } finally {
      setLoading(false);
    }
  };

  const testGetTags = async () => {
    if (!wcId) {
      setResult("ERROR: WC ID is required");
      return;
    }

    setLoading(true);
    setResult("Testing get tags...");

    try {
      const response = await fetch(`/api/wc-tags?wc_id=${wcId}`);
      const data = await response.json();

      setResult(`
GET TAGS RESULT:
Status: ${response.status}
Response: ${JSON.stringify(data, null, 2)}
Time: ${new Date().toLocaleTimeString()}
      `);
    } catch (error) {
      setResult(`ERROR: ${error.message}`);
    } finally {
      setLoading(false);
    }
  };

  const testRemoveTag = async () => {
    if (!wcId || !selectedTag) {
      setResult("ERROR: WC ID and tag are required");
      return;
    }

    setLoading(true);
    setResult("Testing remove tag...");

    try {
      const response = await fetch(
        `/api/wc-tags?wc_id=${wcId}&tag=${encodeURIComponent(selectedTag)}`,
        { method: "DELETE" },
      );

      const data = await response.json();

      setResult(`
REMOVE TAG RESULT:
Status: ${response.status}
Response: ${JSON.stringify(data, null, 2)}
Time: ${new Date().toLocaleTimeString()}
      `);
    } catch (error) {
      setResult(`ERROR: ${error.message}`);
    } finally {
      setLoading(false);
    }
  };

  const clearResult = () => {
    setResult("");
  };

  if (status === "loading") {
    return <div style={styles.container}>Loading session...</div>;
  }

  if (status === "unauthenticated") {
    return (
      <div style={styles.container}>
        <h1>Test Tag API</h1>
        <p style={styles.error}>You must be logged in to test the tag API.</p>
        <a href="/auth/signin">Sign In</a>
      </div>
    );
  }

  return (
    <div style={styles.container}>
      <h1>Test Tag API</h1>

      <div style={styles.sessionInfo}>
        <strong>Session Info:</strong>
        <br />
        User ID: {session?.user?.id}
        <br />
        Email: {session?.user?.email}
        <br />
        Status: {status}
      </div>

      <div style={styles.section}>
        <h3>Select WC</h3>
        <select
          value={wcId}
          onChange={(e) => setWcId(e.target.value)}
          style={styles.select}
        >
          <option value="">-- Select WC --</option>
          {existingWCs.map((wc) => (
            <option key={wc.id} value={wc.id}>
              {wc.name} ({wc.id.substring(0, 8)}...)
            </option>
          ))}
        </select>

        <div style={styles.inputGroup}>
          <label>Or enter WC ID manually:</label>
          <input
            type="text"
            value={wcId}
            onChange={(e) => setWcId(e.target.value)}
            placeholder="Enter WC UUID"
            style={styles.input}
          />
        </div>
      </div>

      <div style={styles.section}>
        <h3>Select Tag</h3>
        <select
          value={selectedTag}
          onChange={(e) => setSelectedTag(e.target.value)}
          style={styles.select}
        >
          {availableTags.map((tag) => (
            <option key={tag} value={tag}>
              {tag}
            </option>
          ))}
        </select>
      </div>

      <div style={styles.section}>
        <h3>Test Operations</h3>
        <div style={styles.buttonGroup}>
          <button
            onClick={testGetTags}
            disabled={loading || !wcId}
            style={styles.button}
          >
            Get Tags
          </button>
          <button
            onClick={testAddTag}
            disabled={loading || !wcId || !selectedTag}
            style={styles.button}
          >
            Add Tag
          </button>
          <button
            onClick={testRemoveTag}
            disabled={loading || !wcId || !selectedTag}
            style={styles.button}
          >
            Remove Tag
          </button>
          <button onClick={clearResult} style={styles.clearButton}>
            Clear Result
          </button>
        </div>
      </div>

      {result && (
        <div style={styles.section}>
          <h3>Result</h3>
          <pre style={styles.result}>{result}</pre>
        </div>
      )}

      <div style={styles.section}>
        <h3>Instructions</h3>
        <ol style={styles.instructions}>
          <li>Select a WC from the dropdown or enter a WC ID manually</li>
          <li>Select a tag to work with</li>
          <li>Click &quot;Get Tags&quot; to see existing tags for the WC</li>
          <li>Click &quot;Add Tag&quot; to add the selected tag</li>
          <li>
            Click &quot;Remove Tag&quot; to remove your tag (only works for your
            own tags)
          </li>
          <li>Check the result section for API responses</li>
        </ol>
      </div>
    </div>
  );
}

const styles = {
  container: {
    maxWidth: "800px",
    margin: "0 auto",
    padding: "20px",
    fontFamily: "Arial, sans-serif",
  },
  sessionInfo: {
    backgroundColor: "#e8f5e8",
    padding: "15px",
    borderRadius: "5px",
    marginBottom: "20px",
    fontSize: "14px",
  },
  section: {
    marginBottom: "30px",
    padding: "20px",
    border: "1px solid #ddd",
    borderRadius: "5px",
  },
  inputGroup: {
    marginTop: "10px",
  },
  select: {
    width: "100%",
    padding: "10px",
    fontSize: "14px",
    borderRadius: "4px",
    border: "1px solid #ddd",
  },
  input: {
    width: "100%",
    padding: "10px",
    fontSize: "14px",
    borderRadius: "4px",
    border: "1px solid #ddd",
    marginTop: "5px",
  },
  buttonGroup: {
    display: "flex",
    gap: "10px",
    flexWrap: "wrap",
  },
  button: {
    padding: "10px 20px",
    fontSize: "14px",
    borderRadius: "4px",
    border: "none",
    backgroundColor: "#007bff",
    color: "white",
    cursor: "pointer",
  },
  clearButton: {
    padding: "10px 20px",
    fontSize: "14px",
    borderRadius: "4px",
    border: "none",
    backgroundColor: "#6c757d",
    color: "white",
    cursor: "pointer",
  },
  result: {
    backgroundColor: "#f8f9fa",
    padding: "15px",
    borderRadius: "4px",
    border: "1px solid #e9ecef",
    whiteSpace: "pre-wrap",
    fontSize: "12px",
    maxHeight: "400px",
    overflow: "auto",
  },
  error: {
    color: "#dc3545",
    fontSize: "16px",
  },
  instructions: {
    paddingLeft: "20px",
    lineHeight: "1.6",
  },
};
