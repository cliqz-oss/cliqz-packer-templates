#!/bin/bash
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
bundle

set -eo pipefail
set -x

sudo xcodebuild -license accept

: | sudo -u vagrant -H ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

sudo -u vagrant -H /bin/bash --login -c \
	'brew update'

sudo -u vagrant -H /bin/bash --login -c \
    'brew install pv wget node nss cask'

sudo -u vagrant -H /bin/bash --login -c \
    'brew cask install java'
