#!/bin/bash
mkdir -p /var/www/html

cd /var/www/html
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

# cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
wp config create \
    --dbname=${MYSQL_DATABASE} \
    --dbuser=${MYSQL_USER} \
    --dbpass=${MYSQL_PASSWORD} \
    --dbhost=${DB_HOST} \
    --path=/var/www/html \
    --allow-root

# sed -i "s/database_name_here/db_wordpress/" wp-config.php
# sed -i "s/username_here/aben-cha/" wp-config.php
# sed -i "s/password_here/aben-cha@@/" wp-config.php
# sed -i "s/localhost/mariadb/" wp-config.php

wp core install \
    --url=https://${DOMAIN_NAME} \
    --title=${TITLE} \
    --admin_user=admin \
    --admin_password=admin \
    --admin_email=admin@admin.com \
    --path=/var/www/html \
    --allow-root


php-fpm8.2 -F