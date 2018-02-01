#!/bin/bash -l

set -eo pipefail
shopt -s nullglob
set -x

cd /private/tmp
sudo ls -lha
chmod +x Xcode.xip
sudo open -Wa "Archive Utility" Xcode.xip
sudo mv Xcode.app /Applications/Xcode.app
cd

if [[ -d "/Applications/Xcode-Beta.app" ]]; then
    echo "Moving Xcode Beta..."
    mv "/Applications/Xcode-Beta.app" "/Applications/Xcode.app"
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
