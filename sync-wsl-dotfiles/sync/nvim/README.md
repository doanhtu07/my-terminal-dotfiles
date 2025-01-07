# My Neovim Config

Hey guys, this is the Neovim config that I learned from Josean Martinez on Youtube "How I Setup Neovim To Make It AMAZING in 2024: The Ultimate Guide"

But of course, I changed it a lot while using Neovim for work to fit my taste and add more notes so that I can recall information later on.

You guys can fork or clone this to use for your Neovim.

Remember to watch the Youtube video by Josean to have a better understanding of some of the plugins are doing.

You should also visit the Github docs of these plugins for more information.

## Prerequisites

In my config for Neovim, some plugins require extra packages available directly from your shell (your environment).

I cannot recall every plugin since there are many dependencies from different plugins.

Here are some of the dependencies that live outside of Neovim ecosystem:

- eza (better ls)
- fzf (fuzzy find files)
- fd (better find files by name)
- ripgrep (better find files by content)
- zoxide (better jump to directory)

To know whether a plugin depends on something from your environment, check that plugin Github page and documentation.

## My main dotfiles repository

[Dotfiles Github link](https://github.com/doanhtu07/my-terminal-dotfiles)

## Extra notes

- **Jedi Language Server**
  - https://www.reddit.com/r/neovim/comments/1603eif/adding_extra_paths_to_jedilanguageserver/
  - https://github.com/pappasam/jedi-language-server/issues/199

## Linux

```bash
sudo apt update
sudo apt upgrade
```

### brew install

Install homebrew to install neovim v10

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Run these two commands in your terminal to add Homebrew to your PATH:

```bash
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /root/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

- Install Homebrew's dependencies if you have sudo access:

```bash
sudo apt-get install build-essential
```

- We recommend that you install GCC:

```bash
brew install gcc
```

Install Neovim

```bash
brew install neovim
```

Install some stuff for Mason

```bash
brew install npm
brew install unzip
brew install curl
brew install tar
brew install gzip
```

### Mason issues

Each package might require different stuff to install

So it's better to install each one that you need and fix errors if there are any

But for many packages, you will need python to build

It's wise to do:

```bash
pyenv install 3.12
pyenv global 3.12
```
