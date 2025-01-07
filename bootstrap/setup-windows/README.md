# A mini script to setup environment on Windows

For Windows, we will use a mix of WSL and PowerShell for different tools

- WSL is for neovim, tmux, and other Linux-native applications
- PowerShell is for Wezterm and window management apps

Thus, we will setup these 2 environments independently as if they are 2 different machines

You will need to clone this repo to both your PowerShell and WSL environments

# Base requirements

If you don't have the base requirements yet, I have a guide below that installs all of them. So, no worries!

---

**Inside PowerShell**

- choco (package manager inside PowerShell)

---

**Inside WSL**

- curl
- zsh (shell)
- brew (package manager inside WSL)

---

# Inside PowerShell

## 1. Base setup

- Chocolatey

```ps1
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

## 2. Auto install PowerShell (choco)

Run the `auto-install-powershell-choco.ps1` script inside Administrator PowerShell

- Right click on PowerShell app and choose `Run as Administrator`

### Install terminal and editor

- wezterm
- vscode

### Install Windows tools

- powertoys
  - Use by `Alt + Space`
  - https://learn.microsoft.com/en-us/windows/powertoys/run

### Install fonts

- nerd-fonts-JetBrainsMono
- nerd-fonts-NerdFontsSymbolsOnly

### Install git tools

- git
- gh

### Install language tools

- nvm
- pnpm

### Install util tools

- dos2unix: For converting Windows line endings to Unix line endings

## 3. Auto install PowerShell (winget)

Run the `auto-install-powershell-winget.ps1` script inside Administrator PowerShell

- Right click on PowerShell app and choose `Run as Administrator`

### Install window manager

- glazewm
  - Start by `glazewm start --config="$HOME\glazewm.yaml"`

## 4. Follow instructions in root README.md to symlink dotfiles

**NOTE**: You can delete any configs that you don't need for a clean symlink process

# Inside WSL

## 0. Install WSL

```ps1
wsl --install
```

## 1. Base setup

- In WSL, it's technically Linux
- Thus, we use apt to install base stuff
- With this setup, we can also port it to Linux system

- Learning links:
  - https://dev.to/contactsunny/installing-zsh-and-oh-my-zsh-on-windows-11-with-wsl2-1p5i
  - https://superuser.com/questions/1110882/how-to-change-default-shell-for-linux-susbsystem-for-windows
  - https://medium.com/@smitgabani/advanced-wsl-configuration-2b4888332fff

```
# Update
sudo apt update
sudo apt upgrade

# Curl
sudo apt install curl

# Zsh
sudo apt install zsh
chsh -s /bin/zsh

# Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## 2. Auto install WSL (brew)

Run the `auto-install-wsl.sh` script

### Install fonts

- Setup fonts

### Install language tools

- Install pyenv
- Install nvm

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
- Install stow

### Install git tools

- Install git
- Install gh: `gh auth login`

### Install cli goodies

- Install power10k theme
- Install vim mode for zsh
- Install zsh-autosuggestions
- Install zsh-syntax-highlighting

### Install fun stuff

- Install fortune (ascii quotes)
- Install figlet (words to ascii art)
- Install cowsay (fun ascii art for quotes)

## 3. Copy zshrc-mini to .zshrc inside `sync` folder

Here I provide a more minimal zshrc for a simple setup ready to develop anything!

For extra stuff, feel free to install them

Please put the file in `sync/home` folder

- That's where we will symlink into $HOME

## 4. Follow instructions in root README.md to symlink dotfiles

**NOTE**: You can delete any configs that you don't need for a clean symlink process

## 5. Run stuff after symlinking

### Run `zshrc`

- `source ~/.zshrc`

### Source `tmux`

- Open a tmux session
- `tmux source-file ~/.tmux.conf`
- Prefix + I -> Install plugins

## 6. Cool knowledge notes

- View symlinks

```
ls -l $(which stow)
```
