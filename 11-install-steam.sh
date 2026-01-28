echo 'Installing Steam...'
wget https://repo.steampowered.com/steam/archive/precise/steam_latest.deb
mv ./steam_latest.deb /tmp/
sudo apt-get install /tmp/steam_latest.deb -y
rm /tmp/steam_latest.deb
echo 'Steam should be now installed in your system.'


