cd "$(dirname "${BASH_SOURCE[0]}")"

echo "==> Copying swayosd config"
mkdir -p ~/.config/swayosd
cp config.toml style.css ~/.config/swayosd/
