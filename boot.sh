#!/usr/bin/env bash
# Entrypoint: curl -fsSL <raw-url>/boot.sh | bash
set -euo pipefail

pacman -Q git &>/dev/null || sudo pacman -Sy --noconfirm --needed git

echo -e "\nCloning DarkSun..."
rm -rf ~/.local/share/dark-sun/
git clone https://github.com/MarioFronza/dark-sun.git ~/.local/share/dark-sun >/dev/null

# Use custom branch if instructed
if [[ -n "${DARK_SUN_REF:-}" ]]; then
  echo "Using branch: $DARK_SUN_REF"
  cd ~/.local/share/dark-sun
  git fetch origin "${DARK_SUN_REF}" && git checkout "${DARK_SUN_REF}"
  cd -
fi

echo -e "\nInstallation starting...\n"
source ~/.local/share/dark-sun/install.sh
