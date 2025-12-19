-- Auto-generated from schema-map-mysql.yaml (map@sha1:0D716345C0228A9FD8972A3D31574000D05317DB)
-- engine: mysql
-- table:  webauthn_credentials

CREATE TABLE IF NOT EXISTS webauthn_credentials (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  rp_id VARCHAR(255) NOT NULL,
  subject VARCHAR(128) NOT NULL,
  user_id BIGINT UNSIGNED NULL,
  credential_id VARCHAR(255) NOT NULL,
  public_key TEXT NOT NULL,
  added_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  created_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  last_used_at DATETIME(6) NULL,
  sign_count BIGINT UNSIGNED NOT NULL DEFAULT 0,
  UNIQUE KEY ux_webauthn_cred (rp_id, credential_id),
  INDEX idx_webauthn_cred_subject (rp_id, subject),
  INDEX idx_webauthn_cred_user (user_id),
  INDEX idx_webauthn_cred_last_used (last_used_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
