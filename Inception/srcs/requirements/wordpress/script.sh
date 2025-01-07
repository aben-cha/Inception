#!/bin/bash

sleep 10
# if wp-config.php does not exist, create it 
# if wordpress is not installed, install it

# wp core install --allow-root \
#     --url=localhost \
#     --title=Inception \
#     --admin_user=aben-cha \
#     --admin_password=aben-cha@@ \
#     --admin_email="admin@example.com" \
#     --path='/var/www/wordpress'

# Check if WordPress is installed; if not, install it
cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php


cd /var/www/wordpress

sed -i "s/define( 'DB_NAME', '.*' );/define( 'DB_NAME', 'db_wordpress' );/" wp-config.php
sed -i "s/define( 'DB_USER', '.*' );/define( 'DB_USER', 'aben-cha' );/" wp-config.php
sed -i "s/define( 'DB_PASSWORD', '.*' );/define( 'DB_PASSWORD', 'aben-cha@@' );/" wp-config.php
sed -i "s/define( 'DB_HOST', '.*' );/define( 'DB_HOST', 'mariadb:3306' );/" wp-config.php

if ! wp core is-installed --allow-root --path='/var/www/wordpress'; then
    wp core install --allow-root \
        --url=http://localhost \
        --title=Inception \
        --admin_user=aben-cha \
        --admin_password=aben-cha@@ \
        --admin_email=admin@example.com \
        --path='/var/www/wordpress'
fi


# /usr/sbin/php-fpm8.2 -F
php-fpm8.2 -F