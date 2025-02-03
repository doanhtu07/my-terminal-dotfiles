# Assuming you are running the script at `~/my-terminal-dotfiles`

cd ./sync-macos-dotfiles/sync

stow --target=$HOME -D home

stow --target=$HOME/.config/nvim -D nvim
rm -r $HOME/.config/nvim

stow --target=$HOME/.config/yazi -D yazi
rm -r $HOME/.config/yazi

stow --target=$HOME/.config/zed -D zed
rm -r $HOME/.config/zed

cd ../..
