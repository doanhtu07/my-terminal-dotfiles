# A mini script to setup environment on Windows

For Windows, we will setup a mix of WSL and PowerShell for different tools

- WSL is for neovim, tmux, and other Linux-native applications
- PowerShell is for wezterm and window management tool

Thus, we will setup these 2 environments independently as if they are 2 different machines

You will need to clone this repo to both your PowerShell and WSL environments and manage them separately

# Base requirements

If you don't have the base requirements yet, I have a guide below that installs all of them. So, no worries!

---

**Inside PowerShell**

- choco (package manager inside PowerShell)
- git

---

**Inside WSL**

- curl
- zsh (shell)
- brew (package manager inside WSL)

---

# Manual install dev software

- Redis Insight:

  - Not available on winget or choco yet
  - Only downloadable through their website
  - You can also install with brew inside WSL

# Inside PowerShell

## 1. Base setup

- Chocolatey

```ps1
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

- Git

```ps1
choco install git -y
```

- Scoop

```ps1
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

## 2. Auto install PowerShell (choco)

Run the `auto-install-powershell-choco.ps1` script inside Administrator PowerShell

- Right click on PowerShell app and choose `Run as Administrator`

### Install terminal and editor

- wezterm
- vscode

### Install dev tools

- pgadmin4
- dbeaver
- beekeeper-studio
- docker-desktop
- postman

### Install Windows tools

- powertoys
  - Use by `Alt + Space`
  - https://learn.microsoft.com/en-us/windows/powertoys/run

### Install fonts

- nerd-fonts-JetBrainsMono
- nerd-fonts-NerdFontsSymbolsOnly

### Install git tools

- gh

### Install language tools

- nvm
- pnpm

### Install util tools

- dos2unix
  - For converting Windows line endings to Unix line endings

## 3. Auto install PowerShell (scoop)

**NOTES**:

- scoop installs packages per-user by default
- To install packages globally, use `sudo scoop install -g <packages>`

### Install cli tools

- yazi
  - Recommended dependencies:
    - ffmpeg, 7zip, poppler, fd, zoxide
    - fzf, bat, less
    - jq, jid
    - imagemagick, ghostscript
    - ripgrep, extras/vcredist2022

## 4. Auto install PowerShell (winget)

Run the `auto-install-powershell-winget.ps1` script inside Administrator PowerShell

- Right click on PowerShell app and choose `Run as Administrator`

### Install window manager

- glazewm
  - Start GlazeWM by `glazewm start --config="$HOME\glazewm.yaml"` or my own shortcut script `Start-Glazewm` in powershell

## 5. Follow instructions in root README.md to symlink dotfiles

**NOTE**: You can delete any configs that you don't need for a clean symlink process

## 6. Optional manual downloads

- Github monaspace font: `https://github.com/githubnext/monaspace`
  - Clone repo down and follow its instructions for Windows
  - On Windows, when right-click on a font, select `Show more options` and you will see `Install for all users`

# Inside WSL

## 1. Install default WSL Ubuntu distro

```ps1
wsl --install
```

## 2. Base setup

- In WSL, it's technically Linux
- Thus, we use `apt` to install base stuff
- With this setup, we can also port it to Linux system

- Learning links:

  - https://dev.to/contactsunny/installing-zsh-and-oh-my-zsh-on-windows-11-with-wsl2-1p5i

  - https://superuser.com/questions/1110882/how-to-change-default-shell-for-linux-susbsystem-for-windows

  - https://medium.com/@smitgabani/advanced-wsl-configuration-2b4888332fff

```
# Update
sudo apt update
sudo apt upgrade

# Zsh
sudo apt install zsh
chsh -s /bin/zsh

# Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
sudo apt install build-essential
brew install gcc

# Git
brew install git
```

## 3. Auto install WSL (brew)

Run the `auto-install-wsl.sh` script

### Install fonts

- Setup fonts

### Install language tools

- Install pyenv
- Install nvm
- Install pnpm

- Install chruby and ruby-install (https://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/)

  - Check versions at ~/.rubies/
  - chruby 3.3.5

- Install lua

### Install neovim and cli tools

- Install neovim
  - Install ripgrep (needed by `telescope` and `fzf-lua`)
  - Install fd (needed by `telescope` and `fzf-lua`)
- Install tmux
- Install yazi
- Install eza (better ls)
- Install zoxide (better cd)
- Install fzf (better search)
- Install bat (file preview with syntax highlighting)
- Install diff-so-fancy (better git diff view)
- Install stow
- Install unzip

### Install git tools

- Install gh:
  - `gh auth login`
  - `gh setup-git`

### Install cli goodies

- Install power10k theme
- Install vim mode for zsh
- Install zsh-autosuggestions
- Install zsh-syntax-highlighting

### Install fun stuff

- Install fortune (ascii quotes)
- Install figlet (words to ascii art)
- Install cowsay (fun ascii art for quotes)

## 4. Copy zshrc-mini to .zshrc inside `sync` folder

In this folder `setup-windows`, I provide a more minimal zshrc (`zshrc-mini`) for a simple setup, which is ready to develop anything!

For extra stuff, feel free to install them

Please replace the zshrc file in `sync/home` folder

- That's where we will symlink into $HOME

## 5. Follow instructions in root README.md to symlink dotfiles

**NOTE**: You can delete any configs that you don't need for a clean symlink process

## 6. Run stuff after symlinking

### Run `zshrc`

- `source ~/.zshrc`

### Source `tmux`

- Open a tmux session
- `tmux source-file ~/.tmux.conf`
- Prefix + I -> Install plugins

## 7. Cool knowledge notes

- View symlinks

```
ls -l $(which stow)
```
