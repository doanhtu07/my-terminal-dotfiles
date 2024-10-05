cd ./sync

stow --target=$HOME home
mkdir -p $HOME/.config/nvim && stow --target=$HOME/.config/nvim nvim

cd ..
