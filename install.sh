# Exit immediately if a command exits with a non-zero status
set -e

# Give people a chance to retry running the installation
trap 'echo "DarkSun installation failed! You can retry by running: source ~/.local/share/dark-sun/install.sh"' ERR

# Install everything, in order
for f in ~/.local/share/dark-sun/install/*.sh; do source "$f"; done

# Ensure locate is up to date now that everything has been installed
sudo updatedb

cat <<'EOF'

==> DarkSun install done. A few things are left, all interactive:

  git/README.md     - edit ~/.config/git/identity, generate an SSH key,
                       add it to GitHub (Authentication + Signing), write
                       ~/.config/git/allowed_signers
  gh auth login      - pick SSH when it asks for the protocol
  packages/enable-services.sh
                       - from the machine's own console, not over SSH
                       (takes the network down)
  Claude Code        - /theme to pick tokyo_night, it's copied in but
                       not selected automatically
EOF

gum confirm "Reboot to apply all settings?" && reboot
