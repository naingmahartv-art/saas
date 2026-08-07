CREATE TABLE _sync_outbox (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  table_name TEXT NOT NULL,
  row_id TEXT NOT NULL,
  op TEXT NOT NULL,
  changed_at INTEGER NOT NULL
)
--> statement-breakpoint
CREATE TABLE _sync_state (
  id INTEGER PRIMARY KEY CHECK (id = 1),
  cursor INTEGER NOT NULL DEFAULT 0
)
--> statement-breakpoint
INSERT INTO _sync_state (id, cursor) VALUES (1, 0)
--> statement-breakpoint
CREATE TRIGGER trg_a_poo_outbox_ins AFTER INSERT ON a_poo BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('a_poo', NEW.id, 'insert', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_a_poo_outbox_upd AFTER UPDATE ON a_poo BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('a_poo', NEW.id, 'update', CAST(unixepoch() AS INTEGER) * 1000);
  UPDATE a_poo SET updated_at = CAST(unixepoch() AS INTEGER) * 1000 WHERE id = NEW.id AND updated_at = OLD.updated_at;
END
--> statement-breakpoint
CREATE TRIGGER trg_a_poo_outbox_del AFTER DELETE ON a_poo BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('a_poo', OLD.id, 'delete', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_agents_outbox_ins AFTER INSERT ON agents BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('agents', NEW.id, 'insert', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_agents_outbox_upd AFTER UPDATE ON agents BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('agents', NEW.id, 'update', CAST(unixepoch() AS INTEGER) * 1000);
  UPDATE agents SET updated_at = CAST(unixepoch() AS INTEGER) * 1000 WHERE id = NEW.id AND updated_at = OLD.updated_at;
END
--> statement-breakpoint
CREATE TRIGGER trg_agents_outbox_del AFTER DELETE ON agents BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('agents', OLD.id, 'delete', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_balance_outbox_ins AFTER INSERT ON balance BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('balance', NEW.id, 'insert', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_balance_outbox_upd AFTER UPDATE ON balance BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('balance', NEW.id, 'update', CAST(unixepoch() AS INTEGER) * 1000);
  UPDATE balance SET updated_at = CAST(unixepoch() AS INTEGER) * 1000 WHERE id = NEW.id AND updated_at = OLD.updated_at;
END
--> statement-breakpoint
CREATE TRIGGER trg_balance_outbox_del AFTER DELETE ON balance BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('balance', OLD.id, 'delete', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_brade_outbox_ins AFTER INSERT ON brade BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('brade', NEW.id, 'insert', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_brade_outbox_upd AFTER UPDATE ON brade BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('brade', NEW.id, 'update', CAST(unixepoch() AS INTEGER) * 1000);
  UPDATE brade SET updated_at = CAST(unixepoch() AS INTEGER) * 1000 WHERE id = NEW.id AND updated_at = OLD.updated_at;
END
--> statement-breakpoint
CREATE TRIGGER trg_brade_outbox_del AFTER DELETE ON brade BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('brade', OLD.id, 'delete', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_hot_numbers_outbox_ins AFTER INSERT ON hot_numbers BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('hot_numbers', NEW.id, 'insert', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_hot_numbers_outbox_upd AFTER UPDATE ON hot_numbers BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('hot_numbers', NEW.id, 'update', CAST(unixepoch() AS INTEGER) * 1000);
  UPDATE hot_numbers SET updated_at = CAST(unixepoch() AS INTEGER) * 1000 WHERE id = NEW.id AND updated_at = OLD.updated_at;
END
--> statement-breakpoint
CREATE TRIGGER trg_hot_numbers_outbox_del AFTER DELETE ON hot_numbers BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('hot_numbers', OLD.id, 'delete', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_key_config_outbox_ins AFTER INSERT ON key_config BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('key_config', NEW.id, 'insert', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_key_config_outbox_upd AFTER UPDATE ON key_config BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('key_config', NEW.id, 'update', CAST(unixepoch() AS INTEGER) * 1000);
  UPDATE key_config SET updated_at = CAST(unixepoch() AS INTEGER) * 1000 WHERE id = NEW.id AND updated_at = OLD.updated_at;
END
--> statement-breakpoint
CREATE TRIGGER trg_key_config_outbox_del AFTER DELETE ON key_config BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('key_config', OLD.id, 'delete', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_lg_outbox_ins AFTER INSERT ON lg BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('lg', NEW.id, 'insert', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_lg_outbox_upd AFTER UPDATE ON lg BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('lg', NEW.id, 'update', CAST(unixepoch() AS INTEGER) * 1000);
  UPDATE lg SET updated_at = CAST(unixepoch() AS INTEGER) * 1000 WHERE id = NEW.id AND updated_at = OLD.updated_at;
END
--> statement-breakpoint
CREATE TRIGGER trg_lg_outbox_del AFTER DELETE ON lg BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('lg', OLD.id, 'delete', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_lg_detail_outbox_ins AFTER INSERT ON lg_detail BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('lg_detail', NEW.id, 'insert', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_lg_detail_outbox_upd AFTER UPDATE ON lg_detail BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('lg_detail', NEW.id, 'update', CAST(unixepoch() AS INTEGER) * 1000);
  UPDATE lg_detail SET updated_at = CAST(unixepoch() AS INTEGER) * 1000 WHERE id = NEW.id AND updated_at = OLD.updated_at;
END
--> statement-breakpoint
CREATE TRIGGER trg_lg_detail_outbox_del AFTER DELETE ON lg_detail BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('lg_detail', OLD.id, 'delete', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_lg_sale_outbox_ins AFTER INSERT ON lg_sale BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('lg_sale', NEW.id, 'insert', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_lg_sale_outbox_upd AFTER UPDATE ON lg_sale BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('lg_sale', NEW.id, 'update', CAST(unixepoch() AS INTEGER) * 1000);
  UPDATE lg_sale SET updated_at = CAST(unixepoch() AS INTEGER) * 1000 WHERE id = NEW.id AND updated_at = OLD.updated_at;
END
--> statement-breakpoint
CREATE TRIGGER trg_lg_sale_outbox_del AFTER DELETE ON lg_sale BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('lg_sale', OLD.id, 'delete', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_lg_sale_detail_outbox_ins AFTER INSERT ON lg_sale_detail BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('lg_sale_detail', NEW.id, 'insert', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_lg_sale_detail_outbox_upd AFTER UPDATE ON lg_sale_detail BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('lg_sale_detail', NEW.id, 'update', CAST(unixepoch() AS INTEGER) * 1000);
  UPDATE lg_sale_detail SET updated_at = CAST(unixepoch() AS INTEGER) * 1000 WHERE id = NEW.id AND updated_at = OLD.updated_at;
END
--> statement-breakpoint
CREATE TRIGGER trg_lg_sale_detail_outbox_del AFTER DELETE ON lg_sale_detail BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('lg_sale_detail', OLD.id, 'delete', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_limits_outbox_ins AFTER INSERT ON limits BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('limits', NEW.id, 'insert', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_limits_outbox_upd AFTER UPDATE ON limits BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('limits', NEW.id, 'update', CAST(unixepoch() AS INTEGER) * 1000);
  UPDATE limits SET updated_at = CAST(unixepoch() AS INTEGER) * 1000 WHERE id = NEW.id AND updated_at = OLD.updated_at;
END
--> statement-breakpoint
CREATE TRIGGER trg_limits_outbox_del AFTER DELETE ON limits BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('limits', OLD.id, 'delete', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_lottery_sessions_outbox_ins AFTER INSERT ON lottery_sessions BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('lottery_sessions', NEW.id, 'insert', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_lottery_sessions_outbox_upd AFTER UPDATE ON lottery_sessions BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('lottery_sessions', NEW.id, 'update', CAST(unixepoch() AS INTEGER) * 1000);
  UPDATE lottery_sessions SET updated_at = CAST(unixepoch() AS INTEGER) * 1000 WHERE id = NEW.id AND updated_at = OLD.updated_at;
END
--> statement-breakpoint
CREATE TRIGGER trg_lottery_sessions_outbox_del AFTER DELETE ON lottery_sessions BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('lottery_sessions', OLD.id, 'delete', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_lucky_no_outbox_ins AFTER INSERT ON lucky_no BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('lucky_no', NEW.id, 'insert', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_lucky_no_outbox_upd AFTER UPDATE ON lucky_no BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('lucky_no', NEW.id, 'update', CAST(unixepoch() AS INTEGER) * 1000);
  UPDATE lucky_no SET updated_at = CAST(unixepoch() AS INTEGER) * 1000 WHERE id = NEW.id AND updated_at = OLD.updated_at;
END
--> statement-breakpoint
CREATE TRIGGER trg_lucky_no_outbox_del AFTER DELETE ON lucky_no BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('lucky_no', OLD.id, 'delete', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_machine_config_outbox_ins AFTER INSERT ON machine_config BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('machine_config', NEW.id, 'insert', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_machine_config_outbox_upd AFTER UPDATE ON machine_config BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('machine_config', NEW.id, 'update', CAST(unixepoch() AS INTEGER) * 1000);
  UPDATE machine_config SET updated_at = CAST(unixepoch() AS INTEGER) * 1000 WHERE id = NEW.id AND updated_at = OLD.updated_at;
END
--> statement-breakpoint
CREATE TRIGGER trg_machine_config_outbox_del AFTER DELETE ON machine_config BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('machine_config', OLD.id, 'delete', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_net_khat_outbox_ins AFTER INSERT ON net_khat BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('net_khat', NEW.id, 'insert', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_net_khat_outbox_upd AFTER UPDATE ON net_khat BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('net_khat', NEW.id, 'update', CAST(unixepoch() AS INTEGER) * 1000);
  UPDATE net_khat SET updated_at = CAST(unixepoch() AS INTEGER) * 1000 WHERE id = NEW.id AND updated_at = OLD.updated_at;
END
--> statement-breakpoint
CREATE TRIGGER trg_net_khat_outbox_del AFTER DELETE ON net_khat BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('net_khat', OLD.id, 'delete', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_net_khat_thai_outbox_ins AFTER INSERT ON net_khat_thai BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('net_khat_thai', NEW.id, 'insert', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_net_khat_thai_outbox_upd AFTER UPDATE ON net_khat_thai BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('net_khat_thai', NEW.id, 'update', CAST(unixepoch() AS INTEGER) * 1000);
  UPDATE net_khat_thai SET updated_at = CAST(unixepoch() AS INTEGER) * 1000 WHERE id = NEW.id AND updated_at = OLD.updated_at;
END
--> statement-breakpoint
CREATE TRIGGER trg_net_khat_thai_outbox_del AFTER DELETE ON net_khat_thai BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('net_khat_thai', OLD.id, 'delete', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_not_buy_numbers_outbox_ins AFTER INSERT ON not_buy_numbers BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('not_buy_numbers', NEW.id, 'insert', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_not_buy_numbers_outbox_upd AFTER UPDATE ON not_buy_numbers BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('not_buy_numbers', NEW.id, 'update', CAST(unixepoch() AS INTEGER) * 1000);
  UPDATE not_buy_numbers SET updated_at = CAST(unixepoch() AS INTEGER) * 1000 WHERE id = NEW.id AND updated_at = OLD.updated_at;
END
--> statement-breakpoint
CREATE TRIGGER trg_not_buy_numbers_outbox_del AFTER DELETE ON not_buy_numbers BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('not_buy_numbers', OLD.id, 'delete', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_organizations_outbox_ins AFTER INSERT ON organizations BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('organizations', NEW.id, 'insert', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_organizations_outbox_upd AFTER UPDATE ON organizations BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('organizations', NEW.id, 'update', CAST(unixepoch() AS INTEGER) * 1000);
  UPDATE organizations SET updated_at = CAST(unixepoch() AS INTEGER) * 1000 WHERE id = NEW.id AND updated_at = OLD.updated_at;
END
--> statement-breakpoint
CREATE TRIGGER trg_organizations_outbox_del AFTER DELETE ON organizations BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('organizations', OLD.id, 'delete', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_part_outbox_ins AFTER INSERT ON part BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('part', NEW.id, 'insert', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_part_outbox_upd AFTER UPDATE ON part BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('part', NEW.id, 'update', CAST(unixepoch() AS INTEGER) * 1000);
  UPDATE part SET updated_at = CAST(unixepoch() AS INTEGER) * 1000 WHERE id = NEW.id AND updated_at = OLD.updated_at;
END
--> statement-breakpoint
CREATE TRIGGER trg_part_outbox_del AFTER DELETE ON part BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('part', OLD.id, 'delete', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_power_outbox_ins AFTER INSERT ON power BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('power', NEW.id, 'insert', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_power_outbox_upd AFTER UPDATE ON power BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('power', NEW.id, 'update', CAST(unixepoch() AS INTEGER) * 1000);
  UPDATE power SET updated_at = CAST(unixepoch() AS INTEGER) * 1000 WHERE id = NEW.id AND updated_at = OLD.updated_at;
END
--> statement-breakpoint
CREATE TRIGGER trg_power_outbox_del AFTER DELETE ON power BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('power', OLD.id, 'delete', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_rates_outbox_ins AFTER INSERT ON rates BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('rates', NEW.id, 'insert', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_rates_outbox_upd AFTER UPDATE ON rates BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('rates', NEW.id, 'update', CAST(unixepoch() AS INTEGER) * 1000);
  UPDATE rates SET updated_at = CAST(unixepoch() AS INTEGER) * 1000 WHERE id = NEW.id AND updated_at = OLD.updated_at;
END
--> statement-breakpoint
CREATE TRIGGER trg_rates_outbox_del AFTER DELETE ON rates BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('rates', OLD.id, 'delete', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_receive_outbox_ins AFTER INSERT ON receive BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('receive', NEW.id, 'insert', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_receive_outbox_upd AFTER UPDATE ON receive BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('receive', NEW.id, 'update', CAST(unixepoch() AS INTEGER) * 1000);
  UPDATE receive SET updated_at = CAST(unixepoch() AS INTEGER) * 1000 WHERE id = NEW.id AND updated_at = OLD.updated_at;
END
--> statement-breakpoint
CREATE TRIGGER trg_receive_outbox_del AFTER DELETE ON receive BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('receive', OLD.id, 'delete', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_serie_m_outbox_ins AFTER INSERT ON serie_m BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('serie_m', NEW.id, 'insert', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_serie_m_outbox_upd AFTER UPDATE ON serie_m BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('serie_m', NEW.id, 'update', CAST(unixepoch() AS INTEGER) * 1000);
  UPDATE serie_m SET updated_at = CAST(unixepoch() AS INTEGER) * 1000 WHERE id = NEW.id AND updated_at = OLD.updated_at;
END
--> statement-breakpoint
CREATE TRIGGER trg_serie_m_outbox_del AFTER DELETE ON serie_m BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('serie_m', OLD.id, 'delete', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_serie_s_outbox_ins AFTER INSERT ON serie_s BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('serie_s', NEW.id, 'insert', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_serie_s_outbox_upd AFTER UPDATE ON serie_s BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('serie_s', NEW.id, 'update', CAST(unixepoch() AS INTEGER) * 1000);
  UPDATE serie_s SET updated_at = CAST(unixepoch() AS INTEGER) * 1000 WHERE id = NEW.id AND updated_at = OLD.updated_at;
END
--> statement-breakpoint
CREATE TRIGGER trg_serie_s_outbox_del AFTER DELETE ON serie_s BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('serie_s', OLD.id, 'delete', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_sm_outbox_ins AFTER INSERT ON sm BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('sm', NEW.id, 'insert', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_sm_outbox_upd AFTER UPDATE ON sm BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('sm', NEW.id, 'update', CAST(unixepoch() AS INTEGER) * 1000);
  UPDATE sm SET updated_at = CAST(unixepoch() AS INTEGER) * 1000 WHERE id = NEW.id AND updated_at = OLD.updated_at;
END
--> statement-breakpoint
CREATE TRIGGER trg_sm_outbox_del AFTER DELETE ON sm BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('sm', OLD.id, 'delete', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_small_outbox_ins AFTER INSERT ON small BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('small', NEW.id, 'insert', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_small_outbox_upd AFTER UPDATE ON small BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('small', NEW.id, 'update', CAST(unixepoch() AS INTEGER) * 1000);
  UPDATE small SET updated_at = CAST(unixepoch() AS INTEGER) * 1000 WHERE id = NEW.id AND updated_at = OLD.updated_at;
END
--> statement-breakpoint
CREATE TRIGGER trg_small_outbox_del AFTER DELETE ON small BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('small', OLD.id, 'delete', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_subscriptions_outbox_ins AFTER INSERT ON subscriptions BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('subscriptions', NEW.id, 'insert', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_subscriptions_outbox_upd AFTER UPDATE ON subscriptions BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('subscriptions', NEW.id, 'update', CAST(unixepoch() AS INTEGER) * 1000);
  UPDATE subscriptions SET updated_at = CAST(unixepoch() AS INTEGER) * 1000 WHERE id = NEW.id AND updated_at = OLD.updated_at;
END
--> statement-breakpoint
CREATE TRIGGER trg_subscriptions_outbox_del AFTER DELETE ON subscriptions BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('subscriptions', OLD.id, 'delete', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_users_outbox_ins AFTER INSERT ON users BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('users', NEW.id, 'insert', CAST(unixepoch() AS INTEGER) * 1000);
END
--> statement-breakpoint
CREATE TRIGGER trg_users_outbox_upd AFTER UPDATE ON users BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('users', NEW.id, 'update', CAST(unixepoch() AS INTEGER) * 1000);
  UPDATE users SET updated_at = CAST(unixepoch() AS INTEGER) * 1000 WHERE id = NEW.id AND updated_at = OLD.updated_at;
END
--> statement-breakpoint
CREATE TRIGGER trg_users_outbox_del AFTER DELETE ON users BEGIN
  INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES ('users', OLD.id, 'delete', CAST(unixepoch() AS INTEGER) * 1000);
END;
