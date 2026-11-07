$ErrorActionPreference = 'Stop'

$wingetPackages = @(
  'Microsoft.PowerShell',
  'Microsoft.WindowsTerminal',
  'JanDeDobbeleer.OhMyPosh',
  'glzr-io.glazewm'
)

foreach ($package in $wingetPackages) {
  winget install --id $package --exact --accept-source-agreements --accept-package-agreements

  if ($LASTEXITCODE -ne 0) {
    throw "winget install failed for '$package' with exit code $LASTEXITCODE"
  }
}
