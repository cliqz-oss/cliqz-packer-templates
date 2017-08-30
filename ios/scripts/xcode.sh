#!/bin/sh

set -eo pipefail
shopt -s nullglob

cd /Applications
xar -xf /private/tmp/Xcode.zip
sudo tar zxvf Content
cd
if [[ -d "/Applications/Xcode-Beta.app" ]]; then
    echo "Moving Xcode Beta..."
    mv "/Applications/Xcode-Beta.app" "/Applications/Xcode.app"
fi

[[ ! -d "/Applications/Xcode.app" ]] && exit

xcode-select -switch /Applications/Xcode.app/Contents/Developer
# accept Xcode license
xcodebuild -license accept
