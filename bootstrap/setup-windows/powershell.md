# PowerShell setup

Use this guide for Windows tools and PowerShell. For Linux tools, see [WSL setup](wsl.md). Keep the Windows and WSL environments separate; clone the dotfiles repo in both environments.

## 1. Base setup

Install these if they are not already available:

- Chocolatey
- Scoop
- winget
- Git

### Chocolatey

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

### Scoop

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

### Git

```powershell
choco install git -y
```

## Manual install dev software

- Redis Insight is not available from winget or Chocolatey.
- Download it from the Redis Insight website or install it with Homebrew inside WSL.

## 2. Auto install PowerShell (choco)

Run `auto-install-powershell-choco.ps1` from Administrator PowerShell.

### Install terminal and editor

- WezTerm
- VS Code

### Install dev tools

- pgAdmin 4
- DBeaver
- Beekeeper Studio
- Docker Desktop
- Postman

### Install Windows tools

- PowerToys (`Alt+Space` opens PowerToys Run)
- AutoHotkey for custom keybindings

### Install fonts

- JetBrains Mono Nerd Font
- Nerd Fonts Symbols Only

### Install git tools

- GitHub CLI (`gh`)

### Install language tools

- nvm
- pnpm

### Install util tools

- dos2unix for converting Windows line endings to Unix line endings

## 3. Auto install PowerShell (scoop)

Scoop installs packages per-user by default. To install globally, use `sudo scoop install -g <package>`.

### Install language tools

- uv

### Install CLI tools

- yazi
- Dependencies:
  - ffmpeg, 7zip, poppler, fd, zoxide
  - fzf, bat, less
  - jq, jid
  - imagemagick, ghostscript
  - ripgrep, `extras/vcredist2022`

## 4. Auto install PowerShell (winget)

Run `auto-install-powershell-winget.ps1` from PowerShell.

### Install PowerShell

- PowerShell 7 (`pwsh`); Windows PowerShell 5.1 remains installed with Windows.

### Install terminal

- Windows Terminal

### Install prompt

- Oh My Posh

### Install window manager

- GlazeWM
- Start it with `glazewm start --config="$HOME\glazewm.yaml"` or the `Start-Glazewm` profile command.

## 5. PowerShell CLI goodies

### Oh My Posh (prompt and theme)

- Powerlevel10k-style prompt using the Catppuccin Mocha theme.
- Theme file: `sync-powershell-dotfiles\sync\WindowsPowerShell\catppuccin_mocha.omp.json`.
- Shows the current directory and Git branch/status.

### PSReadLine (suggestions, syntax highlighting, and Vi mode)

- PowerShell 7 includes PSReadLine 2.4+.
- The profile enables history predictions, syntax highlighting, and Vi editing.
- Press `→` to accept a suggestion.

### fzf and PSFzf (fuzzy search)

- Scoop installs the `fzf` executable.
- PSFzf adds `Ctrl+F` for the provider and `Ctrl+R` for fuzzy history search.

### zoxide (directory jumping)

- Scoop installs `zoxide`.
- Use `z <directory>` to jump to a frequently used directory.

### Terminal-Icons (file icons)

- Adds file-type icons to PowerShell directory listings.

### posh-git (Git integration)

- Provides PowerShell Git helpers and completions.
- Oh My Posh renders Git status in the prompt.

## 6. Install PowerShell modules

Run this in PowerShell 7 to install these modules from the PowerShell Gallery:

- Terminal-Icons
- PSFzf
- posh-git

```powershell
pwsh -ExecutionPolicy Bypass -File .\bootstrap\setup-windows\install-powershell-cli-modules.ps1
```

## 7. Configure terminal font

- The Chocolatey script installs JetBrains Mono Nerd Font.
- WezTerm is configured to use `JetBrainsMono Nerd Font`.
- For Windows Terminal, select it under Settings > Profiles > Defaults > Appearance.

## 8. Enable the PowerShell profile

The profile is at `sync-powershell-dotfiles\sync\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`. The sync script links it for Windows PowerShell 5.1 and PowerShell 7:

```powershell
. .\sync-powershell-dotfiles\scripts\sync.ps1
```

WezTerm is configured to launch `pwsh.exe`. Restart the terminal after setup to load the profile and font.

## 9. Follow instructions in the root README to symlink dotfiles

You can remove configs you do not need before creating symlinks.

## 10. Optional manual downloads

- GitHub Monaspace font: <https://github.com/githubnext/monaspace>
  - Follow its Windows installation instructions.
  - To install for all users, right-click the font and choose **Show more options** > **Install for all users**.
