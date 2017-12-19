# Revised 2017-12-12_12:30:32
#!/bin/bash

alias cls='tput clear'
alias quit='exit'

alias sudo='sudo -H'
alias su='sudo'

# bash
alias ver-alias='head -n 1 ~/.bash_aliases'
alias alias-reload='unalias -a; source ~/.bash_aliases'
alias sh-level='echo $SHLVL'

alias senv='env | sort'

bashStamp() {
  echo "tail"
  tail -n +2 "$1" > "$1.tmp" && mv -f "$1.tmp" "$1"

  echo "date"
  echo "# Revised $(date +%F_%H:%M:%S)" | cat - "$1" > "$1.tmp" && mv -f "$1.tmp" "$1"
}

vimStamp() {
  echo "tail"
  tail -n +2 "$1" > "$1.tmp" && mv -f "$1.tmp" "$1"

  echo "date"
  echo "\" Revised $(date +%F_%H:%M:%S)" | cat - "$1" > "$1.tmp" && mv -f "$1.tmp" "$1"
}

# vim
# MacOS X brew: detect if brew exists on system

if [ -x /usr/local/bin/brew ]; then
  if [ -f $(brew --prefix)/bin/vim ]; then
    alias vi='$(brew --prefix)/bin/vim'
  else
    alias vi='vim'
  fi

else
  alias vi='vim'
fi

alias svi='sudo vim'
alias svim='svi'
alias edit='vim'
alias vim-cls='rm ~/.vim/tmp/*.swp'


# Directories
## Dir Listing
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lsa='ls -la'


## Dir Management
alias cp='cp -iv'
alias rm='rm -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias rmdir='rmdir -v'


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
alias show_exports='export -p'


alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'


trash () { command mv "$@" ~/.Trash ; }
zipd() { zip -r "$1".zip "$1" ; }


# Networking
alias fast-ping='ping -c 100 -s.4'
alias ping='ping -c 5'
alias ports='netstat -tulanp'
alias wget='wget -c'


## Process Management
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'
alias memHogsTop='top -l 1 -o rsize | head -20'

ps_my() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }

alias ps_gunicorn='ps aux |grep gunicorn |grep master| grep django_project'
alias kill_sighup='kill -s SIGHUP'

# git
alias get='git'
alias g-add='git add'
alias g-amend='git commit --amend'
alias g-cls='git clean'
alias g-cls-f='git clean -f'
alias g-co='git checkout'
alias g-fetch='git fetch origin master'
alias g-hard='git reset --hard origin'
alias g-pull='git pull origin master'
alias g-push='git push origin master'
alias g-rm='git rm'
alias g-stat='git status'
alias g-ls='git ls-files'
alias g-lsa='git ls-tree --full-tree -r HEAD'

alias g-agent='eval $(ssh-agent -s)'
alias g-keyadd='ssh-add ~/.ssh/id_rsa_git'
alias g-conn='g-agent; g-keyadd'

g-ci() { git commit -m "$1" ; }

g-setup-upstream() {
  git remote add upstream https://github.com/$1/$2.git ;
}
g-sync(){
  git fetch upstream
  git checkout master
  git merge upstream/master
}
g-http-to-ssh() {
  git remote set-url origin git@github.com:$1/$2.git;
}


# Apt Package management
alias apt-list='apt list --installed'


# django
dj-up() {
  python manage.py runserver 0:8000
}

alias dj-start="dj-up"


# wagtail
wag-init() { wagtail start "$1" ; }
alias wag-start='dj-start'


# python / env
# Using autoenv for now to handle this functionality
# py-default() { 
#   source "/home/ubuntu/.virtualenvs/default/bin/activate"
# }

py-venv(){
  python3 -m venv ~/.venv
}


# vagrant
alias v-reload='vagrant reload'
alias v-up='vagrant up'
alias v-go='vagrant ssh'
alias v-stat='vagrant status'
alias v-down='vagrant halt'


# ssh
g-keygen-m() { ssh-keygen -t rsa -b 4096 -C "$1" -f "/Users/$2/.ssh/$3" -N "$4" ; }
g-keygen-l() { ssh-keygen -t rsa -b 4096 -C "$1" -f "/home/$2/.ssh/id_rsa_git" -N "$4" ; }
g-keygen-vul() { ssh-keygen -t rsa -b 4096 -C "$1" -f "/home/ubuntu/.ssh/id_rsa_git" -N "$2" ; }
