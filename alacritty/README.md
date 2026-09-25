# alacritty

Terminal. `tokyo-night.toml` holds the palette and is imported by
`alacritty.toml`, same theme (Night variant) as
[`swaylock`](../swaylock/README.md), [`fuzzel`](../fuzzel/README.md),
[`mako`](../mako/README.md), [`swayosd`](../swayosd/README.md),
[`waybar`](../waybar/README.md) and [`nvim`](../nvim/README.md). Colours
come from [zatchheems/tokyo-night-alacritty-theme](https://github.com/zatchheems/tokyo-night-alacritty-theme),
with the foreground raised to `#c0caf5` to match the rest.

`alacritty` and `ttf-jetbrains-mono-nerd` (the font) are installed via
[`../packages/`](../packages/README.md).

## Copy

```bash
mkdir -p ~/.config/alacritty
cp alacritty/alacritty.toml alacritty/tokyo-night.toml ~/.config/alacritty/
```

## Apply

Restart alacritty, or `Ctrl+Shift+,` if `live_config_reload` is on.

## Notes

- `osc52 = "CopyPaste"` lets a program inside the terminal drive the
  system clipboard. That is what carries a yank out of Neovim running over
  ssh, together with the matching `terminal-features` line in
  [`../tmux/`](../tmux/README.md).
- The `Return` bindings send CSI u sequences, so Neovim can tell
  `Shift+Enter` and `Alt+Shift+Enter` apart from a plain `Enter`, which
  the terminal would otherwise collapse into the same byte.
- `TERM` is pinned to `xterm-256color` rather than alacritty's own
  terminfo. It costs the title-setting capability locally and buys a
  terminal that is recognised on remote hosts that have no `alacritty`
  entry.
