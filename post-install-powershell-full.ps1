## post-install-powershell-full.ps1

# Ensure profile directory and file exist, install posh-git and ensure it's imported
$profileDir = Split-Path -Parent $PROFILE
if (!(Test-Path $profileDir)) { New-Item -ItemType Directory -Path $profileDir -Force | Out-Null }
if (!(Test-Path $PROFILE)) { New-Item -ItemType File -Path $PROFILE -Force | Out-Null }

Install-Module posh-git -Repository PSGallery -Force -AllowClobber

# Ensure posh-git is imported in the profile
if (-not (Get-Content -Path $PROFILE -ErrorAction SilentlyContinue | Select-String -SimpleMatch 'Import-Module posh-git')) {
    Add-Content -Path $PROFILE -Value 'Import-Module posh-git' -Encoding UTF8
}

# Ensure the custom functions directory exists
mkdir -p $HOME/PowerShell/functions/

# Add a reusable code-block to load custom functions into the profile
$codeBlock = @'
# -----------------------------------------------------------------------------------------------------------------
# Load custom functions [BEGIN]
# -----------------------------------------------------------------------------------------------------------------
Write-Host ('-' * 100)
$functionsPath = "$HOME/PowerShell/functions/*.ps1"
if (Test-Path $functionsPath) { gci $functionsPath | % { Write-Host "Load functions: $($_.Name)"; . $_.FullName } }
else { "No functions in $functionsPath - skip loading." | Write-Host }
Write-Host ('-' * 100); Write-Host
# -----------------------------------------------------------------------------------------------------------------
# Load custom functions [END]
# -----------------------------------------------------------------------------------------------------------------
'@

if (-not (Get-Content -Path $PROFILE -ErrorAction SilentlyContinue | Select-String -SimpleMatch 'Load custom functions [BEGIN]')) {
    Add-Content -Path $PROFILE -Value $codeBlock -Encoding UTF8
}
