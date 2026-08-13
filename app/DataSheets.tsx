"use client";

import { useEffect, useState } from "react";

type Sheet = { id: number; version: string; fileName: string; externalUrl: string; contentType: string; sizeBytes: number; notes: string; createdAt: string };
type Item = { id: number; name: string };

const size = (bytes: number) => bytes < 1024 ? `${bytes} B` : bytes < 1048576 ? `${(bytes / 1024).toFixed(1)} KB` : `${(bytes / 1048576).toFixed(1)} MB`;

export default function DataSheets({ item, onClose }: { item: Item; onClose: () => void }) {
  const [files, setFiles] = useState<Sheet[]>([]);
  const [version, setVersion] = useState("");
  const [notes, setNotes] = useState("");
  const [file, setFile] = useState<File | null>(null);
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState("");

  async function load() {
    const response = await fetch(`/api/items/${item.id}/data-sheets`);
    const data = await response.json();
    response.ok ? setFiles(data) : setError(data.error || "Data sheets could not be loaded.");
  }

  useEffect(() => { load(); }, [item.id]);

  async function upload(event: React.FormEvent) {
    event.preventDefault();
    if (!file) return;
    setBusy(true);
    setError("");
    const body = new FormData();
    body.set("file", file);
    body.set("version", version.trim() || `Revision ${files.length + 1}`);
    body.set("notes", notes.trim());
    const response = await fetch(`/api/items/${item.id}/data-sheets`, { method: "POST", body });
    const data = await response.json();
    if (!response.ok) setError(data.error || "Upload failed.");
    else {
      setFile(null);
      setVersion("");
      setNotes("");
      await load();
    }
    setBusy(false);
  }

  async function remove(sheet: Sheet) {
    if (!confirm(`Delete ${sheet.fileName}?`)) return;
    const response = await fetch(`/api/data-sheets/${sheet.id}`, { method: "DELETE" });
    response.ok ? await load() : setError("The data sheet could not be deleted.");
  }

  return <div className="overlay" onMouseDown={event => event.target === event.currentTarget && onClose()}>
    <section className="modal file-modal">
      <button className="close" onClick={onClose}>×</button>
      <p className="eyebrow">DATA SHEETS</p>
      <h2>{item.name}</h2>
      <p className="muted">Keep specifications, manuals, and revised supplier documents together.</p>
      {error && <p className="file-error">{error}</p>}
      <form className="file-upload" onSubmit={upload}>
        <label>PDF or document<input type="file" required accept=".pdf,.doc,.docx,.xls,.xlsx,.txt,.zip" onChange={event => setFile(event.target.files?.[0] || null)} /></label>
        <div className="file-fields">
          <label>Revision<input required placeholder="e.g. Rev B" value={version} onChange={event => setVersion(event.target.value)} /></label>
          <label>Notes<input placeholder="Supplier, date, or change" value={notes} onChange={event => setNotes(event.target.value)} /></label>
        </div>
        <button className="primary" disabled={busy}>{busy ? "Uploading…" : "Upload data sheet"}</button>
      </form>
      <div className="version-list">
        <h3>Document history</h3>
        {files.map((sheet, index) => <article key={sheet.id}>
          <div>
            <strong>{sheet.version} {index === 0 && <span className="current-version">Current</span>}</strong>
            <p>{sheet.fileName}{sheet.sizeBytes ? ` · ${size(sheet.sizeBytes)}` : ""}</p>
            {sheet.notes && <small>{sheet.notes}</small>}
            <time>{new Date(sheet.createdAt).toLocaleString()}</time>
          </div>
          <div className="file-actions">
            <a className="ghost" href={`/api/data-sheets/${sheet.id}/download`} target="_blank" rel="noreferrer">Open</a>
            <button onClick={() => remove(sheet)}>Delete</button>
          </div>
        </article>)}
        {!files.length && <div className="empty">No data sheets uploaded yet.</div>}
      </div>
    </section>
  </div>;
}
