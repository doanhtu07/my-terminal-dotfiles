# NOTE: This file only contains a part of full .zshrc. Since the full file might contain secured information.
# Specifically, this relates to theme and useful plugins for terminal.

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
