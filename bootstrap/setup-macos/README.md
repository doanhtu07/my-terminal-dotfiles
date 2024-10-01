# A mini script to setup environment on macOS

Assuming you already have:

- brew
- zsh
- wezterm
- vscode

## 1. Auto install

- Install pyenv
- Install nvm

- Install neovim
- Install tmux
- Install yabai
- Install skhd
- Install yazi

- Install eza (better ls)
- Install zoxide (better cd)
- Install fzf (better search)

- Install power10k theme
- Install vim mode for zsh
- Install zsh-autosuggestions
- Install zsh-syntax-highlighting

- Install gh: `gh auth login`
- Install JankyBorders

## 2. Copy zshrc-mini to .zshrc inside `sync` folder

Here I provide a more minimal zshrc for a simple setup ready to develop anyhthing!

For extra stuff, feel free to install them

## 3. Follow instructions in root README.md to symlink dotfiles

You can delete any configs that you don't need for a clean symlink

## 4. Run `zshrc`

- `source ~/.zshrc`

## Cool notes

- View symlinks

```
ls -l $(which stow)
```