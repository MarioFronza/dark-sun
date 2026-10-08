# DarkSun

My personal Arch Linux setup: Sway, Tokyo Night, one command from a bare
`archinstall` to a configured system. Built for my own machines and taste,
not as a general-purpose distribution.

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
| `10-udev` | USB wake-on-connect, battery charge thresholds |
| `15-dotfiles` | clones [dotfiles](https://github.com/MarioFronza/dotfiles) to `~/dotfiles` and stows every package into `$HOME` |
| `20-zsh` | sets zsh as the login shell |
| `25-tmux` | clones tpm |
| `30-git` | seeds `~/.config/git/identity` from the dotfiles template |
| `40-mise` | installs language/tool versions |

Every file under `$HOME` comes from dotfiles as a symlink, so editing a
config on the machine edits the clone. Commit and push from `~/dotfiles`.
Claude Code's `settings.json` is the one exception: it is copied once,
because Claude Code rewrites it at runtime.

## Migrating a configured machine

A machine set up before the switch to stow has real files where the
symlinks go, and stow refuses to replace them. Move them out of the way,
then re-run:

```bash
backup=~/dotfiles-backup-$(date +%F)
mkdir -p "$backup"
cd ~/dotfiles
for pkg in */; do
  pkg=${pkg%/}; [[ $pkg == test ]] && continue
  stow --no-folding -n -v -t ~ "$pkg" 2>&1 \
    | sed -n 's/.* over existing target \(.*\) since .*/\1/p' \
    | while read -r file; do mkdir -p "$backup/$(dirname "$file")"; mv ~/"$file" "$backup/$file"; done
done
source ~/.local/share/dark-sun/install.sh
```

Diff anything you changed locally against `$backup` afterwards and commit
it to dotfiles.

## What it deliberately does not do

- Disk partitioning, encryption, bootloader — `archinstall` stays manual.
- Enabling network/bluetooth services — run
  `modules/05-packages/enable-services.sh` from the machine's own console,
  since it takes the network down.
- Anything account-bound: SSH keys, `gh auth login`. `install.sh` prints
  what is left when it finishes.
