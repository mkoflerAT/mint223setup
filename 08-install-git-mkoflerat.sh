#!/bin/bash
# -----------------------------------------------------------------------------------------------------------------------
# https://code.visualstudio.com/docs/setup/linux
# -----------------------------------------------------------------------------------------------------------------------

echo 'Install git'
sudo apt install git -y
echo "Don't forget to configure your git by applying these settings:"
echo '--------------------------------------------------------------'
echo 'git config --global user.name "Markus Kofler"'
echo 'git config --global user.email "git@markuskofler.com"'
echo 'git config --global core.autocrlf input'
echo 'git config --global core.editor "code --wait --new-window"'
echo 'git config --global init.defaultbranch main'
echo '--------------------------------------------------------------'
echo 'git should have been installed'
echo '--------------------------------------------------------------'

# adapt to your needs
git config --global user.name "Markus Kofler"
git config --global user.email "git@markuskofler.com"
git config --global core.autocrlf input
git config --global core.editor "code --wait --new-window"
git config --global init.defaultbranch main
