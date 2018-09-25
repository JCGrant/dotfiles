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

export PATH=$PATH:$HOME/.local/bin

export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

if [ ! -f ~/.git-prompt.sh ]; then
  curl -fLo ~/.git-prompt.sh http://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
fi
source ~/.git-prompt.sh

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

export PS1='\n\u@\h:\w $(__git_ps1 "(%s)")\nλ '

alias ls="ls -G"

if [ -f ~/.local-bashrc ]; then
  source ~/.local-bashrc
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
