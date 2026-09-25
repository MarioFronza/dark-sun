# packages

Every pacman/AUR package this machine had installed, mapped for a fresh
Arch install. GPU drivers are split out by vendor so you only install
the one that matches the actual hardware.

```bash
cd packages
./install.sh [amd|intel|nvidia]
```

`base`, `linux`, and `linux-firmware` aren't listed anywhere — those come
from the Arch install itself. Review the bootloader section in
`pacman.txt` too (assumes Limine; swap for grub/systemd-boot if that's
what the installer set up).

`install.sh` forces `/usr/bin` to the front of `PATH` for the AUR step.
Without it, [`mise`](../mise/README.md)'s `activate` hook (already
running by the time you get here) puts its own tool bin dirs ahead of
`/usr/bin`, so a bare `python`/`node`/etc. inside a PKGBUILD's
`package()` silently resolves to mise's version instead of the system
one — missing modules like `python-installer` that only exist in the
system interpreter's site-packages. If you ever run `yay` for an AUR
package by hand outside this script, prefix it the same way:

```bash
PATH="/usr/bin:$PATH" yay -S --needed <package>
```

## Files

- `pacman.txt` / `aur.txt` — everything compositor-agnostic
- `gpu-amd.txt` / `gpu-intel.txt` / `gpu-nvidia.txt` — pick one, open-source
  drivers only (see the comments in `gpu-nvidia.txt` about `nvidia-open`
  needing a Turing-or-newer card)
- `enable-services.sh` — `install.sh` installs `iwd`, `systemd-networkd`,
  `systemd-resolved`, `bluetooth` and `tailscaled` but leaves every one of
  them stopped. This turns them on. It takes the network with it, so run
  it from the machine's own console, not over ssh.
- [`CATALOG.md`](CATALOG.md) — every package above with a one-line
  description, grouped the same way as the `.txt` files. Regenerate it
  after editing any package list (pull descriptions from `pacman -Si`
  for repo packages, the AUR RPC `info` endpoint for AUR ones).

## Dropped entirely

A handful of installed packages had no public AUR or official-repo
equivalent under the same name (checked against the AUR API, not
guessed): a wallpaper-based dynamic theming tool (moot now that everything
here is hardcoded to Tokyo Night), an Apple Studio Display brightness
tool, and two small niche CLI utilities. Get them from their own GitHub
releases directly if you want them.
