param ( 
  [string] $sourceFolder, 
  [string] $destinationFolder
)

# Get all items in the source folder
$items = Get-ChildItem -Path $sourceFolder

foreach ($item in $items) {
  # Full path of item symlink at destination
  $linkPath = Join-Path -Path $destinationFolder -ChildPath $item.Name

  # Create symlink at destination
  New-Item -Path $linkPath -ItemType SymbolicLink -Target $item.FullName
}