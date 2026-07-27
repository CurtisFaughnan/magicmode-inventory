ALTER TABLE `items` ADD COLUMN `category` text NOT NULL DEFAULT 'Other';
--> statement-breakpoint
UPDATE `items` SET `category` = CASE
  WHEN LOWER(`name`) LIKE '%battery%' THEN 'Battery'
  WHEN LOWER(`name`) LIKE '%screw%' OR LOWER(`name`) LIKE '%nut%' OR LOWER(`name`) LIKE '%clip%' THEN 'Screws & Hardware'
  WHEN LOWER(`name`) LIKE '%camera%' OR LOWER(`description`) LIKE '%camera%' OR LOWER(`name`) LIKE '%lens%' THEN 'Camera'
  WHEN LOWER(`name`) LIKE '%cable%' OR LOWER(`name`) LIKE '%connector%' OR LOWER(`name`) LIKE '%usb%' THEN 'Cord & Cable'
  WHEN LOWER(`description`) LIKE '%3d print%' OR LOWER(`name`) LIKE '%housing%' OR LOWER(`name`) LIKE '%boom%' THEN '3D Print'
  WHEN LOWER(`name`) LIKE '%display%' OR LOWER(`name`) LIKE '%screen%' THEN 'Display'
  WHEN LOWER(`name`) LIKE '%pcb%' OR LOWER(`name`) LIKE '%jetson%' OR LOWER(`name`) LIKE '%r-net%' THEN 'Electronics'
  ELSE 'Other'
END;
