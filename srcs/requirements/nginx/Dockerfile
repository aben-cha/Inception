FROM debian:12-slim

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends nginx && \
    rm -rf /var/lib/apt/lists/*

COPY default.conf /etc/nginx/conf.d/default.conf
RUN chmod -R 755 /var/www/html

RUN mkdir -p /etc/nginx/ssl

COPY ./tools/ssl/* /etc/nginx/ssl

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]