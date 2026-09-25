cd "$(dirname "${BASH_SOURCE[0]}")"

echo "==> Copying gh config"
mkdir -p ~/.config/gh
cp config.yml ~/.config/gh/config.yml
