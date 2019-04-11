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
export PATH=$PATH:$HOME/dotfiles/bin

export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/binutils/bin:$PATH"
export PATH="/usr/local/opt/unzip/bin:$PATH"

export PATH=$PATH:$HOME/bin


if [ ! -f ~/.git-prompt.sh ]; then
  curl -fLo ~/.git-prompt.sh http://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
fi
source ~/.git-prompt.sh

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

PROMPT_DIRTRIM=3
export PS1='\n\u@\h:\w $(__git_ps1 "(%s)")\nλ '

alias ls="ls -G --color"
alias ll="ls -l"
alias ..="cd .."

if [ -f ~/.local-bashrc ]; then
  source ~/.local-bashrc
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if command -v pyenv virtualenv 1>/dev/null 2>&1; then
  eval "$(pyenv virtualenv-init -)"
fi
