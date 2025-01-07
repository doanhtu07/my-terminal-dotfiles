# Assuming you are running the script at `~/my-terminal-dotfiles`

$targetPath = ".\README.md" 
$linkPath = ".\README-link.md" 
New-Item -Path $linkPath -ItemType SymbolicLink -Target $targetPath
Write-Output (Get-Item -path .\README-link.md).Attributes