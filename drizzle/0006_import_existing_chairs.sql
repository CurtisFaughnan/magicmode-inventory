CREATE TABLE IF NOT EXISTS chair_assets (id INTEGER PRIMARY KEY AUTOINCREMENT, chair_id INTEGER NOT NULL, type TEXT NOT NULL, part_id TEXT NOT NULL, status TEXT NOT NULL, updated_at TEXT NOT NULL, updated_by TEXT NOT NULL DEFAULT '', notes TEXT NOT NULL DEFAULT '', UNIQUE(chair_id,type,part_id));
--> statement-breakpoint
INSERT OR IGNORE INTO chairs(name,chair_color,remote_color,notes,created_at) VALUES ('CHAIR-001','#3274bb','#14161e','Imported from Chair Parts Tracker','2026-07-27T17:14:13.460Z'),('CHAIR-002','#3274bb','#14161e','Imported from Chair Parts Tracker','2026-07-27T17:53:39.866Z');
--> statement-breakpoint
INSERT OR IGNORE INTO chair_assets(chair_id,type,part_id,status,updated_at) SELECT id,'Product ID','PDT-001-001','Installed','2026-07-27T18:22:32.767Z' FROM chairs WHERE name='CHAIR-001';
--> statement-breakpoint
INSERT OR IGNORE INTO chair_assets(chair_id,type,part_id,status,updated_at) SELECT id,'Software','SW-001-001','Installed','2026-07-27T17:14:13.460Z' FROM chairs WHERE name='CHAIR-001';
--> statement-breakpoint
INSERT OR IGNORE INTO chair_assets(chair_id,type,part_id,status,updated_at) SELECT id,'Model','MDL-001-001','Installed','2026-07-27T17:14:13.460Z' FROM chairs WHERE name='CHAIR-001';
--> statement-breakpoint
INSERT OR IGNORE INTO chair_assets(chair_id,type,part_id,status,updated_at) SELECT id,'Firmware','FW-001-001','Installed','2026-07-27T17:14:13.460Z' FROM chairs WHERE name='CHAIR-001';
--> statement-breakpoint
INSERT OR IGNORE INTO chair_assets(chair_id,type,part_id,status,updated_at) SELECT id,'Hardware','HW-001-001','Installed','2026-07-27T18:22:41.481Z' FROM chairs WHERE name='CHAIR-001';
--> statement-breakpoint
INSERT OR IGNORE INTO chair_assets(chair_id,type,part_id,status,updated_at) SELECT id,'PCB','PCB-001-001','Installed','2026-07-27T18:22:15.224Z' FROM chairs WHERE name='CHAIR-001';
--> statement-breakpoint
INSERT OR IGNORE INTO chair_assets(chair_id,type,part_id,status,updated_at) SELECT id,'Bluetooth Controller','BLU-001-001','Installed','2026-07-27T18:22:24.968Z' FROM chairs WHERE name='CHAIR-001';
--> statement-breakpoint
INSERT OR IGNORE INTO chair_assets(chair_id,type,part_id,status,updated_at) SELECT id,'Jetson Orin AGX','JET-001-001','Installed','2026-07-27T18:22:47.869Z' FROM chairs WHERE name='CHAIR-001';
--> statement-breakpoint
INSERT OR IGNORE INTO chair_assets(chair_id,type,part_id,status,updated_at) SELECT id,'Product ID','PDT-001-002','Installed','2026-07-27T18:23:07.689Z' FROM chairs WHERE name='CHAIR-002';
--> statement-breakpoint
INSERT OR IGNORE INTO chair_assets(chair_id,type,part_id,status,updated_at) SELECT id,'Software','SW-001-002','Installed','2026-07-27T18:23:13.207Z' FROM chairs WHERE name='CHAIR-002';
--> statement-breakpoint
INSERT OR IGNORE INTO chair_assets(chair_id,type,part_id,status,updated_at) SELECT id,'Model','MDL-001-002','Installed','2026-07-27T18:23:17.675Z' FROM chairs WHERE name='CHAIR-002';
--> statement-breakpoint
INSERT OR IGNORE INTO chair_assets(chair_id,type,part_id,status,updated_at) SELECT id,'Firmware','FW-001-002','Installed','2026-07-27T18:23:25.628Z' FROM chairs WHERE name='CHAIR-002';
--> statement-breakpoint
INSERT OR IGNORE INTO chair_assets(chair_id,type,part_id,status,updated_at) SELECT id,'Hardware','HW-001-002','Installed','2026-07-27T17:54:11.773Z' FROM chairs WHERE name='CHAIR-002';
--> statement-breakpoint
INSERT OR IGNORE INTO chair_assets(chair_id,type,part_id,status,updated_at) SELECT id,'PCB','PCB-001-002','Installed','2026-07-27T17:53:39.866Z' FROM chairs WHERE name='CHAIR-002';
--> statement-breakpoint
INSERT OR IGNORE INTO chair_assets(chair_id,type,part_id,status,updated_at) SELECT id,'Bluetooth Controller','BLU-001-002','Installed','2026-07-27T17:54:03.772Z' FROM chairs WHERE name='CHAIR-002';
--> statement-breakpoint
INSERT OR IGNORE INTO chair_assets(chair_id,type,part_id,status,updated_at) SELECT id,'Jetson Orin AGX','JET-001-002','Installed','2026-07-27T17:53:56.621Z' FROM chairs WHERE name='CHAIR-002';
