FROM debian:12

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get insall -y \
    php-fpm php-mysql curl


CMD [ "php8.3-fpm", "-F" ]