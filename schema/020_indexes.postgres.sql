-- Auto-generated from schema-map-postgres.yaml (map@sha1:FAEA49A5D5F8FAAD9F850D0F430ED451C5C1D707)
-- engine: postgres
-- table:  webauthn_credentials

CREATE INDEX IF NOT EXISTS idx_webauthn_cred_subject ON webauthn_credentials (rp_id, subject);

CREATE INDEX IF NOT EXISTS idx_webauthn_cred_user ON webauthn_credentials (user_id);

CREATE INDEX IF NOT EXISTS idx_webauthn_cred_last_used ON webauthn_credentials (last_used_at);
