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

if [ ! -f ~/.git-prompt.sh ]; then
  curl -fLo ~/.git-prompt.sh http://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
fi
source ~/.git-prompt.sh

if [ ! -f ~/.git-completion.bash ]; then
  curl -fLo ~/.git-completion.bash http://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
fi
source ~/.git-completion.bash

export PS1='\n\u@\h:\w $(__git_ps1 "(%s)")\nλ '

alias ls="ls -G"

if [ -f ~/.local-bashrc ]; then
  source ~/.local-bashrc
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
