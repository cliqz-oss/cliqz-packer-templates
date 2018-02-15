#!/bin/bash

set -eo pipefail
set -x

sudo -u vagrant -H /bin/bash --login -c " \
	git config --global http.postBuffer 524288000; \
	echo '[url \"git@github.com:\"]' >>~/.gitconfig; \
	echo 'insteadOf = \"https://github.com/\"' >>~/.gitconfig; \
	touch ~/.bashrc; \
	echo 'export LANG=en_US.UTF-8' >>~/.profile; \
	echo 'export LANGUAGE=en_US.UTF-8' >>~/.profile; \
	echo 'source $HOME/.bashrc' >>~/.profile; \
	echo 'export LC_ALL=en_US.UTF-8' >>~/.profile"

: | sudo -u vagrant -H ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

sudo -u vagrant -H /bin/bash --login -c \
	'brew update'

sudo -u vagrant -H /bin/bash --login -c \
    'brew install pv wget nss cask'


sudo -u vagrant -H /bin/bash --login -c \
    'brew install carthage'

sudo -u vagrant -H /bin/bash --login -c '\
    brew tap caskroom/versions &&\
    brew cask install java8'