#!/usr/bin/env bash

# Вызывает немедленный выход, если выходное состояние команды не нулевое
set -e

# RVM install
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm requirements

# Ruby install
rvm install 2.4.1
rvm use 2.4.1 --default

# Bundler install
gem install bundler -V --no-ri --no-rdoc