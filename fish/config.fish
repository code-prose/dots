if status is-interactive
    if test -z "$TMUX"
        tmux attach-session -t default; or tmux new-session -s default
    end
end

starship init fish | source

function firefox
    firefox-developer-edition > /dev/null 2>&1 &
end
# alias
alias vim='nvim'
