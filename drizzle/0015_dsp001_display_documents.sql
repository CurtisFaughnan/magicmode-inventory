-- Confirmed physical assembly: C022A capacitive-touch display plus SP002A HDMI board.
UPDATE items
SET description='4.0-inch 480x800 IPS capacitive-touch TFT assembly, KD040WVFPA027-C022A display with SP002A HDMI interface board; ST7701S display controller and GT911 touch controller',
    supplier='Shenzhen Startek Electronic Technology Co., Ltd.'
WHERE part_number='DSP-001';

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Product specification','KD040WVFPA027-SP002A-HDMI Official Product Specifications','',
       'https://tft-tft.com/product/1280-KD040WVFPA027-SP002A-HDMI-4.0%E5%AF%B8IPS%E5%85%A8%E8%A7%86%E8%A7%92HDMI%E6%8E%A5%E5%8F%A3480x800-TFT-LCD%E6%B6%B2%E6%99%B6%E6%98%BE%E7%A4%BA%E5%B1%8F.html',
       'text/html',0,
       'Official manufacturer page for the 4.0-inch 480x800 IPS display with SP002A HDMI interface. The installed assembly additionally uses the C022A capacitive-touch display.',
       CURRENT_TIMESTAMP
FROM items
WHERE part_number='DSP-001'
  AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Product specification');

--> statement-breakpoint
INSERT INTO data_sheets(item_id,version,file_name,storage_key,external_url,content_type,size_bytes,notes,created_at)
SELECT id,'Manufacturer catalog','Startek TFT LCD Product Catalogue 2023.pdf','',
       'https://starmakes.fi/wp-content/uploads/2023/12/startek-product-catalogue-2023.pdf',
       'application/pdf',0,
       'Manufacturer product catalog; page 4 identifies KD040WVFPA027-C022A as a 4.0-inch 480x800 IPS capacitive-touch display using ST7701S and GT911, with RGB and IIC interfaces.',
       CURRENT_TIMESTAMP
FROM items
WHERE part_number='DSP-001'
  AND NOT EXISTS(SELECT 1 FROM data_sheets d WHERE d.item_id=items.id AND d.version='Manufacturer catalog');
