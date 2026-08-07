PRAGMA foreign_keys=OFF;--> statement-breakpoint
CREATE TABLE `__new_key_config` (
	`id` text PRIMARY KEY NOT NULL,
	`org_id` text NOT NULL,
	`key_value` text NOT NULL,
	`updated_at` integer DEFAULT (cast(unixepoch() as integer) * 1000) NOT NULL
);
--> statement-breakpoint
INSERT INTO `__new_key_config`("id", "org_id", "key_value", "updated_at") SELECT "id", "org_id", "key_value", "updated_at" FROM `key_config`;--> statement-breakpoint
DROP TABLE `key_config`;--> statement-breakpoint
ALTER TABLE `__new_key_config` RENAME TO `key_config`;--> statement-breakpoint
PRAGMA foreign_keys=ON;--> statement-breakpoint
CREATE TABLE `__new_limits` (
	`id` text PRIMARY KEY NOT NULL,
	`org_id` text NOT NULL,
	`limit_value` real DEFAULT 0 NOT NULL,
	`updated_at` integer DEFAULT (cast(unixepoch() as integer) * 1000) NOT NULL
);
--> statement-breakpoint
INSERT INTO `__new_limits`("id", "org_id", "limit_value", "updated_at") SELECT "id", "org_id", "limit_value", "updated_at" FROM `limits`;--> statement-breakpoint
DROP TABLE `limits`;--> statement-breakpoint
ALTER TABLE `__new_limits` RENAME TO `limits`;--> statement-breakpoint
CREATE TABLE `__new_rates` (
	`id` text PRIMARY KEY NOT NULL,
	`org_id` text NOT NULL,
	`num1_rate` real DEFAULT 0 NOT NULL,
	`num2_rate` real DEFAULT 0 NOT NULL,
	`updated_at` integer DEFAULT (cast(unixepoch() as integer) * 1000) NOT NULL
);
--> statement-breakpoint
INSERT INTO `__new_rates`("id", "org_id", "num1_rate", "num2_rate", "updated_at") SELECT "id", "org_id", "num1_rate", "num2_rate", "updated_at" FROM `rates`;--> statement-breakpoint
DROP TABLE `rates`;--> statement-breakpoint
ALTER TABLE `__new_rates` RENAME TO `rates`;--> statement-breakpoint
ALTER TABLE `a_poo` ADD `updated_at` integer DEFAULT (cast(unixepoch() as integer) * 1000) NOT NULL;--> statement-breakpoint
ALTER TABLE `agents` ADD `updated_at` integer DEFAULT (cast(unixepoch() as integer) * 1000) NOT NULL;--> statement-breakpoint
ALTER TABLE `balance` ADD `updated_at` integer DEFAULT (cast(unixepoch() as integer) * 1000) NOT NULL;--> statement-breakpoint
ALTER TABLE `brade` ADD `updated_at` integer DEFAULT (cast(unixepoch() as integer) * 1000) NOT NULL;--> statement-breakpoint
ALTER TABLE `hot_numbers` ADD `updated_at` integer DEFAULT (cast(unixepoch() as integer) * 1000) NOT NULL;--> statement-breakpoint
ALTER TABLE `lg` ADD `updated_at` integer DEFAULT (cast(unixepoch() as integer) * 1000) NOT NULL;--> statement-breakpoint
ALTER TABLE `lg_detail` ADD `updated_at` integer DEFAULT (cast(unixepoch() as integer) * 1000) NOT NULL;--> statement-breakpoint
ALTER TABLE `lg_sale` ADD `updated_at` integer DEFAULT (cast(unixepoch() as integer) * 1000) NOT NULL;--> statement-breakpoint
ALTER TABLE `lg_sale_detail` ADD `updated_at` integer DEFAULT (cast(unixepoch() as integer) * 1000) NOT NULL;--> statement-breakpoint
ALTER TABLE `lottery_sessions` ADD `updated_at` integer DEFAULT (cast(unixepoch() as integer) * 1000) NOT NULL;--> statement-breakpoint
ALTER TABLE `lucky_no` ADD `updated_at` integer DEFAULT (cast(unixepoch() as integer) * 1000) NOT NULL;--> statement-breakpoint
ALTER TABLE `machine_config` ADD `updated_at` integer DEFAULT (cast(unixepoch() as integer) * 1000) NOT NULL;--> statement-breakpoint
ALTER TABLE `net_khat` ADD `updated_at` integer DEFAULT (cast(unixepoch() as integer) * 1000) NOT NULL;--> statement-breakpoint
ALTER TABLE `net_khat_thai` ADD `updated_at` integer DEFAULT (cast(unixepoch() as integer) * 1000) NOT NULL;--> statement-breakpoint
ALTER TABLE `not_buy_numbers` ADD `updated_at` integer DEFAULT (cast(unixepoch() as integer) * 1000) NOT NULL;--> statement-breakpoint
ALTER TABLE `organizations` ADD `updated_at` integer DEFAULT (cast(unixepoch() as integer) * 1000) NOT NULL;--> statement-breakpoint
ALTER TABLE `part` ADD `updated_at` integer DEFAULT (cast(unixepoch() as integer) * 1000) NOT NULL;--> statement-breakpoint
ALTER TABLE `power` ADD `updated_at` integer DEFAULT (cast(unixepoch() as integer) * 1000) NOT NULL;--> statement-breakpoint
ALTER TABLE `receive` ADD `updated_at` integer DEFAULT (cast(unixepoch() as integer) * 1000) NOT NULL;--> statement-breakpoint
ALTER TABLE `serie_m` ADD `updated_at` integer DEFAULT (cast(unixepoch() as integer) * 1000) NOT NULL;--> statement-breakpoint
ALTER TABLE `serie_s` ADD `updated_at` integer DEFAULT (cast(unixepoch() as integer) * 1000) NOT NULL;--> statement-breakpoint
ALTER TABLE `sm` ADD `updated_at` integer DEFAULT (cast(unixepoch() as integer) * 1000) NOT NULL;--> statement-breakpoint
ALTER TABLE `small` ADD `updated_at` integer DEFAULT (cast(unixepoch() as integer) * 1000) NOT NULL;--> statement-breakpoint
ALTER TABLE `subscriptions` ADD `updated_at` integer DEFAULT (cast(unixepoch() as integer) * 1000) NOT NULL;--> statement-breakpoint
ALTER TABLE `users` ADD `updated_at` integer DEFAULT (cast(unixepoch() as integer) * 1000) NOT NULL;