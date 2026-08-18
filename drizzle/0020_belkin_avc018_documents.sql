UPDATE items
SET part_number='AVC018',
    name='Belkin USB-C to 4-Port USB-C Hub',
    description='Belkin Connect AVC018 USB-C hub with four USB-C 3.2 Gen 2 ports, up to 10 Gbps data transfer, 100 W USB Power Delivery pass-through with up to 85 W to the host, and an integrated 8.7-inch USB-C cable',
    category='Electronics',
    unit_cost=44.99,
    supplier='Belkin',
    notes='Belkin packaging SKU AVC018btBK. Plug-and-play with Windows, macOS, ChromeOS, and compatible USB-C or Thunderbolt hosts. Manufacturer list price recorded August 2026; Belkin listed the item out of stock at that time.'
WHERE part_number='AVC018'
   OR (lower(name) LIKE '%belkin%' AND lower(name) LIKE '%4%port%' AND lower(name) LIKE '%usb%');

--> statement-breakpoint
INSERT INTO items(part_number,name,description,category,qty_needed,qty_on_hand,unit_cost,unit,supplier,lead_time,bom_level,notes,is_optional)
SELECT 'AVC018','Belkin USB-C to 4-Port USB-C Hub','Belkin Connect AVC018 USB-C hub with four USB-C 3.2 Gen 2 ports, up to 10 Gbps data transfer, 100 W USB Power Delivery pass-through with up to 85 W to the host, and an integrated 8.7-inch USB-C cable','Electronics',1,0,44.99,'pcs','Belkin','',1,'Belkin packaging SKU AVC018btBK. Plug-and-play with Windows, macOS, ChromeOS, and compatible USB-C or Thunderbolt hosts. Manufacturer list price recorded August 2026; Belkin listed the item out of stock at that time.',0
WHERE NOT EXISTS(SELECT 1 FROM items WHERE part_number='AVC018');

--> statement-breakpoint
INSERT INTO purchase_links(item_id,url,updated_at)
SELECT id,'https://www.belkin.com/p/usb-c-to-4-port-usb-c-hub/AVC018btBK.html',CURRENT_TIMESTAMP
FROM items WHERE part_number='AVC018'
ON CONFLICT(item_id) DO UPDATE SET url=excluded.url,updated_at=excluded.updated_at;

--> statement-breakpoint
INSERT INTO price_history(item_id,old_price,new_price,reason,changed_by,created_at)
SELECT id,NULL,44.99,'Belkin manufacturer list price recorded August 2026','System',CURRENT_TIMESTAMP
FROM items WHERE part_number='AVC018' AND NOT EXISTS(SELECT 1 FROM price_history p WHERE p.item_id=items.id AND p.new_price=44.99 AND p.reason='Belkin manufacturer list price recorded August 2026');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Product specifications','Belkin AVC018 Product Specifications','', 'https://www.belkin.com/p/usb-c-to-4-port-usb-c-hub/AVC018btBK.html','text/html',0,'Official Belkin product page with port, performance, power-delivery, cable-length, dimensions, compatibility, warranty, and ordering information.',CURRENT_TIMESTAMP FROM items WHERE part_number='AVC018' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Product specifications');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Support overview','Meet the Belkin Connect AVC018','', 'https://www.belkin.com/support-article?articleNum=335458','text/html',0,'Official Belkin support overview describing features, package contents, color, compatibility, and power delivery.',CURRENT_TIMESTAMP FROM items WHERE part_number='AVC018' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Support overview');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'FAQ and integration','Belkin AVC018 Frequently Asked Questions','', 'https://www.belkin.com/sg/support-article/?articleNum=335459','text/html',0,'Official Belkin hardware, compatibility, setup, data-rate, charging, dimensions, and operating FAQ. The hub is plug-and-play and does not require a driver.',CURRENT_TIMESTAMP FROM items WHERE part_number='AVC018' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='FAQ and integration');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'EU declaration','Belkin AVC018 EU Declaration of Conformity','', 'https://s3.belkin.com/support/assets/belkin/dofc/AVC018_USB_C_to_4_Port_USB_C_Hub.pdf','application/pdf',0,'Official Belkin declaration for model AVC018 and packaging part AVC018btBK, covering safety, EMC, RoHS, WEEE, REACH, and POP requirements.',CURRENT_TIMESTAMP FROM items WHERE part_number='AVC018' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='EU declaration');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Regulatory statement','Belkin Hub and Adapter Regulatory Statement','', 'https://www.belkin.com/on/demandware.static/-/Sites-master-product-catalog-blk/default/dw9ecaac53/datasheets/regulatory/INS_8850bt00921_Online.pdf','application/pdf',0,'Official multilingual Belkin regulatory statement explicitly listing AVC018; includes CE, UKCA, EMC, RoHS, WEEE, and regional compliance information.',CURRENT_TIMESTAMP FROM items WHERE part_number='AVC018' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Regulatory statement');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Warranty','Belkin Docks and Hubs Warranty Information','', 'https://www.belkin.com/tw/en/support-article/?articleNum=336857','text/html',0,'Official Belkin warranty library listing AVC018btBK. Product support identifies a two-year limited warranty.',CURRENT_TIMESTAMP FROM items WHERE part_number='AVC018' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Warranty');
