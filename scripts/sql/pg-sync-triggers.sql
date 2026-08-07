CREATE TABLE IF NOT EXISTS _sync_outbox (
  id BIGSERIAL PRIMARY KEY,
  table_name TEXT NOT NULL,
  row_id TEXT NOT NULL,
  op TEXT NOT NULL,
  changed_at BIGINT NOT NULL
);

CREATE OR REPLACE FUNCTION sync_outbox_capture() RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'DELETE' THEN
    INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES (TG_TABLE_NAME, OLD.id, 'delete', (extract(epoch from now()) * 1000)::bigint);
    RETURN OLD;
  ELSE
    INSERT INTO _sync_outbox (table_name, row_id, op, changed_at) VALUES (TG_TABLE_NAME, NEW.id, lower(TG_OP), (extract(epoch from now()) * 1000)::bigint);
    RETURN NEW;
  END IF;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION bump_updated_at() RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = (extract(epoch from now()) * 1000)::bigint;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_a_poo_outbox ON a_poo;

CREATE TRIGGER trg_a_poo_outbox AFTER INSERT OR UPDATE OR DELETE ON a_poo FOR EACH ROW EXECUTE FUNCTION sync_outbox_capture();

DROP TRIGGER IF EXISTS trg_a_poo_bump_updated ON a_poo;

CREATE TRIGGER trg_a_poo_bump_updated BEFORE UPDATE ON a_poo FOR EACH ROW EXECUTE FUNCTION bump_updated_at();

DROP TRIGGER IF EXISTS trg_agents_outbox ON agents;

CREATE TRIGGER trg_agents_outbox AFTER INSERT OR UPDATE OR DELETE ON agents FOR EACH ROW EXECUTE FUNCTION sync_outbox_capture();

DROP TRIGGER IF EXISTS trg_agents_bump_updated ON agents;

CREATE TRIGGER trg_agents_bump_updated BEFORE UPDATE ON agents FOR EACH ROW EXECUTE FUNCTION bump_updated_at();

DROP TRIGGER IF EXISTS trg_balance_outbox ON balance;

CREATE TRIGGER trg_balance_outbox AFTER INSERT OR UPDATE OR DELETE ON balance FOR EACH ROW EXECUTE FUNCTION sync_outbox_capture();

DROP TRIGGER IF EXISTS trg_balance_bump_updated ON balance;

CREATE TRIGGER trg_balance_bump_updated BEFORE UPDATE ON balance FOR EACH ROW EXECUTE FUNCTION bump_updated_at();

DROP TRIGGER IF EXISTS trg_brade_outbox ON brade;

CREATE TRIGGER trg_brade_outbox AFTER INSERT OR UPDATE OR DELETE ON brade FOR EACH ROW EXECUTE FUNCTION sync_outbox_capture();

DROP TRIGGER IF EXISTS trg_brade_bump_updated ON brade;

CREATE TRIGGER trg_brade_bump_updated BEFORE UPDATE ON brade FOR EACH ROW EXECUTE FUNCTION bump_updated_at();

DROP TRIGGER IF EXISTS trg_hot_numbers_outbox ON hot_numbers;

CREATE TRIGGER trg_hot_numbers_outbox AFTER INSERT OR UPDATE OR DELETE ON hot_numbers FOR EACH ROW EXECUTE FUNCTION sync_outbox_capture();

DROP TRIGGER IF EXISTS trg_hot_numbers_bump_updated ON hot_numbers;

CREATE TRIGGER trg_hot_numbers_bump_updated BEFORE UPDATE ON hot_numbers FOR EACH ROW EXECUTE FUNCTION bump_updated_at();

DROP TRIGGER IF EXISTS trg_key_config_outbox ON key_config;

CREATE TRIGGER trg_key_config_outbox AFTER INSERT OR UPDATE OR DELETE ON key_config FOR EACH ROW EXECUTE FUNCTION sync_outbox_capture();

DROP TRIGGER IF EXISTS trg_key_config_bump_updated ON key_config;

CREATE TRIGGER trg_key_config_bump_updated BEFORE UPDATE ON key_config FOR EACH ROW EXECUTE FUNCTION bump_updated_at();

DROP TRIGGER IF EXISTS trg_lg_outbox ON lg;

CREATE TRIGGER trg_lg_outbox AFTER INSERT OR UPDATE OR DELETE ON lg FOR EACH ROW EXECUTE FUNCTION sync_outbox_capture();

DROP TRIGGER IF EXISTS trg_lg_bump_updated ON lg;

CREATE TRIGGER trg_lg_bump_updated BEFORE UPDATE ON lg FOR EACH ROW EXECUTE FUNCTION bump_updated_at();

DROP TRIGGER IF EXISTS trg_lg_detail_outbox ON lg_detail;

CREATE TRIGGER trg_lg_detail_outbox AFTER INSERT OR UPDATE OR DELETE ON lg_detail FOR EACH ROW EXECUTE FUNCTION sync_outbox_capture();

DROP TRIGGER IF EXISTS trg_lg_detail_bump_updated ON lg_detail;

CREATE TRIGGER trg_lg_detail_bump_updated BEFORE UPDATE ON lg_detail FOR EACH ROW EXECUTE FUNCTION bump_updated_at();

DROP TRIGGER IF EXISTS trg_lg_sale_outbox ON lg_sale;

CREATE TRIGGER trg_lg_sale_outbox AFTER INSERT OR UPDATE OR DELETE ON lg_sale FOR EACH ROW EXECUTE FUNCTION sync_outbox_capture();

DROP TRIGGER IF EXISTS trg_lg_sale_bump_updated ON lg_sale;

CREATE TRIGGER trg_lg_sale_bump_updated BEFORE UPDATE ON lg_sale FOR EACH ROW EXECUTE FUNCTION bump_updated_at();

DROP TRIGGER IF EXISTS trg_lg_sale_detail_outbox ON lg_sale_detail;

CREATE TRIGGER trg_lg_sale_detail_outbox AFTER INSERT OR UPDATE OR DELETE ON lg_sale_detail FOR EACH ROW EXECUTE FUNCTION sync_outbox_capture();

DROP TRIGGER IF EXISTS trg_lg_sale_detail_bump_updated ON lg_sale_detail;

CREATE TRIGGER trg_lg_sale_detail_bump_updated BEFORE UPDATE ON lg_sale_detail FOR EACH ROW EXECUTE FUNCTION bump_updated_at();

DROP TRIGGER IF EXISTS trg_lg_voucher_token_outbox ON lg_voucher_token;

CREATE TRIGGER trg_lg_voucher_token_outbox AFTER INSERT OR UPDATE OR DELETE ON lg_voucher_token FOR EACH ROW EXECUTE FUNCTION sync_outbox_capture();

DROP TRIGGER IF EXISTS trg_lg_voucher_token_bump_updated ON lg_voucher_token;

CREATE TRIGGER trg_lg_voucher_token_bump_updated BEFORE UPDATE ON lg_voucher_token FOR EACH ROW EXECUTE FUNCTION bump_updated_at();

DROP TRIGGER IF EXISTS trg_limits_outbox ON limits;

CREATE TRIGGER trg_limits_outbox AFTER INSERT OR UPDATE OR DELETE ON limits FOR EACH ROW EXECUTE FUNCTION sync_outbox_capture();

DROP TRIGGER IF EXISTS trg_limits_bump_updated ON limits;

CREATE TRIGGER trg_limits_bump_updated BEFORE UPDATE ON limits FOR EACH ROW EXECUTE FUNCTION bump_updated_at();

DROP TRIGGER IF EXISTS trg_lottery_sessions_outbox ON lottery_sessions;

CREATE TRIGGER trg_lottery_sessions_outbox AFTER INSERT OR UPDATE OR DELETE ON lottery_sessions FOR EACH ROW EXECUTE FUNCTION sync_outbox_capture();

DROP TRIGGER IF EXISTS trg_lottery_sessions_bump_updated ON lottery_sessions;

CREATE TRIGGER trg_lottery_sessions_bump_updated BEFORE UPDATE ON lottery_sessions FOR EACH ROW EXECUTE FUNCTION bump_updated_at();

DROP TRIGGER IF EXISTS trg_lucky_no_outbox ON lucky_no;

CREATE TRIGGER trg_lucky_no_outbox AFTER INSERT OR UPDATE OR DELETE ON lucky_no FOR EACH ROW EXECUTE FUNCTION sync_outbox_capture();

DROP TRIGGER IF EXISTS trg_lucky_no_bump_updated ON lucky_no;

CREATE TRIGGER trg_lucky_no_bump_updated BEFORE UPDATE ON lucky_no FOR EACH ROW EXECUTE FUNCTION bump_updated_at();

DROP TRIGGER IF EXISTS trg_machine_config_outbox ON machine_config;

CREATE TRIGGER trg_machine_config_outbox AFTER INSERT OR UPDATE OR DELETE ON machine_config FOR EACH ROW EXECUTE FUNCTION sync_outbox_capture();

DROP TRIGGER IF EXISTS trg_machine_config_bump_updated ON machine_config;

CREATE TRIGGER trg_machine_config_bump_updated BEFORE UPDATE ON machine_config FOR EACH ROW EXECUTE FUNCTION bump_updated_at();

DROP TRIGGER IF EXISTS trg_net_khat_outbox ON net_khat;

CREATE TRIGGER trg_net_khat_outbox AFTER INSERT OR UPDATE OR DELETE ON net_khat FOR EACH ROW EXECUTE FUNCTION sync_outbox_capture();

DROP TRIGGER IF EXISTS trg_net_khat_bump_updated ON net_khat;

CREATE TRIGGER trg_net_khat_bump_updated BEFORE UPDATE ON net_khat FOR EACH ROW EXECUTE FUNCTION bump_updated_at();

DROP TRIGGER IF EXISTS trg_net_khat_thai_outbox ON net_khat_thai;

CREATE TRIGGER trg_net_khat_thai_outbox AFTER INSERT OR UPDATE OR DELETE ON net_khat_thai FOR EACH ROW EXECUTE FUNCTION sync_outbox_capture();

DROP TRIGGER IF EXISTS trg_net_khat_thai_bump_updated ON net_khat_thai;

CREATE TRIGGER trg_net_khat_thai_bump_updated BEFORE UPDATE ON net_khat_thai FOR EACH ROW EXECUTE FUNCTION bump_updated_at();

DROP TRIGGER IF EXISTS trg_not_buy_numbers_outbox ON not_buy_numbers;

CREATE TRIGGER trg_not_buy_numbers_outbox AFTER INSERT OR UPDATE OR DELETE ON not_buy_numbers FOR EACH ROW EXECUTE FUNCTION sync_outbox_capture();

DROP TRIGGER IF EXISTS trg_not_buy_numbers_bump_updated ON not_buy_numbers;

CREATE TRIGGER trg_not_buy_numbers_bump_updated BEFORE UPDATE ON not_buy_numbers FOR EACH ROW EXECUTE FUNCTION bump_updated_at();

DROP TRIGGER IF EXISTS trg_organizations_outbox ON organizations;

CREATE TRIGGER trg_organizations_outbox AFTER INSERT OR UPDATE OR DELETE ON organizations FOR EACH ROW EXECUTE FUNCTION sync_outbox_capture();

DROP TRIGGER IF EXISTS trg_organizations_bump_updated ON organizations;

CREATE TRIGGER trg_organizations_bump_updated BEFORE UPDATE ON organizations FOR EACH ROW EXECUTE FUNCTION bump_updated_at();

DROP TRIGGER IF EXISTS trg_part_outbox ON part;

CREATE TRIGGER trg_part_outbox AFTER INSERT OR UPDATE OR DELETE ON part FOR EACH ROW EXECUTE FUNCTION sync_outbox_capture();

DROP TRIGGER IF EXISTS trg_part_bump_updated ON part;

CREATE TRIGGER trg_part_bump_updated BEFORE UPDATE ON part FOR EACH ROW EXECUTE FUNCTION bump_updated_at();

DROP TRIGGER IF EXISTS trg_power_outbox ON power;

CREATE TRIGGER trg_power_outbox AFTER INSERT OR UPDATE OR DELETE ON power FOR EACH ROW EXECUTE FUNCTION sync_outbox_capture();

DROP TRIGGER IF EXISTS trg_power_bump_updated ON power;

CREATE TRIGGER trg_power_bump_updated BEFORE UPDATE ON power FOR EACH ROW EXECUTE FUNCTION bump_updated_at();

DROP TRIGGER IF EXISTS trg_rates_outbox ON rates;

CREATE TRIGGER trg_rates_outbox AFTER INSERT OR UPDATE OR DELETE ON rates FOR EACH ROW EXECUTE FUNCTION sync_outbox_capture();

DROP TRIGGER IF EXISTS trg_rates_bump_updated ON rates;

CREATE TRIGGER trg_rates_bump_updated BEFORE UPDATE ON rates FOR EACH ROW EXECUTE FUNCTION bump_updated_at();

DROP TRIGGER IF EXISTS trg_receive_outbox ON receive;

CREATE TRIGGER trg_receive_outbox AFTER INSERT OR UPDATE OR DELETE ON receive FOR EACH ROW EXECUTE FUNCTION sync_outbox_capture();

DROP TRIGGER IF EXISTS trg_receive_bump_updated ON receive;

CREATE TRIGGER trg_receive_bump_updated BEFORE UPDATE ON receive FOR EACH ROW EXECUTE FUNCTION bump_updated_at();

DROP TRIGGER IF EXISTS trg_serie_m_outbox ON serie_m;

CREATE TRIGGER trg_serie_m_outbox AFTER INSERT OR UPDATE OR DELETE ON serie_m FOR EACH ROW EXECUTE FUNCTION sync_outbox_capture();

DROP TRIGGER IF EXISTS trg_serie_m_bump_updated ON serie_m;

CREATE TRIGGER trg_serie_m_bump_updated BEFORE UPDATE ON serie_m FOR EACH ROW EXECUTE FUNCTION bump_updated_at();

DROP TRIGGER IF EXISTS trg_serie_s_outbox ON serie_s;

CREATE TRIGGER trg_serie_s_outbox AFTER INSERT OR UPDATE OR DELETE ON serie_s FOR EACH ROW EXECUTE FUNCTION sync_outbox_capture();

DROP TRIGGER IF EXISTS trg_serie_s_bump_updated ON serie_s;

CREATE TRIGGER trg_serie_s_bump_updated BEFORE UPDATE ON serie_s FOR EACH ROW EXECUTE FUNCTION bump_updated_at();

DROP TRIGGER IF EXISTS trg_sm_outbox ON sm;

CREATE TRIGGER trg_sm_outbox AFTER INSERT OR UPDATE OR DELETE ON sm FOR EACH ROW EXECUTE FUNCTION sync_outbox_capture();

DROP TRIGGER IF EXISTS trg_sm_bump_updated ON sm;

CREATE TRIGGER trg_sm_bump_updated BEFORE UPDATE ON sm FOR EACH ROW EXECUTE FUNCTION bump_updated_at();

DROP TRIGGER IF EXISTS trg_small_outbox ON small;

CREATE TRIGGER trg_small_outbox AFTER INSERT OR UPDATE OR DELETE ON small FOR EACH ROW EXECUTE FUNCTION sync_outbox_capture();

DROP TRIGGER IF EXISTS trg_small_bump_updated ON small;

CREATE TRIGGER trg_small_bump_updated BEFORE UPDATE ON small FOR EACH ROW EXECUTE FUNCTION bump_updated_at();

DROP TRIGGER IF EXISTS trg_subscriptions_outbox ON subscriptions;

CREATE TRIGGER trg_subscriptions_outbox AFTER INSERT OR UPDATE OR DELETE ON subscriptions FOR EACH ROW EXECUTE FUNCTION sync_outbox_capture();

DROP TRIGGER IF EXISTS trg_subscriptions_bump_updated ON subscriptions;

CREATE TRIGGER trg_subscriptions_bump_updated BEFORE UPDATE ON subscriptions FOR EACH ROW EXECUTE FUNCTION bump_updated_at();

DROP TRIGGER IF EXISTS trg_users_outbox ON users;

CREATE TRIGGER trg_users_outbox AFTER INSERT OR UPDATE OR DELETE ON users FOR EACH ROW EXECUTE FUNCTION sync_outbox_capture();

DROP TRIGGER IF EXISTS trg_users_bump_updated ON users;

CREATE TRIGGER trg_users_bump_updated BEFORE UPDATE ON users FOR EACH ROW EXECUTE FUNCTION bump_updated_at();
