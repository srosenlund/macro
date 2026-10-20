#!/bin/sh
set -eu

# Required secret names (values from Sliplane env; not stored in git):
#   TC_FA_API_KEY, TC_FA_JWT_SECRET, TC_FA_APPLICATION_ID, TC_FA_TENANT_ID
for v in TC_FA_API_KEY TC_FA_JWT_SECRET TC_FA_APPLICATION_ID TC_FA_TENANT_ID; do
  eval "val=\${$v-}"
  if [ -z "$val" ]; then
    echo "missing required env: $v" >&2
    exit 1
  fi
done

mkdir -p /usr/local/fusionauth/kickstart
src=/opt/tc/kickstart.template.json
dst=/usr/local/fusionauth/kickstart/kickstart.json
if command -v python3 >/dev/null 2>&1; then
  python3 - <<'PY'
import os, pathlib
t = pathlib.Path("/opt/tc/kickstart.template.json").read_text()
for k in ("TC_FA_API_KEY", "TC_FA_JWT_SECRET", "TC_FA_APPLICATION_ID", "TC_FA_TENANT_ID"):
    t = t.replace("#{%s}" % k, os.environ[k])
pathlib.Path("/usr/local/fusionauth/kickstart/kickstart.json").write_text(t)
PY
else
  sed \
    -e "s|#{TC_FA_API_KEY}|${TC_FA_API_KEY}|g" \
    -e "s|#{TC_FA_JWT_SECRET}|${TC_FA_JWT_SECRET}|g" \
    -e "s|#{TC_FA_APPLICATION_ID}|${TC_FA_APPLICATION_ID}|g" \
    -e "s|#{TC_FA_TENANT_ID}|${TC_FA_TENANT_ID}|g" \
    "$src" > "$dst"
fi

exec /usr/local/fusionauth/fusionauth-app/bin/start.sh
