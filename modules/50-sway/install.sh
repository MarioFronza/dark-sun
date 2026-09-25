cd "$(dirname "${BASH_SOURCE[0]}")"

echo "==> Copying sway config"
mkdir -p ~/.config/sway
cp config ~/.config/sway/config
cp -r scripts ~/.config/sway/
