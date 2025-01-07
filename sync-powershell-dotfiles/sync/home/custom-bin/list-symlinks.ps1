# Usage: 
# & ".\list-symlinks.ps1" -sourceFolder ".\home"
# or 
# . ".\list-symlinks.ps1" -sourceFolder ".\home"

param ( 
    [string] $sourceFolder
)

Get-ChildItem -Path $sourceFolder | Select-Object FullName, Target
