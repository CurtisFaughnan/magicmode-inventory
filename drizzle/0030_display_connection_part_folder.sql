UPDATE items
SET part_number='CAB-DISPLAY-HDMI-HDMI-001',
    name='SPACE SHUTTLE-Z HDMI-to-HDMI Display Cable',
    description='Approximately 6 ft high-speed HDMI male-to-male display cable; jacket marked 9U AWM E101344 Style 20276 VW-1 80 C 30 V SPACE SHUTTLE-Z and CSA LL80671 AWM II A/B 80 C 30 V FT1',
    category='Cord & Cable',
    item_group='Display Connections',
    unit_cost=NULL,
    supplier='SPACE SHUTTLE-Z / manufacturer not verified',
    lead_time='',
    notes='Current display connection: one per chair. Curtis confirmed the physical cable matches the referenced 6 ft HDMI cable and that the chair now uses HDMI-to-HDMI. Jacket markings identify cable safety construction but do not establish an HDMI performance certification, exact assembly model, manufacturer datasheet, or current purchase source.',
    is_optional=0
WHERE part_number='CAB-DISPLAY-HDMI-HDMI-001' OR lower(trim(name))='display connector';

--> statement-breakpoint
INSERT INTO items(part_number,name,description,category,item_group,qty_needed,qty_on_hand,unit_cost,unit,supplier,lead_time,bom_level,notes,is_optional)
SELECT 'CAB-DISPLAY-DP-HDMI-OLD','Previous DisplayPort-to-HDMI Display Cable','Previous-generation display cable with DisplayPort source connector and HDMI display connector; exact BENFEI model, length, and certifications remain to be identified','Cord & Cable','Display Connections',1,0,7.99,'pcs','BENFEI (previously recorded)','','2','Previous chair configuration retained as an alternative for history and possible reuse. Excluded from the current chair BOM. Do not use the HDMI-to-DisplayPort direction: this previous configuration was DisplayPort source to HDMI display. Add the exact model or original purchase link if recovered.',1
WHERE NOT EXISTS(SELECT 1 FROM items WHERE part_number='CAB-DISPLAY-DP-HDMI-OLD');

--> statement-breakpoint
INSERT INTO price_history(item_id,old_price,new_price,reason,changed_by,created_at)
SELECT id,NULL,7.99,'Price carried over from the previous Display Connector inventory record','System',CURRENT_TIMESTAMP
FROM items WHERE part_number='CAB-DISPLAY-DP-HDMI-OLD' AND NOT EXISTS(SELECT 1 FROM price_history p WHERE p.item_id=items.id AND p.new_price=7.99 AND p.reason='Price carried over from the previous Display Connector inventory record');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Physical identification reference','Matching SPACE SHUTTLE-Z 6 ft HDMI Cable Reference','', 'https://www.craigslist.org/view/d/north-vancouver-hdmi-cables/pStnQgr1WXkWhLKMr8vhrf','text/html',0,'Third-party listing for an apparently identical 6 ft HDMI cable carrying the same E101344, AWM Style 20276, 80 C, 30 V, VW-1, and SPACE SHUTTLE-Z markings. Curtis confirmed the cable looks identical. This is an identification reference, not a manufacturer datasheet or purchase recommendation.',CURRENT_TIMESTAMP FROM items WHERE part_number='CAB-DISPLAY-HDMI-HDMI-001' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Physical identification reference');
