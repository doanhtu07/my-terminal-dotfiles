# Assuming you are running the script at `~/my-terminal-dotfiles`

Set-Location .\sync-powershell-dotfiles\sync

..\scripts\utils\unlink-folder.ps1 -sourceFolder .\home -destinationFolder $HOME

..\scripts\utils\unlink-folder.ps1 -sourceFolder ".\WindowsPowerShell" -destinationFolder "$HOME\Documents\WindowsPowerShell"

Set-Location ..\..