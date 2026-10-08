cd "$(dirname "${BASH_SOURCE[0]}")"

DOTFILES_REPO="${DOTFILES_REPO:-https://github.com/MarioFronza/dotfiles.git}"

echo "==> Cloning dotfiles"
[[ -d ~/dotfiles ]] || git clone "$DOTFILES_REPO" ~/dotfiles

echo "==> Stowing dotfiles"
mapfile -t packages < <(find ~/dotfiles -maxdepth 1 -mindepth 1 -type d ! -name '.*' ! -name 'test' -printf '%f\n')
stow --no-folding -d ~/dotfiles -t ~ "${packages[@]}"

echo "==> Copying claude settings"
cp ~/dotfiles/claude/.claude/settings.json ~/.claude/settings.json
