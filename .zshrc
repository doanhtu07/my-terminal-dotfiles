# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set up pyenv
# https://github.com/pyenv/pyenv?tab=readme-ov-file#set-up-your-shell-environment-for-pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Add postgresql (pg_dump, pg_restore) to path
export PATH="/usr/local/opt/libpq/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/admin/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/admin/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/admin/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/admin/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home
export ANDROID_HOME=/Users/admin/Library/Android/sdk

# Herd injected PHP binary.
export PATH="/Users/admin/Library/Application Support/Herd/bin/":$PATH

# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/admin/Library/Application Support/Herd/config/php/82/"

# Microsoft vcpkg for C++ library manager
export VCPKG_ROOT="$HOME/vcpkg"

# WezTerm binary path
export PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"

# Power Level 10k run code
source /usr/local/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# Run zsh autosuggestions plugin code
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Run zsh syntax highlighting plugin code
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Set alias for eza plugin (better ls command)
alias ls="eza --color=always --long --icons=always --no-time --no-user --no-permissions"

# Set alias for zoxide
alias cd="z"
eval "$(zoxide init zsh)"

# Add vim mode to zsh
# IMPORTANT: config and stuff need to go before the actual plugin script
function zvm_config() {
  ZVM_INIT_MODE=sourcing # https://github.com/jeffreytse/zsh-vi-mode/issues/277
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
}
function zvm_after_init() {
  # Set up fzf key bindings and fuzzy completion
  # https://stackoverflow.com/questions/73033698/fzf-keybindings-doesnt-work-with-zsh-vi-mode
  # https://github.com/jeffreytse/zsh-vi-mode?tab=readme-ov-file#initialization-mode
  eval "$(fzf --zsh)"
} 
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Set alias for nvim
alias nv="nvim"

# /Users/admin/Desktop/Projects/virtual-machines/ros2-docker-dev
# https://github.com/adeeb10abbas/ros2-docker-dev
ros_dev() {
  # Check if the correct number of arguments were provided
  if (( $# % 2 != 0 )); then
    echo "Usage: ros_dev <container_name1> <project_path1> [<container_name2> <project_path2> ...]"
    return 1
  fi

  while (( $# >= 2 )); do
    # Set environment variables
    ROS_DEV_CONTAINER_NAME=$1
    ROS_PROJECT_PATH=$2
    shift 2

    # Run docker-compose from the correct directory
    cd "/Users/admin/Desktop/Projects/virtual-machines/ros2-docker-dev" && docker-compose up -d --build
  done
}
