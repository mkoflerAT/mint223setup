#!/bin/bash
# Master installer for Mint 223 setup
# Usage: curl -fsSL https://<url>/install.sh | bash -s -- [USERNAME] [REPO_URL]
# Example: curl -fsSL https://raw.githubusercontent.com/mkoflerAT/mint223setup/main/install.sh | bash -s -- mkoflerat

set -e

# Start timer
START_TIME=$(date +%s)

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
    "13-install-protonvpn.sh"
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
SCRIPT_COUNT=${#SCRIPTS[@]}
CURRENT_SCRIPT=0

for script in "${SCRIPTS[@]}"; do
    CURRENT_SCRIPT=$((CURRENT_SCRIPT + 1))
    PROGRESS=$((CURRENT_SCRIPT * 100 / SCRIPT_COUNT))
    
    # Simple progress bar
    BAR_LENGTH=40
    FILLED=$((PROGRESS * BAR_LENGTH / 100))
    BAR=$(printf '%0.s#' $(seq 1 $FILLED))
    EMPTY=$(printf '%0.s-' $(seq 1 $((BAR_LENGTH - FILLED))))
    
    echo "[$BAR$EMPTY] $PROGRESS% ($CURRENT_SCRIPT/$SCRIPT_COUNT)"
    
    case "$script" in
        01-install-network-shares.sh|07-install-git.sh)
            echo "Running: $script (with USERNAME=$USERNAME)"
            ./"$script" "$USERNAME"
            ;;
        *)
            echo "Running: $script"
            ./"$script"
            ;;
    esac
    echo ""
done

echo "========================================"
echo "Installation complete!"
echo "========================================"
echo ""

# Calculate and display elapsed time
END_TIME=$(date +%s)
ELAPSED=$((END_TIME - START_TIME))
MINUTES=$((ELAPSED / 60))
SECONDS=$((ELAPSED % 60))

echo "Installation time: ${MINUTES}m ${SECONDS}s"
echo ""
echo "Next steps:"
echo "1. Configure CIFS credentials: sudo nano /root/.cifs"
echo "2. Reload and mount shares: sudo systemctl daemon-reload && sudo mount -a"
echo "3. (Optional) Restart audio: systemctl --user restart pipewire wireplumber pipewire-pulse"
echo ""
echo "Setup directory: $WORK_DIR"
echo "You can safely delete it after setup is complete."
