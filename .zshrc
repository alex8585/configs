# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export VIMCONF="/home/alex/.vim"
export NVM_DIR="$HOME/.nvm"
export NVM_DIR=/usr/local/nvm
export TERM="xterm-256color"
PATH=$PATH:$HOME/bin
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
export DATA_DIR="$HOME/data"
export HISTCONTROL=ignoreboth
export CDPATH=/home/links
export ZSH="$HOME/.oh-my-zsh"
export UPDATE_ZSH_DAYS=1
EDITOR=vim; export EDITOR
eval "$(lua /mnt/home/alex85/data/scripts/z.lua-master/z.lua --init zsh once)"
# source ~/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh


export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
#source '/usr/local/bin/virtualenvwrapper.sh'
source <(fzf --zsh) 

# Add this to your .bashrc, .zshrc or equivalent.
# Run 'fff' with 'f' or whatever you decide to name the function.
f() {
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}



# source /opt/nvm/nvm.sh
stty start undef
stty stop undef
setopt noflowcontrol
# export FZF_DEFAULT_OPTS="--layout=reverse --inline-info"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
     # source /etc/profile.d/vte.sh
fi


PS1='\[\033[1;31m\]$ >\[\033[00m\] '

# ZSH_THEME="agnoster"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(zsh-autosuggestions fzf extract fancy-ctrl-z dircycle cp copyfile copybuffer copypath tmux git common-aliases aliases)

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


[[ -s /home/alex/.autojump/etc/profile.d/autojump.sh ]] && source /home/alex/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/alex85/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
export PATH=/home/alex/.local/bin:$PATH


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)


alias vim='gvim -v'
export EDITOR="gvim -v"
export VISUAL="$EDITOR"

fpath+=~/.zsh/completions
autoload -Uz compinit && compinit


eval "$(zoxide init zsh)"


function fcd() {
    local dir
    dir=$(fd -t d . ~ | fzf) && cd "$dir"
}
bindkey -s '^g' 'fcd\n'

setopt correct
setopt correct_all

alias r='ranger --choosedir=$HOME/.rangerdir; cd "$(cat $HOME/.rangerdir)"'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
