ALTER TABLE items ADD COLUMN is_optional INTEGER NOT NULL DEFAULT 0;

--> statement-breakpoint
INSERT OR IGNORE INTO items(part_number,name,description,category,qty_needed,qty_on_hand,unit_cost,unit,supplier,lead_time,bom_level,notes,is_optional)
VALUES('USN-001','Ultrasonic Sensor','Optional ultrasonic proximity sensor; exact manufacturer and model to be identified','Electronics',5,0,NULL,'pcs','','',1,'Optional package; five sensors are required only when a chair is configured with ultrasonics.',1);

--> statement-breakpoint
INSERT OR IGNORE INTO items(part_number,name,description,category,qty_needed,qty_on_hand,unit_cost,unit,supplier,lead_time,bom_level,notes,is_optional)
VALUES('MCU-001','Ultrasonic Microcontroller','Optional microcontroller for the ultrasonic sensor package; exact manufacturer and model to be identified','Electronics',1,0,NULL,'pcs','','',1,'Optional package; one controller is required only when a chair is configured with ultrasonics.',1);

--> statement-breakpoint
INSERT OR IGNORE INTO items(part_number,name,description,category,qty_needed,qty_on_hand,unit_cost,unit,supplier,lead_time,bom_level,notes,is_optional)
VALUES('USN-CASE-001','Ultrasonic Casing','Optional 3D-printed casing for the ultrasonic sensor package','3D Print',1,0,NULL,'pcs','','',1,'Optional package; store CAD, print files, and previous revisions in this item''s 3D Files area.',1);
