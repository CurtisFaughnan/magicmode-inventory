UPDATE items
SET name='Commonlands CLA020-PC M12 Lens Holder',
    description='Black polycarbonate M12x0.5 S-mount lens holder with 20 mm mounting-hole spacing, 20 x 20 mm footprint, 10 mm profile height, and M1.6 screw compatibility',
    category='Camera',
    unit_cost=4.50,
    supplier='Commonlands Optics',
    notes='Official Commonlands part CLA020-PC. Lens is not included. Compatible with standard M12x0.5 lenses and many e-con Systems, Arducam, and similar embedded camera boards. Current per-chair quantity remains editable in Chair Requirements.'
WHERE part_number='CLA020-PC';

--> statement-breakpoint
INSERT INTO purchase_links(item_id,url,updated_at)
SELECT id,'https://commonlands.com/products/m12-lens-mount-20mm-spacing',CURRENT_TIMESTAMP
FROM items WHERE part_number='CLA020-PC'
ON CONFLICT(item_id) DO UPDATE SET url=excluded.url,updated_at=excluded.updated_at;

--> statement-breakpoint
INSERT INTO price_history(item_id,old_price,new_price,reason,changed_by,created_at)
SELECT id,unit_cost,4.50,'Official Commonlands listed price verified August 2026','System',CURRENT_TIMESTAMP
FROM items WHERE part_number='CLA020-PC' AND NOT EXISTS(SELECT 1 FROM price_history p WHERE p.item_id=items.id AND p.new_price=4.50 AND p.reason='Official Commonlands listed price verified August 2026');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Product specifications','Commonlands CLA020-PC Product Specifications','', 'https://commonlands.com/products/m12-lens-mount-20mm-spacing','text/html',0,'Official product page with current price, availability, M12x0.5 thread, 20 mm spacing, 20 x 20 mm footprint, 10 mm height, black polycarbonate construction, M1.6 screw compatibility, and ordering information.',CURRENT_TIMESTAMP FROM items WHERE part_number='CLA020-PC' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Product specifications');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'STEP and mechanical drawing','Commonlands CLA020-PC STEP Model and Mechanical Drawing','', 'https://docsend.com/view/s/6sjffr22suunepji','text/html',0,'Official Commonlands engineering download page for the CLA020-PC STEP model and mechanical drawings. DocSend may require opening the page interactively before downloading.',CURRENT_TIMESTAMP FROM items WHERE part_number='CLA020-PC' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='STEP and mechanical drawing');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'ISO 9001 certificate','Commonlands ISO 9001 Certificate','', 'https://docsend.com/view/xcspidx48npzihkd','text/html',0,'Official Commonlands quality-management certification link published in the manufacturer website footer. DocSend may require interactive access.',CURRENT_TIMESTAMP FROM items WHERE part_number='CLA020-PC' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='ISO 9001 certificate');
