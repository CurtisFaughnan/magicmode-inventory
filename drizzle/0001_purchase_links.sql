CREATE TABLE IF NOT EXISTS `purchase_links` (
  `item_id` integer PRIMARY KEY NOT NULL,
  `url` text NOT NULL,
  `updated_at` text NOT NULL
);
