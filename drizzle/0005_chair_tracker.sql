CREATE TABLE IF NOT EXISTS chairs (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL UNIQUE, chair_color TEXT NOT NULL DEFAULT '#3274bb', remote_color TEXT NOT NULL DEFAULT '#14161e', notes TEXT NOT NULL DEFAULT '', created_at TEXT NOT NULL);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS chair_parts (chair_id INTEGER NOT NULL, item_id INTEGER NOT NULL, quantity REAL NOT NULL DEFAULT 0, status TEXT NOT NULL DEFAULT 'Installed', notes TEXT NOT NULL DEFAULT '', updated_by TEXT NOT NULL DEFAULT '', updated_at TEXT NOT NULL, PRIMARY KEY(chair_id,item_id));
--> statement-breakpoint
CREATE INDEX IF NOT EXISTS chair_parts_chair_idx ON chair_parts(chair_id);
