# sway

Sway config for the ThinkPad. Status bar is [`waybar`](../waybar/README.md),
not the native swaybar.

Terminal is `alacritty` (`$term`), launcher bound to `$mod+space` is
[`fuzzel`](../fuzzel/README.md), notifications are
[`mako`](../mako/README.md), volume/brightness OSD is
[`swayosd`](../swayosd/README.md). `sway` itself and everything the config
calls (`swaybg`, `swayidle`, `swaylock`, `grim`, `playerctl`, `jq`, `gum`,
`bluetui`, `impala`, `wiremix`) are installed via
[`../packages/`](../packages/README.md).

## Copy

```bash
mkdir -p ~/.config/sway
cp sway/config ~/.config/sway/config
cp -r sway/scripts ~/.config/sway/
```

## Apply

```bash
swaymsg reload
```

## Notes

- **Wallpaper**: `output * bg ~/Pictures/Wallpapers/dark-sun.jpg fill` is
  hardcoded to my own file, which this repo does not ship. Point it at
  whatever you have, or swap it for a flat colour with `output * bg
  #1a1b26 solid_color` — a missing file just leaves the background
  unpainted.
- **Ctrl/CapsLock swap is ThinkPad-specific**: the `input
  "1:1:AT_Translated_Set_2_keyboard" { xkb_options ctrl:swapcaps }` block
  only swaps the *internal* keyboard, so an external keyboard isn't
  affected. On another machine, find the right device name with `swaymsg
  -t get_inputs` and update the identifier, or drop the block entirely.
- Volume/mic/brightness keys go through `swayosd-client`, which shows
  the on-screen indicator and wraps WirePlumber/brightnessctl itself —
  capped at 100% volume (`max_volume` in
  [`../swayosd/`](../swayosd/README.md)), no boost past unity gain.
- `$mod+Shift+b` opens `bluetui` in a terminal for Bluetooth management.
- `$mod+Shift+p` opens `perf` (the `zsh/functions` TUI over the
  power-profiles-daemon dbus API) in a terminal, to switch CPU perf
  profile — the waybar icon (`custom/power-profile`) is read-only by
  design, so this is the only way to change it.
- `$mod+Escape` opens `power` (the `zsh/functions` TUI for
  Lock/Suspend/Reboot/Poweroff) in a terminal.
- `$mod+Shift+w` opens `impala` (wifi), `$mod+Shift+a` opens `wiremix`
  (audio) — same `zsh/aliases` tools as `wifi`/`audio` from a terminal.
- **Mouse has no acceleration curve** (`input type:pointer { accel_profile
  flat }`) — 1:1 with physical movement.
- **Multi-monitor and lid switch**: `scripts/monitor-setup.sh` is the only
  thing that configures outputs. It runs once at Sway startup, on every
  output hotplug (via its own `swaymsg -t subscribe`), and on both lid
  transitions (`bindswitch ... exec monitor-setup.sh once`). Whichever
  monitor isn't the laptop panel (`eDP-1`) becomes the main surface for
  workspaces 1-9, set to its highest advertised resolution (refresh rate
  as tiebreaker) — no per-monitor identifier or hardcoded `mode` block
  needed. Workspace 10 is assigned `eDP-1 <external>`, so it falls back to
  the external monitor whenever the panel is off.
- **The hotplug loop must never react to its own events.** Applying a
  layout emits `output` events, so a naive `subscribe | while read` that
  re-applies on every event feeds itself: each pass emits roughly three
  more events than it consumes. Unplugging and replugging quickly used to
  turn that into an event storm, which saturated Sway's main loop with
  modesets and starved every client of frame callbacks — Firefox, Spotify
  and Alacritty would stop repainting and look frozen, with only a reboot
  to recover. The loop therefore compares a fingerprint of *connected
  output names plus lid state* and re-applies only when that changes.
  `layout()` only enables, disables, moves and re-modes outputs, so it can
  never move its own fingerprint.
- **That guard is deliberately blind to resume**, which needs its own trigger.
  Waking restores Sway's default output config — the external monitor drops to
  its preferred mode (60Hz instead of 120Hz here) and the panel comes back on
  even with the lid shut — but nothing connects or disconnects, so the
  fingerprint never moves. `idle-lock.sh` therefore hands swayidle an
  `after-resume` hook that re-runs `monitor-setup.sh once`.
- **There must always be at least one active output.** Sway emits no frame
  callbacks with zero outputs, which freezes clients the same way. Closing
  the lid while docked disables `eDP-1`; unplugging the external monitor
  from that state used to leave nothing active at all, so `layout()` now
  re-enables the panel whenever no external monitor is present.
- Docked lid close disables `eDP-1` rather than suspending, because
  systemd-logind's `HandleLidSwitchDocked=ignore` default means no suspend
  happens and the panel would otherwise stay lit. Undocked, the panel is
  left strictly alone and the machine suspends normally (the panel blanks
  via hardware, not sway) — `layout()` issues no command at all when
  `eDP-1` is already active, because a redundant modeset there raced
  `idle-lock.sh`'s `before-sleep` lock and sometimes resumed to a black,
  unresponsive screen. See
  [`../swaylock/README.md`](../swaylock/README.md) for the lock itself.
- Unplugging the external monitor while the lid is closed is logind's
  business, not sway's: the machine stops counting as docked and suspends on
  the spot. Plugging back in only wakes it because of the USB rule in
  [`../udev/README.md`](../udev/README.md).
