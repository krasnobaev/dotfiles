#!/usr/bin/bash
# Make backup of dotfiles from home directory
rsync --exclude-from=.gitignore -rlptgoDv --no-perms --existing ~/ .

