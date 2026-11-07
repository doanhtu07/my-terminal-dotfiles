# WSL setup

Use this guide for Linux tools inside WSL. For Windows tools and PowerShell, see [PowerShell setup](powershell.md). Manage the Windows and WSL dotfiles independently.

## 1. Install Ubuntu

```powershell
wsl --install
```

## 2. Base setup

Update Ubuntu and install zsh:

```bash
sudo apt update
sudo apt upgrade
sudo apt install zsh
chsh -s /bin/zsh
```

Install Homebrew and its build dependencies:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
sudo apt install build-essential
brew install gcc

# Git
brew install git
```

### Learning links

- <https://dev.to/contactsunny/installing-zsh-and-oh-my-zsh-on-windows-11-with-wsl2-1p5i>
- <https://superuser.com/questions/1110882/how-to-change-default-shell-for-linux-susbsystem-for-windows>
- <https://medium.com/@smitgabani/advanced-wsl-configuration-2b4888332fff>

## 3. Auto install WSL (brew)

Run `auto-install-wsl.sh`.

### Install fonts

- Set up fonts for your terminal

### Install language tools

- pyenv
- uv
- jenv
- nvm
- pnpm

- chruby and ruby-install: <https://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/>
  - Check versions under `~/.rubies/`; this setup uses `chruby 3.3.5`.

- lua
- php
- composer

### Install dev tools

- opencode

### Install CLI tools

- neovim (AstroNvim distro)
  - ripgrep (needed by `telescope` and `fzf-lua`)
  - fd (needed by `telescope` and `fzf-lua`)
  - lazygit (better git cli)
  - gdu (disk usage toggle terminal)
  - bottom (process viewer toggle terminal)

- tmux
- herdr
- yazi
- eza (better ls)
- zoxide (better cd)
- fzf (better search)
- bat (file preview with syntax highlighting)
- diff-so-fancy (better git diff view)
- stow
- unzip

### Install git tools

- gh:
  - `gh auth login`
  - `gh setup-git`

### Install CLI goodies

- power10k theme
- vim mode for zsh
- zsh-autosuggestions
- zsh-syntax-highlighting

### Install fun stuff

- fortune (ascii quotes)
- figlet (words to ascii art)
- cowsay (fun ascii art for quotes)

## 4. Set up the zsh config

Copy `zshrc-mini` to `.zshrc` in `sync-wsl-dotfiles/sync/home/`. That is the config symlinked into `$HOME`.

## 5. Follow instructions in the root README to symlink dotfiles

You can remove configs you do not need before creating symlinks.

## 6. Run stuff after symlinking

### Run zsh

```bash
source ~/.zshrc
```

### Set up tmux plugins

- Open a tmux session.
- Run `tmux source-file ~/.tmux.conf`.
- Press the tmux prefix, then `I` to install plugins.

## 7. Cool knowledge notes

View symlinks with:

```bash
ls -l "$(which stow)"
```
