#!/usr/bin/env bash

find -L ~/bin -maxdepth 1 -type l -exec rm -- {} +
chmod +x ~/bin/*