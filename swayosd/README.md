# swayosd

On-screen display for volume, mic, brightness, and lock keys — started
by [`../sway/config`](../sway/config) (`exec swayosd-server`), driven
by `swayosd-client` calls in the volume/brightness keybinds there.
Separate from [`mako`](../mako/README.md), which only handles app
notifications. `swayosd` itself is installed via
[`../packages/`](../packages/README.md).

Volume is capped at 100% (`max_volume = 100` in `config.toml`) — no
boost past unity gain.

Colors are [Tokyo Night](https://github.com/folke/tokyonight.nvim) (Night
variant), same as the rest of the setup.

## Copy

```bash
mkdir -p ~/.config/swayosd
cp swayosd/config.toml swayosd/style.css ~/.config/swayosd/
```

## Apply

Restart Sway/re-login for the `exec swayosd-server` in sway config to
pick it up, or run `swayosd-server &` by hand for the current session.

## Notes

- The `SwayOSD LibInput Backend isn't available` warning on startup is
  expected without the systemd-managed root helper — it only affects
  auto-showing the OSD when Caps/Num/Scroll Lock changes via hardware,
  not volume/brightness.
