#!/usr/bin/env bash

# Install Node.js #############################################################

echo "***************************************************"
echo "Checking for Node.js... "
echo "***************************************************"
if ! node --version; then
  # nvm installs these lines in .bashrc, but .bashrc doesn't seem to be loaded when running
  # Vagrant provsioning scripts. Even manually sourcing it doesn't seem to work
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  nvm install stable
  nvm alias default stable
  nvm use default
else
  echo 'OK'
fi