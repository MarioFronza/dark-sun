cd "$(dirname "${BASH_SOURCE[0]}")"

# Both rules only make sense on a machine that sleeps on lid close and runs
# on battery. 9/10/14 are the DMI chassis types for laptop/notebook/sub-notebook.
if [[ "$(cat /sys/class/dmi/id/chassis_type 2>/dev/null)" =~ ^(9|10|14)$ ]]; then
  echo "==> Installing udev rules (laptop chassis detected)"
  sudo cp 90-usb-wakeup.rules 99-battery-charge-threshold.rules /etc/udev/rules.d/
  sudo udevadm control --reload
  sudo udevadm trigger --subsystem-match=usb --action=add
  sudo udevadm trigger --action=add /sys/class/power_supply/BAT[0-9] 2>/dev/null || true
else
  echo "==> Skipping udev rules (not a laptop chassis)"
fi
