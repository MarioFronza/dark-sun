#!/usr/bin/env bash
set -euo pipefail

DARK_SUN_REPO="$(cd "$(dirname "$0")/.." && pwd)"
DOTFILES_REPO="${DOTFILES_REPO:-"$DARK_SUN_REPO/../dotfiles"}"
# install.sh sources modules under set -e, so run them the same way.
MODULE="$DARK_SUN_REPO/modules/15-dotfiles/install.sh"

tmphome=$(mktemp -d)
conflict_home=$(mktemp -d)
trap 'rm -rf "$tmphome" "$conflict_home"' EXIT

export HOME="$tmphome"
export DOTFILES_REPO

bash -e "$MODULE"

target="$(readlink -f "$HOME/.config/sway/config" 2>/dev/null || true)"
if [[ "$target" != "$HOME/dotfiles/"* ]]; then
  echo "FAIL: ~/.config/sway/config is not a symlink resolving inside ~/dotfiles (got: ${target:-<missing>})"
  exit 1
fi

PACKAGES=(alacritty claude fuzzel git github mako mise nvim sway swaylock swayosd tmux waybar zsh)
failures=0

for pkg in "${PACKAGES[@]}"; do
  out=$(stow --no-folding -n -v -d "$HOME/dotfiles" -t "$HOME" "$pkg" 2>&1)
  if grep -q '^LINK' <<<"$out"; then
    echo "FAIL: $pkg not fully stowed"
    failures=$((failures + 1))
  fi
done

if [[ $failures -gt 0 ]]; then
  exit 1
fi

if [[ ! -f "$HOME/.claude/settings.json" || -L "$HOME/.claude/settings.json" ]]; then
  echo "FAIL: ~/.claude/settings.json must exist as a regular file, not a symlink"
  exit 1
fi

echo "# runtime-marker" >> "$HOME/.claude/settings.json"
if ! bash -e "$MODULE"; then
  echo "FAIL: re-running the module exited non-zero"
  exit 1
fi
if ! grep -q "runtime-marker" "$HOME/.claude/settings.json"; then
  echo "FAIL: re-run overwrote ~/.claude/settings.json (runtime edits not preserved)"
  exit 1
fi

mkdir -p "$conflict_home/.config/sway"
echo "mine" > "$conflict_home/.config/sway/config"
if HOME="$conflict_home" bash -e "$MODULE" >/dev/null 2>&1; then
  echo "FAIL: module succeeded over a conflicting ~/.config/sway/config"
  exit 1
fi
if [[ -L "$conflict_home/.config/sway/config" || "$(cat "$conflict_home/.config/sway/config")" != "mine" ]]; then
  echo "FAIL: module changed a conflicting ~/.config/sway/config"
  exit 1
fi
