cd "$(dirname "${BASH_SOURCE[0]}")"

if [[ ! -d ~/.config/tmux/plugins/tpm ]]; then
  echo "==> Cloning tpm"
  git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
fi
