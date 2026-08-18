UPDATE items
SET name='R-Net JSM Bulkhead Retaining Clip',
    description='Curtiss-Wright / PG Drives Technology retaining U-clip for securing the R-Net JSM bulkhead connector, confirmed part P77978',
    category='Screws & Hardware',
    supplier='Curtiss-Wright / PG Drives Technology',
    notes='One per chair under the current editable Chair Requirements BOM. Part number P77978 was confirmed by Curtis. The official R-Net system manual is attached as the applicable installation and safety reference. A public clip-specific drawing, material specification, regulatory declaration, and official purchase page were not found.'
WHERE part_number='P77978';

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'R-Net technical manual','Curtiss-Wright R-Net Technical Manual SK77981-14','', 'https://industrial.curtisswright.com/sites/default/files/sunrise/pgdt_rnet_manual_SK77981-14.pdf','application/pdf',0,'Official Curtiss-Wright / PG Drives Technology R-Net installation, wiring, connector, programming, diagnostics, EMC, environmental, and system-safety reference. It applies to the R-Net system but is not a standalone P77978 retaining-clip drawing.',CURRENT_TIMESTAMP FROM items WHERE part_number='P77978' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='R-Net technical manual');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Manufacturer manual library','PG Drives Technology Official Manual Library','', 'https://support.pgdt.com/Home/Manuals','text/html',0,'Official PG Drives Technology support library for current R-Net manuals and technical references. No public standalone P77978 retaining-clip drawing was located.',CURRENT_TIMESTAMP FROM items WHERE part_number='P77978' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Manufacturer manual library');
