#!/bin/bash
# Create the ML observations folder structure and start VS Code
# Usage: bash create-ml-dir.sh <path-to-ml-observations>

set -euo pipefail

DIR="${1:-$HOME/ml-observations}"

mkdir -p "$DIR"
cd "$DIR"
if [ -d .git ]; then
  git pull --quiet 2>/dev/null || true
fi

# Create dataset folder
mkdir -p "$DIR/datasets"

# Tell VS Code to open this folder
code "$DIR" 2>/dev/null || echo "Open it manually: code $DIR"

echo ""
echo "Done. Folder: $DIR"
echo "Run: python exp1.py  (from this directory)"
