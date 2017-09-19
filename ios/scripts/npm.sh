#!/bin/bash

set -x 
set -e

sudo -u vagrant -H /bin/bash --login -c ' \
	npm -g install yarn && \
	npm -g instal appium && \
	npm -g install wd'