-- Auto-generated from schema-map-postgres.yaml (map@sha1:621FDD3D99B768B6A8AD92061FB029414184F4B3)
-- engine: postgres
-- table:  webauthn_credentials

CREATE INDEX IF NOT EXISTS idx_webauthn_cred_subject ON webauthn_credentials (rp_id, subject);

CREATE INDEX IF NOT EXISTS idx_webauthn_cred_user ON webauthn_credentials (user_id);

CREATE INDEX IF NOT EXISTS idx_webauthn_cred_last_used ON webauthn_credentials (last_used_at);
