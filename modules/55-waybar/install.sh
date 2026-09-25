cd "$(dirname "${BASH_SOURCE[0]}")"

echo "==> Copying waybar config"
mkdir -p ~/.config/waybar
cp config.jsonc style.css power-profile.sh ~/.config/waybar/
