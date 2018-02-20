#!/bin/bash

sudo -u vagrant -H /bin/bash --login -c 'echo "gem: --no-document" >> ~/.gemrc'
sudo -u vagrant -H /bin/bash --login -c 'curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable'
echo "Installing ruby version ${RUBY_VERSION}"
sudo -u vagrant -H /bin/bash --login -c " \
	rvm pkg install libyaml && \
	rvm install $RUBY_VERSION && \
	rvm use ${RUBY_VERSION} 	&& \
	gem install xcpretty -N 	&& \
	gem install fastlane	&& \
	gem install cocoapods"

