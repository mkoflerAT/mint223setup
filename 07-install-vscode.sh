#!/bin/bash
# -----------------------------------------------------------------------------------------------------------------------
# https://code.visualstudio.com/docs/setup/linux
# -----------------------------------------------------------------------------------------------------------------------

echo 'Install vscode'
wget https://vscode.download.prss.microsoft.com/dbazure/download/stable/6f17636121051a53c88d3e605c491d22af2ba755/code_1.103.2-1755709794_amd64.deb
mv ./code_1.103.2-1755709794_amd64.deb /tmp/
sudo apt install -y /tmp/code_1.103.2-1755709794_amd64.deb
rm /tmp/code_1.103.2-1755709794_amd64.deb
echo '-----------------------------------------------------------------------'
echo 'vscode should have been installed'
echo '-----------------------------------------------------------------------'

