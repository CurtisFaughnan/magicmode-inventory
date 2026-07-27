CREATE TABLE IF NOT EXISTS `print_files` (
  `id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
  `item_id` integer NOT NULL,
  `version` text NOT NULL,
  `file_name` text NOT NULL,
  `storage_key` text NOT NULL UNIQUE,
  `content_type` text NOT NULL,
  `size_bytes` integer NOT NULL,
  `notes` text NOT NULL,
  `created_at` text NOT NULL
);
--> statement-breakpoint
CREATE INDEX IF NOT EXISTS `print_files_item_idx` ON `print_files` (`item_id`, `created_at`);
