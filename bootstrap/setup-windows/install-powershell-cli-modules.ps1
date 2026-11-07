$ErrorActionPreference = 'Stop'

if ($PSVersionTable.PSVersion.Major -lt 7) {
  throw 'Run this installer from PowerShell 7 (pwsh), not Windows PowerShell 5.1.'
}

$modules = @('Terminal-Icons', 'PSFzf', 'posh-git')
Install-Module -Name $modules -Repository PSGallery -Scope CurrentUser -Force -AllowClobber

Get-Module -ListAvailable -Name $modules |
  Sort-Object Name, Version -Descending |
  Select-Object Name, Version, Path
