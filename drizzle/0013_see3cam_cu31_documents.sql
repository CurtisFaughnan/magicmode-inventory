-- Identified from sensor module E-CAM313_CUMI031C_MOD_H01 and verified by exact $249/$289 variant pricing.
UPDATE items SET description='See3CAM_CU31_CHLCC_H03R1 top camera; 3MP Sony ISX031 120dB HDR USB camera, wide-angle lens, without enclosure', supplier='e-con Systems' WHERE part_number='CAM-001';
--> statement-breakpoint
UPDATE items SET description='See3CAM_CU31_CXLCC_BX_H03R1 side camera; 3MP Sony ISX031 120dB HDR USB camera, wide-angle lens, with enclosure', supplier='e-con Systems' WHERE part_number='CAM-002';

-- Each named record opens the official e-con CU31 technical-document section, where the current file is maintained.
--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Datasheet','See3CAM_CU31 Datasheet and Lens Datasheets','', 'https://www.e-consystems.com/usb-cameras/sony-isx031-120db-hdr-camera.asp#documents','text/html',0,'Official e-con Systems CU31 datasheet plus wide- and narrow-angle lens datasheets.',CURRENT_TIMESTAMP FROM items WHERE part_number IN ('CAM-001','CAM-002') AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Datasheet');
--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Getting started','See3CAM_CU31 Getting Started Manual','', 'https://www.e-consystems.com/usb-cameras/sony-isx031-120db-hdr-camera.asp#documents','text/html',0,'Official e-con Systems setup and operating manual.',CURRENT_TIMESTAMP FROM items WHERE part_number IN ('CAM-001','CAM-002') AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Getting started');
--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'SDK/API manual','See3CAM_CU31 Extension Unit SDK API Manual','', 'https://www.e-consystems.com/usb-cameras/sony-isx031-120db-hdr-camera.asp#documents','text/html',0,'Official e-con Systems extension-unit programming reference.',CURRENT_TIMESTAMP FROM items WHERE part_number IN ('CAM-001','CAM-002') AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='SDK/API manual');
--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Windows manuals','See3CAM_CU31 e-CAMView User and Installation Manuals','', 'https://www.e-consystems.com/usb-cameras/sony-isx031-120db-hdr-camera.asp#documents','text/html',0,'Official e-CAMView streaming application user and installation manuals.',CURRENT_TIMESTAMP FROM items WHERE part_number IN ('CAM-001','CAM-002') AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Windows manuals');
--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Linux manuals','See3CAM_CU31 QtCAM User and Installation Manuals','', 'https://www.e-consystems.com/usb-cameras/sony-isx031-120db-hdr-camera.asp#documents','text/html',0,'Official QtCAM streaming application user and installation manuals.',CURRENT_TIMESTAMP FROM items WHERE part_number IN ('CAM-001','CAM-002') AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Linux manuals');
--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Declaration of conformity','See3CAM_CU31 Declaration of Conformity','', 'https://www.e-consystems.com/usb-cameras/sony-isx031-120db-hdr-camera.asp#documents','text/html',0,'Official declaration covering FCC Class B, immunity, environmental, and RoHS standards.',CURRENT_TIMESTAMP FROM items WHERE part_number IN ('CAM-001','CAM-002') AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Declaration of conformity');
--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Reliability report','See3CAM_CU31_CHLCC_H03R1 Reliability Test Report','', 'https://www.e-consystems.com/usb-cameras/sony-isx031-120db-hdr-camera.asp#documents','text/html',0,'Official reliability report for the wide-angle camera without enclosure (top camera).',CURRENT_TIMESTAMP FROM items WHERE part_number='CAM-001' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Reliability report');
--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Reliability report','See3CAM_CU31_CXLCC_BX_H03R1 Reliability Test Report','', 'https://www.e-consystems.com/usb-cameras/sony-isx031-120db-hdr-camera.asp#documents','text/html',0,'Official reliability report for the wide-angle camera with enclosure (side cameras).',CURRENT_TIMESTAMP FROM items WHERE part_number='CAM-002' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Reliability report');
