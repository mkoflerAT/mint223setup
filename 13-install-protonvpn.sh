#!/bin/bash
# -----------------------------------------------------------------------------------------------------------------------
# https://protonvpn.com/support/official-linux-vpn-ubuntu/
# -----------------------------------------------------------------------------------------------------------------------

echo 'Installing ProtonVPN...'
wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.8_all.deb
sudo dpkg -i ./protonvpn-stable-release_1.0.8_all.deb && sudo apt update
sudo apt install -y proton-vpn-gnome-desktop
echo 'Clean-up downloaded packages...'
rm ./protonvpn-stable-release_1.0.8_all.deb
echo 'Setting lightdm as default display manager...'
echo "lightdm shared/default-x-display-manager select lightdm" | sudo debconf-set-selections
sudo dpkg-reconfigure -f noninteractive lightdm
echo 'Installing tray-icon for ProtonVPN...'
sudo apt install -y libayatana-appindicator3-1 gir1.2-ayatanaappindicator3-0.1 gnome-shell-extension-appindicator
echo 'ProtonVPN should now be installed in your system. After starting ProtonVPN you should see the tray-icon.'
