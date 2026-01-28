#!/bin/bash
# -----------------------------------------------------------------------------------------------------------------------
# https://code.visualstudio.com/docs/setup/linux
# -----------------------------------------------------------------------------------------------------------------------

read -p "Install vscode? [y/n] " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo 'Install vscode'
    wget https://vscode.download.prss.microsoft.com/dbazure/download/stable/6f17636121051a53c88d3e605c491d22af2ba755/code_1.103.2-1755709794_amd64.deb
    mv ./code_1.103.2-1755709794_amd64.deb /tmp/
    sudo apt install /tmp/code_1.103.2-1755709794_amd64.deb
    rm /tmp/code_1.103.2-1755709794_amd64.deb
    echo '-----------------------------------------------------------------------'
    echo 'vscode should have been installed'
    echo '-----------------------------------------------------------------------'
else
    echo '[Skipped] Installing vscode'
fi

