#!/bin/bash
# cleanup_traces.sh - Clear shell history and system login logs
# WARNING: Use with caution and only on systems you are authorized to manage.
# Usage: sudo bash cleanup_traces.sh

echo "Clearing shell history..."
history -c
cat /dev/null > ~/.bash_history

echo "Clearing system login records (requires sudo)..."
sudo -S -p '' truncate -s 0 /var/log/wtmp        # Successful logins
sudo -S -p '' truncate -s 0 /var/log/btmp        # Failed login attempts
sudo -S -p '' truncate -s 0 /var/log/lastlog     # Last login times
sudo -S -p '' truncate -s 0 /var/log/auth.log    # Auth logs (Debian/Ubuntu)

echo "Cleanup complete. Close this terminal session now."
exit
