#!/usr/bin/env bash

#if ~/bin does not exist, create it
if [ ! -d ~/bin ]; then
  mkdir ~/bin
fi
make -C dependencies/simplecurses install PREFIX=~/bin