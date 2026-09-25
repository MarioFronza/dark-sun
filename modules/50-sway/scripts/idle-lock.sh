#!/usr/bin/env bash
exec 9>"${XDG_RUNTIME_DIR:-/tmp}/idle-lock.sh.lock"
flock -n 9 || exit 0
# Resume restores sway's default output config, which drops the external
# monitor to its preferred mode and re-enables the panel with the lid shut.
# monitor-setup.sh cannot see this on its own: no output connects or
# disconnects, so its fingerprint never moves.
exec swayidle -w \
  before-sleep 'swaylock -f' \
  after-resume "$HOME/.config/sway/scripts/monitor-setup.sh once"
