# TC FusionAuth on Sliplane

Image builds from this directory. Runtime requires secret env vars (set in Sliplane as secrets; never commit values):

| Env | Purpose |
| --- | --- |
| `DATABASE_URL` | `jdbc:postgresql://tc-macro-fusionauth-db.internal:5432/fusionauth` |
| `DATABASE_ROOT_USERNAME` | `postgres` |
| `DATABASE_ROOT_PASSWORD` | secret (FA DB) |
| `DATABASE_USERNAME` | `fusionauth` (created on first boot) |
| `FUSIONAUTH_APP_URL` | `http://tc-macro-fusionauth.internal:9011` |
| `TC_FA_API_KEY` | Kickstart API key |
| `TC_FA_JWT_SECRET` | JWT HMAC secret |
| `TC_FA_APPLICATION_ID` | Application UUID |
| `TC_FA_TENANT_ID` | Tenant UUID |

Private network only. Auth mail (transactional) is a separate Stefan decision — required for passwordless G1 login.

Kickstart template is a stub; expand to Macro application + passwordless email templates before claiming login G1.
