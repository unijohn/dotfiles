# ~/.bash_logout: executed by bash(1) when login shell exits.

# Clear console if possible when logging out to increase privacy.

if [ "$SHLVL" = 1 ]; then
  [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q 2> /dev/null
fi
