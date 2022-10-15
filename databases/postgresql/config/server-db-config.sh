# SERVER CONFIG
#
#

# FROM MAIN SERVER
ip addr | grep inet # copy IP_ADDR
sudo su - postgres
psql

# from postgres role in psql
\password # change passwd for role 'postgres'
CREATE DATABASE appdb;
\c appdb # connect to db appdb
CREATE USER approle; # or CREATE USER approle WITH SUPERUSER;
\password approle # change passwd for role 'approle'
\q

# edit server configuration
sudo ls /var/lib/pgsql/12/data
sudo vim /var/lib/pgsql/12/data/postgres.conf

# change postgresql configuration details
# ---------------------------------------------------
listen_address = '*'
port = 5432
max_connections = 500

shared_buffers = 256MB
# ---------------------------------------------------

sudo vim /var/lib/pgsql/12/data/pg_hba.conf

# change host-based authentication details
# apply to EOF
# ---------------------------------------------------
# Enable remote connection via password-based authentication
host    all     all     0.0.0.0/0       md5
# ---------------------------------------------------

sudo systemctl restart postgresql-12
sudo systemctl status postgresql-12

# FROM A DIFFERENT SERVER
psql -h $IP_ADDR -U approle -p 5432 -W -d appdb
# connects to psql role approle in db appdb

# DATABASE CONFIG
#
#

ALTER DATABASE appdb RENAME AppDatabase;

SHOW enable_indexscan; # on
ALTER DATABASE AppDatabase SET enable_indexscan TO off;
SHOW enable_indexscan; # off