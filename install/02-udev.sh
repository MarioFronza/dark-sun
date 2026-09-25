DARK_SUN=~/.local/share/dark-sun

if [[ "$(cat /sys/class/dmi/id/chassis_type 2>/dev/null)" =~ ^(9|10|14)$ ]]; then
  echo "==> Installing udev rules (laptop chassis detected)"
  sudo cp "$DARK_SUN/udev/90-usb-wakeup.rules" "$DARK_SUN/udev/99-battery-charge-threshold.rules" /etc/udev/rules.d/
  sudo udevadm control --reload
  sudo udevadm trigger --subsystem-match=usb --action=add
  sudo udevadm trigger --action=add /sys/class/power_supply/BAT0 2>/dev/null || true
else
  echo "==> Skipping udev rules (not a laptop chassis)"
fi
