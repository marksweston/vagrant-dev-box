#!/usr/bin/env bash

# Install Yarn package manager ################################################

echo "***************************************************"
echo "Checking Yarn installation..."
echo "***************************************************"
if ! dpkg -s yarn; then
 curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
 echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
 sudo apt-get update && sudo apt-get install -y yarn
fi