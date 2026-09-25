# waybar

Status bar for [`../sway/`](../sway/README.md), started by sway itself
(`bar { swaybar_command waybar }` in [`../sway/config`](../sway/config)).
Based on the stock config shipped by the `waybar` package
(`/etc/xdg/waybar/`), trimmed down and restyled.

`sway/workspaces`, `sway/mode` and `sway/scratchpad` on the left, `clock`
centered. On the right: `pulseaudio`, `network`, `custom/power-profile`,
`cpu`, `memory`, `battery`, separated by a dim `│`.

View-only by design: workspace and volume scrolling and clicking are
disabled, since switching workspaces and adjusting volume already have
keyboard binds in [`../sway/config`](../sway/config).

Colors are [Tokyo Night](https://github.com/folke/tokyonight.nvim) (Night
variant).

`waybar` is installed via [`../packages/`](../packages/README.md).

## Copy

```bash
mkdir -p ~/.config/waybar
cp waybar/config.jsonc waybar/style.css waybar/power-profile.sh ~/.config/waybar/
```

## Apply

```bash
swaymsg reload
```

(sway owns the waybar process through its `bar` block — don't run
`waybar &` by hand, it leaves a second instance alongside the one sway
manages)

## Notes

- Icons are Nerd Font glyphs from the private-use area — **copy the
  files with `cp`, don't retype them**. Hand-typing them, even through an
  editor, can silently turn a glyph into an empty string with no visible
  diff, which looks identical in most terminals but makes that bar
  segment disappear. Not obvious until checked byte by byte (`xxd`, or
  `python3 -c "open(path,'rb').read()"`).
- `custom/power-profile` (`power-profile.sh`) replaces the stock
  `power-profiles-daemon` module, which cycles the profile on click with
  no option to disable that, against the view-only design above. The
  script only reads the active profile over dbus and prints it, with no
  click handler at all.
