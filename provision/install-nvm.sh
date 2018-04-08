#!/usr/bin/env bash

# Install Node Version Manager ################################################

echo "***************************************************"
echo "Checking for NVM... "
echo "***************************************************"
if [[ ! -x "$HOME/.nvm" ]]; then
  #python required for compiling node
  sudo apt-get update && sudo apt-get install -y python
  sudo -u vagrant wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
else
  echo "OK"
fi



