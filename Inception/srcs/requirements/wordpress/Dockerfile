FROM debian:12

# Install packages
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y \
    php-fpm php-mysql wget

RUN wget https://wordpress.org/latest.tar.gz -P /var/www
RUN cd /var/www && tar -xvzf latest.tar.gz && rm latest.tar.gz


# Set correct ownership for the WordPress files
RUN chown -R www-data:www-data /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Copy PHP configuration if needed
# COPY php.ini /etc/php/7.3/fpm/php.ini


EXPOSE 9000

COPY script.sh /var/www/html/script.sh
RUN chmod +x /var/www/html/script.sh


# -p which ensures that the command doesn’t fail if the directory already exists:
RUN mkdir -p /run/php

CMD ["/var/www/html/script.sh"]