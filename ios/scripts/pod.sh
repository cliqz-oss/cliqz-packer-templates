#!/bin/bash

set -o pipefail
shopt -s nullglob
set -x 


sudo -u vagrant -H /bin/bash --login -c " \
	[[ -d '/Users/vagrant/.cocoapods/repos' ]] || mkdir  -p ~/.cocoapods/repos; \
	cd ~/.cocoapods/repos; \
	git init; \
	git config --global core.compression 0; \
	git config --global http.postBuffer 524288000; \
	git clone --depth 1 https://github.com/CocoaPods/Specs.git master; \
	git fetch --unshallow; \
	git pull --all; \
	pod setup --verbose"


sudo -u vagrant -H /bin/bash --login -c "pod setup --verbose"