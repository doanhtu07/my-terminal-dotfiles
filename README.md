# My ultimate dotfiles

## My cheatsheets

[Cheatsheets in Notion](https://tudope.notion.site/Cheatsheets-5315b36f45cd41ab899d8f4538bb0e1f?pvs=4)

## My Neovim config

[MacOS Neovim config](./sync-macos-dotfiles/sync/nvim/README.md)

[Linux/WSL Neovim config](./sync-wsl-dotfiles/sync/nvim/README.md)

## Bootstrap environment

If you need to boot up an environment from scratch, check out the `bootstrap` folder.

As of now, I have MacOS setup, but it should be the same for Linux.

On Windows, the setup is a little bit harder since we need to use a mix of WSL and PowerShell

## Manage dotfiles symlinks

---

**IMPORTANT NOTES**:

- If you want to change the structure of the dotfiles, I recommend you to remove symlinks first
- Then, do your changes as you want
- Finally, re-create the symlinks
- If you don't follow this lifecycle, you can unexpectedly break the structure of your connections
- You might end up having to manually remove the symlinks yourselves

---

### MacOS

- We will use GNU stow
- Assuming you are in `~/my-terminal-dotfiles`
  - Create symlinks by running `source ./sync-macos-dotfiles/scripts/sync.sh`
  - Remove symlinks by running `source ./sync-macos-dotfiles/scripts/unsync.sh`

---

### Windows PowerShell

- We won't use any special tools but simple scripts I created
- Assuming you are in `~/my-terminal-dotfiles`
  - Create symlinks by running `. .\sync-powershell-dotfiles\scripts\sync.ps1`
  - Remove symlinks by running `. .\sync-powershell-dotfiles\scripts\unsync.ps1`

---

### Windows WSL

- We will use GNU stow
- Assuming you are in `~/my-terminal-dotfiles`
  - Create symlinks by running `source ./sync-wsl-dotfiles/scripts/sync.sh`
  - Remove symlinks by running `source ./sync-wsl-dotfiles/scripts/unsync.sh`
