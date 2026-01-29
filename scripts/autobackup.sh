#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TS=$(TZ="America/New_York" date +"%Y%m%d-%H%M%S")
SRC="$ROOT/index.html"
DST_DIR="$ROOT/backups"
DST="$DST_DIR/index-$TS.html"

mkdir -p "$DST_DIR"
cp "$SRC" "$DST"
