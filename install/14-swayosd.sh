DARK_SUN=~/.local/share/dark-sun

echo "==> Copying swayosd config"
mkdir -p ~/.config/swayosd
cp "$DARK_SUN"/swayosd/config.toml "$DARK_SUN"/swayosd/style.css ~/.config/swayosd/
