#!/usr/bin/env bash

set -euo pipefail

verbose=false
if [[ "${1:-}" == "-v" ]]; then
    verbose=true
fi

function _echo() {
    if $verbose; then
        echo "$@"
    fi
}

function update() {
    folder="$1"
    repo="$2"

    _echo "Updating $folder from $repo"
    if [ -z "$folder" ] || [ -z "$repo" ]; then
        _echo "Usage: update <folder> <repo>"
        return 1
    fi
    to_backup=$([[ -d "$folder" ]])
    if $to_backup; then
        _echo "Backing up existing folder $folder"
        mv "$folder" "/tmp/.git_backup_$$"
        _echo "Deleted existing folder $folder"
        rm -rf "$folder"
    fi
    _echo "Cloning $repo into $folder"
    git clone "$repo" "$folder" 2>/dev/null
    clone_status=$?
    if $to_backup && [ $clone_status -ne 0 ]; then
        _echo "Cloning failed, restoring backup"
        mv "/tmp/.git_backup_$$" "$folder"
        echo "Failed to update $folder from $repo"
    fi
    if [ $clone_status -eq 0 ]; then
        _echo "Successfully updated $folder from $repo"
        rm -rf "$folder/.git"
        [ -e "$folder/.gitignore" ] && rm -f "$folder/.gitignore"
        [ -e "$folder/.gitmodule" ] && rm -f "$folder/.gitmodule"
        _echo "Removed git metadata from $folder"
        [ -d "/tmp/.git_backup_$$" ] && rm -rf "/tmp/.git_backup_$$"
        _echo "Cleaned up backup"
    fi
}

function main() {
    # read dependencies from dependencies.txt

    while IFS="" read -r line || [ -n "$line" ]
    do
        # skip empty lines and comments
        [[ -z "$line" || "$line" =~ ^# ]] && continue
        # folder and repo should be separated by a space on each line call update on each
        # shellcheck disable=SC2086
        update $line
        done < dependencies.txt
        }

main