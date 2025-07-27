# A mini script to setup environment on MacOS

Before we start, you should have cloned this repo to your MacOS machine already

Assuming your machine has these tools installed:

- curl
- zsh (shell)
- brew (package manager)

## 1. Base setup

These are optional - in case MacOS doesn't have by default

```
# Zsh
brew install zsh
chsh -s /bin/zsh

# Git
brew install git
```

## 2. Auto install (brew)

Run the `auto-install.sh` script

### Install terminal and editor

- Install wezterm
- Install vscode

### Install fonts

- Setup fonts

### Install language tools

- Install pyenv
- Install jenv
- Install nvm
- Install pnpm

- Install chruby and ruby-install (https://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/)

  - Check versions at ~/.rubies/
  - chruby 3.3.5

- Install lua

### Install dev tools

- pgadmin4
- dbeaver
- beekeeper-studio
- redis-insight
- docker

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

### Install git tools

- Install gh:
  - `gh auth login`
  - `gh setup-git`

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
- Install karabiner elements

## 3. Copy zshrc-mini to .zshrc inside `sync` folder

In this folder `setup-macos`, I provide a more minimal zshrc (`zshrc-mini`) for a simple setup, which is ready to develop anything!

For extra stuff, feel free to install them

Please replace the zshrc file in `sync/home` folder

- That's where we will symlink into $HOME

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
