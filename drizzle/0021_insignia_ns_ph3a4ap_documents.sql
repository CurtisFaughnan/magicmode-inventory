UPDATE items
SET part_number='NS-PH3A4AP',
    name='Insignia 4-Port USB 3.0 Powered Hub',
    description='Insignia NS-PH3A4AP powered USB-A hub with four USB 3.0 ports, up to 5 Gbps data transfer, 5 V/900 mA output per port, LED power indicator, USB 2.0 backward compatibility, and included 5 V/4 A AC adapter and USB-A-to-Micro-B host cable',
    category='Electronics',
    unit_cost=24.99,
    supplier='Insignia / Best Buy',
    notes='Best Buy SKU 6460662; UPC 600603277283. Plug-and-play with Windows 10, macOS 10.12, and Chrome OS 81 or later compatible systems. Regular listed price recorded August 2026; temporary sale pricing may vary.'
WHERE part_number='NS-PH3A4AP'
   OR (lower(name) LIKE '%insignia%' AND lower(name) LIKE '%4%port%' AND lower(name) LIKE '%powered%hub%');

--> statement-breakpoint
INSERT INTO items(part_number,name,description,category,qty_needed,qty_on_hand,unit_cost,unit,supplier,lead_time,bom_level,notes,is_optional)
SELECT 'NS-PH3A4AP','Insignia 4-Port USB 3.0 Powered Hub','Insignia NS-PH3A4AP powered USB-A hub with four USB 3.0 ports, up to 5 Gbps data transfer, 5 V/900 mA output per port, LED power indicator, USB 2.0 backward compatibility, and included 5 V/4 A AC adapter and USB-A-to-Micro-B host cable','Electronics',1,0,24.99,'pcs','Insignia / Best Buy','',1,'Best Buy SKU 6460662; UPC 600603277283. Plug-and-play with Windows 10, macOS 10.12, and Chrome OS 81 or later compatible systems. Regular listed price recorded August 2026; temporary sale pricing may vary.',0
WHERE NOT EXISTS(SELECT 1 FROM items WHERE part_number='NS-PH3A4AP');

--> statement-breakpoint
INSERT INTO purchase_links(item_id,url,updated_at)
SELECT id,'https://www.bestbuy.com/product/insignia-4-port-usb-3-0-powered-hub-metallic-gray/6460662',CURRENT_TIMESTAMP
FROM items WHERE part_number='NS-PH3A4AP'
ON CONFLICT(item_id) DO UPDATE SET url=excluded.url,updated_at=excluded.updated_at;

--> statement-breakpoint
INSERT INTO price_history(item_id,old_price,new_price,reason,changed_by,created_at)
SELECT id,NULL,24.99,'Best Buy regular listed price recorded August 2026','System',CURRENT_TIMESTAMP
FROM items WHERE part_number='NS-PH3A4AP' AND NOT EXISTS(SELECT 1 FROM price_history p WHERE p.item_id=items.id AND p.new_price=24.99 AND p.reason='Best Buy regular listed price recorded August 2026');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Product specifications','Insignia NS-PH3A4AP Product Specifications','', 'https://www.bestbuy.com/product/insignia-4-port-usb-3-0-powered-hub-metallic-gray/6460662','text/html',0,'Official Insignia/Best Buy product page with specifications, dimensions, contents, compatibility, UL listing, warranty, current availability, and purchase information.',CURRENT_TIMESTAMP FROM items WHERE part_number='NS-PH3A4AP' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Product specifications');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Quick setup guide','Insignia NS-PH3A4AP Quick Setup Guide','', 'https://files.bbystatic.com/1L%2FL%2Fp7BtHd9nSJwr71zJA%3D%3D/Quick%2BSetup%2BGuide','application/pdf',0,'Official six-page guide for NS-PH3A4AP and NS-PH3A4AP-C covering package contents, installation, specifications, operating conditions, FCC and ICES statements, and the limited warranty.',CURRENT_TIMESTAMP FROM items WHERE part_number='NS-PH3A4AP' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Quick setup guide');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Installation and specifications','NS-PH3A4AP Installation and Technical Specifications','', 'https://files.bbystatic.com/1L%2FL%2Fp7BtHd9nSJwr71zJA%3D%3D/Quick%2BSetup%2BGuide','application/pdf',0,'Official installation reference: 5 V/4 A power adapter, USB 3.0 upstream connection, hot-swap and plug-and-play behavior, 5 Gbps maximum transmission, 0-50 C operating temperature, and 20-85 percent relative humidity.',CURRENT_TIMESTAMP FROM items WHERE part_number='NS-PH3A4AP' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Installation and specifications');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'FCC and ICES compliance','NS-PH3A4AP FCC and ICES Regulatory Statements','', 'https://files.bbystatic.com/1L%2FL%2Fp7BtHd9nSJwr71zJA%3D%3D/Quick%2BSetup%2BGuide','application/pdf',0,'Official regulatory section within the product guide, including FCC Part 15 and Canadian ICES statements.',CURRENT_TIMESTAMP FROM items WHERE part_number='NS-PH3A4AP' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='FCC and ICES compliance');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Warranty','Insignia NS-PH3A4AP One-Year Limited Warranty','', 'https://files.bbystatic.com/1L%2FL%2Fp7BtHd9nSJwr71zJA%3D%3D/Quick%2BSetup%2BGuide','application/pdf',0,'Official one-year limited parts-and-labor warranty included in the product guide.',CURRENT_TIMESTAMP FROM items WHERE part_number='NS-PH3A4AP' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Warranty');
