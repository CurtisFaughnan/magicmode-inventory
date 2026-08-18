UPDATE items
SET part_number='CAB-CAM-USBA-USBC-001',
    name='USB-A to USB-C Camera Data Cable',
    description='3 ft camera data cable with straight USB-A and straight USB-C connectors; cable jacket marked E328849 9U, AWM Style 20276, 80 C, 30 V, VW-1; application requires up to 20 Gbps',
    category='Cord & Cable',
    qty_needed=3,
    supplier='Wuerth Elektronik (jacket marking)',
    notes='Three per chair under the current editable Chair Requirements BOM. Physical dimensions, connector orientation, and jacket text were provided by Curtis. E328849 is a Wuerth Elektronik UL file reference but does not by itself identify the finished USB cable. Exact assembly model, 20 Gbps certification, and purchase source remain unverified.',
    is_optional=0
WHERE part_number='CAB-CAM-USBA-USBC-001'
   OR lower(trim(name))='usb c to usb a 20gbps data cable';

--> statement-breakpoint
INSERT INTO items(part_number,name,description,category,qty_needed,qty_on_hand,unit_cost,unit,supplier,lead_time,bom_level,notes,is_optional)
SELECT 'CAB-CAM-USBA-USBC-001','USB-A to USB-C Camera Data Cable','3 ft camera data cable with straight USB-A and straight USB-C connectors; cable jacket marked E328849 9U, AWM Style 20276, 80 C, 30 V, VW-1; application requires up to 20 Gbps','Cord & Cable',3,0,NULL,'pcs','Wuerth Elektronik (jacket marking)','',3,'Three per chair under the current editable Chair Requirements BOM. Physical dimensions, connector orientation, and jacket text were provided by Curtis. E328849 is a Wuerth Elektronik UL file reference but does not by itself identify the finished USB cable. Exact assembly model, 20 Gbps certification, and purchase source remain unverified.',0
WHERE NOT EXISTS(SELECT 1 FROM items WHERE part_number='CAB-CAM-USBA-USBC-001');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'UL file reference','UL Product iQ E328849 Reference','', 'https://productiq.ulprospector.com/en/profile/8765856/avlv8.e328849?term=e328849','text/html',0,'Official UL record for Wuerth Elektronik file E328849. This verifies the file holder and wiring-material classification only; it does not identify or certify the complete USB-A-to-USB-C cable assembly.',CURRENT_TIMESTAMP FROM items WHERE part_number='CAB-CAM-USBA-USBC-001' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='UL file reference');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'USB 3.x technical reference','Wuerth Elektronik USB 3.x Technical Overview','', 'https://www.we-online.com/en/components/applicationguide/usbc','text/html',0,'Official Wuerth Elektronik USB 3.x application overview explaining high-speed differential pairs and speeds up to 20 Gbps. This is a general engineering reference, not the finished cable assembly datasheet.',CURRENT_TIMESTAMP FROM items WHERE part_number='CAB-CAM-USBA-USBC-001' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='USB 3.x technical reference');
