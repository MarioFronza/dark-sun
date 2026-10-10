#!/usr/bin/env bash
set -euo pipefail

SETUP_REPO="$(cd "$(dirname "$0")/.." && pwd)"
DOTFILES_REPO="${DOTFILES_REPO:-"$SETUP_REPO/../dotfiles"}"

# Config under $HOME belongs to dotfiles. A module carrying a file with the
# same name as a dotfiles one is a stale copy waiting to drift.
mapfile -t dotfiles_names < <(git -C "$DOTFILES_REPO" ls-files | xargs -n1 basename | sort -u)
failures=0

while IFS= read -r file; do
  name=$(basename "$file")
  [[ $name == install.sh ]] && continue
  if printf '%s\n' "${dotfiles_names[@]}" | grep -qxF "$name"; then
    echo "FAIL: $file duplicates a dotfiles file"
    failures=$((failures + 1))
  fi
done < <(git -C "$SETUP_REPO" ls-files modules)

if [[ $failures -gt 0 ]]; then
  exit 1
fi
