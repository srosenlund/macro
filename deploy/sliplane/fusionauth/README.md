# TC FusionAuth on Sliplane

Private service. Image builds from this directory. Kickstart is rendered at
container start from secret env vars — **never bake secret values into git/images**.

## Database

| Env | Example / note |
| --- | --- |
| `DATABASE_URL` | `jdbc:postgresql://tc-macro-fusionauth-db.internal:5432/fusionauth` |
| `DATABASE_ROOT_USERNAME` | `postgres` |
| `DATABASE_ROOT_PASSWORD` | Sliplane secret (FA DB) |
| `DATABASE_USERNAME` | `fusionauth` (created on first boot) |
| `FUSIONAUTH_APP_URL` | `http://tc-macro-fusionauth.internal:9011` |

## Kickstart secrets / ids

| Env | Purpose |
| --- | --- |
| `TC_FA_API_KEY` | FusionAuth API key |
| `TC_FA_JWT_SECRET` | HS256 signing secret |
| `TC_FA_JWT_KEY_ID` | UUID for signing key |
| `TC_FA_JWT_LAMBDA_ID` | UUID for JWT populate lambda |
| `TC_FA_APPLICATION_ID` | Application UUID (= OAuth client id) |
| `TC_FA_TENANT_ID` | Tenant UUID |
| `TC_FA_CLIENT_SECRET` | OAuth client secret |
| `TC_FA_PASSWORDLESS_TEMPLATE_ID` | Email template UUID |
| `TC_FA_MAIL_FROM` | From address |
| `TC_FA_ISSUER` | JWT issuer URL |
| `TC_FA_SMTP_HOST` / `PORT` / `SECURITY` / `USERNAME` / `PASSWORD` | Transactional SMTP (**Stefan decision** — not Mailpit, not M365 Phase 2) |
| `TC_FA_OAUTH_REDIRECT_URI` | Public HTTPS auth callback |
| `TC_INTERNAL_API_KEY` | Must match authentication-service internal key |

Do not deploy this service until SMTP credentials exist; kickstart configures
tenant email for passwordless codes required by G1 login.
