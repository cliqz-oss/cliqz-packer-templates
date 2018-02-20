#!/bin/bash

set -eo pipefail
set -x


eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

sudo -u vagrant -H /bin/bash --login -c " \
	ssh-keyscan -t rsa github.com | ssh-keygen -lf -; \
	echo 'ssh-keyscan github.com' >>~/.ssh/known_hosts; \
	git config --global http.postBuffer 524288000; \
	echo '[url \"git@github.com:\"]' >>~/.gitconfig; \
	echo 'insteadOf = \"https://github.com/\"' >>~/.gitconfig; \
	echo -e 'Host github.com\n\tStrictHostKeyChecking no\n' >> ~/.ssh/config;\
	ssh -vT git@github.com; "