#!/usr/bin/env bash
# View-only power-profile indicator for waybar (custom/power-profile).
# power-profiles-daemon's own waybar module cycles the profile on click,
# with no config to disable that — this script just reads the current
# profile over dbus and prints it, no click handler at all.

profile=$(busctl --system get-property net.hadess.PowerProfiles \
  /net/hadess/PowerProfiles net.hadess.PowerProfiles ActiveProfile \
  | cut -d'"' -f2)

case "$profile" in
  performance)  icon=$'' ;;
  balanced)     icon=$'' ;;
  power-saver)  icon=$'' ;;
  *)            icon="?" ;;
esac

printf '{"text": "%s", "tooltip": "Power profile: %s"}\n' "$icon" "$profile"
