DARK_SUN=~/.local/share/dark-sun

echo "==> Copying alacritty config"
mkdir -p ~/.config/alacritty
cp "$DARK_SUN"/alacritty/alacritty.toml "$DARK_SUN"/alacritty/tokyo-night.toml ~/.config/alacritty/
