FROM debian:12.8

RUN apt-get update -y && \
apt-get upgrade -y && \
apt-get install -y wget php-cli php-mysqli && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /var/www/html && \
    wget -O /var/www/html/index.php https://www.adminer.org/latest.php && \
    wget -O /var/www/html/adminer.css https://raw.githubusercontent.com/vrana/adminer/master/designs/mvt/adminer.css

RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

EXPOSE 8080

WORKDIR /var/www/html

CMD ["php", "-S", "0.0.0.0:8080"]
