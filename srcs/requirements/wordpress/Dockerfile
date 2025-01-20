FROM debian:12

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y php-fpm php-mysql wget

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf
COPY tools/script.sh .
RUN chmod +x script.sh

CMD [ "/script.sh"]