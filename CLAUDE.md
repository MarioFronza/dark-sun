# DarkSun

Arch installer: fresh `archinstall` to configured desktop, one command. Config
under `$HOME` comes from [dotfiles](https://github.com/MarioFronza/dotfiles)
via GNU Stow. This file describes the **target state**; code is mid-migration,
and when it disagrees with this file, this file is the goal.

## Boundary

**dotfiles owns everything under `$HOME`.** DarkSun owns everything else.

- Here: packages, GPU drivers, multilib, system files (`/etc`, udev,
  services), login shell, then clone dotfiles and stow it.
- Never carry a copy of a `$HOME` config file. If a config exists in both
  repos, it's a bug.

## Flow

```
curl .../boot.sh | bash
  boot.sh     install git, clone dark-sun to ~/.local/share/dark-sun
  install.sh  run modules/*/install.sh in order
    packages  pacman + AUR + GPU (lspci) + multilib + stow
    system    udev (laptop only), /etc files, chsh
    dotfiles  clone dotfiles to ~/dotfiles, stow --no-folding the package set
  print the account-bound leftovers, offer reboot
```

- Modules: `modules/NN-name/install.sh`, numbered in steps of 5,
  self-contained. `15-dotfiles` clones and stows; later modules only do what
  stow cannot (chsh, tpm clone, git identity seed, mise install).
- Tests: `bash test/dotfiles.sh` and `bash test/modules.sh`, against the
  sibling `../dotfiles` clone (override with `DOTFILES_REPO`).
- Hardware-agnostic: detect, never ask. Skip silently what doesn't apply.
- Re-runnable: running `install.sh` twice is safe (`--needed`, `stow -R`).
- Out of scope: partitioning, encryption, bootloader (archinstall), enabling
  network services (`enable-services.sh`, console only), anything
  account-bound (SSH keys, `gh auth login`).

## Conventions

- Bash: `set -euo pipefail`, `cd "$(dirname "${BASH_SOURCE[0]}")"` at module top.
- Docs: README + QUICKSTART at the root. No per-module READMEs.
- Conventional commit prefixes. A change spanning both repos is two commits,
  dotfiles first (DarkSun consumes it).
