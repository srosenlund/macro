# TC Macro config schema (names only)

No secret **values** belong in this file, in git, or in chat. Store values in the authorized secret source; reference by name/path/id here.

## Runtime profile

| Key | Required for G1 | Notes |
| --- | --- | --- |
| `ENVIRONMENT` | yes | TC value, not `dev`/`prod` Macro-hosted |
| `OVERRIDE_*` service URLs | yes | Point at `*.internal` / TC public origin only |
| Feature flags disabling email/calendar/CRM write | yes | Explicit off |

## Datastores

| Key name (category) | Required |
| --- | --- |
| MacroDB URL / user / password / db name | yes |
| Redis host/port/(password) | yes |
| Kafka bootstrap | yes |
| OpenSearch URL + credentials | yes |
| FusionAuth URL + API key + application/tenant ids | yes |
| Object storage endpoint, region, bucket names, access key **ids** | yes |
| Queue URLs / DynamoDB table names / KMS key ids | yes (or blocked until AWS/port decision) |

## Auth & mail

| Key name (category) | Required |
| --- | --- |
| Authentication service signing secrets | yes |
| FusionAuth kickstart / admin credentials | yes |
| Transactional mail provider API key | yes |
| Web origin / cookie domain / OAuth redirect allowlist for **auth** | yes |

## Agents

| Key name (category) | Required |
| --- | --- |
| LLM provider API key(s) | yes for G1 agentchat criterion |
| Internal API keys between services | yes |

## Sync (Cloudflare)

| Key name (category) | Required |
| --- | --- |
| CF account id / API token name | yes |
| Worker secrets: internal API keys, DSS/Lexical URLs | yes |
| D1 / KV / R2 / DO binding ids | yes |

## Sliplane platform

| Key | Notes |
| --- | --- |
| `PORT` | Per public/private HTTP service as required by Sliplane |
| `SLIPLANE_DOMAIN` | Injected by platform |
| Deploy hook URL | Treat as secret |
