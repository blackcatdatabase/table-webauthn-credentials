-- Auto-generated from schema-map-postgres.yaml (map@sha1:621FDD3D99B768B6A8AD92061FB029414184F4B3)
-- engine: postgres
-- table:  webauthn_credentials

ALTER TABLE webauthn_credentials ADD CONSTRAINT fk_webauthn_cred_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL;
