#!/usr/bin/env bash
set -euo pipefail

SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_CSS="${SRC_DIR}/custom.css"

DEST_CSS="/opt/meshcentral/node_modules/meshcentral/public/styles/custom.css"

if [[ ! -f "${SRC_CSS}" ]]; then
  echo "ERROR: Missing ${SRC_CSS}"
  exit 1
fi

# Backup current (once per run)
if [[ -f "${DEST_CSS}" && ! -L "${DEST_CSS}" ]]; then
  sudo cp -a "${DEST_CSS}" "${DEST_CSS}.bak.$(date +%F_%H%M%S)" || true
fi

sudo cp -a "${SRC_CSS}" "${DEST_CSS}"
echo "Installed theme -> ${DEST_CSS}"
echo "Hard refresh browser (Ctrl+Shift+R)."
