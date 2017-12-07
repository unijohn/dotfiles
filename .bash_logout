# ~/.bash_logout: executed by bash(1) when login shell exits.

# Clear console if possible when logging out to increase privacy.
# Check for different options to clear the console in case one option
# is missing on a platform

if [ "$SHLVL" = 1 ]; then
  [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q 2> /dev/null
  [ -x /usr/bin/tput ] && /usr/bin/tput clear 2> /dev/null

  history -c
fi

