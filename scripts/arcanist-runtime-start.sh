#!/usr/bin/env bash
set -euo pipefail

if [ -d /home/mambauser/jupyterlab_cache/node_modules ]; then
  mkdir -p /home/mambauser/jupyterlab/node_modules
  micromamba run rsync -ar /home/mambauser/jupyterlab_cache/node_modules/. /home/mambauser/jupyterlab/node_modules
fi

bash scripts/arcanist-runtime-seed.sh

exec micromamba run jupyter lab \
  --dev-mode \
  --extensions-in-dev-mode \
  --watch \
  --no-browser \
  --ip=0.0.0.0 \
  --port=8888 \
  --ServerApp.root_dir=/home/mambauser/jlab_root \
  --ServerApp.token='' \
  --ServerApp.password='' \
  --ServerApp.allow_origin='*' \
  --ServerApp.allow_remote_access=True \
  --ServerApp.disable_check_xsrf=True
