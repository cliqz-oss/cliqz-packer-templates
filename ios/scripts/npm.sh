#!/bin/bash

set -x 

sudo -u vagrant -H /bin/bash --login -c ' \
	npm install -g yarn && \
	npm install -g appium && \
	npm install -g wd'