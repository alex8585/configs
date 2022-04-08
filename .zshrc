export VIMCONF="/home/alex/.vim"
export NVM_DIR="$HOME/.nvm"
export NVM_DIR=/usr/local/nvm
export TERM="xterm-256color"
PATH=$PATH:$HOME/bin
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
export HISTCONTROL=ignoreboth
export CDPATH=/home/links
export ZSH="/home/alex/.oh-my-zsh"
EDITOR=vim; export EDITOR
eval "$(lua /home/alex/scripts/z.lua-master/z.lua --init zsh once)"

source /opt/nvm/nvm.sh
stty start undef
stty stop undef
setopt noflowcontrol
# export FZF_DEFAULT_OPTS="--layout=reverse --inline-info"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
     source /etc/profile.d/vte.sh
fi


PS1='\[\033[1;31m\]$ >\[\033[00m\] '

ZSH_THEME="agnoster"

plugins=(tmux git laravel common-aliases )

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


