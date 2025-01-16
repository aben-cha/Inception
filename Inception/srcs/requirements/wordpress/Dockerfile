FROM debian:12.8

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y php-fpm php-mysql wget && \
    rm -rf /var/lib/apt/lists/*

COPY www.conf /etc/php/8.2/fpm/pool.d/www.conf
COPY script.sh .
RUN chmod +x script.sh

CMD [ "./script.sh"]