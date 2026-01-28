#!/bin/bash

# first create the necessary folders and copy all the files in there
# mkdir -p ~/source/mint223setup/
# cd /media/$(whoami)/MINT223CIN/addon/
# cp -R ./* ~/source/mint223setup/
# cd ~/source/mint223setup/
# chmod +x *.sh

# update the whole system
# sudo apt update && sudo apt upgrade -y

# fix sound-problems related to pipewire & wireplumber
# mkdir -p ~/.config/wireplumber/main.lua.d/
# cp ~/source/mint-setup/wireplumber/main.lua.d/50-alsa-config.lua             ~/.config/wireplumber/main.lua.d/
# cp ~/source/mint-setup/wireplumber/main.lua.d/90-enable-all.lua              ~/.config/wireplumber/main.lua.d/
# cp ~/source/mint-setup/wireplumber/main.lua.d/50-disable-session-suspend.lua ~/.config/wireplumber/main.lua.d/

./00-install-rx-9060-xt-driver-support.sh
./01-install-network-shares-mkoflerat.sh
./02-install-brave.sh
./03-install-veracrypt.sh
./04-install-keepassxc.sh
./05-install-protonvpn.sh
./06-install-signal.sh
./07-install-vscode.sh
./08-install-git-mkoflerat.sh
./09-install-dotnet-core.sh
./10-install-powershell.sh
./11-install-steam.sh
./12-install-fido2-manage.sh

echo 'Now run these commands manually:'
echo 'sudo nano /root/.cifs'
echo 'sudo systemctl daemon-reload'
echo 'sudo mount -a'
echo 'systemctl --user restart pipewire wireplumber pipewire-pulse'
echo 'watch -cd -n .1 pactl list short sinks'

