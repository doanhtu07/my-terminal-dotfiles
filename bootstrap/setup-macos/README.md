# A mini script to setup environment on MacOS

Before we start, you should have cloned this repo to your machine already

Assuming you have installed:

- curl
- zsh (shell)
- brew (package manager)
- wezterm (terminal)
- vscode (editor)
- zed (fast editor - optional)

## 1. Auto install

Run the `auto-install.sh` script

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

### Install window management

- Install yabai
- Install skhd
- Install aerospace
- Install raycast
- Install JankyBorders

### Install fun stuff

- Install fortune (ascii quotes)
- Install figlet (words to ascii art)
- Install cowsay (fun ascii art for quotes)

## 2. Copy zshrc-mini to .zshrc inside `sync` folder

Here I provide a more minimal zshrc for a simple setup ready to develop anything!

For extra stuff, feel free to install them

## 3. Follow instructions in root README.md to symlink dotfiles

You can delete any configs that you don't need for a clean symlink process

## 4. Run stuff after symlinking

### Run `zshrc`

- `source ~/.zshrc`

### Reload `wezterm`

- Cmd + r

### Source `tmux`

- Open a tmux session
- `tmux source-file ~/.tmux.conf`
- Prefix + I -> Install plugins

### (Optional) Run `yabai` and `skhd`

- **NOTE**: This step is optional because you can just use `aerospace` for window management instead
- Run `yabai --start-service` and `skhd --start-service`

## 5. Cool knowledge notes

- View symlinks

```
ls -l $(which stow)
```
