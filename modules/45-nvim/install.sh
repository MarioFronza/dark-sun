cd "$(dirname "${BASH_SOURCE[0]}")"

# LazyVim rewrites lazyvim.json itself, so mirror it back here after
# changing extras.
echo "==> Copying nvim config"
mkdir -p ~/.config/nvim
cp -r init.lua lazyvim.json lua ~/.config/nvim/
