# Assuming you are running the script at `~/my-terminal-dotfiles`

cd ./sync-macos-dotfiles/sync

stow --target=$HOME home
chmod +x $HOME/custom-bin/*

mkdir -p $HOME/.config/nvim
stow --target=$HOME/.config/nvim nvim

mkdir -p $HOME/.config/yazi
stow --target=$HOME/.config/yazi yazi

mkdir -p $HOME/.config/zed
stow --target=$HOME/.config/zed zed

cd ../..
