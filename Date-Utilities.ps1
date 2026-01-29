# ====================================================================================================
# Author:   Markus Kofler (mkoflerAT)
# Website:  https://www.kofler-it.com
# Licence:  MIT
# Date:     2022-05-05 00:00
# ====================================================================================================
# ----------------------------------------------------------------------------------------------------
# Fake timestamps for files to get nice dates (e.g.: 2020-11-03 00:00)
# ----------------------------------------------------------------------------------------------------
function Set-FileTimeStamps {
   Param (
       [Parameter(mandatory=$true)]
       [string[]]$path,
       [datetime]$date=(Get-Date)
   )

   Get-ChildItem -Path $path |
       ForEach-Object {
           $_.CreationTime = $date
           $_.LastAccessTime = $date
           $_.LastWriteTime = $date
       }
}

function Set-FileTimeStampsSingle {
   Param (
       [Parameter(mandatory=$true)]
       [string[]]$path,
       [datetime]$date=(Get-Date)
   )

   Get-Item -Path $path | % { $_.CreationTime = $date; $_.LastAccessTime = $date; $_.LastWriteTime = $date }
}

# $date= Get-Date "2021-04-18 20:30"; Get-ChildItem | % { $_.CreationTime = $date; $_.LastAccessTime = $date; $_.LastWriteTime = $date }

function Set-FileTimeStampsRecursive {
   Param (
       [Parameter(mandatory=$true)]
       [string[]]$path,
       [datetime]$date=(Get-Date)
   )

   Get-ChildItem -Path $path -Recurse |
       ForEach-Object {
           $_.CreationTime = $date
           $_.LastAccessTime = $date
           $_.LastWriteTime = $date
       }
}

function Fix-DateForPowershellFolder {
    $date = Get-Date "2022-05-05 00:00";
    Set-Location ~\Documents\
    mkdir WindowsPowershellNew
    Move-Item .\WindowsPowerShell\* .\WindowsPowershellNew\
    Remove-Item .\WindowsPowerShell\
    Get-Item -Path .\WindowsPowershellNew | % { $_.CreationTime = $date; $_.LastAccessTime = $date; $_.LastWriteTime = $date }
    Get-ChildItem -Recurse -Path .\WindowsPowershellNew | % { $_.CreationTime = $date; $_.LastAccessTime = $date; $_.LastWriteTime = $date }
    Rename-Item .\WindowsPowershellNew\ .\WindowsPowershell
}

function Fix-DateForPortableAppsFolder {
    $date = Get-Date "2022-05-05 00:00";
    Set-Location C:\
    mkdir PortableAppsNew
    Move-Item .\PortableApps\* .\PortableAppsNew\
    Remove-Item .\PortableApps\
    Get-Item -Path .\PortableAppsNew | % { $_.CreationTime = $date; $_.LastAccessTime = $date; $_.LastWriteTime = $date }
    Get-ChildItem -Recurse -Path .\PortableAppsNew | % { $_.CreationTime = $date; $_.LastAccessTime = $date; $_.LastWriteTime = $date }
    Rename-Item .\PortableAppsNew\ .\PortableApps
}