# Revised 2017-09-17_02:02:01
#!/bin/bash

# The goal of this file is to just allow me to clone my git repo
# and have this file handle setting up my dotfiles
# ... also a way to revisit how to do bash scripting

for file in git/dotfiles/.*; do
  [ -e "$file" ] || continue

  file_name=${file##*/}

# echo ".. $file_name"

  if [ "$file_name" != "." -a "$file_name" != ".." -a "$file_name" != ".git" ]; then

#   echo ".... $file_name"

    if [[ -e ~/$file_name ]]; then
      echo "~/$file_name exists"
#     echo "Removing ~/$file_name"
      rm -f ~/"$file_name"
    fi

    printf '%s\n\n' "Creating symlink for $file_name"
    ln -s ~/git/dotfiles/"$file_name" ~/"$file_name"

  fi

done

if [[ -e ~/.bash_aliases ]]; then
  echo "Sourcing new .bash_aliases file"
  bash --rcfile ~/.bash_aliases
fi

