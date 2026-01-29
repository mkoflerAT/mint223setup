#!/bin/bash
# Local installer - requires scripts to be in current directory
# For remote installation via curl, use: install.sh

# Setup: first create the necessary folders and copy all the files in there
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

USERNAME="${1:-mkoflerat}"

./00-install-rx-9060-xt-driver-support.sh
./01-install-network-shares.sh "$USERNAME"
./02-install-brave.sh
./03-install-veracrypt.sh
./04-install-keepassxc.sh
./05-install-signal.sh
./06-install-vscode.sh
./07-install-git.sh "$USERNAME"
./08-install-dotnet-core.sh
./09-install-powershell.sh
./10-install-steam.sh
./11-install-fido2-manage.sh
./12-install-docker.sh

echo ""
echo "========================================"
echo "Installation complete!"
echo "========================================"
echo ""
echo "Next steps:"
echo "1. Configure CIFS credentials: sudo nano /root/.cifs"
echo "2. Reload and mount shares: sudo systemctl daemon-reload && sudo mount -a"
echo "3. (Optional) Restart audio: systemctl --user restart pipewire wireplumber pipewire-pulse"
echo "4. (Optional) Monitor audio: watch -cd -n .1 pactl list short sinks"

