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
pwsh -NoProfile -Command "
    \$profileDir = Split-Path -Parent \$PROFILE
    if (!(Test-Path \$profileDir)) { New-Item -ItemType Directory -Path \$profileDir -Force | Out-Null }
    if (!(Test-Path \$PROFILE)) { New-Item -ItemType File -Path \$PROFILE -Force | Out-Null }
    Install-Module posh-git -Repository PSGallery -Force -AllowClobber
    Add-Content -Path \$PROFILE -Value 'Import-Module posh-git' -Encoding UTF8
"
echo "PowerShell profile setup complete"
echo '-----------------------------------------------------------------------'
