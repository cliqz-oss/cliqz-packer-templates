#!/bin/bash

set -eo pipefail
set -x

sudo -u vagrant -H /bin/bash --login -c 'brew install python'
sudo -u vagrant -H /bin/bash --login -c 'wget https://bootstrap.pypa.io/get-pip.py'
sudo -u vagrant -H /bin/bash --login -c 'sudo python get-pip.py'
sudo -u vagrant -H /bin/bash --login -c 'pip install --user compare-locales'
sudo -u vagrant -H /bin/bash --login -c 'pip install --user virtualenv'
sudo -u vagrant -H /bin/bash --login -c 'sudo /usr/bin/easy_install virtualenv'
sudo -u vagrant -H /bin/bash --login -c 'brew install python2'
sudo -u vagrant -H /bin/bash --login -c 'brew install getsentry/tools/sentry-cli'
