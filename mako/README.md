# mako

Notification daemon, started by [`../sway/config`](../sway/config)
(`exec mako`). Handles freedesktop notifications (`notify-send`,
app popups) — separate from [`swayosd`](../swayosd/README.md), which
only shows volume/brightness/lock-key OSDs. `mako` itself is
installed via [`../packages/`](../packages/README.md).

Colors are [Tokyo Night](https://github.com/folke/tokyonight.nvim) (Night
variant), same as the rest of the setup.

## Copy

```bash
mkdir -p ~/.config/mako
cp mako/config ~/.config/mako/config
```

## Apply

```bash
makoctl reload
```

(or restart Sway/re-login for the `exec mako` in sway config to
pick it up fresh)
