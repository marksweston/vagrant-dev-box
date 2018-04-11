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
  # sudo -u postgres bash -c "psql -c \"CREATE USER vagrant WITH PASSWORD 'vagrant';\""
  # sudo -u postgres bash -c "psql -c \"ALTER USER vagrant WITH SUPERUSER;\""
  # sudo -u postgres bash -c "psql -c \"CREATE USER root;\""
  # sudo -u postgres bash -c "psql -c \"ALTER USER root WITH SUPERUSER;\""
  echo "export DATABASE_URL=postgresql://rails:rails@localhost:5432" >> /home/vagrant/.bashrc
  echo "export TEST_DATABASE_URL=postgresql://rails:rails@localhost:5432" >> /home/vagrant/.bashrc

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