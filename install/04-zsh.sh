DARK_SUN=~/.local/share/dark-sun

echo "==> Copying zsh config"
mkdir -p ~/.config/zsh
cp "$DARK_SUN"/zsh/shell "$DARK_SUN"/zsh/init "$DARK_SUN"/zsh/envs "$DARK_SUN"/zsh/aliases "$DARK_SUN"/zsh/functions "$DARK_SUN"/zsh/prompt "$DARK_SUN"/zsh/bindkeys ~/.config/zsh/
cp "$DARK_SUN"/zsh/zshrc ~/.zshrc
cp "$DARK_SUN"/zsh/zprofile ~/.zprofile
cp "$DARK_SUN"/zsh/inputrc ~/.inputrc

echo "==> Setting zsh as login shell"
sudo chsh -s /usr/bin/zsh "$USER"
