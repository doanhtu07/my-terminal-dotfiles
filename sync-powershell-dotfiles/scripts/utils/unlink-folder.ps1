param ( 
  [string] $sourceFolder, 
  [string] $destinationFolder
)

# Get all items in the source folder
$sourceItems = Get-ChildItem -Path $sourceFolder

foreach ($sourceItem in $sourceItems) {
  # Full path of item symlink at destination
  $linkPath = Join-Path -Path $destinationFolder -ChildPath $sourceItem.Name

  # Check if path exists and a symbolic link
  if (Test-Path -Path $linkPath) { 
    # Example:
    # ---
    # PS C:\Users\doanh\Projects\my-terminal-dotfiles> Write-Output (Get-Item -path .\README-link.md).Attributes
    # Archive, ReparsePoint
    # ---
    $item = Get-Item -Path $linkPath 
    if ($item.Attributes -match "ReparsePoint") { 
      Remove-Item -Path $linkPath 
    } 
  }
}
