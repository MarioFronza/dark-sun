DARK_SUN=~/.local/share/dark-sun

if [[ ! -d ~/.config/nvim ]]; then
  echo "==> Cloning LazyVim starter"
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  rm -rf ~/.config/nvim/.git
fi

echo "==> Copying nvim overrides"
cp "$DARK_SUN/nvim/lazyvim.json" ~/.config/nvim/lazyvim.json
mkdir -p ~/.config/nvim/lua/plugins
cp "$DARK_SUN"/nvim/lua/plugins/*.lua ~/.config/nvim/lua/plugins/
