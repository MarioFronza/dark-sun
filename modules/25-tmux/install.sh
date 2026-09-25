cd "$(dirname "${BASH_SOURCE[0]}")"

echo "==> Copying tmux config"
mkdir -p ~/.config/tmux
cp tmux.conf ~/.config/tmux/tmux.conf

if [[ ! -d ~/.config/tmux/plugins/tpm ]]; then
  echo "==> Cloning tpm"
  git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
fi
