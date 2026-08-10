if status is-interactive
    if test -z "$TMUX"
        tmux attach-session -t default; or tmux new-session -s default
    end
end

# fish doesn't source /etc/profile.d, so flatpak's XDG_DATA_DIRS setup
# (needed for app launchers like wofi to find flatpak .desktop files)
# never runs unless replicated here
if command -v flatpak > /dev/null
    set -gx --path XDG_DATA_DIRS $HOME/.local/share/flatpak/exports/share /var/lib/flatpak/exports/share /usr/local/share /usr/share
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
