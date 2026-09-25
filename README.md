# DarkSun

Opinionated, standalone Arch Linux system: Sway, one command from a bare
`archinstall` to a fully configured desktop.

```bash
curl -fsSL https://raw.githubusercontent.com/MarioFronza/dark-sun/main/boot.sh | bash
```

Starting from a blank machine? See [`QUICKSTART.md`](QUICKSTART.md)
(install media through a working, SSH-reachable base system, then the
command above).

## What it installs

- [`packages/`](packages/README.md) — pacman/AUR packages, GPU driver
  auto-detected via `lspci`
- [`udev/`](udev/README.md) — system udev rules (USB wake-on-connect,
  battery threshold), only on a laptop chassis
- [`alacritty/`](alacritty/README.md) — terminal
- [`zsh/`](zsh/README.md) — shell
- [`tmux/`](tmux/README.md) — terminal multiplexer
- [`git/`](git/README.md) — git config
- [`github/`](github/README.md) — gh CLI config
- [`mise/`](mise/README.md) — language/tool versions
- [`nvim/`](nvim/README.md) — editor
- [`sway/`](sway/README.md) — Sway
- [`waybar/`](waybar/README.md) — status bar
- [`fuzzel/`](fuzzel/README.md) — app launcher
- [`mako/`](mako/README.md) — notifications
- [`swayosd/`](swayosd/README.md) — volume/brightness OSD
- [`swaylock/`](swaylock/README.md) — lock screen
- [`claude/`](claude/README.md) — Claude Code config

Each module's README documents what its `install/NN-*.sh` script does and
how to redo that step by hand if you ever need to.

## What it does not do

- Disk partitioning, encryption, bootloader — `archinstall` stays manual,
  see `QUICKSTART.md`.
- Enabling network/bluetooth services — run `packages/enable-services.sh`
  yourself, from the machine's own console (it takes the network down).
- Anything account-bound: SSH key generation/upload, `gh auth login` —
  `install.sh` prints what's left at the end.
