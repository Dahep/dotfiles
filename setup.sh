#!/usr/bin/env bash
source scripts/setup-ente.sh
source scripts/setup-bashsimplecurses.sh
stow --adopt . || exit 1
