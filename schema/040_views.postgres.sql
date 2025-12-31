-- Auto-generated from schema-views-postgres.yaml (map@sha1:A7406D76A2DD55741B4DC6A4EC831681A19168EB)
-- engine: postgres
-- table:  webauthn_credentials

-- Contract view for [webauthn_credentials]
CREATE OR REPLACE VIEW vw_webauthn_credentials AS
SELECT
  id,
  rp_id,
  subject,
  user_id,
  credential_id,
  public_key,
  added_at,
  created_at,
  last_used_at,
  sign_count
FROM webauthn_credentials;
