export GOBIN=~/go/bin
export PATH=$PATH:~/go/bin
if command -v nvim &> /dev/null
then
    export MANPAGER="nvim +Man!"
else
    export MANPAGER="vim +MANPAGER --not-a-term -"
fi
