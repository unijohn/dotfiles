# Revised 2017-09-17_01:21:06
#!/bin/bash

# The goal of this file is to just allow me to clone my git repo
# and have this file handle setting up my dotfiles
# ... also a way to revisit how to do bash scripting

for file in git/dotfiles/.*; do
  [ -e "$file" ] || continue

  file_name=${file##*/}

  if [ "$file_name" != "." -a "$file_name" != ".." ]; then

    if [[ -e ~/$file_name ]]; then
      echo "~/$file_name exists"
      echo "Removing ~/$file_name"
      rm -f ~/"$file_name"
    fi

    echo "Creating symlink for $file_name"
    ln -s ~/git/dotfiles/"$file_name" ~/"$file_name"

  fi

done

