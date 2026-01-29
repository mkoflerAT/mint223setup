#!/bin/bash
# Master installer for Mint 223 setup
# Usage: curl -fsSL https://<url>/install.sh | bash -s -- [USERNAME] [REPO_URL]
# Example: curl -fsSL https://raw.githubusercontent.com/mkoflerAT/mint223setup/main/install.sh | bash -s -- mkoflerat

set -e

USERNAME="${1:-mkoflerat}"
REPO_URL="${2:-https://raw.githubusercontent.com/mkoflerAT/mint223setup/main}"
WORK_DIR="${3:-/tmp/mint223setup}"

echo "========================================"
echo "Mint 223 Setup Installer"
echo "========================================"
echo "Username: $USERNAME"
echo "Repository: $REPO_URL"
echo "Working directory: $WORK_DIR"
echo "========================================"

# Create working directory
mkdir -p "$WORK_DIR"
cd "$WORK_DIR"

# Download all scripts
echo "Downloading installation scripts..."
SCRIPTS=(
    "00-install-rx-9060-xt-driver-support.sh"
    "01-install-network-shares.sh"
    "02-install-brave.sh"
    "03-install-veracrypt.sh"
    "04-install-keepassxc.sh"
    "05-install-signal.sh"
    "06-install-vscode.sh"
    "07-install-git.sh"
    "08-install-dotnet-core.sh"
    "09-install-powershell.sh"
    "10-install-steam.sh"
    "11-install-fido2-manage.sh"
    "12-install-docker.sh"
)

for script in "${SCRIPTS[@]}"; do
    echo "Downloading: $script"
    curl -fsSL "$REPO_URL/$script" -o "$script"
    chmod +x "$script"
done

echo ""
echo "Running installation scripts..."
echo "========================================"

# Run scripts with USERNAME parameter where applicable
for script in "${SCRIPTS[@]}"; do
    case "$script" in
        01-install-network-shares.sh|08-install-git.sh)
            echo "Running: $script (with USERNAME=$USERNAME)"
            ./"$script" "$USERNAME"
            ;;
        *)
            echo "Running: $script"
            ./"$script" < /dev/null
            ;;
    esac
    echo ""
done

echo "========================================"
echo "Installation complete!"
echo "========================================"
echo ""
echo "Next steps:"
echo "1. Configure CIFS credentials: sudo nano /root/.cifs"
echo "2. Reload and mount shares: sudo systemctl daemon-reload && sudo mount -a"
echo "3. (Optional) Restart audio: systemctl --user restart pipewire wireplumber pipewire-pulse"
echo ""
echo "Setup directory: $WORK_DIR"
echo "You can safely delete it after setup is complete."
