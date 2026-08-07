CREATE TABLE `lg_voucher_token` (
	`id` text PRIMARY KEY NOT NULL,
	`org_id` text NOT NULL,
	`sr_no` integer NOT NULL,
	`on_count` integer NOT NULL,
	`ampm` text NOT NULL,
	`token_text` text NOT NULL,
	`created_at` integer NOT NULL,
	`updated_at` integer DEFAULT (cast(unixepoch() as integer) * 1000) NOT NULL
);
