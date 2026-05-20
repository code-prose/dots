alias vim='nvim'

alias ls="eza --color=always --long --no-filesize --icons=always --no-time --no-user --no-permissions"

eval "$(zoxide init zsh)"

alias cd="z"

# can insert file type for non alias
# e.g. git ls-files "*.rs" | xargs wc -l
alias lc="git ls-files | xargs wc -l"
