# Make symlinks

Symlinks all files in my-terminal-dotfiles to the home directory.

- https://stackoverflow.com/questions/46534290/symlink-dotfiles

```
cp -rsf ~/my-terminal-dotfiles/dotfiles/ ~
```

# List all symlinks

```
eza -l -a | grep '^l'
```

```
ls -l -a | grep '^l'
```
