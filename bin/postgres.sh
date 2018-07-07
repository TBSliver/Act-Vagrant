#! /bin/bash

sudo -u postgres psql < /vagrant/etc/postgres.sql

sudo sed -i 's/^\(local\|host\)\( * all * all .* \)\([A-Za-z0-9]*\)$/\1\2md5/' /etc/postgresql/9.5/main/pg_hba.conf

sudo systemctl restart postgresql
