read -p "Install and configure git? [y/n] " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo 'Install git'
    sudo apt install git -y
    echo "Don't forget to configure your git by applying these settings:"
    echo '--------------------------------------------------------------'
    echo 'git config --global user.name "Liga Daine"'
    echo 'git config --global user.email "liga.daine@daine-it.com"'
    echo 'git config --global core.autocrlf input'
    echo 'git config --global core.editor "code --wait --new-window"'
    echo 'git config --global init.defaultbranch main'
    echo '--------------------------------------------------------------'
    echo 'git should have been installed'
    echo '--------------------------------------------------------------'
else
    echo '[Skipped] Installing and configuring git'
fi

# adapt to your needs
git config --global user.name "Liga Daine"
git config --global user.email "liga.daine@daine-it.com"
git config --global core.autocrlf input
git config --global core.editor "code --wait --new-window"
git config --global init.defaultbranch main
