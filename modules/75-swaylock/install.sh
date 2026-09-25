cd "$(dirname "${BASH_SOURCE[0]}")"

echo "==> Copying swaylock config"
mkdir -p ~/.config/swaylock
cp config ~/.config/swaylock/config
