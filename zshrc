HISTSIZE=1000
if (( ! EUID )); then
  HISTFILE=~/.history_root
else
  HISTFILE=~/.history
fi
SAVEHIST=1000


export PATH=$PATH:~/.composer/vendor/bin

export PATH=$PATH:/usr/local/mysql/bin

export PATH=$PATH:$HOME/Library/Haskell/bin

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:/Users/jcgrant/bin

export NVM_DIR="/Users/jcgrant/.nvm"

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_92.jdk/Contents/Home

export VIRTUALENVWRAPPER_PYTHON=/Users/jcgrant/.pyenv/shims/python
export PYENV_VIRTUALENV_DISABLE_PROMPT=1


source /usr/local/bin/virtualenvwrapper.sh

source $NVM_DIR/nvm.sh

source ~/bin/git-prompt.sh


eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(rbenv init -)"
eval "$(thefuck --alias)"


setopt PROMPT_SUBST ; PS1=$'\n[%n@%m %~$(__git_ps1 " (%s)")]\nλ '


zstyle ':completion:*:*:git:*' script ~/bin/git-completion.zsh


alias sftp="rlwrap sftp"

alias pyserver="python3 -m http.server"
alias phpserver="php -S 127.0.0.1:8000"

alias ls='ls -Gp'
alias ll='ls -l'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
