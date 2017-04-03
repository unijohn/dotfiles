# QoL
alias cls='clear'
alias quit='exit'
alias sh-reload='source ~/.bash_aliases'

alias sudo='sudo -H'
alias su='sudo'

# vim
alias vi='vim'
alias svi='sudo vim'
alias edit='vim'

# Directories
## Dir Listing
alias ls='ls -Gp'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lsa='ls -la'

## Dir Management
alias cp='cp -iv'
alias rm='rm -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'

## Dir Traversing
alias ~='cd ~'
alias ..='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

alias path='echo -e ${PATH//:/\\n}'
alias show_options='shopt'
alias fix_stty='stty sane'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

trash () { command mv "$@" ~/.Trash ; }
zipd() { zip -r "$1".zip "$1" ; }

# Networking
alias ping='ping -c 5'
alias fast-ping='ping -c 100 -s.4'

alias ports='netstat -tulanp'

alias wget='wget -c'

## Process Management
alias memHogsTop='top -l 1 -o rsize | head -20'
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }

# git
alias get='git'
alias git-bash='git clone git@github.com:unijohn/bash_conf.git'
alias g-add='git add'
alias g-pull='git pull origin master'
alias g-push='git push origin master'
alias g-amend='git commit --amend'
alias g-stat='git status'

g-ci() { git commit -m "$1" ; }
g-setup-upstream() {
  git remote add upstream https://github.com/$1/$2.git ;
}
g-sync(){
  git fetch upstream
  git checkout master
  git merge upstream/master
}

# apt
alias a-list='apt list --installed'

# python
alias dj-up='source /var/www/python/django/.virtualenv/bin/activate'

# vagrant
alias v-reload='vagrant reload'
alias v-up='vagrant up'
alias v-go='vagrant ssh'
alias v-stat='vagrant status'
alias v-down='vagrant halt'

# ssh
g-keygen-m() { ssh-keygen -t rsa -b 4096 -C "$1" -f "/Users/$2/.ssh/$3" -N "$4" ; }
