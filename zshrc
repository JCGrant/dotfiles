HISTSIZE=1000
if (( ! EUID )); then
  HISTFILE=~/.history_root
else
  HISTFILE=~/.history
fi
SAVEHIST=1000

export ANDROID_HOME=/usr/local/opt/android-sdk
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_92.jdk/Contents/Home

export PATH=~/bin:$PATH
export PATH=/usr/local/mysql/bin:$PATH
export PATH=/usr/local/sbin:$PATH

export NVM_DIR="/Users/jcgrant/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

source ~/.git-prompt.sh
setopt PROMPT_SUBST ; PS1=$'\n[%n@%m %~$(__git_ps1 " (%s)")]\nλ '

alias sftp="rlwrap sftp"

alias pyserver="python3 -m http.server"
alias phpserver="php -S 127.0.0.1:8000"

alias ls='ls -Gp'
alias ll='ls -l'

eval "$(rbenv init -)"
eval "$(thefuck --alias)"

export VIRTUALENVWRAPPER_PYTHON=/Users/jcgrant/.pyenv/shims/python
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
