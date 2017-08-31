#!/bin/sh

set -eo pipefail
shopt -s nullglob


cd /private/tmp
curl -O https://gist.githubusercontent.com/pudquick/ff412bcb29c9c1fa4b8d/raw/24b25538ea8df8d0634a2a6189aa581ccc6a5b4b/parse_pbzx2.py
xar -xf Xcode.xip
python parse_pbzx2.py Content
xz -d Content.part00.cpio.xz
sudo cpio -idm < ./Content.part00.cpio
mv Xcode.app /Applications/Xcode.app
cd

if [[ -d "/Applications/Xcode-Beta.app" ]]; then
    echo "Moving Xcode Beta..."
    mv "/Applications/Xcode-Beta.app" "/Applications/Xcode.app"
fi

[[ ! -d "/Applications/Xcode.app" ]] && exit

xcode-select -switch /Applications/Xcode.app/Contents/Developer
# accept Xcode license
xcodebuild -license accept

sudo -u vagrant -H /bin/bash --login -c \
    'brew install carthage'
