if status is-interactive
    if test -z "$TMUX"
        tmux attach-session -t default; or tmux new-session -s default
    end
end

starship init fish | source

function firefox
    firefox-developer-edition > /dev/null 2>&1 &
end

function protonvpn
    if test "$argv[1]" = "connect"; and test (count $argv) -eq 1
        command protonvpn connect --country CH
    else
        command protonvpn $argv
    end
end
# alias
alias vim='nvim'
