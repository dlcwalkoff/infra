#!/usr/bin/env bash

# Вызывает немедленный выход, если выходное состояние команды не нулевое
set -e

# Add apt key
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'

# MongoDB install
apt-get update
apt-get install -y mongodb-org

# Enable mongod service
systemctl enable mongod