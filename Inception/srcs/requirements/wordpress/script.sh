#!/bin/bash

mkdir -p /var/www/html

cd /var/www/html
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
# wp config create \
#     --dbname=db_wordpress \
#     --dbuser=aben-cha \
#     --dbpass=aben-cha@@ \
#     --dbhost=mariadb --allow-root

sed -i "s/database_name_here/db_wordpress/" wp-config.php
sed -i "s/username_here/aben-cha/" wp-config.php
sed -i "s/password_here/aben-cha@@/" wp-config.php
sed -i "s/localhost/mariadb/" wp-config.php

wp core install \
    --url=localhost \
    --title=inception \
    --admin_user=admin \
    --admin_password=admin \
    --admin_email=admin@admin.com \
    --allow-root


php-fpm8.2 -F