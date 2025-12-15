-- Auto-generated from schema-map-mysql.yaml (map@sha1:B9D3BE28A74392B9B389FDAFB493BD80FA1F6FA4)
-- engine: mysql
-- table:  webauthn_credentials

ALTER TABLE webauthn_credentials ADD CONSTRAINT fk_webauthn_cred_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL;
