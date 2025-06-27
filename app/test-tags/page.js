"use client";

import { useState } from "react";
import WCTags from "../components/WCTags";

export default function TestTagsPage() {
  const [selectedWcId, setSelectedWcId] = useState("de1b2c45-e850-4cee-b4e3-b0f3d600601c");

  const handleFormSubmit = (e) => {
    e.preventDefault();
    console.log("Form submitted - this should NOT happen when clicking tag buttons");
    alert("Form was submitted! This indicates the buttons are not preventing form submission.");
  };

  return (
    <div style={{ padding: "2rem", maxWidth: "600px", margin: "0 auto" }}>
      <h1>Test WCTags Component</h1>

      <div style={{ marginBottom: "2rem", padding: "1rem", border: "1px solid #ddd" }}>
        <h2>Test outside form (should work fine)</h2>
        <WCTags wcId={selectedWcId} isEditable={true} />
      </div>

      <div style={{ marginBottom: "2rem", padding: "1rem", border: "1px solid #ddd" }}>
        <h2>Test inside form (this is where the problem occurs)</h2>
        <form onSubmit={handleFormSubmit}>
          <div style={{ marginBottom: "1rem" }}>
            <label>
              Test Input:
              <input type="text" placeholder="Type something" style={{ marginLeft: "1rem" }} />
            </label>
          </div>

          <div style={{ marginBottom: "1rem" }}>
            <WCTags wcId={selectedWcId} isEditable={true} />
          </div>

          <button type="submit" style={{ padding: "0.5rem 1rem", backgroundColor: "#007bff", color: "white", border: "none" }}>
            Submit Form
          </button>
        </form>
      </div>

      <div style={{ marginBottom: "1rem" }}>
        <label>
          Test with different WC ID:
          <select
            value={selectedWcId}
            onChange={(e) => setSelectedWcId(e.target.value)}
            style={{ marginLeft: "1rem" }}
          >
            <option value="de1b2c45-e850-4cee-b4e3-b0f3d600601c">WC 1</option>
            <option value="48100dd4-bc07-49e7-a1c6-50b589e5d66e">WC 2</option>
            <option value="e6afd0ae-7295-4534-87d3-aa0d3223e5ab">WC 3</option>
          </select>
        </label>
      </div>

      <div style={{ marginTop: "2rem", padding: "1rem", backgroundColor: "#f8f9fa" }}>
        <h3>Instructions:</h3>
        <ol>
          <li>Try clicking the + button to expand tags in both sections</li>
          <li>Try adding/removing tags in both sections</li>
          <li>The first section (outside form) should work fine</li>
          <li>The second section (inside form) should NOT submit the form when clicking tag buttons</li>
          <li>Only the "Submit Form" button should submit the form</li>
        </ol>
      </div>
    </div>
  );
}
