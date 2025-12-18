-- Auto-generated from schema-map-postgres.yaml (map@sha1:8C4F2BC1C4D22EE71E27B5A7968C71E32D8D884D)
-- engine: postgres
-- table:  webauthn_credentials

CREATE INDEX IF NOT EXISTS idx_webauthn_cred_subject ON webauthn_credentials (rp_id, subject);

CREATE INDEX IF NOT EXISTS idx_webauthn_cred_user ON webauthn_credentials (user_id);

CREATE INDEX IF NOT EXISTS idx_webauthn_cred_last_used ON webauthn_credentials (last_used_at);
