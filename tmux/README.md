# tmux

Prefix is `Ctrl-a`. Status bar on top, colours taken from the terminal
palette (`blue`, `brightblack`) rather than hardcoded hex, so it follows
whatever theme [`alacritty`](../alacritty/README.md) is on.

`Ctrl+hjkl` crosses panes and vim splits alike through
`vim-tmux-navigator`, which is also a plugin on the
[`nvim`](../nvim/README.md) side.

`tmux` is installed via [`../packages/`](../packages/README.md).

## Setup

[tpm](https://github.com/tmux-plugins/tpm) (plugin manager) isn't a
package — clone it where tpm itself installs everything else:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

## Copy

```bash
mkdir -p ~/.config/tmux
cp tmux/tmux.conf ~/.config/tmux/tmux.conf
```

## Apply

Start tmux, then install the plugins from inside a session with
`prefix + I`. Already running? `prefix + r` reloads the config first.

## Notes

- Plugins: `tpm`, `vim-tmux-navigator`, `tmux-resurrect`,
  `tmux-continuum`. Continuum saves every 15 minutes and restores on
  start, so a reboot comes back to the same windows.
- `@status-left-idle` and `@window-status-idle` hold the normal status
  colours. `claude/hooks/notify-ready.sh` overwrites both with red to
  flag a finished run, and the `after-select-window` and
  `client-session-changed` hooks paint them back from those two options.
