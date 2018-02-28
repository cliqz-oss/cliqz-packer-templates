#!/bin/bash -l

set -o pipefail
shopt -s nullglob
set -x


if [[ -d "/Applications/Xcode.app" ]]; then
    echo "Xcode is installed"
fi

[[ ! -d "/Applications/Xcode.app" ]] && exit 1

xcode-select --print-path
xcode-select -switch /Applications/Xcode.app
xcode-select -p
