cd "$(dirname "${BASH_SOURCE[0]}")"

echo "==> Setting zsh as login shell"
sudo chsh -s /usr/bin/zsh "$USER"
