INSERT INTO price_history(item_id,old_price,new_price,reason,changed_by,created_at)
SELECT id,unit_cost,3.12,'Mouser single-unit listed price verified August 2026','System',CURRENT_TIMESTAMP
FROM items WHERE (part_number='SC-2AMK006F' OR lower(trim(name))='display power cable') AND NOT EXISTS(SELECT 1 FROM price_history p WHERE p.item_id=items.id AND p.new_price=3.12 AND p.reason='Mouser single-unit listed price verified August 2026');

--> statement-breakpoint
UPDATE items
SET part_number='SC-2AMK006F',
    name='Stewart Connector USB-A to Micro-B Display Power Cable',
    description='Shielded black USB 2.0 cable assembly, straight USB Type-A male to straight Micro-B male, 6 ft (1.83 m), data transfer and charging, rated to 480 Mbps',
    category='Cord & Cable',
    unit_cost=3.12,
    supplier='Stewart Connector / Mouser',
    lead_time='Manufacturer standard lead time about 12 weeks',
    notes='Manufacturer part SC-2AMK006F. One per chair under the current editable Chair Requirements BOM. Published conductor gauges vary by distributor between 24/28 AWG and 26/28 AWG; consult the current manufacturer drawing for procurement. Mouser single-unit price recorded August 2026 and may change.'
WHERE part_number='SC-2AMK006F' OR lower(trim(name))='display power cable';

--> statement-breakpoint
INSERT INTO purchase_links(item_id,url,updated_at)
SELECT id,'https://www.mouser.com/ProductDetail/Stewart-Connector-Bel/SC-2AMK006F',CURRENT_TIMESTAMP
FROM items WHERE part_number='SC-2AMK006F'
ON CONFLICT(item_id) DO UPDATE SET url=excluded.url,updated_at=excluded.updated_at;

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Manufacturer datasheet','Stewart Connector USB Cable Assemblies Datasheet','', 'https://www.mouser.com/datasheet/2/643/ds_stw_usb_cable_assemblies-1842787.pdf','application/pdf',0,'Manufacturer datasheet identifying SC-2AMK006F as USB 2.0, USB-A male to Micro-B male, 6 ft, shielded, and black, with the Stewart cable-family part-number configurator.',CURRENT_TIMESTAMP FROM items WHERE part_number='SC-2AMK006F' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Manufacturer datasheet');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Current product specifications','Mouser SC-2AMK006F Product Specifications','', 'https://www.mouser.com/ProductDetail/Stewart-Connector-Bel/SC-2AMK006F','text/html',0,'Authorized distributor page with current availability, pricing, 6 ft length, USB 2.0 rating, 480 Mbps data rate, PVC jacket, black color, connector details, export classification, and datasheet access.',CURRENT_TIMESTAMP FROM items WHERE part_number='SC-2AMK006F' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Current product specifications');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'CE declaration','Stewart Connector USB Cable Assemblies CE Declaration of Conformity','', 'https://www.mouser.com/catalog/additional/Stewart_Models_USB_2_0_3_0_CE_DoC_EV_10_14_2022.pdf','application/pdf',0,'Manufacturer CE Declaration of Conformity explicitly listing model SC-2AMK006F.',CURRENT_TIMESTAMP FROM items WHERE part_number='SC-2AMK006F' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='CE declaration');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Technical drawing and compliance','element14 SC-2AMK006F Technical Documents','', 'https://sg.element14.com/stewart-connector/sc-2amk006f/usb-cable-assembly-95ac2935/dp/3014614','text/html',0,'Distributor document library providing the technical drawing, technical datasheet, RoHS status, phthalates compliance, product compliance certificate, origin, and export classifications.',CURRENT_TIMESTAMP FROM items WHERE part_number='SC-2AMK006F' AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Technical drawing and compliance');
