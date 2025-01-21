#!/bin/bash

mkdir -p /var/www/html

cd /var/www/html

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

wp config create --allow-root \
    --dbname=${MYSQL_DATABASE} \
    --dbuser=${MYSQL_USER} \
    --dbpass=${MYSQL_PASSWORD} \
    --dbhost=${DB_HOST}

wp core install \
    --url=${SITE_URL} \
    --title=${TITLE} \
    --admin_user=${WP_ADMIN_USER} \
    --admin_password=${WP_ADMIN_PASSWORD} \
    --admin_email=admin@admin.com \
    --skip-email \
    --allow-root

wp user create ${WP_USER} ${WP_EMAIL} \
    --role=author \
    --user_pass=${WP_PASSWORD} \
    --allow-root

wp config set WP_REDIS_HOST 'redis' --allow-root
wp config set WP_REDIS_PORT 6379 --allow-root
wp config set WP_CACHE true --allow-root

wp plugin install redis-cache --activate --allow-root

wp redis enable --allow-root

chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

php-fpm8.2 -F