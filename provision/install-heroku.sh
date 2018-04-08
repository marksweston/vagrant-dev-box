#!/usr/bin/env bash

# Install Heroku CLI ##########################################################

echo "***************************************************"
echo "Checking Heroku CLI installation..."
echo "***************************************************"
if ! heroku --version; then
  wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh
else
  echo 'OK'
fi