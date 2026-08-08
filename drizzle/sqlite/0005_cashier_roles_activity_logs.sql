CREATE TABLE `activity_logs` (
	`id` text PRIMARY KEY NOT NULL,
	`org_id` text NOT NULL,
	`user_id` text NOT NULL,
	`user_name` text NOT NULL,
	`user_role` text NOT NULL,
	`action` text NOT NULL,
	`entity` text NOT NULL,
	`entity_id` text,
	`details` text,
	`ip_address` text,
	`created_at` integer NOT NULL
);
--> statement-breakpoint
PRAGMA foreign_keys=OFF;--> statement-breakpoint
CREATE TABLE `__new_users` (
	`id` text PRIMARY KEY NOT NULL,
	`name` text NOT NULL,
	`email` text NOT NULL,
	`password_hash` text NOT NULL,
	`role` text DEFAULT 'cashier' NOT NULL,
	`status` text DEFAULT 'active' NOT NULL,
	`org_id` text,
	`created_at` integer NOT NULL,
	`updated_at` integer DEFAULT (cast(unixepoch() as integer) * 1000) NOT NULL,
	FOREIGN KEY (`org_id`) REFERENCES `organizations`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
INSERT INTO `__new_users`("id", "name", "email", "password_hash", "role", "status", "org_id", "created_at", "updated_at") SELECT "id", "name", "email", "password_hash", "role", 'active', "org_id", "created_at", "updated_at" FROM `users`;--> statement-breakpoint
DROP TABLE `users`;--> statement-breakpoint
ALTER TABLE `__new_users` RENAME TO `users`;--> statement-breakpoint
PRAGMA foreign_keys=ON;--> statement-breakpoint
CREATE UNIQUE INDEX `users_email_unique` ON `users` (`email`);