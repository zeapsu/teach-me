#!/usr/bin/env bash
# Install the Codex-tuned teach-me skill into ~/.agents/skills,
# where Codex auto-discovers skills.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$REPO_DIR/codex/skills/teach-me"
DEST="$HOME/.agents/skills/teach-me"

mkdir -p "$HOME/.agents/skills"
rm -rf "$DEST"
cp -R "$SRC" "$DEST"

echo "Installed teach-me for Codex at $DEST"
echo "Start a Codex session and say: teach me <thing>"
