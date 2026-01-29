#!/bin/bash
# Network shares configuration
# Usage: ./01-install-network-shares.sh [ldaine|mkoflerat|tvmedia]
# Or set USERNAME variable: USERNAME=ldaine ./01-install-network-shares.sh

# Configuration - can be overridden via argument or USERNAME env var
USERNAME="${1:-$USERNAME}"

# User configurations
declare -A NASIP=([ldaine]="192.168.20.100" [mkoflerat]="192.168.10.100" [tvmedia]="192.168.10.100")
declare -A SHARES=([ldaine]="home" [mkoflerat]="home" [tvmedia]="home movies music series")

# Validate user
if [[ -z "$USERNAME" ]] || [[ ! -v NASIP[$USERNAME] ]]; then
    echo "Usage: $0 [ldaine|mkoflerat|tvmedia]"
    exit 1
fi

CREDCIFS="/root/.cifs"
NAS_IP="${NASIP[$USERNAME]}"
USER_SHARES="${SHARES[$USERNAME]}"

echo "Configuring network shares for: $USERNAME"
echo "NAS IP: $NAS_IP"

# Create credentials file
echo "Creating credentials file: $CREDCIFS"
echo 'username=xxxxxxxxxxxxxxxx' | sudo tee "$CREDCIFS" > /dev/null
echo 'password=xxxxxxxxxxxxxxxx' | sudo tee -a "$CREDCIFS" > /dev/null
sudo chown root:root "$CREDCIFS"
sudo chmod 600 "$CREDCIFS"

# Create mount points
mkdir -p ~/NAS/{home,backups,media,movies,music,series,software}

# Add fstab entries
for share in $USER_SHARES; do
    fstab_line="//$NAS_IP/$share                 /home/$(whoami)/NAS/$share                cifs uid=1000,credentials=$CREDCIFS,iocharset=utf8 0 0"
    if ! grep -q "$NAS_IP/$share" /etc/fstab; then
        echo "$fstab_line" | sudo tee -a /etc/fstab > /dev/null
    fi
done

echo "Network shares configured for $USERNAME"
echo "Update credentials: sudo nano $CREDCIFS"
echo "Then mount shares: sudo systemctl daemon-reload && sudo mount -a"
