DARK_SUN=~/.local/share/dark-sun

echo "==> Copying gh config"
mkdir -p ~/.config/gh
cp "$DARK_SUN/github/config.yml" ~/.config/gh/config.yml
