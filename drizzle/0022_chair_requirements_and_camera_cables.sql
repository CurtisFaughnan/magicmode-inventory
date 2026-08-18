UPDATE items
SET part_number='CAB-CAM-SHORT-001',
    name='LEIRUI Short USB-C Camera Cable',
    description='3.3 ft USB-C to USB-C camera cable with one straight connector and one 90-degree connector; cable marking AWM Style 2725, 80 C, 30 V; SuperSpeed USB 3.2 family, vendor-rated up to 20 Gbps',
    category='Cord & Cable',
    qty_needed=3,
    supplier='LEIRUI',
    notes='Used for the side and rear cameras: three per chair. Physical cable markings were provided by Curtis. The linked performance figures are vendor claims; no manufacturer-issued PDF datasheet or UL E-file number was found.',
    is_optional=0
WHERE part_number='CAB-CAM-SHORT-001'
   OR lower(trim(name))='usb c to usb c cable';

--> statement-breakpoint
INSERT INTO items(part_number,name,description,category,qty_needed,qty_on_hand,unit_cost,unit,supplier,lead_time,bom_level,notes,is_optional)
SELECT 'CAB-CAM-SHORT-001','LEIRUI Short USB-C Camera Cable','3.3 ft USB-C to USB-C camera cable with one straight connector and one 90-degree connector; cable marking AWM Style 2725, 80 C, 30 V; SuperSpeed USB 3.2 family, vendor-rated up to 20 Gbps','Cord & Cable',3,0,NULL,'pcs','LEIRUI','',1,'Used for the side and rear cameras: three per chair. Physical cable markings were provided by Curtis. The linked performance figures are vendor claims; no manufacturer-issued PDF datasheet or UL E-file number was found.',0
WHERE NOT EXISTS(SELECT 1 FROM items WHERE part_number='CAB-CAM-SHORT-001');

--> statement-breakpoint
INSERT INTO items(part_number,name,description,category,qty_needed,qty_on_hand,unit_cost,unit,supplier,lead_time,bom_level,notes,is_optional)
SELECT 'CAB-CAM-TOP-001','Top Camera USB-C Cable (Long)','Long USB-C cable used for the top camera; exact manufacturer, length, connector orientation, and performance rating still need to be identified','Cord & Cable',1,0,NULL,'pcs','','',1,'One per chair. Placeholder inventory record created so the long top-camera cable remains separate from the three short side/rear camera cables. Add the label details and verified documents when available.',0
WHERE NOT EXISTS(SELECT 1 FROM items WHERE part_number='CAB-CAM-TOP-001');

--> statement-breakpoint
INSERT INTO purchase_links(item_id,url,updated_at)
SELECT id,'https://www.amazon.com/dp/B09LVN8XJF',CURRENT_TIMESTAMP
FROM items WHERE part_number='CAB-CAM-SHORT-001'
ON CONFLICT(item_id) DO UPDATE SET url=excluded.url,updated_at=excluded.updated_at;

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Vendor specifications','LEIRUI USB-C 3.2 Gen 2x2 Cable Specifications','', 'https://www.cart2india.com/usb-cables/90-degree-usb-c-to-usb-c-cable-high-speed-20gbps-data-transfer-4k144hz60hz-video-monitor-cable-usb-c-32-gen2x2-cable-240w-fast-charging-right-angle-compatible-with-iphone-15-samsung-macbook-ipad/00000000004389992684','text/html',0,'Third-party vendor listing identifying LEIRUI and the cable family, including 3.3 ft length, right-angle connector, claimed 20 Gbps USB 3.2 Gen 2x2 operation, video support, and charging capability. This is not a manufacturer-issued certification document.',CURRENT_TIMESTAMP FROM items WHERE part_number='CAB-CAM-SHORT-001' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Vendor specifications');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Matching product listing','3.3 ft Right-Angle USB-C 20 Gbps Cable Listing','', 'https://www.amazon.com/dp/B09LVN8XJF','text/html',0,'Matching 3.3 ft product listing with one right-angle USB-C connector and claimed 20 Gbps USB 3.2 performance. Confirm the listing photo and markings before reordering because LEIRUI does not publish a stable model number on the cable.',CURRENT_TIMESTAMP FROM items WHERE part_number='CAB-CAM-SHORT-001' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Matching product listing');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Cable-family technical guide','Right-Angle USB 3.2 Gen 2x2 Technical Guide','', 'https://m.media-amazon.com/images/I/A17TjFWJq2L.pdf','application/pdf',0,'Vendor-hosted technical guide for a matching right-angle USB 3.2 Gen 2x2 cable family. Use as a reference only; it is not confirmed as a manufacturer-controlled LEIRUI datasheet.',CURRENT_TIMESTAMP FROM items WHERE part_number='CAB-CAM-SHORT-001' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Cable-family technical guide');
