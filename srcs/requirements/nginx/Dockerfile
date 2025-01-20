FROM debian:12

RUN apt-get update -y && \
    apt-get install -y nginx openssl && \
    rm -rf /var/lib/apt/lists/*

COPY tools/script.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/script.sh

COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf

RUN chmod -R 755 /var/www/html

EXPOSE 443

CMD ["/usr/local/bin/script.sh"]