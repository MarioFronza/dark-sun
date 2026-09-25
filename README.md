# DarkSun

Opinionated, standalone Arch Linux system: Sway, Tokyo Night, one command
from a bare `archinstall` to a configured desktop. Works on any laptop or
desktop — hardware-specific parts detect what they need and skip themselves
when it isn't there.

```bash
curl -fsSL https://raw.githubusercontent.com/MarioFronza/dark-sun/main/boot.sh | bash
```

Starting from blank hardware? See [`QUICKSTART.md`](QUICKSTART.md): install
media through a working, SSH-reachable base system, then the command above.

## How it works

`boot.sh` installs git, clones this repo to `~/.local/share/dark-sun` and
sources `install.sh`, which runs every `modules/*/install.sh` in order.

Each module is one self-contained directory: the script plus exactly the
files it copies. Adding or removing a module is adding or removing a
directory. They are numbered in dependency order, in steps of 5.

| Module | What it does |
|---|---|
| `05-packages` | pacman + AUR, GPU driver auto-detected via `lspci` |
| `10-udev` | USB wake-on-connect, battery charge thresholds — laptops only |
| `15-alacritty` | terminal |
| `20-zsh` | shell, and sets it as the login shell |
| `25-tmux` | multiplexer + tpm |
| `30-git` | git config |
| `35-github` | gh CLI config |
| `40-mise` | language/tool versions |
| `45-nvim` | LazyVim + overrides |
| `50-sway` | compositor, monitor/lid handling |
| `55-waybar` | status bar |
| `60-fuzzel` | app launcher |
| `65-mako` | notifications |
| `70-swayosd` | volume/brightness OSD |
| `75-swaylock` | lock screen |
| `80-claude` | Claude Code config |

## Hardware differences

Nothing has to be passed in or edited by hand:

- **GPU** — every vendor found on the PCI bus gets its driver, so hybrid
  graphics installs both.
- **Laptop vs desktop** — `10-udev` installs nothing unless the DMI chassis
  type says laptop, and `50-sway`'s monitor script exits immediately when
  there is no built-in panel, leaving sway's own multi-monitor defaults.

## What it deliberately does not do

- Disk partitioning, encryption, bootloader — `archinstall` stays manual.
- Enabling network/bluetooth services — run
  `modules/05-packages/enable-services.sh` from the machine's own console,
  since it takes the network down.
- Anything account-bound: SSH keys, `gh auth login`. `install.sh` prints
  what is left when it finishes.
