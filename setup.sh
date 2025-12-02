#!/usr/bin/env bash
source scripts/setup-ente.sh
source scripts/setup-bashsimplecurses.sh
source scripts/setup-steam.sh
source scripts/setup-get-imgs.sh
source scripts/setup-executables.sh
stow --adopt . || exit 1
