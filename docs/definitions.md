# webauthn_credentials

WebAuthn credentials (passkeys) stored per RP id and user.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| id | BIGINT | NO |  | Surrogate primary key. |
| rp_id | VARCHAR(255) | NO |  | Relying Party ID (domain). |
| subject | VARCHAR(128) | NO |  | Subject identifier (typically users.id). |
| user_id | BIGINT | YES |  | Optional FK users.id for convenience joins. |
| credential_id | VARCHAR(255) | NO |  | Credential identifier (base64/url-safe). |
| public_key | TEXT | NO |  | Public key material for the credential. |
| added_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | When the credential was added (UTC). |
| created_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |
| last_used_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | YES |  | When the credential was last used, if tracked. |
| sign_count | BIGINT | NO | 0 | WebAuthn signature counter (for clone/replay detection). |

## Engine Details

### mysql

Unique keys:
| Name | Columns |
| --- | --- |
| ux_webauthn_cred | rp_id, credential_id |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_webauthn_cred_last_used | last_used_at | INDEX idx_webauthn_cred_last_used (last_used_at) |
| idx_webauthn_cred_subject | rp_id,subject | INDEX idx_webauthn_cred_subject (rp_id, subject) |
| idx_webauthn_cred_user | user_id | INDEX idx_webauthn_cred_user (user_id) |
| ux_webauthn_cred | rp_id,credential_id | UNIQUE KEY ux_webauthn_cred (rp_id, credential_id) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_webauthn_cred_user | user_id | users(id) | ON DELETE SET |

### postgres

Unique keys:
| Name | Columns |
| --- | --- |
| ux_webauthn_cred | rp_id, credential_id |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_webauthn_cred_last_used | last_used_at | CREATE INDEX IF NOT EXISTS idx_webauthn_cred_last_used ON webauthn_credentials (last_used_at) |
| idx_webauthn_cred_subject | rp_id,subject | CREATE INDEX IF NOT EXISTS idx_webauthn_cred_subject ON webauthn_credentials (rp_id, subject) |
| idx_webauthn_cred_user | user_id | CREATE INDEX IF NOT EXISTS idx_webauthn_cred_user ON webauthn_credentials (user_id) |
| ux_webauthn_cred | rp_id,credential_id | CONSTRAINT ux_webauthn_cred UNIQUE (rp_id, credential_id) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_webauthn_cred_user | user_id | users(id) | ON DELETE SET |

## Engine differences

## Views
| View | Engine | Flags | File |
| --- | --- | --- | --- |
| vw_webauthn_credentials | mysql | algorithm=MERGE, security=INVOKER | [../schema/040_views.mysql.sql](../schema/040_views.mysql.sql) |
| vw_webauthn_credentials | postgres |  | [../schema/040_views.postgres.sql](../schema/040_views.postgres.sql) |
