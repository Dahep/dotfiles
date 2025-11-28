#!/usr/bin/env bash

if [ ! -d ~/.local/lib ]; then
  mkdir -p ~/.local/lib
fi
make -C dependencies/simplecurses install PREFIX=~/.local -s
chmod +x ~/.local/lib/simple_curses.sh