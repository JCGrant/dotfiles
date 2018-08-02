case $- in
  *i*) ;;
    *) return;;
esac

[ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit; }

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend
shopt -s checkwinsize

EDITOR=vim

export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

