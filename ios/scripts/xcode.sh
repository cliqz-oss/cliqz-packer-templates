#!/bin/bash -l

set -o pipefail
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

cat ~/.profile 
sudo -u vagrant -H /bin/bash --login -c 'command -v nvm'
sudo -u vagrant -H /bin/bash --login -c 'nvm install 8.5.0'
sudo -u vagrant -H /bin/bash --login -c 'nvm use 8.5.0'
sudo -u vagrant -H /bin/bash --login -c 'nvm alias default 8.5.0'

sudo -u vagrant -H /bin/bash --login -c \
    'brew install carthage'
gcc --version

which npm
