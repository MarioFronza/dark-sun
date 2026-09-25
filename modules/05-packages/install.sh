cd "$(dirname "${BASH_SOURCE[0]}")"

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
mapfile -t official_pkgs < <(pkgs pacman.txt)
sudo pacman -S --needed --noconfirm "${official_pkgs[@]}"

echo "==> Detecting GPU"
declare -A gpu_files=([Intel]=gpu-intel.txt [AMD]=gpu-amd.txt [NVIDIA]=gpu-nvidia.txt)
for vendor in "${!gpu_files[@]}"; do
  if lspci | grep -qiE "(VGA|3D|Display).*${vendor}"; then
    echo "==> Installing $vendor GPU driver"
    mapfile -t gpu_pkgs < <(pkgs "${gpu_files[$vendor]}")
    sudo pacman -S --needed --noconfirm "${gpu_pkgs[@]}"
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
mapfile -t aur_pkgs < <(pkgs aur.txt)
# /usr/bin first: some PKGBUILDs call bare `python`/etc. expecting system
# site-packages (e.g. python-installer). mise's activate hook prepends its
# own tool bin dirs ahead of /usr/bin, which silently breaks those builds.
# Same guard is needed for any hand-run `yay -S` outside this script.
PATH="/usr/bin:$PATH" yay -S --needed --noconfirm "${aur_pkgs[@]}"

# iwd, systemd-networkd, systemd-resolved, bluetooth and tailscaled are
# installed here but deliberately left stopped: enabling them takes the
# network down, which kills the SSH session this usually runs over.
# enable-services.sh turns them on, from the machine's own console.
