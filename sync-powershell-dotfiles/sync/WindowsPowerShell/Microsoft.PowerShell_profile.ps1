# Useful alias cli commands
Set-Alias -Name List-Symlinks -Value "$HOME\custom-bin\list-symlinks.ps1"
Set-Alias -Name Reload-Ps-Profile -Value "$HOME\custom-bin\reload-ps-profile.ps1"
Set-Alias -Name Start-Glazewm -Value "$HOME\custom-bin\start-glazewm.ps1"
Set-Alias -Name Symlink-Folder -Value "$HOME\custom-bin\symlink-folder.ps1"
Set-Alias -Name Unlink-Folder -Value "$HOME\custom-bin\unlink-folder.ps1"

# yazi Windows setup: https://yazi-rs.github.io/docs/installation/#windows
$env:YAZI_FILE_ONE = "C:\Program Files\Git\usr\bin\file.exe"

# fzf with preview
function fzff {
  fzf -m --layout=reverse --preview "bat --style=numbers --color=always {}"
}

# fzf directory
function fzfd {
  Get-ChildItem -Directory -Recurse | ForEach-Object FullName | fzf -m --layout=reverse
}

# fzf directory and cd
function fzfcd {
  $dir = fzfd
  if ($dir) { Set-Location -Path $dir }
}

# Open selected files in VS Code
function fzfv {
  $files = fzff
  if ($files) { code $files }
}

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
