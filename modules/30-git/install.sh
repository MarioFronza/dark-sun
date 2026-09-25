cd "$(dirname "${BASH_SOURCE[0]}")"

echo "==> Copying git config"
mkdir -p ~/.config/git
cp config ignore ~/.config/git/

if [[ ! -f ~/.config/git/identity ]]; then
  cp identity.example ~/.config/git/identity
fi
