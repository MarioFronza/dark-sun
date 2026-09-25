#!/usr/bin/env bash
set -u

INTERNAL=eDP-1
LOCK=/tmp/sway-monitor-setup.lock

lid_closed() { grep -qw closed /proc/acpi/button/lid/*/state 2>/dev/null; }

internal_active() {
  swaymsg -t get_outputs | jq -r --arg int "$INTERNAL" '.[] | select(.name == $int) | .active'
}

external_best() {
  swaymsg -t get_outputs | jq -r --arg int "$INTERNAL" '
    [.[] | select(.name != $int)][0]
    | select(.)
    | (.modes | sort_by(.width * .height, .refresh) | last) as $best
    | "\(.name) \($best.width) \($best.height) \($best.refresh)"'
}

layout() {
  local ext width height refresh hz
  read -r ext width height refresh < <(external_best)

  if [ -z "${ext:-}" ]; then
    # Touch the panel only when it is actually off. A redundant modeset here
    # races idle-lock.sh's before-sleep lock and can resume to a black screen.
    if [ "$(internal_active)" != true ]; then
      swaymsg output "$INTERNAL" enable pos 0 0
    fi
    return
  fi

  hz=$(printf "%d.%03d" $((refresh / 1000)) $((refresh % 1000)))
  swaymsg output "$ext" enable mode "${width}x${height}@${hz}Hz" pos 0 0

  if lid_closed; then
    swaymsg output "$INTERNAL" disable
  else
    swaymsg output "$INTERNAL" enable pos "$width" 0
  fi

  for i in $(seq 1 9); do swaymsg workspace "$i" output "$ext"; done
  swaymsg workspace 10 output "$INTERNAL" "$ext"
}

apply() { ( flock 9; layout ) 9>"$LOCK"; }

# Only physical changes move this: layout() never connects or disconnects an
# output, so its own events can never re-trigger apply.
fingerprint() {
  printf '%s|%s\n' \
    "$(swaymsg -t get_outputs | jq -r '[.[].name] | sort | join(",")')" \
    "$(lid_closed && echo closed || echo open)"
}

[ "${1:-}" = once ] && { apply; exit 0; }

apply
last=$(fingerprint)

swaymsg -t subscribe -m '["output"]' | while read -r _; do
  sleep 0.3
  now=$(fingerprint)
  [ "$now" = "$last" ] && continue
  last=$now
  apply
done
