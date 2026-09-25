# Exit immediately if a command exits with a non-zero status
set -e

# Give people a chance to retry running the installation
trap 'echo "DarkSun installation failed! You can retry by running: source ~/.local/share/dark-sun/install.sh"' ERR

# The run spans 30-90 minutes because mise builds several toolchains from
# source, so the initial sudo timestamp expires long before the end. Refresh it
# in the background, and stop when this shell does.
sudo -v
while true; do sudo -n true; sleep 50; done 2>/dev/null &
sudo_keepalive=$!
trap 'kill "$sudo_keepalive" 2>/dev/null' EXIT

# Every module is self-contained: modules/NN-name/install.sh plus the files
# it copies. Numbered in dependency order, in steps of 5 to leave room.
for f in ~/.local/share/dark-sun/modules/*/install.sh; do source "$f"; done

sudo updatedb

cat <<'EOF'

==> DarkSun install done. What is left is interactive, or takes the network
    down, so none of it runs here:

  1. Fill in ~/.config/git/identity (name, email, signing key path).

  2. Generate an SSH key if you have none, add the public key to GitHub
     under both Authentication and Signing, then map it for local
     verification:

       ssh-keygen -t ed25519 -C "you@example.com" -f ~/.ssh/id_ed25519
       printf '%s namespaces="git" %s\n' \
         "$(git config user.email)" "$(cut -d' ' -f1,2 ~/.ssh/id_ed25519.pub)" \
         > ~/.config/git/allowed_signers

  3. gh auth login, picking SSH as the protocol.

  4. modules/05-packages/enable-services.sh, from the machine's own
     console — it takes the network with it.

  5. /theme inside Claude Code, to pick tokyo_night.
EOF

gum confirm "Reboot to apply all settings?" && reboot
