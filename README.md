# My dotfiles in HOME

## My cheatsheets

[Cheatsheets in Notion](https://tudope.notion.site/Cheatsheets-5315b36f45cd41ab899d8f4538bb0e1f?pvs=4)

## Use GNU stow

Assuming you already have GNU stow on your system

```
# Assuming you are in ~/my-terminal-dotfiles
stow .

# Remove symlinks by
stow -D .
```

## Manually make symlinks

Symlinks all files in my-terminal-dotfiles to the home directory.

- https://stackoverflow.com/questions/46534290/symlink-dotfiles

```
cp -rsf ~/my-terminal-dotfiles/dotfiles/ ~
```

## List all symlinks

```
eza -l -a | grep '^l'
```

```
ls -l -a | grep '^l'
```

## My Neovim config

[Neovim config Github link](https://github.com/doanhtu07/my-neovim-config)
