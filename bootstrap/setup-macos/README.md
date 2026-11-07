# A mini script to setup environment on MacOS

Before we start, you should have cloned this repo to your MacOS machine already

Assuming your machine has these tools installed:

- curl
- zsh (shell)
- brew (package manager)

# Manual install dev software

- Sidebar (sidebarapp.net):
  - Not available in brew
  - Helps simulate Windows-like taskbar
  - Trial for 7 days, then buy license

## 1. Base setup

These are optional - in case MacOS doesn't have by default

```bash
# Zsh
brew install zsh
chsh -s /bin/zsh

# Git
brew install git
```

## 2. Auto install (brew)

Run the `auto-install.sh` script

### Install terminal and editor

- wezterm
- vscode
- herdr-app

### Install fonts

- Set up fonts for your terminal

### Install language tools

- pyenv
- uv
- jenv
- nvm
- pnpm

- chruby and ruby-install (https://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/)
  - Check versions at ~/.rubies/
  - chruby 3.3.5

- lua
- php
- composer

### Install dev tools

- pgadmin4
- dbeaver
- beekeeper-studio
- redis-insight
- docker
- xcodes
- aria2
- opencode

### Install neovim and cli tools

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

### Install git tools

- gh:
  - `gh auth login`
  - `gh setup-git`

### Install cli goodies

- power10k theme
- vim mode for zsh
- zsh-autosuggestions
- zsh-syntax-highlighting

### Install computer control tools

- yabai
- skhd
- aerospace
- raycast
- JankyBorders
- alt-tab
- Sidebar
- karabiner-elements
- monitorcontrol
- KeepingYouAwake

### Install fun stuff

- fortune (ascii quotes)
- figlet (words to ascii art)
- cowsay (fun ascii art for quotes)

## 3. Manually copy `zshrc-mini` to .zshrc inside `sync` folder

In this folder `setup-macos`, I provide a more minimal zshrc (`zshrc-mini`) for a simple setup, which is ready to develop anything!

For extra stuff, feel free to install them

Please replace the `.zshrc` file in `sync/home` folder

- That's where we will symlink into `$HOME`

## 4. Follow instructions in root README.md to symlink dotfiles

You can delete any configs that you don't need for a clean symlink process

## 5. Run stuff after symlinking

### Run `zshrc`

- `source ~/.zshrc`

### Reload `wezterm`

- Cmd + r

### Source `tmux`

- Open a tmux session
- `tmux source-file ~/.tmux.conf`
- Prefix + I -> Install plugins

**NOTES**:

- If tmux plugins somehow don't work as expected, just force remove the folder `~/.tmux/plugins`
- Then `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
- Create a new tmux session and run `tmux source-file ~/.tmux.conf`
- Do Prefix + I again to re-install plugins

### (Optional) Run `yabai` and `skhd`

- **NOTE**: This step is optional because you can just use `aerospace` for window management instead
- Run `yabai --start-service` and `skhd --start-service`

## 6. Cool knowledge notes

- View symlinks

```
ls -l $(which stow)
```
