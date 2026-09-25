DARK_SUN=~/.local/share/dark-sun

# Strips full-line and inline comments, keeping just the package name per line.
pkgs() {
  sed 's/#.*//' "$1" | awk 'NF{print $1}'
}

echo "==> Enabling multilib"
if ! grep -q '^\[multilib\]' /etc/pacman.conf; then
  sudo sed -i '/^#\[multilib\]/,/^#Include = \/etc\/pacman.d\/mirrorlist/ s/^#//' /etc/pacman.conf
fi

echo "==> Updating package databases"
sudo pacman -Sy

echo "==> Installing official repo packages"
mapfile -t official_pkgs < <(pkgs "$DARK_SUN/packages/pacman.txt")
sudo pacman -S --needed "${official_pkgs[@]}"

echo "==> Detecting GPU"
declare -A gpu_files=([Intel]=gpu-intel.txt [AMD]=gpu-amd.txt [NVIDIA]=gpu-nvidia.txt)
for vendor in "${!gpu_files[@]}"; do
  if lspci | grep -qiE "(VGA|3D|Display).*${vendor}"; then
    echo "==> Installing $vendor GPU driver"
    mapfile -t gpu_pkgs < <(pkgs "$DARK_SUN/packages/${gpu_files[$vendor]}")
    sudo pacman -S --needed "${gpu_pkgs[@]}"
  fi
done

if ! command -v yay &>/dev/null; then
  echo "==> Bootstrapping yay"
  tmpdir=$(mktemp -d)
  git clone https://aur.archlinux.org/yay.git "$tmpdir/yay"
  (cd "$tmpdir/yay" && makepkg -si --noconfirm)
  rm -rf "$tmpdir"
fi

echo "==> Installing AUR packages"
mapfile -t aur_pkgs < <(pkgs "$DARK_SUN/packages/aur.txt")
# /usr/bin first: some PKGBUILDs call bare `python`/etc. expecting system
# site-packages (e.g. python-installer). mise's activate hook prepends its
# own tool bin dirs ahead of /usr/bin, which silently breaks those builds.
PATH="/usr/bin:$PATH" yay -S --needed "${aur_pkgs[@]}"
