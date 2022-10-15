#!/bin/bash

# docs -- https://www.postgresql.org/download/linux/<distribution>

# pre-requisites
    # 1. add repository
    # 2. import gpg key
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# install
sudo apt-get update && sudo apt-get install postgresql postgresql-contrib

# verify service
service postgresql status
sudo service postgresql start # use if service is down

# launch psql
sudo su - postgres
psql

# secure the postgres role
\password postgres