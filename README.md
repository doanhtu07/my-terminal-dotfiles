# My dotfiles in HOME

## My cheatsheets

[Cheatsheets in Notion](https://tudope.notion.site/Cheatsheets-5315b36f45cd41ab899d8f4538bb0e1f?pvs=4)

## Make symlinks

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
