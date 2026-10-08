cd "$(dirname "${BASH_SOURCE[0]}")"

DOTFILES_REPO="${DOTFILES_REPO:-https://github.com/MarioFronza/dotfiles.git}"

echo "==> Cloning dotfiles"
[[ -d ~/dotfiles ]] || git clone "$DOTFILES_REPO" ~/dotfiles

echo "==> Stowing dotfiles"
stow --no-folding -d ~/dotfiles -t ~ sway
