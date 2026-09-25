DARK_SUN=~/.local/share/dark-sun

echo "==> Copying mise config"
mkdir -p ~/.config/mise
cp "$DARK_SUN/mise/config.toml" ~/.config/mise/config.toml

echo "==> Installing mise tool versions (this takes a while)"
mise install
