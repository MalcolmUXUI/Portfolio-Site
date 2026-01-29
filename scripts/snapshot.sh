#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TS=$(TZ="America/New_York" date +"%Y%m%d-%H%M%S")
HTML_SRC="$ROOT/index.html"
HTML_DST="$ROOT/backups/index-$TS.html"
PNG_DST="$ROOT/backups/preview-$TS.png"

cp "$HTML_SRC" "$HTML_DST"

# Open in default browser
open "$HTML_SRC"

# Capture a screenshot interactively after the page loads
/usr/sbin/screencapture -i "$PNG_DST"

echo "Saved: $HTML_DST"
echo "Saved: $PNG_DST"
