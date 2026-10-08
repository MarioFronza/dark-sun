cd "$(dirname "${BASH_SOURCE[0]}")"

echo "==> Copying sway config"
mkdir -p ~/.config/sway
cp config dark-sun.jpg ~/.config/sway/
cp -r scripts ~/.config/sway/
