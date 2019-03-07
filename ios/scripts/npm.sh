#!/bin/bash

set -x 

sudo -u vagrant -H /bin/bash --login -c 'curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash'

sudo -u vagrant -H /bin/bash --login -c ' \
	command -v nvm; \
	nvm install 9.11.2 && \
	nvm use 9.11.2 && \
	nvm alias default 9.11.2'

sudo -u vagrant -H /bin/bash --login -c ' \
	npm install -g npm@6.5.0 && \
	npm install -g yarn && \
	npm install -g appium && \
	npm install -g appdmg && \
	npm install -g wd'