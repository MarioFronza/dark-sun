cd "$(dirname "${BASH_SOURCE[0]}")"

echo "==> Copying alacritty config"
mkdir -p ~/.config/alacritty
cp alacritty.toml tokyo-night.toml ~/.config/alacritty/
