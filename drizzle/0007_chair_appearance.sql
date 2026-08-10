CREATE TABLE IF NOT EXISTS chair_appearance (chair_id INTEGER PRIMARY KEY, chair_color TEXT NOT NULL DEFAULT '#3274bb', remote_color TEXT NOT NULL DEFAULT '#14161e', wheel_position TEXT NOT NULL DEFAULT 'M');
--> statement-breakpoint
INSERT OR IGNORE INTO chair_appearance(chair_id,chair_color,remote_color,wheel_position) SELECT id,chair_color,remote_color,'M' FROM chairs;
