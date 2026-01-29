echo 'Install powershell'
sudo apt-get update
sudo apt-get install -y wget apt-transport-https software-properties-common
source /etc/os-release
wget -q https://packages.microsoft.com/config/ubuntu/24.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y powershell
echo '-----------------------------------------------------------------------'
echo 'powershell should have been installed - run it by "pwsh"'
echo '-----------------------------------------------------------------------'

echo "Setting up PowerShell profile with posh-git..."
# Run the standalone PowerShell post-install script to avoid escaping issues
pwsh -NoProfile -File "${PWD}/post-install-powershell-full.ps1"
echo "PowerShell profile setup complete"
echo '-----------------------------------------------------------------------'
