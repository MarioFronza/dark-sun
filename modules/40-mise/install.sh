cd "$(dirname "${BASH_SOURCE[0]}")"

echo "==> Copying mise config"
mkdir -p ~/.config/mise
cp config.toml ~/.config/mise/config.toml

echo "==> Installing mise tool versions (ruby, php, python and erlang build from source)"
mise install
