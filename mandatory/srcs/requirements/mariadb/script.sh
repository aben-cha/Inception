#!/bin/bash

# set -o allexport
source ../../.env
# set +o allexport


# echo "CREATE DATABASE ${DB_NAME}";
# echo "CREATE USER ${DB_USER}";
# /docker-entrypoint-initdb.d/init.sql
# COPY script.sh /docker-entrypoint-initdb.d/
cat <<EOF #> init.sh
CREATE DATABASE ${DB_NAME};
CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
EOF;