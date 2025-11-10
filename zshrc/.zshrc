export PATH="opt/homebrew/bin:$PATH"
tmux

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

clear
neofetch

export ZSH="$HOME/.oh-my-zsh"
source ~/powerlevel10k/powerlevel10k.zsh-theme

zstyle ':omz:update' mode disabled  # disable automatic updates

source $ZSH/oh-my-zsh.sh
source ~/.config/zshrc/alias.zsh
source ~/.config/zshrc/completion.zsh
source ~/.config/zshrc/env.zsh
source ~/.config/zshrc/plugins.zsh
source ~/.config/zshrc/set.zsh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
