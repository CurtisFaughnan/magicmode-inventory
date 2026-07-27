CREATE TABLE IF NOT EXISTS `items` (
  `id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
  `part_number` text NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `qty_needed` real NOT NULL,
  `qty_on_hand` real NOT NULL,
  `unit_cost` real,
  `unit` text NOT NULL,
  `supplier` text NOT NULL,
  `lead_time` text NOT NULL,
  `bom_level` integer,
  `notes` text NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
  `item_id` integer NOT NULL,
  `kind` text NOT NULL,
  `quantity` real NOT NULL,
  `reference` text NOT NULL,
  `note` text NOT NULL,
  `created_at` text NOT NULL
);
--> statement-breakpoint
CREATE INDEX IF NOT EXISTS `transactions_item_idx` ON `transactions` (`item_id`);
