DARK_SUN=~/.local/share/dark-sun

echo "==> Copying swaylock config"
mkdir -p ~/.config/swaylock
cp "$DARK_SUN/swaylock/config" ~/.config/swaylock/config
