#!/usr/bin/bash
# Make backup of dotfiles from home directory
rsync --exclude ".directory" -rlptgoDv --no-perms --existing ~/ .

