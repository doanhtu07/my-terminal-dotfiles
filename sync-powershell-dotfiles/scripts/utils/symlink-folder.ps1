param ( 
  [string] $sourceFolder, 
  [string] $destinationFolder
)

# Get all items in the source folder
$items = Get-ChildItem -Path $sourceFolder

foreach ($item in $items) {
  # Full path of item symlink at destination
  $linkPath = Join-Path -Path $destinationFolder -ChildPath $item.Name

  # Leave existing links in place, but never overwrite a real file or directory.
  $existingItem = Get-Item -LiteralPath $linkPath -Force -ErrorAction SilentlyContinue
  
  if ($existingItem) {
    $isLink = ($existingItem.Attributes -band [System.IO.FileAttributes]::ReparsePoint) -ne 0
    
    if ($isLink) {
      continue
    }

    throw "Refusing to replace existing path '$linkPath'. Remove or move it manually, then retry."
  }

  # Create symlink at destination
  New-Item -Path $linkPath -ItemType SymbolicLink -Target $item.FullName -ErrorAction Stop | Out-Null
}
