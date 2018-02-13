#!/bin/bash

bundle

set -eo pipefail
set -x
source ~/.profile 

sudo xcodebuild -license accept

: | sudo -u vagrant -H ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

sudo -u vagrant -H /bin/bash --login -c \
	'brew update'

sudo -u vagrant -H /bin/bash --login -c \
    'brew install pv wget nss cask'

sudo -u vagrant -H /bin/bash --login -c \
    'brew cask install java'

sudo -u vagrant -H /bin/bash --login -c 'curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash'
