DARK_SUN=~/.local/share/dark-sun

echo "==> Copying sway config"
mkdir -p ~/.config/sway
cp "$DARK_SUN/sway/config" ~/.config/sway/config
cp -r "$DARK_SUN/sway/scripts" ~/.config/sway/
