-- Replace unreliable legacy XK-12 manufacturer-host URLs with working document copies.
DELETE FROM data_sheets WHERE item_id=(SELECT id FROM items WHERE part_number='XK-1202-UHS12-R') AND storage_key='';
--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Data sheet','PI Engineering XK-12 USB Switch Interface Data Sheet.pdf','', 'https://www.fullcompass.com/common/files/20192-PIEngineeringXKeysUSBSwitchInterfaceDataSheet.pdf','application/pdf',0,'PI Engineering manufacturer data sheet for XK-1202-UHS12-R; working document copy hosted by Full Compass.',CURRENT_TIMESTAMP FROM items WHERE part_number='XK-1202-UHS12-R';
--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Product manual and compliance','PI Engineering XK-12 USB Switch Interface Manual.pdf','', 'https://www.fullcompass.com/common/files/20193-PIEngineeringXKeysUSBSwitchInterfaceManual.pdf','application/pdf',0,'PI Engineering product manual for XK-1202-UHS12-R, including FCC and CE declarations.',CURRENT_TIMESTAMP FROM items WHERE part_number='XK-1202-UHS12-R';

-- McMaster occasionally retires direct catalog-number destinations; use its live filtered specification page.
--> statement-breakpoint
UPDATE data_sheets
SET external_url='https://www.mcmaster.com/products/locknuts/nut-type~nylon-insert/thread-size~m4-1/',
    file_name='McMaster-Carr M4 Nylon-Insert Locknut Specifications',
    notes='Live McMaster-Carr catalog specifications filtered to M4 x 0.7 mm nylon-insert locknuts.'
WHERE item_id=(SELECT id FROM items WHERE part_number='9031A112') AND storage_key='';
