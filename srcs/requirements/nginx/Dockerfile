FROM debian:12-slim

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y nginx openssl

COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf
COPY tools/script.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/script.sh

RUN chmod -R 755 /var/www/html

EXPOSE 443

CMD ["/usr/local/bin/script.sh"]