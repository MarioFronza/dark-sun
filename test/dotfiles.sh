#!/usr/bin/env bash
set -euo pipefail

DARK_SUN_REPO="$(cd "$(dirname "$0")/.." && pwd)"
DOTFILES_REPO="${DOTFILES_REPO:-"$DARK_SUN_REPO/../dotfiles"}"

tmphome=$(mktemp -d)
trap 'rm -rf "$tmphome"' EXIT

export HOME="$tmphome"
export DOTFILES_REPO

bash "$DARK_SUN_REPO/modules/15-dotfiles/install.sh"

target="$(readlink -f "$HOME/.config/sway/config" 2>/dev/null || true)"
if [[ "$target" != "$HOME/dotfiles/"* ]]; then
  echo "FAIL: ~/.config/sway/config is not a symlink resolving inside ~/dotfiles (got: ${target:-<missing>})"
  exit 1
fi
