#!/bin/bash -l

set -eo pipefail
shopt -s nullglob
set -x

cd /private/tmp
cd

if [[ -d "/Applications/Xcode.app" ]]; then
    echo "Xcode is installed"
fi

[[ ! -d "/Applications/Xcode.app" ]] && exit

xcode-select -p
sudo xcode-select --print-path
sudo xcode-select -switch /Applications/Xcode.app
sudo xcode-select -p
# accept Xcode license
xcodebuild -license accept

sudo -u vagrant -H /bin/bash --login -c \
    'brew install carthage'
gcc --version