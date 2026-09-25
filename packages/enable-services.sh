#!/usr/bin/env bash
# Enables the daemons install.sh puts on the machine but leaves stopped.
#
# Networking is among them, so this drops an ssh session: iwd and
# systemd-networkd take over interfaces that whatever you connected with is
# holding. Run it from the machine's own console.
set -euo pipefail

services=(iwd systemd-networkd systemd-resolved bluetooth tailscaled)

if [[ -n "${SSH_CONNECTION:-}" ]]; then
  echo "This looks like an ssh session, and enabling iwd/systemd-networkd" >&2
  echo "will take the network out from under it. Run it on the console." >&2
  read -rp "Continue anyway? [y/N] " reply
  [[ $reply == [yY] ]] || exit 1
fi

for service in "${services[@]}"; do
  echo "==> Enabling $service"
  sudo systemctl enable --now "$service"
done

# systemd-resolved only answers on 127.0.0.53; without this everything else
# keeps reading a resolv.conf nothing updates any more.
echo "==> Pointing /etc/resolv.conf at systemd-resolved"
sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

cat <<'EOF'

==> Done. Two things are left, both interactive:

  sudo tailscale up   # prints a URL to authenticate the machine, once
  impala              # connect to wifi (bluetui for bluetooth)
EOF
