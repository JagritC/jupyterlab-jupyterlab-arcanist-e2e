#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="${JUPYTERLAB_BENCHMARK_ROOT:-/home/mambauser/jlab_root}"
mkdir -p "$ROOT_DIR"

for index in $(seq -w 1 40); do
  cat >"$ROOT_DIR/tab-${index}.txt" <<EOF
JupyterLab tab overflow benchmark file ${index}

Open this file in the main work area to create enough panel tabs for issue
https://github.com/jupyterlab/jupyterlab/issues/10305.
EOF
done

echo "Seeded 40 benchmark files in ${ROOT_DIR}"
