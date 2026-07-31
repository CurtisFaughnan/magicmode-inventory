CREATE TABLE IF NOT EXISTS `app_users` (
  `id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
  `name` text NOT NULL UNIQUE,
  `active` integer NOT NULL DEFAULT 1,
  `created_at` text NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `app_settings` (
  `key` text PRIMARY KEY NOT NULL,
  `value` text NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `app_sessions` (
  `token_hash` text PRIMARY KEY NOT NULL,
  `user_id` integer NOT NULL,
  `expires_at` text NOT NULL,
  `created_at` text NOT NULL
);
--> statement-breakpoint
CREATE INDEX IF NOT EXISTS `app_sessions_user_idx` ON `app_sessions` (`user_id`);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `price_history` (
  `id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
  `item_id` integer NOT NULL,
  `old_price` real,
  `new_price` real,
  `reason` text NOT NULL,
  `changed_by` text NOT NULL,
  `created_at` text NOT NULL
);
--> statement-breakpoint
CREATE INDEX IF NOT EXISTS `price_history_item_idx` ON `price_history` (`item_id`, `created_at`);
--> statement-breakpoint
INSERT OR IGNORE INTO `app_users` (`name`,`active`,`created_at`) VALUES ('Steven',1,CURRENT_TIMESTAMP),('Alexis',1,CURRENT_TIMESTAMP),('Curtis',1,CURRENT_TIMESTAMP),('Vishnu',1,CURRENT_TIMESTAMP);
--> statement-breakpoint
INSERT OR IGNORE INTO `app_settings` (`key`,`value`) VALUES ('password_salt','/pL2etlIJ6yO3yryPEGx2w=='),('password_hash','6fvIg0YcYu+VRD7iFbzCFWlbwvvjkNG/csbAh4Gu+iY=');
--> statement-breakpoint
INSERT INTO `price_history` (`item_id`,`old_price`,`new_price`,`reason`,`changed_by`,`created_at`)
SELECT `id`,NULL,`unit_cost`,'Initial recorded price','System',CURRENT_TIMESTAMP FROM `items` WHERE `unit_cost` IS NOT NULL;
