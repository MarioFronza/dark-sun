DARK_SUN=~/.local/share/dark-sun

echo "==> Copying git config"
mkdir -p ~/.config/git
cp "$DARK_SUN"/git/config "$DARK_SUN"/git/ignore ~/.config/git/
if [[ ! -f ~/.config/git/identity ]]; then
  cp "$DARK_SUN/git/identity.example" ~/.config/git/identity
fi
