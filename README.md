# My ultimate dotfiles

## My cheatsheets

[Cheatsheets in Notion](https://tudope.notion.site/Cheatsheets-5315b36f45cd41ab899d8f4538bb0e1f?pvs=4)

## My Neovim config

- [Neovim config](./sync/.config/nvim/README.md)

## My bootstrap

If you need to boot up an environment from scratch, check out the bootstrap folder.

As of now, I have macos setup, but it should be the same for Linux.

I don't use Windows, so it's hard to say. But I'm sure the scripts and notes are still useful for you.

## Use GNU stow to symlink dotfiles

Assuming you already have GNU stow on your system

- Assuming you are in ~/my-terminal-dotfiles

```
stow --target=$HOME sync
```

- Remove symlinks by

```
stow --target=$HOME -D sync
```
