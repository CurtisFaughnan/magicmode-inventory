CREATE TABLE IF NOT EXISTS data_sheets (id INTEGER PRIMARY KEY AUTOINCREMENT, item_id INTEGER NOT NULL, version TEXT NOT NULL, file_name TEXT NOT NULL, storage_key TEXT, external_url TEXT NOT NULL DEFAULT '', content_type TEXT NOT NULL, size_bytes INTEGER NOT NULL DEFAULT 0, notes TEXT NOT NULL DEFAULT '', created_at TEXT NOT NULL);
--> statement-breakpoint
CREATE INDEX IF NOT EXISTS idx_data_sheets_item_id ON data_sheets(item_id,created_at);
--> statement-breakpoint
INSERT OR IGNORE INTO items(part_number,name,description,category,qty_needed,qty_on_hand,unit_cost,unit,supplier,lead_time,bom_level,notes) VALUES('XK-1202-UHS12-R','XK-12 USB Switch Interface','6 dual switch ports supporting up to 12 switches; programmable USB HID interface','Electronics',1,0,109.95,'pcs','PI Engineering','',1,'Manufacturer MSRP recorded August 2026');
--> statement-breakpoint
INSERT OR IGNORE INTO purchase_links(item_id,url,updated_at) SELECT id,'https://www.bhphotovideo.com/c/product/1032483-REG/x_keys_xk_1202_uhs12_r_xk_12_usb_switch_interface.html',CURRENT_TIMESTAMP FROM items WHERE part_number='XK-1202-UHS12-R';
--> statement-breakpoint
INSERT INTO price_history(item_id,old_price,new_price,reason,changed_by,created_at) SELECT id,NULL,109.95,'PI Engineering manufacturer MSRP','System',CURRENT_TIMESTAMP FROM items WHERE part_number='XK-1202-UHS12-R' AND NOT EXISTS(SELECT 1 FROM price_history p WHERE p.item_id=items.id);
--> statement-breakpoint
INSERT OR IGNORE INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at) SELECT id,'Manufacturer sheet','XK-12 USB Switch Interface Info Sheet','', 'https://xkeys.com/media/wysiwyg/smartwave/porto/category/Info%20Sheets/USB%2012%20Switch%20Interface%20Info%20Sheet.pdf','application/pdf',0,'Official PI Engineering product information sheet',CURRENT_TIMESTAMP FROM items WHERE part_number='XK-1202-UHS12-R';
