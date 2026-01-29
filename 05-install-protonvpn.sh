#!/bin/bash
# -----------------------------------------------------------------------------------------------------------------------
# ProtonVPN Installation for Linux/Ubuntu
# Official guide: https://protonvpn.com/support/official-linux-vpn-ubuntu/
# -----------------------------------------------------------------------------------------------------------------------

set -e

echo 'Installing ProtonVPN...'

# Add ProtonVPN repository key
echo "Adding ProtonVPN repository..."
sudo mkdir -p /usr/share/keyrings
sudo curl -fsSL https://repo.protonvpn.com/debian/PUBLIC.KEY -o /usr/share/keyrings/protonvpn-keyring.asc

# Add ProtonVPN repository
echo "deb [signed-by=/usr/share/keyrings/protonvpn-keyring.asc] https://repo.protonvpn.com/debian stable main" | sudo tee /etc/apt/sources.list.d/protonvpn.sources > /dev/null

# Update package list
sudo apt update

# Install ProtonVPN
echo "Installing ProtonVPN application..."
sudo apt install -y proton-vpn-gnome-desktop

# Install appindicator support for system tray
echo "Installing appindicator support for system tray..."
sudo apt install -y libayatana-appindicator3-1 gir1.2-ayatanaappindicator3-0.1 gnome-shell-extension-appindicator

echo '=========================================='
echo 'ProtonVPN has been installed successfully!'
echo '=========================================='
echo ''
echo 'To use ProtonVPN:'
echo '1. Launch ProtonVPN from your applications menu'
echo '2. Sign in with your ProtonVPN account'
echo '3. The system tray icon should appear when running'
echo ''
