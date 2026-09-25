# udev

System-level `udev` rules for the ThinkPad. These are the only files in this
repo that land outside `$HOME`, so every step here needs `sudo`.

- `90-usb-wakeup.rules` — plugging anything into USB wakes the machine
- `99-battery-charge-threshold.rules` — stop charging at 80%, resume at 75%

**Laptops only — skip this folder on a desktop.** Both rules exist because
the machine sleeps when the lid closes and spends its days on AC.

## Copy

```bash
sudo cp udev/90-usb-wakeup.rules udev/99-battery-charge-threshold.rules /etc/udev/rules.d/
```

## Apply

```bash
sudo udevadm control --reload
sudo udevadm trigger --subsystem-match=usb --action=add
sudo udevadm trigger --action=add /sys/class/power_supply/BAT0
```

`control --reload` re-reads the rules, the `trigger` calls re-process the
devices that are already present so neither rule waits for a reboot.

## Verify

```bash
grep . /sys/bus/usb/devices/usb*/power/wakeup
cat /sys/class/power_supply/BAT0/charge_control_{start,end}_threshold
```

All four root hubs should read `enabled`, and the thresholds `75` and `80`.

## Notes

### USB wake-on-connect

- **`90-usb-wakeup.rules` makes plugging the dock in wake the machine.** This
  laptop only supports `s2idle` (there is no `deep`/S3 — check with
  `cat /sys/power/mem_sleep`). Closing the lid while docked is fine, but
  unplugging from that state leaves no display at all, so `systemd-logind`
  stops treating the machine as docked and suspends it. Plugging the dock back
  in then did nothing, because a sleeping machine cannot notice a connection,
  and the lid had to be opened to wake it.
- The wake path was blocked at exactly one place. The xHCI controllers
  (`/sys/bus/pci/devices/0000:00:{0d,14}.0/power/wakeup`) and the Thunderbolt
  domains were already `enabled`, but wake-on-*connect* is decided by the root
  hub, and all four shipped `disabled`. The port noticed the dock arriving and
  had no permission to raise a wake event.
- **The rule is deliberately device-agnostic.** It matches root hubs by
  `1d6b` — the Linux Foundation vendor id every root hub reports — so it
  describes the ThinkPad, never a particular dock. Any dock, any port, any USB
  device behaves the same way. Scoping to a dock's own `idVendor`/`idProduct`
  cannot work here: while the dock is unplugged, that device does not exist,
  so there is nothing for such a rule to arm.
- Narrowing to only the buses the dock currently lands on is also a bad trade.
  The USB-C ports split one physical cable across two controllers (USB2 pairs
  route to the chipset xHCI, USB3 pairs to the USB4 one), so which root hubs
  are involved depends on the port used.
- **If the machine starts waking on its own**, suspect a leaf device before
  this rule. Check what else is allowed to wake things:

  ```bash
  grep . /sys/bus/usb/devices/*/power/wakeup
  ```

  The dock's Realtek `r8152` ethernet enables wake-on-LAN by itself and is the
  usual culprit; the keyboard is normally wanted (a keypress wakes the
  machine). Neither is set by this rule.

### Battery charge thresholds

- `thinkpad_acpi` is built into the kernel and already loaded on boot, so the
  thresholds sit on `BAT0` directly. No TLP, no tp-smapi, no extra package.
- The embedded controller enforces them, not Linux polling in the background.
  Plugged in, the battery charges to 80% and stops, and the laptop runs off AC
  pass-through. If use drags it back under 75% while still plugged in, the EC
  charges to 80% again. The 5-point gap is what stops it cycling on and off at
  the edge. Unplugged, the thresholds do not apply at all.
- **The rule only fires when `BAT0` appears**, at boot and on resume. It is
  not a running process. Some ThinkPad ECs forget the threshold across a cold
  boot, which is the only reason it needs reapplying.
- To charge to 100% once, before travelling:

  ```bash
  echo 100 | sudo tee /sys/class/power_supply/BAT0/charge_control_end_threshold
  ```

  That lasts until the next boot, when the rule puts it back to 80%.

### Revert

```bash
sudo rm /etc/udev/rules.d/90-usb-wakeup.rules
sudo rm /etc/udev/rules.d/99-battery-charge-threshold.rules
```

Then reboot.

See [`../sway/README.md`](../sway/README.md) for the lid and external-monitor
behavior the USB rule pairs with.
