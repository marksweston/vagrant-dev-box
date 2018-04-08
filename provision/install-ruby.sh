#!/usr/bin/env bash

source $HOME/.rvm/scripts/rvm || source /etc/profile.d/rvm.sh

rvm use --default --install $1

rvm use @global
gem update --system
gem update
gem install bundler
rvm use ruby@global --default
sudo apt-get autoremove
rvm cleanup all