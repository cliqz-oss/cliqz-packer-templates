#!/bin/bash

set -x 

sudo -u vagrant -H /bin/bash --login -c 'curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash'

sudo -u vagrant -H /bin/bash --login -c ' \
	command -v nvm; \
	nvm install 8.5.0 && \
	nvm use 8.5.0 && \
	nvm alias default 8.5.0'

sudo -u vagrant -H /bin/bash --login -c ' \
	npm install -g yarn && \
	npm install -g appium && \
	npm install -g wd'