cd "$(dirname "${BASH_SOURCE[0]}")"

echo "==> Copying mako config"
mkdir -p ~/.config/mako
cp config ~/.config/mako/config
