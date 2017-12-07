# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Initialize
# Determine within a startup script whether Bash is running interactively or not.
[ -z "$PS1" ] && return
case $- in
  *i*) ;;
  *) return ;;
esac

# Clear away command_not_found_handle if a system bashrc file set it up
unset -f command_not_found_handle

# Remove any pre-existing aliases in case of re-sourcing .bashrc
$(unalias -a)

# OS detection to handle different quirks
case "$OSTYPE" in
  solaris*)
    echo "OS Detection:  solaris"
    ;;

# Temporarily commenting out this section to see what Linux distros
# _would not_ show up as 'linux-gnu'

# linux-gnu*)
#   echo "OS Detection:  linux-gnu"

#   # enable color support of ls and also add handy aliases
#   if [ -x /usr/bin/dircolors ]; then
#     test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#     alias ls='ls --color=auto'
#   fi
#   ;;

  linux*)
    echo "OS Detection:  linux ($OSTYPE)"

    # Set LC encoding to UTF-8.
    # Fixes for illegal byte sequence (http://stackoverflow.com/q/19242275/55075).
    export LANG=en_US.UTF-8
    export LANGUAGE="en_US:en"

    # Linux: enable color support of ls and also add handy aliases
    if [ -x /usr/bin/dircolors ]; then
      test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
      alias ls='ls --color=auto'

      alias grep='grep --color=auto'
      alias egrep='egrep --color=auto'
      alias fgrep='fgrep --color=auto'
    fi

    # Linux: Enable bash_completion (Install by: brew install bash-completion)
    # enable programmable completion features (you don't need to enable
    # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
    # sources /etc/bash.bashrc).
    if ! shopt -oq posix; then
      if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion

      elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion

      fi
    fi

    # Export platform-specific options.
    export LS_OPTIONS='--color=auto -h'

    # Linux specific aliases.
    if [ -f ~/.bash_aliases_linux ]; then
      . ~/.bash_aliases_linux
    fi

    ;;

  darwin*)
    echo "OS Detection:  darwin (MacOS X)"

    # Fixes for illegal byte sequence (http://stackoverflow.com/q/19242275/55075).
    export LC_ALL=en_US.UTF-8
    export LANG=en_US.UTF-8

    # Brew path additions
    export PATH="/usr/local/bin:$PATH"

    # MacOS X brew: detect if brew exists on system
    if [ -x /usr/local/bin/brew ]; then

      # coreutils version of 'ls'
      if [ -f $(brew --prefix)/opt/coreutils/bin/gls ]; then
        alias ls='gls --color=auto'
      else
        alias ls='ls -G -h'
      fi

      # OSX:  Enable bash_completion (Install by: brew install bash-completion)
      #       Homebrew's own bash completion script: /usr/local/etc/bash_completion.d
      if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
      fi

    else
      alias ls='ls -G -h'
    fi

    # Export platform-specific options.
    export LS_OPTIONS='-G -h'

    # MacOS X specific aliases.
    if [ -f ~/.bash_aliases_macosx ]; then
      . ~/.bash_aliases_macos
    fi

    ;;

  bsd*)
    echo "OS Detection:  bsd  ($OSTYPE)"
    export LS_OPTIONS='-G'

    ;;

  # POSIX compatibility layer and Linux environment emulation for Windows
  cygwin*) echo "OS Detection:  cygwin*" ;;

  # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
  msys*) echo "OS Detection:  msys*" ;;

  # I'm not sure this can happen.
  win32*) echo "OS Detection:  win32*" ;;

  *) echo "Unknown: $OSTYPE" ;;

esac

# Make less more friendly for non-text input files, see lesspipe(1).
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt

check_color_prompt=yes

if [ -n "$check_color_prompt" ]; then

  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes

  else
    color_prompt=

  fi

fi

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

if [ "$color_prompt" = yes ]; then

    # Source the color settings file before setting PS1.
    if [ -f ~/.bash_colors ]; then
      . ~/.bash_colors
    fi

# Default Prompt for PS1
    PS1="$ICyan(${HOSTNAME:9:5})$Color_Off \u ($Green\w$Color_Off)"' `git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\<\\\\\1\>\ /`'"$IBlack$ $Color_Off"

# Orig. Prompt for PS1
#   PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

else
   PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '

fi

unset color_prompt check_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*aler
t$//'\'')"'

# Aliases definitions
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# Includes function definitions.
if [ -f ~/.bash_functions ]; then
  . ~/.bash_functions
fi

# Includes shell options.
if [ -f ~/.bash_options ]; then
  . ~/.bash_options
fi

# Includes shell exports
if [ -f ~/.bash_exports ]; then
  . ~/.bash_exports
fi

# Includes python options
if [ -f ~/.bash_python ]; then
  . ~/.bash_python
fi

# Load private secret settings.
if [ -f ~/.secrets ]; then
  . ~/.secrets
fi
