cd "$(dirname "${BASH_SOURCE[0]}")"

echo "==> Copying fuzzel config"
mkdir -p ~/.config/fuzzel
cp fuzzel.ini ~/.config/fuzzel/fuzzel.ini
