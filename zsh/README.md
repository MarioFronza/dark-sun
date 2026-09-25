# zsh

`~/.zshrc` only sources the files in `~/.config/zsh/`: `shell` (history,
options, `PATH`), `init` (tool hooks), `envs`, `aliases`, `functions`,
`prompt`, `bindkeys`.

`~/.zprofile` is what starts the desktop: logging in on tty1 replaces the
shell with [`sway`](../sway/README.md). There is no display manager.

Installed via [`../packages/`](../packages/README.md): `zsh`,
`zsh-autosuggestions`, `zsh-syntax-highlighting`, `starship` (prompt),
`zoxide`, `fzf`, `bat`, `gum`, `mise`, `atuin` (history, `Ctrl+R`).
`tmux`, `ddcutil` and `git` back a few aliases each.

## Copy

```bash
mkdir -p ~/.config/zsh
cp zsh/shell zsh/init zsh/envs zsh/aliases zsh/functions zsh/prompt zsh/bindkeys ~/.config/zsh/
cp zsh/zshrc ~/.zshrc
cp zsh/zprofile ~/.zprofile
cp zsh/inputrc ~/.inputrc
```

## Apply

```bash
chsh -s /usr/bin/zsh
```

Takes effect on next login. `exec zsh` for the current session.

## Notes

- `~/.config/zsh/secrets` is sourced if present, never tracked here.
- Git aliases live in [`../git/config`](../git/README.md), not here.
