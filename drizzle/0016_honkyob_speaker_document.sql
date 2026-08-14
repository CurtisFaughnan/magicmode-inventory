-- Confirmed by the physical label and matching product listing.
UPDATE items
SET description='HONKYOB 5002-speaker compact USB stereo speaker for notebook and PC; approximately 84 x 32 x 43 mm; 5 V USB input; physical label rates two 3 W speaker drivers',
    supplier='HONKYOB'
WHERE name='Speaker';

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Product specifications','HONKYOB 5002-speaker Product Specifications','',
       'https://www.walmart.ca/en/ip/HONKYOB-USB-Mini-Speaker-Computer-Speaker-Powered-Stereo-Multimedia-Speaker-for-Notebook-Laptop-PC-Black/24OTYCUU8AV4',
       'text/html',0,
       'Verified matching product listing for HONKYOB model 5002-speaker. It documents 5 V USB power, compact dimensions, USB 1.1/2.0 compatibility, 1.2 m cable, and plug-and-play operation. The listing states 0.5 W x 2 peak output while the installed unit label rates the speaker drivers at 3 W x 2.',
       CURRENT_TIMESTAMP
FROM items
WHERE name='Speaker'
  AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Product specifications');
