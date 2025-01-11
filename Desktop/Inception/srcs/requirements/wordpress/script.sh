#!/bin/bash
mkdir -p /var/www/html

chown -R www-data:www-data /var/www/html/ 
chmod -R 755 /var/www/html/
cd /var/www/html

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

# cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
wp config create --allow-root \
    --dbname=${MYSQL_DATABASE} \
    --dbuser=${MYSQL_USER} \
    --dbpass=${MYSQL_PASSWORD} \
    --dbhost=${DB_HOST} \
    # --path=/var/www/html \

# sed -i "s/database_name_here/db_wordpress/" wp-config.php
# sed -i "s/username_here/aben-cha/" wp-config.php
# sed -i "s/password_here/aben-cha@@/" wp-config.php
# sed -i "s/localhost/mariadb/" wp-config.php

wp core install \
    --url=localhost \
    --title=${TITLE} \
    --admin_user=admin \
    --admin_password=admin \
    --admin_email=admin@admin.com \
    --skip-email --allow-root
    # --path=/var/www/html \

wp user create $WP_USR $WP_EMAIL \
    --role=author \
    --user_pass=$WP_PWD\
     --allow-root

# Configure Redis if applicable (optional)
# wp config set WP_REDIS_HOST 'redis' --allow-root
# wp config set WP_REDIS_PORT 6379 --allow-root
# wp config set WP_REDIS_DATABASE 0 --allow-root
# wp config set WP_CACHE_KEY_SALT 'inception' --allow-root
# wp config set WP_CACHE true --allow-root

# # Install Redis Cache plugin
# wp plugin install redis-cache --activate --allow-root

# # Enable Redis cache
# wp redis enable --allow-root


php-fpm8.2 -F