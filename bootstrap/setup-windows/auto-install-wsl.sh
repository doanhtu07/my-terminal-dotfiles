brew update

# https://gist.github.com/davidteren/898f2dcccd42d9f8680ec69a3a5d350e
# Cask are only for MacOS
# 2 solutions:
# - Solution 1: https://github.com/Homebrew/homebrew-linux-fonts/tree/master
# - Solution 2: Many other options on https://github.com/ryanoasis/nerd-fonts

# brew install --cask font-jetbrains-mono-nerd-font
# brew install --cask font-symbols-only-nerd-font

brew tap homebrew/linux-fonts
brew install font-jetbrains-mono-nerd-font
brew install font-symbols-only-nerd-font

brew install pyenv
brew install jenv
brew install nvm
brew install pnpm
brew install chruby ruby-install
brew install lua
brew install php
brew install composer

brew install neovim ripgrep fd
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
brew install yazi
brew install eza
brew install zoxide
brew install fzf
brew install bat
brew install diff-so-fancy
brew install stow
brew install unzip

brew install gh

brew install powerlevel10k
brew install zsh-vi-mode
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting

brew install fortune
brew install figlet
brew install cowsay
