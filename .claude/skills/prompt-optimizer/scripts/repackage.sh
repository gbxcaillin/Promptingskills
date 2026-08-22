#!/usr/bin/env bash
# Repackage the prompt-optimizer skill into a fresh .skill file.
# A .skill is just a zip containing the skill folder. Portable: needs only zip.
# Usage: run from anywhere — paths are resolved relative to this script.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_DIR="$(dirname "$SCRIPT_DIR")"          # .../prompt-optimizer
SKILL_NAME="$(basename "$SKILL_DIR")"          # prompt-optimizer
PARENT_DIR="$(dirname "$SKILL_DIR")"
OUT="${1:-$SKILL_DIR/$SKILL_NAME.skill}"

command -v zip >/dev/null 2>&1 || { echo "error: 'zip' is required"; exit 1; }

# Stamp the refresh date so users can see how current it is.
DATE="$(date +%Y-%m-%d)"
STAMP="$SKILL_DIR/LAST_UPDATED"
echo "$DATE" > "$STAMP"

rm -f "$OUT"
# Zip the folder (as prompt-optimizer/...) excluding the packaged artifact itself.
( cd "$PARENT_DIR" && zip -r -q "$OUT" "$SKILL_NAME" \
    -x "$SKILL_NAME/*.skill" )

echo "Packaged: $OUT (stamped $DATE)"
