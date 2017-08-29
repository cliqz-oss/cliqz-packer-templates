#!/bin/sh

set -eo pipefail
shopt -s nullglob

curl ftp://cliqznas/packermacfiles/Xcode8.3.3.xip -o /Applications/Xcode.zip
cd /Applications
unzip Xcode.zip
cd 
if [[ -d "/Applications/Xcode-Beta.app" ]]; then
    echo "Moving Xcode Beta..."
    mv "/Applications/Xcode-Beta.app" "/Applications/Xcode.app"
fi

[[ ! -d "/Applications/Xcode.app" ]] && exit

xcode-select -switch /Applications/Xcode.app/Contents/Developer
# accept Xcode license
xcodebuild -license accept
