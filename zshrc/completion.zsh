autoload -U compinit; compinit
zstyle ':completion:*:*:cp:*' file-sort size
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:messages' format '%F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}-- no matches found --%f'
zstyle ':completions:*:default' list-colors ${(s.:.)LS_COLORS}


source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source /Users/loganrose/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

