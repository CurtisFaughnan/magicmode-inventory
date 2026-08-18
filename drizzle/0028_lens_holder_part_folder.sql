ALTER TABLE items ADD COLUMN item_group TEXT NOT NULL DEFAULT '';

--> statement-breakpoint
UPDATE items SET item_group='Lens Holders' WHERE part_number='CLA020-PC';

--> statement-breakpoint
INSERT INTO items(part_number,name,description,category,item_group,qty_needed,qty_on_hand,unit_cost,unit,supplier,lead_time,bom_level,notes,is_optional)
SELECT 'HD36-20-10','CCOM HD36-20 Metal M12 Lens Holder','Metal M12x0.5 lens holder with 20 mm fixed mounting pitch and 10 mm total height','Camera','Lens Holders',1,0,NULL,'pcs','CCOM Electronics Technology Co., Ltd.','',2,'Possible replacement for the Commonlands CLA020-PC. Recorded as the 10 mm-height option to match the current holder. Supplier listing states model HD36-20 and MOQ 100 pieces. Price, mounting screw specification, mechanical drawing, material grade, and certifications are not published. Excluded from the current chair BOM until approved.',1
WHERE NOT EXISTS(SELECT 1 FROM items WHERE part_number='HD36-20-10');

--> statement-breakpoint
INSERT INTO purchase_links(item_id,url,updated_at)
SELECT id,'https://megapixellenses-com.sell.everychina.com/p-105352790/showimage.html',CURRENT_TIMESTAMP
FROM items WHERE part_number='HD36-20-10'
ON CONFLICT(item_id) DO UPDATE SET url=excluded.url,updated_at=excluded.updated_at;

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Supplier specifications','CCOM HD36-20 Metal Lens Holder Supplier Specifications','', 'https://megapixellenses-com.sell.everychina.com/p-105352790/showimage.html','text/html',0,'Supplier listing identifying CCOM Electronics Technology Co., Ltd., model HD36-20, metal M12x0.5 construction, 20 mm fixed pitch, selectable 7 mm or 10 mm height, and MOQ of 100 pieces. The 10 mm option is recorded here to match the current Commonlands holder.',CURRENT_TIMESTAMP FROM items WHERE part_number='HD36-20-10' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Supplier specifications');
