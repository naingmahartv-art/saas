CREATE TABLE `a_poo` (
	`id` text PRIMARY KEY NOT NULL,
	`org_id` text NOT NULL,
	`num` text NOT NULL,
	`created_at` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `agents` (
	`id` text PRIMARY KEY NOT NULL,
	`org_id` text NOT NULL,
	`agent_name` text NOT NULL,
	`address` text,
	`phone` text,
	`commission` real DEFAULT 0 NOT NULL,
	`rate` real DEFAULT 0 NOT NULL,
	`created_at` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `balance` (
	`id` text PRIMARY KEY NOT NULL,
	`org_id` text NOT NULL,
	`agent_name` text NOT NULL,
	`amount` real DEFAULT 0 NOT NULL,
	`on_date` text NOT NULL,
	`created_at` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `brade` (
	`id` text PRIMARY KEY NOT NULL,
	`org_id` text NOT NULL,
	`brade_code` text NOT NULL,
	`created_at` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `hot_numbers` (
	`id` text PRIMARY KEY NOT NULL,
	`org_id` text NOT NULL,
	`on_count` integer NOT NULL,
	`num` text NOT NULL,
	`created_at` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `key_config` (
	`id` text PRIMARY KEY NOT NULL,
	`org_id` text NOT NULL,
	`key_value` text NOT NULL,
	`updated_at` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `lg` (
	`id` text PRIMARY KEY NOT NULL,
	`org_id` text NOT NULL,
	`sr_no` integer NOT NULL,
	`on_count` integer NOT NULL,
	`ampm` text NOT NULL,
	`on_date` text NOT NULL,
	`machine_id` integer DEFAULT 1 NOT NULL,
	`agent_name` text NOT NULL,
	`num1` text,
	`amount` real DEFAULT 0 NOT NULL,
	`created_at` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `lg_detail` (
	`id` text PRIMARY KEY NOT NULL,
	`org_id` text NOT NULL,
	`sr_no` integer NOT NULL,
	`on_count` integer NOT NULL,
	`ampm` text NOT NULL,
	`agent_name` text NOT NULL,
	`num1` text NOT NULL,
	`value` real DEFAULT 0 NOT NULL,
	`post` integer DEFAULT 0 NOT NULL,
	`created_at` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `lg_sale` (
	`id` text PRIMARY KEY NOT NULL,
	`org_id` text NOT NULL,
	`sr_no` integer NOT NULL,
	`on_count` integer NOT NULL,
	`ampm` text NOT NULL,
	`on_date` text NOT NULL,
	`agent_id` text,
	`created_at` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `lg_sale_detail` (
	`id` text PRIMARY KEY NOT NULL,
	`org_id` text NOT NULL,
	`sr_no` integer NOT NULL,
	`on_count` integer NOT NULL,
	`ampm` text NOT NULL,
	`num` text NOT NULL,
	`value` real DEFAULT 0 NOT NULL,
	`created_at` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `limits` (
	`id` text PRIMARY KEY NOT NULL,
	`org_id` text NOT NULL,
	`limit_value` real DEFAULT 0 NOT NULL,
	`updated_at` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `lottery_sessions` (
	`id` text PRIMARY KEY NOT NULL,
	`org_id` text NOT NULL,
	`on_count` integer NOT NULL,
	`ampm` text NOT NULL,
	`on_date` text NOT NULL,
	`machine_id` integer DEFAULT 1 NOT NULL,
	`is_active` integer DEFAULT 1 NOT NULL,
	`created_at` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `lucky_no` (
	`id` text PRIMARY KEY NOT NULL,
	`org_id` text NOT NULL,
	`on_date` text NOT NULL,
	`ampm` text NOT NULL,
	`l_no` text NOT NULL,
	`created_at` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `machine_config` (
	`id` text PRIMARY KEY NOT NULL,
	`org_id` text NOT NULL,
	`machine_id` integer NOT NULL,
	`min_serial` integer DEFAULT 1 NOT NULL,
	`max_serial` integer DEFAULT 999 NOT NULL,
	`label` text,
	`created_at` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `net_khat` (
	`id` text PRIMARY KEY NOT NULL,
	`org_id` text NOT NULL,
	`num` text NOT NULL,
	`created_at` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `net_khat_thai` (
	`id` text PRIMARY KEY NOT NULL,
	`org_id` text NOT NULL,
	`num` text NOT NULL,
	`created_at` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `not_buy_numbers` (
	`id` text PRIMARY KEY NOT NULL,
	`org_id` text NOT NULL,
	`on_count` integer NOT NULL,
	`num` text NOT NULL,
	`created_at` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `organizations` (
	`id` text PRIMARY KEY NOT NULL,
	`name` text NOT NULL,
	`slug` text NOT NULL,
	`plan` text NOT NULL,
	`status` text DEFAULT 'active' NOT NULL,
	`created_by` text,
	`created_at` integer NOT NULL
);
--> statement-breakpoint
CREATE UNIQUE INDEX `organizations_slug_unique` ON `organizations` (`slug`);--> statement-breakpoint
CREATE TABLE `part` (
	`id` text PRIMARY KEY NOT NULL,
	`org_id` text NOT NULL,
	`part_digit` text NOT NULL,
	`created_at` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `power` (
	`id` text PRIMARY KEY NOT NULL,
	`org_id` text NOT NULL,
	`num` text NOT NULL,
	`created_at` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `rates` (
	`id` text PRIMARY KEY NOT NULL,
	`org_id` text NOT NULL,
	`num1_rate` real DEFAULT 0 NOT NULL,
	`num2_rate` real DEFAULT 0 NOT NULL,
	`updated_at` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `receive` (
	`id` text PRIMARY KEY NOT NULL,
	`org_id` text NOT NULL,
	`agent_name` text NOT NULL,
	`amount` real DEFAULT 0 NOT NULL,
	`on_date` text NOT NULL,
	`on_count` integer,
	`ampm` text,
	`created_at` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `serie_m` (
	`id` text PRIMARY KEY NOT NULL,
	`org_id` text NOT NULL,
	`num` text NOT NULL,
	`pp` integer DEFAULT 0 NOT NULL,
	`created_at` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `serie_s` (
	`id` text PRIMARY KEY NOT NULL,
	`org_id` text NOT NULL,
	`num` text NOT NULL,
	`pp` integer DEFAULT 0 NOT NULL,
	`created_at` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `sm` (
	`id` text PRIMARY KEY NOT NULL,
	`org_id` text NOT NULL,
	`num` text NOT NULL,
	`flag` text NOT NULL,
	`created_at` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `small` (
	`id` text PRIMARY KEY NOT NULL,
	`org_id` text NOT NULL,
	`num` text NOT NULL,
	`flag` text NOT NULL,
	`created_at` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `subscriptions` (
	`id` text PRIMARY KEY NOT NULL,
	`org_id` text NOT NULL,
	`plan` text NOT NULL,
	`amount` integer NOT NULL,
	`status` text DEFAULT 'active' NOT NULL,
	`created_at` integer NOT NULL,
	FOREIGN KEY (`org_id`) REFERENCES `organizations`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `users` (
	`id` text PRIMARY KEY NOT NULL,
	`name` text NOT NULL,
	`email` text NOT NULL,
	`password_hash` text NOT NULL,
	`role` text DEFAULT 'user' NOT NULL,
	`org_id` text,
	`created_at` integer NOT NULL,
	FOREIGN KEY (`org_id`) REFERENCES `organizations`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE UNIQUE INDEX `users_email_unique` ON `users` (`email`);