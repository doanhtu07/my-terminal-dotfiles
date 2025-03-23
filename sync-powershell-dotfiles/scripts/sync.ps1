# Assuming you are running the script at `~/my-terminal-dotfiles`

function EnsureFolderExists {
  param ( 
    [string] $destinationFolder
  ) 

  if (-Not (Test-Path -Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder
  }
}

function SyncFolder {
  param (
    [string] $src,
    [string] $dest
  )

  EnsureFolderExists -destinationFolder $dest
  ..\scripts\utils\symlink-folder.ps1 -sourceFolder $src -destinationFolder $dest
}

Set-Location .\sync-powershell-dotfiles\sync

SyncFolder -src ".\home" -dest "$HOME"

# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7.4
SyncFolder -src ".\WindowsPowerShell" -dest "$HOME\Documents\WindowsPowerShell"

SyncFolder -src ".\yazi" -dest "$env:AppData\yazi\config"

Set-Location ..\..