#!/usr/bin/env bash

# Install and setup PostgreSQL ################################################

echo "***************************************************"
echo "Checking Postgres installation..."
echo "***************************************************"
if ! dpkg -s postgresql; then
  echo "Installing PostgreSQL"
  sudo apt-get update
  sudo apt-get install -y postgresql libpq-dev postgresql-contrib

  echo "Setting up user"
  sudo -u postgres createuser -s rails
  sudo -u postgres bash -c "psql -c \"ALTER USER rails WITH PASSWORD 'rails';\""
  sudo -u postgres createdb rails
  echo "export DATABASE_URL=postgresql://rails:rails@localhost:5432" >> /home/vagrant/.bashrc
  echo "export TEST_DATABASE_URL=postgresql://rails:rails@localhost:5432" >> /home/vagrant/.bashrc

  # create a postgres superuser for the vagrant role, which Rails will effectively use by default
  sudo -u postgres createuser -s vagrant

  echo "Starting Postgres server"
  sudo service postgresql start
fi


# Install Redis ###############################################################

echo "***************************************************"
echo "Checking Redis installation..."
echo "***************************************************"
if ! dpkg -s redis-server; then
  echo "Instalating Redis"
  sudo apt-get install -y redis-server
fi
