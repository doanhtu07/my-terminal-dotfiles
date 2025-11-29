# My ultimate dotfiles

## My cheatsheets

[Cheatsheets in Notion](https://tudope.notion.site/Cheatsheets-5315b36f45cd41ab899d8f4538bb0e1f?pvs=4)

## My Neovim config

[MacOS Neovim config](./sync-macos-dotfiles/sync/nvim/README.md)

[Linux/WSL Neovim config](./sync-wsl-dotfiles/sync/nvim/README.md)

## Setup git worktree

I recommend not directly using branch `main`

But create a local branch `my-local-branch` for your changes

## Bootstrap environment

When you are on a new machine and you need to boot up an environment from scratch, check out the `bootstrap` folder

As of now, I have both MacOS and Windows setups, but it should be the same for Linux with some tweaks

- You can take a look at Windows WSL as that's also Linux but with a mini setup

On Windows, the setup is a little bit harder since we need to setup a mix of WSL and PowerShell

## Manage dotfiles symlinks

---

### Dotfiles lifecycle

**IMPORTANT NOTES**:

- If you want to change the `FOLDER STRUCTURE` of the dotfiles, I recommend you to remove symlinks first
- Then, do your changes as you want
- Finally, re-create the symlinks
- If you don't follow this lifecycle, you can unexpectedly break the structure of your connections
- You might end up having to manually remove the symlinks yourselves

One broken example:

- Remove some files or folders without unsyncing first
- This causes old files and folders to be orphan links

---

### MacOS symlinks

- We will use GNU stow for symlink management
- Assuming you are in `my-terminal-dotfiles` folder
  - Create symlinks by running `source ./sync-macos-dotfiles/scripts/sync.sh`
  - Remove symlinks by running `source ./sync-macos-dotfiles/scripts/unsync.sh`

---

### Windows PowerShell

- We won't use any special tools but simple scripts I created which work similarly to GNU stow
- Assuming you are in `my-terminal-dotfiles` folder
  - Create symlinks by running `. .\sync-powershell-dotfiles\scripts\sync.ps1`
  - Remove symlinks by running `. .\sync-powershell-dotfiles\scripts\unsync.ps1`

---

### Windows WSL

- We will use GNU stow for symlink management
- Assuming you are in `my-terminal-dotfiles` folder
  - Create symlinks by running `source ./sync-wsl-dotfiles/scripts/sync.sh`
  - Remove symlinks by running `source ./sync-wsl-dotfiles/scripts/unsync.sh`
