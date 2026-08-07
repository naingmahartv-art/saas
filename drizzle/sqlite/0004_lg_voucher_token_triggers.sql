CREATE TRIGGER trg_lg_voucher_token_outbox_ins AFTER INSERT ON lg_voucher_token BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('lg_voucher_token', NEW.id, 'insert', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_lg_voucher_token_outbox_upd AFTER UPDATE ON lg_voucher_token BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('lg_voucher_token', NEW.id, 'update', CAST(unixepoch() AS INTEGER) * 1000);
  UPDATE lg_voucher_token SET updated_at = CAST(unixepoch() AS INTEGER) * 1000 WHERE id = NEW.id AND updated_at = OLD.updated_at;
END
--> statement-breakpoint
CREATE TRIGGER trg_lg_voucher_token_outbox_del AFTER DELETE ON lg_voucher_token BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('lg_voucher_token', OLD.id, 'delete', CAST(unixepoch() AS INTEGER) * 1000);
END
