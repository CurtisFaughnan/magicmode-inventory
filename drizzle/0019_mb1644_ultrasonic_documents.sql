UPDATE items
SET name='MaxBotix MB1644 Ultrasonic Sensor',
    description='MaxBotix MB1644 HRLV-ShortRange-EZ4T ultrasonic distance sensor; 1 mm resolution, 2 cm to 5 m reported range, 10 Hz read rate, 2.5-5.5 V operation, and analog-voltage, TTL serial, and pulse-width outputs',
    supplier='MaxBotix',
    unit_cost=29.95,
    notes='Optional ultrasonic package. Five sensors are required only when a chair is configured with ultrasonics. Active manufacturer part-number family: MB1644-00X. Saved price reflects the manufacturer listing when the part was identified and can be edited as purchasing costs change.'
WHERE part_number='USN-001';

--> statement-breakpoint
INSERT INTO purchase_links(item_id,url,updated_at)
SELECT id,'https://maxbotix.com/products/mb1644',CURRENT_TIMESTAMP
FROM items WHERE part_number='USN-001'
ON CONFLICT(item_id) DO UPDATE SET url=excluded.url,updated_at=excluded.updated_at;

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Product specifications','MaxBotix MB1644 HRLV-ShortRange-EZ4T Product Specifications','', 'https://maxbotix.com/products/mb1644','text/html',0,'Official MaxBotix product page with performance specifications, active part-number family, ordering information, documents, and CAD resources.',CURRENT_TIMESTAMP FROM items WHERE part_number='USN-001' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Product specifications');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Datasheet','MaxBotix HRLV-ShortRange-EZ Datasheet','', 'https://cdn.shopify.com/s/files/1/0550/8091/0899/files/15029.pdf?v=1778005288','application/pdf',0,'Official MaxBotix datasheet covering the MB1644 HRLV-ShortRange-EZ4T sensor, electrical connections, outputs, timing, beam patterns, dimensions, and operating specifications.',CURRENT_TIMESTAMP FROM items WHERE part_number='USN-001' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Datasheet');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Trigger and chaining guide','MaxBotix Sensor Trigger and Chaining Application Guide','', 'https://maxbotix.com/pages/controlling-a-maxsonar-sensor','text/html',0,'Official MaxBotix integration guide explaining the RX trigger pin, commanded readings, and chaining multiple ultrasonic sensors.',CURRENT_TIMESTAMP FROM items WHERE part_number='USN-001' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Trigger and chaining guide');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'RoHS compliance','MaxBotix RoHS Declaration of Conformity','', 'https://maxbotix.com/pages/rohs-compliance','text/html',0,'Official MaxBotix RoHS compliance declaration and supporting information.',CURRENT_TIMESTAMP FROM items WHERE part_number='USN-001' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='RoHS compliance');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'CE compliance','MaxBotix CE Declaration of Conformity','', 'https://maxbotix.com/pages/ce-declaration-of-conformity','text/html',0,'Official MaxBotix CE declaration of conformity.',CURRENT_TIMESTAMP FROM items WHERE part_number='USN-001' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='CE compliance');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'SolidWorks CAD','MaxBotix HRLV-ShortRange-EZ SolidWorks Model','', 'https://cdn.shopify.com/s/files/1/0550/8091/0899/files/HRLV-ShortRange-EZ.sldprt?v=1699309838','application/octet-stream',0,'Official MaxBotix mechanical CAD model in SolidWorks part format.',CURRENT_TIMESTAMP FROM items WHERE part_number='USN-001' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='SolidWorks CAD');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'STEP CAD','MaxBotix HRLV-ShortRange-EZ STEP Model','', 'https://cdn.shopify.com/s/files/1/0550/8091/0899/files/HRLV-ShortRange-EZ.STEP?v=1699309838','model/step',0,'Official MaxBotix neutral mechanical CAD model in STEP format.',CURRENT_TIMESTAMP FROM items WHERE part_number='USN-001' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='STEP CAD');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'STL CAD','MaxBotix HRLV-ShortRange-EZ STL Model','', 'https://cdn.shopify.com/s/files/1/0550/8091/0899/files/HRLV-ShortRange-EZ.STL?v=1699309838','model/stl',0,'Official MaxBotix mechanical reference model in STL format.',CURRENT_TIMESTAMP FROM items WHERE part_number='USN-001' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='STL CAD');
