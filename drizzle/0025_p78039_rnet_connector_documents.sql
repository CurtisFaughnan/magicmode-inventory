UPDATE items
SET name='R-Net Rebus Panel Mount Connector',
    description='Curtiss-Wright / PG Drives Technology R-Net Rebus panel-mount connector, confirmed part P78039',
    category='Electronics',
    supplier='Curtiss-Wright / PG Drives Technology',
    notes='One per chair under the current editable Chair Requirements BOM. Part number P78039 was confirmed by Curtis. The official R-Net system manual is attached; a standalone public P78039 mechanical drawing, product datasheet, certification declaration, and current official purchase page were not found.'
WHERE part_number='P78039';

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'R-Net technical manual','Curtiss-Wright R-Net Technical Manual SK77981-14','', 'https://industrial.curtisswright.com/sites/default/files/sunrise/pgdt_rnet_manual_SK77981-14.pdf','application/pdf',0,'Official Curtiss-Wright / PG Drives Technology R-Net installation, wiring, connector, programming, diagnostics, EMC, environmental, and system-safety reference. It applies to the R-Net system but is not a standalone P78039 product datasheet.',CURRENT_TIMESTAMP FROM items WHERE part_number='P78039' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='R-Net technical manual');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Manufacturer manual library','PG Drives Technology Official Manual Library','', 'https://support.pgdt.com/Home/Manuals','text/html',0,'Official PG Drives Technology support library for current R-Net manuals and technical references. Use this page to check for revised manuals; no public standalone P78039 drawing was located.',CURRENT_TIMESTAMP FROM items WHERE part_number='P78039' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Manufacturer manual library');
