#!/usr/bin/env bash

# Clone app
git clone https://github.com/Artemmkin/reddit.git

# Install deps
cd reddit && bundle install

# Start DB
sudo systemctl start mongod

# Start app
puma -d