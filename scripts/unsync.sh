cd ./sync

stow --target=$HOME -D home
stow --target=$HOME/.config/nvim -D nvim && rm -r $HOME/.config/nvim

cd ..
