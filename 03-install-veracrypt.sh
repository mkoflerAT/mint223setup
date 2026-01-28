#!/bin/bash
# -----------------------------------------------------------------------------------------------------------------------
# https://www.veracrypt.fr/
# -----------------------------------------------------------------------------------------------------------------------

echo 'Installing VeraCrypt...'

# install GUI-version of VeraCrypt
echo 'Installing VeraCrypt-GUI...'
wget https://launchpadlibrarian.net/796424882/veracrypt-1.26.24-Ubuntu-24.04-amd64.deb
mv ./veracrypt-1.26.24-Ubuntu-24.04-amd64.deb /tmp/
sudo apt-get install /tmp/veracrypt-1.26.24-Ubuntu-24.04-amd64.deb -y
rm /tmp/veracrypt-1.26.24-Ubuntu-24.04-amd64.deb

# install CLI-version of VeraCrypt
# echo 'Installing VeraCrypt-Console...'
# wget https://launchpadlibrarian.net/796425302/veracrypt-console-1.26.24-Ubuntu-24.04-amd64.deb
# mv ./veracrypt-console-1.26.24-Ubuntu-24.04-amd64.deb /tmp/
# sudo apt-get install /tmp/veracrypt-console-1.26.24-Ubuntu-24.04-amd64.deb -y
# rm /tmp/veracrypt-console-1.26.24-Ubuntu-24.04-amd64.deb
echo 'VeraCrypt should be now installed in your system.'

