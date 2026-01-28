read -p "Install Steam? [y/n] " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo 'Installing Steam...'
    wget https://repo.steampowered.com/steam/archive/precise/steam_latest.deb
    mv ./steam_latest.deb /tmp/
    sudo apt-get install /tmp/steam_latest.deb -y
    rm /tmp/steam_latest.deb
    echo 'Steam should be now installed in your system.'
else
    echo '[Skipped] Installing Steam'
fi

