#!/usr/bin/env bash

echo "***************************************************"
echo 'Cheking for Ruby... '
echo "***************************************************"

# pre-req for nokogir, given how common that is, let's just assume we need it
sudo apt-get install libxmlsec1-dev

# install rvm unless ruby is already installed
if ! ruby -v; then
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
  curl -sSL https://get.rvm.io | bash -s $1
else
  echo 'OK'
fi
