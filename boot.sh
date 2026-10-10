#!/usr/bin/env bash
# Entrypoint: curl -fsSL <raw-url>/boot.sh | bash
set -euo pipefail

pacman -Q git &>/dev/null || sudo pacman -Sy --noconfirm --needed git

echo -e "\nCloning arch-linux-setup..."
rm -rf ~/.local/share/arch-linux-setup/
git clone https://github.com/MarioFronza/arch-linux-setup.git ~/.local/share/arch-linux-setup >/dev/null

# Use custom branch if instructed
if [[ -n "${SETUP_REF:-}" ]]; then
  echo "Using branch: $SETUP_REF"
  cd ~/.local/share/arch-linux-setup
  git fetch origin "${SETUP_REF}" && git checkout "${SETUP_REF}"
  cd -
fi

echo -e "\nInstallation starting...\n"
source ~/.local/share/arch-linux-setup/install.sh
