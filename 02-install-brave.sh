#!/bin/bash
# -----------------------------------------------------------------------------------------------------------------------
# https://brave.com/linux/#release-channel-installation
# -----------------------------------------------------------------------------------------------------------------------

echo 'Installing brave-browser...'
sudo apt install curl -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
sudo curl -fsSLo /etc/apt/sources.list.d/brave-browser-release.sources https://brave-browser-apt-release.s3.brave.com/brave-browser.sources
sudo apt update
sudo apt install brave-browser -y
echo 'Press super-key (windows-key) and search for "brave". Then right click it to pin it to panel or desktop.'

