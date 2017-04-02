# QoL
alias cls='clear'
alias sh_reload='source ~/.bash_aliases'

# Dir Listing
alias ls='ls -Gp'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lsa='ls -la'

# Dir Management
alias cp='cp -iv'
alias rm='rm -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'

## Dir traversing
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

## Process Management
alias memHogsTop='top -l 1 -o rsize | head -20'
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }

# git
alias get='git'
alias git-bash='git clone git@github.com:unijohn/bash_conf.git'
