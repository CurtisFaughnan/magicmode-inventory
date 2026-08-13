-- Verified documentation for the first eight confidently identified components.

-- NVIDIA Jetson AGX Orin 64GB production module (P3701-0005).
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Data sheet','Jetson AGX Orin Series Data Sheet','', 'https://developer.nvidia.com/downloads/embedded/dlc/jetson-agx-orin-data-sheet_ds','text/html',0,'Official NVIDIA module data sheet; includes P3701-0005. NVIDIA sign-in may be required.',CURRENT_TIMESTAMP FROM items WHERE part_number='JET-001' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.external_url='https://developer.nvidia.com/downloads/embedded/dlc/jetson-agx-orin-data-sheet_ds');
--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Technical brief','Jetson AGX Orin Series Technical Brief','', 'https://www.nvidia.com/content/dam/en-zz/Solutions/gtcf21/jetson-orin/nvidia-jetson-agx-orin-technical-brief.pdf','application/pdf',0,'Official NVIDIA architecture and performance brief for the 64GB and 32GB modules.',CURRENT_TIMESTAMP FROM items WHERE part_number='JET-001' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.external_url='https://www.nvidia.com/content/dam/en-zz/Solutions/gtcf21/jetson-orin/nvidia-jetson-agx-orin-technical-brief.pdf');
--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Design guide','Jetson AGX Orin Series Design Guide','', 'https://developer.nvidia.com/embedded/downloads','text/html',0,'Official NVIDIA download center entry for the current module design guide. Search Jetson AGX Orin Series Design Guide after signing in.',CURRENT_TIMESTAMP FROM items WHERE part_number='JET-001' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Design guide');
--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Thermal guide','Jetson AGX Orin Series Thermal Design Guide','', 'https://developer.nvidia.com/downloads/jetson-agx-orin-series-thermal-design-guide','text/html',0,'Official NVIDIA thermal and mechanical guidance. NVIDIA sign-in may be required.',CURRENT_TIMESTAMP FROM items WHERE part_number='JET-001' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.external_url='https://developer.nvidia.com/downloads/jetson-agx-orin-series-thermal-design-guide');
--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Regulatory','Jetson AGX Orin Series Regulatory and Compliance Documents','', 'https://developer.nvidia.com/embedded/downloads','text/html',0,'Official NVIDIA compliance package. Search this exact title after signing in.',CURRENT_TIMESTAMP FROM items WHERE part_number='JET-001' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Regulatory');
--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Mechanical CAD','Jetson AGX Orin Module 3D STEP Model P3701','', 'https://developer.nvidia.com/downloads/jetson-agx-orin-module-3d-step-modelzip','text/html',0,'Official NVIDIA mechanical model for the P3701 module family. NVIDIA sign-in may be required.',CURRENT_TIMESTAMP FROM items WHERE part_number='JET-001' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.external_url='https://developer.nvidia.com/downloads/jetson-agx-orin-module-3d-step-modelzip');

-- PI Engineering XK-12 USB Switch Interface.
--> statement-breakpoint
UPDATE data_sheets SET external_url='https://xkeys.com/media/wysiwyg/smartwave/porto/category/manuals/USB%2012%20Switch%20Interface.1206UK.pdf', file_name='XK-12 USB Switch Interface Product Manual.pdf', version='Product manual', notes='Official PI Engineering product manual for XK-1202-UHS12-R' WHERE item_id=(SELECT id FROM items WHERE part_number='XK-1202-UHS12-R') AND storage_key='';
--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Product specifications','XK-12 USB Switch Interface Product Details','', 'https://www.ymouse.com/xkeys/xkswi.html','text/html',0,'Official PI Engineering product page with features, specifications, drawings, software, and accessories.',CURRENT_TIMESTAMP FROM items WHERE part_number='XK-1202-UHS12-R' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.external_url='https://www.ymouse.com/xkeys/xkswi.html');

-- McMaster-Carr catalog pages are the authoritative specification records for these fasteners.
--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Technical specifications','McMaster-Carr 96887A121 Technical Specifications','', 'https://www.mcmaster.com/96887A121','text/html',0,'Manufacturer catalog specifications, material, dimensions, and available CAD.',CURRENT_TIMESTAMP FROM items WHERE part_number='96887A121' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.external_url='https://www.mcmaster.com/96887A121');
--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Technical specifications','McMaster-Carr 91290A320 Technical Specifications','', 'https://www.mcmaster.com/91290A320','text/html',0,'Manufacturer catalog specifications, material, dimensions, and available CAD.',CURRENT_TIMESTAMP FROM items WHERE part_number='91290A320' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.external_url='https://www.mcmaster.com/91290A320');
--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Technical specifications','McMaster-Carr 9031A112 Technical Specifications','', 'https://www.mcmaster.com/9031A112','text/html',0,'Manufacturer catalog specifications, material, dimensions, and available CAD.',CURRENT_TIMESTAMP FROM items WHERE part_number='9031A112' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.external_url='https://www.mcmaster.com/9031A112');
--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Technical specifications','McMaster-Carr 99461A941 Technical Specifications','', 'https://www.mcmaster.com/99461A941','text/html',0,'Manufacturer catalog specifications, material, dimensions, and available CAD.',CURRENT_TIMESTAMP FROM items WHERE part_number='99461A941' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.external_url='https://www.mcmaster.com/99461A941');
--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Technical specifications','McMaster-Carr 91290A012 Technical Specifications','', 'https://www.mcmaster.com/91290A012','text/html',0,'Manufacturer catalog specifications, material, dimensions, and available CAD.',CURRENT_TIMESTAMP FROM items WHERE part_number='91290A012' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.external_url='https://www.mcmaster.com/91290A012');
--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Technical specifications','McMaster-Carr 95893A179 Technical Specifications','', 'https://www.mcmaster.com/95893A179','text/html',0,'Manufacturer catalog specifications, material, dimensions, and available CAD.',CURRENT_TIMESTAMP FROM items WHERE part_number='95893A179' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.external_url='https://www.mcmaster.com/95893A179');
