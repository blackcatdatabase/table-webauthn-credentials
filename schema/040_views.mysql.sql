-- Auto-generated from schema-views-mysql.yaml
-- engine: mysql
-- table:  webauthn_credentials

-- Contract view for [webauthn_credentials]
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_webauthn_credentials AS
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
