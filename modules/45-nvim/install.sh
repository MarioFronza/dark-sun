cd "$(dirname "${BASH_SOURCE[0]}")"

if [[ ! -d ~/.config/nvim ]]; then
  echo "==> Cloning LazyVim starter"
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  rm -rf ~/.config/nvim/.git
fi

# LazyVim rewrites lazyvim.json itself, so mirror it back here after
# changing extras.
echo "==> Copying nvim overrides"
cp lazyvim.json ~/.config/nvim/lazyvim.json
mkdir -p ~/.config/nvim/lua/plugins
cp lua/plugins/*.lua ~/.config/nvim/lua/plugins/
