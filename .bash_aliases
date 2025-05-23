targz() { tar -zcvf $1.tar.gz $1;   }
untargz() { tar -zxvf $1; }

function changeDirectory {
    cd $1 ; ls -la
}

laravel_create() {
	cd /mnt/home/alex85/data/scripts/ansible/nginx-laravel &&
	ansible-playbook playbook.yml -i hosts.yml  --ask-become-pass --extra-vars "http_host=$1"
}

wp_create() {
        cd /mnt/home/alex85/data/scripts/ansible/nginx-wordpress &&
        ansible-playbook playbook.yml -i hosts.yml  --ask-become-pass --extra-vars "http_host=$1"
}


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'

fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


alias cl=changeDirectory
alias ..='cl ../..'
alias ...='cl ../../..'

alias zz='z -I -t .'

alias refresh='source ~/.zshrc'


alias mnt='/home/alex/scripts/222/mnt.sh'
alias umnt='/home/alex/scripts/222/umnt.sh'


alias cd1='cd /home/alex/projects/notes-react'
alias cd2='cd /home/alex/projects/notes-vue'
alias cd3='cd /home/alex/projects/vue3'

alias dus='du -sh * | sort -rh'
alias duds='du -d 1 -h | sort -rh'


alias backup='sudo ${DATA_DIR}/python_projects/python/backup.py'
alias backup2=' ~/scripts/rsync_backup.sh'


alias fdf='\fdfind'
#alias rs='rsync -azvhP'
alias cc='cd $(cd /home/links && ls | fzf)'
alias ag='ag --no-heading --hidden'
alias rg='ag --no-heading --hidden'

alias F='fzf -m | xargs '
alias vimrc='${=EDITOR} ${ZDOTDIR:-$HOME}/.vimrc'
alias basha='${=EDITOR} ${ZDOTDIR:-$HOME}/.bash_aliases'
alias pg='ps aux | grep -v grep | grep $1'
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'

alias tags='ctags --recurse=yes --exclude=.git'
alias -g B='| bat'
alias python='python3'

alias v='vim'
alias lv='lvim'

alias larad="cd /home/alex/new_data/projects/laradock && docker-compose up -d nginx mysql phpmyadmin workspace"
alias work="docker exec -u laradock -it laradock-workspace-1 zsh"



