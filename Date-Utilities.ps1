# ====================================================================================================
# Author:   Markus Kofler (mkoflerAT)
# Website:  https://www.kofler-it.com
# Licence:  MIT
# Date:     2026-01-30 00:00
# ====================================================================================================
# ----------------------------------------------------------------------------------------------------
# Fake timestamps for files to get nice dates (e.g.: 2020-11-03 00:00)
# ----------------------------------------------------------------------------------------------------
function Set-FileTimeStamps {
   Param (
       [Parameter(mandatory=$true)]
       [string[]]$Path,
       [datetime]$Date=(Get-Date)
   )

   $utc = $Date.ToUniversalTime()
   foreach ($p in $Path) {
       if (-not (Test-Path $p)) {
           Write-Verbose "Path not found: $p"
           continue
       }

       Get-ChildItem -Path $p -Recurse -Force -ErrorAction SilentlyContinue | ForEach-Object {
           $full = $_.FullName
           try {
               if ($_.PSIsContainer) {
                   [System.IO.Directory]::SetLastWriteTimeUtc($full, $utc)
                   [System.IO.Directory]::SetLastAccessTimeUtc($full, $utc)
                   try { [System.IO.Directory]::SetCreationTimeUtc($full, $utc) } catch {}
               } else {
                   [System.IO.File]::SetLastWriteTimeUtc($full, $utc)
                   [System.IO.File]::SetLastAccessTimeUtc($full, $utc)
                   try { [System.IO.File]::SetCreationTimeUtc($full, $utc) } catch {}
               }
           } catch {
               Write-Verbose "Failed setting timestamps for $full: $_"
           }
       }
   }
}