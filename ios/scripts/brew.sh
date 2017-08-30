#!/bin/bash

set -eo pipefail

: | sudo -u vagrant -H ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

sudo -u vagrant -H /bin/bash --login -c \
	'brew update'

sudo -u vagrant -H /bin/bash --login -c \
    'brew install xz wget node nss cask'

sudo -u vagrant -H /bin/bash --login -c \
    'brew cask install java'
