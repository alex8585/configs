# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
DATA_DIR='/home/alex/data'
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export VIMCONF="/home/alex/.vim"
export NVM_DIR="$HOME/.nvm"
export NVM_DIR=/usr/local/nvm
export TERM="xterm-256color"
PATH=$PATH:$HOME/bin
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
export HISTCONTROL=ignoreboth
export CDPATH=/home/links
export UPDATE_ZSH_DAYS=1
EDITOR=vim; export EDITOR
eval "$(lua /home/alex/data/scripts/z.lua-master/z.lua --init zsh once)"

#source /opt/nvm/nvm.sh
stty start undef
stty stop undef
setopt noflowcontrol
export FZF_DEFAULT_OPTS="--height=100% --layout=reverse --inline-info"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
     source /etc/profile.d/vte.sh
fi


#PS1='\[\033[1;31m\]$ >\[\033[00m\] '

#ZSH_THEME="agnoster"

plugins=(extract fancy-ctrl-z dircycle cp copyfile copybuffer copypath ag tmux git laravel common-aliases aliases)

source $ZSH/oh-my-zsh.sh
source    /usr/share/fzf/key-bindings.zsh
source    /usr/share/fzf/completion.zsh
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


[[ -s /home/alex/.autojump/etc/profile.d/autojump.sh ]] && source /home/alex/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u

bindkey '^ ' autosuggest-accept
