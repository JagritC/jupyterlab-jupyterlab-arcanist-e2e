#!/usr/bin/env bash
set -euo pipefail

python - <<'PY'
import urllib.request

url = "http://127.0.0.1:8888/lab"
with urllib.request.urlopen(url, timeout=10) as response:
    if response.status >= 500:
        raise SystemExit(f"{url} returned HTTP {response.status}")
print(f"{url} returned HTTP {response.status}")
PY

jupyter lab --version
test -f /home/mambauser/jlab_root/tab-40.txt
