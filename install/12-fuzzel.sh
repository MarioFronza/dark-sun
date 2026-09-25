DARK_SUN=~/.local/share/dark-sun

echo "==> Copying fuzzel config"
mkdir -p ~/.config/fuzzel
cp "$DARK_SUN/fuzzel/fuzzel.ini" ~/.config/fuzzel/fuzzel.ini
