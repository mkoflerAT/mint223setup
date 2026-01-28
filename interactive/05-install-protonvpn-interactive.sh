# https://protonvpn.com/support/official-linux-vpn-ubuntu/

read -p "Install ProtonVPN? [y/n] " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo 'Installing ProtonVPN...'
    wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.8_all.deb
    sudo dpkg -i ./protonvpn-stable-release_1.0.8_all.deb && sudo apt update
    # sudo apt-get install protonvpn protonvpn-cli -y
    sudo apt install proton-vpn-gnome-desktop
    echo 'Clean-up downloaded packages...'
    rm ./protonvpn-stable-release_1.0.8_all.deb
    echo 'Installing tray-icon for ProtonVPN...'
    sudo apt install libayatana-appindicator3-1 gir1.2-ayatanaappindicator3-0.1 gnome-shell-extension-appindicator
    echo 'ProtonVPN should now be installed in your system. After starting ProtonVPN you should see the tray-icon.'
else
    echo '[Skipped] Installing ProtonVPN'
fi

