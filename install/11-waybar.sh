DARK_SUN=~/.local/share/dark-sun

echo "==> Copying waybar config"
mkdir -p ~/.config/waybar
cp "$DARK_SUN"/waybar/config.jsonc "$DARK_SUN"/waybar/style.css "$DARK_SUN"/waybar/power-profile.sh ~/.config/waybar/
