CREATE TABLE IF NOT EXISTS hardware_assets (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  asset_tag TEXT NOT NULL UNIQUE,
  kind TEXT NOT NULL CHECK(kind IN ('Jetson','PCB')),
  model TEXT NOT NULL DEFAULT '',
  serial_number TEXT NOT NULL DEFAULT '',
  chair_id INTEGER,
  notes TEXT NOT NULL DEFAULT '',
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL,
  updated_by TEXT NOT NULL DEFAULT ''
);

CREATE TABLE IF NOT EXISTS hardware_flashes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  asset_id INTEGER NOT NULL,
  flashed_at TEXT NOT NULL,
  image_name TEXT NOT NULL,
  version TEXT NOT NULL DEFAULT '',
  notes TEXT NOT NULL DEFAULT '',
  flashed_by TEXT NOT NULL DEFAULT '',
  created_at TEXT NOT NULL
);

CREATE INDEX IF NOT EXISTS hardware_assets_chair_idx ON hardware_assets(chair_id);
CREATE INDEX IF NOT EXISTS hardware_flashes_asset_idx ON hardware_flashes(asset_id, flashed_at DESC);

INSERT OR IGNORE INTO hardware_assets(asset_tag,kind,model,serial_number,chair_id,notes,created_at,updated_at,updated_by)
SELECT part_id,
       CASE WHEN LOWER(type) LIKE '%jetson%' THEN 'Jetson' ELSE 'PCB' END,
       type,'',chair_id,notes,updated_at,updated_at,updated_by
FROM chair_assets
WHERE type='PCB' OR LOWER(type) LIKE '%jetson%';
