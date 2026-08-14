UPDATE items
SET name='Seeed Studio XIAO ESP32S3',
    description='Seeed Studio XIAO ESP32S3 development board, SKU 113991114; ESP32-S3R8 dual-core 240 MHz microcontroller with 2.4 GHz Wi-Fi, Bluetooth 5 LE, 8 MB PSRAM, 8 MB flash, USB-C, and battery charge management',
    supplier='Seeed Studio',
    notes='Optional ultrasonic-package controller. One controller is required only when a chair is configured with ultrasonics. Manufacturer SKU: 113991114.'
WHERE part_number='MCU-001';

--> statement-breakpoint
INSERT INTO purchase_links(item_id,url,updated_at)
SELECT id,'https://www.seeedstudio.com/XIAO-ESP32S3-p-5627.html',CURRENT_TIMESTAMP
FROM items WHERE part_number='MCU-001'
ON CONFLICT(item_id) DO UPDATE SET url=excluded.url,updated_at=excluded.updated_at;

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Product specifications','Seeed Studio XIAO ESP32S3 Product Specifications','', 'https://www.seeedstudio.com/XIAO-ESP32S3-p-5627.html','text/html',0,'Official Seeed Studio product page for SKU 113991114, including board specifications and purchasing information.',CURRENT_TIMESTAMP FROM items WHERE part_number='MCU-001' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Product specifications');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Getting started and programming','XIAO ESP32S3 Getting Started and Programming Guide','', 'https://wiki.seeedstudio.com/xiao_esp32s3_getting_started/','text/html',0,'Official Seeed Studio setup, pin description, Arduino programming, battery, bootloader, and recovery guide.',CURRENT_TIMESTAMP FROM items WHERE part_number='MCU-001' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Getting started and programming');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'ESP32-S3 datasheet','Espressif ESP32-S3 Series Datasheet','', 'https://documentation.espressif.com/esp32-s3_datasheet_en.pdf','application/pdf',0,'Official current Espressif technical datasheet for the ESP32-S3 system-on-chip used by the board.',CURRENT_TIMESTAMP FROM items WHERE part_number='MCU-001' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='ESP32-S3 datasheet');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Board schematic','Seeed Studio XIAO ESP32S3 Board Schematic','', 'https://files.seeedstudio.com/wiki/SeeedStudio-XIAO-ESP32S3/new-res/202003751_XIAO%20ESP32S3_v1.4_SCH_260226.pdf.pdf','application/pdf',0,'Official Seeed-hosted XIAO ESP32S3 v1.4 electrical schematic.',CURRENT_TIMESTAMP FROM items WHERE part_number='MCU-001' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Board schematic');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Hardware design resources','XIAO ESP32S3 Hardware Design Resources','', 'https://wiki.seeedstudio.com/xiao_esp32s3_getting_started/#resources','text/html',0,'Official resource library containing the schematic, KiCad project, symbols and footprints, pinout, DXF dimensions, 3D model, and factory firmware.',CURRENT_TIMESTAMP FROM items WHERE part_number='MCU-001' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Hardware design resources');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'FCC certification','Seeed Studio XIAO ESP32S3 FCC Certificate - SKU 113991114','', 'https://files.seeedstudio.com/Seeed_Certificate/documents_certificate/113991114-FCC.pdf','application/pdf',0,'Official Seeed Studio FCC certificate specifically indexed to manufacturer SKU 113991114.',CURRENT_TIMESTAMP FROM items WHERE part_number='MCU-001' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='FCC certification');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'CE compliance','Seeed Studio XIAO ESP32S3 CE Verification','', 'https://files.seeedstudio.com/Seeed_Certificate/documents_certificate/102010635-CE.pdf','application/pdf',0,'Official Seeed Studio CE verification covering the XIAO ESP32S3 product family.',CURRENT_TIMESTAMP FROM items WHERE part_number='MCU-001' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='CE compliance');
