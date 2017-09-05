#!/usr/bin/env bash

# @todo: correct startup-script for GCP
# su - appuser
# cd ~

#./install_ruby.sh
# RVM install
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
# source /etc/profile.d/rvm.sh
rvm requirements

# Ruby install
rvm install 2.4.1
rvm use 2.4.1 --default

# Bundler install
gem install bundler -V --no-ri --no-rdoc

#./install_mongodb.sh
# Add apt key
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'

# MongoDB install
sudo apt-get update
sudo apt-get install -y mongodb-org

#./deploy.sh
# Clone app
cd /home/appuser/ && mkdir app && cd app
git clone https://github.com/Artemmkin/reddit.git

# Install deps
cd reddit && bundle install

# Start DB
sudo systemctl start mongod

# Start app
puma -d