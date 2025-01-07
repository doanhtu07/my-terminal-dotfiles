# === Export basic env variables ===

# List all java versions: "/usr/libexec/java_home -V"
# export JAVA_HOME=
# export ANDROID_HOME=

# === === ===

# === Set up plugins and other settings ===

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Power Level 10k run code
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set up pyenv
# https://github.com/pyenv/pyenv?tab=readme-ov-file#set-up-your-shell-environment-for-pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

mkdir -p $HOME/.nvim
export NVM_DIR="$HOME/.nvm"
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

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
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Run zsh syntax highlighting plugin code
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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

# === === ===
