cd "$(dirname "${BASH_SOURCE[0]}")"

echo "==> Copying zsh config"
mkdir -p ~/.config/zsh
cp shell init envs aliases functions prompt bindkeys ~/.config/zsh/
cp zshrc ~/.zshrc
cp zprofile ~/.zprofile
cp inputrc ~/.inputrc

echo "==> Setting zsh as login shell"
sudo chsh -s /usr/bin/zsh "$USER"
