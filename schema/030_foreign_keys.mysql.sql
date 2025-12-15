-- Auto-generated from schema-map-mysql.yaml
-- engine: mysql
-- table:  webauthn_credentials

ALTER TABLE webauthn_credentials ADD CONSTRAINT fk_webauthn_cred_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL;
