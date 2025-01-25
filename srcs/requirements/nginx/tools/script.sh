#!/bin/bash

mkdir -p /etc/nginx/ssl/
chmod 700 /etc/nginx/ssl/

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=MO/ST=KHOURIBGA/L=YOUSSOUFIA/O=1337/CN=${DOMAIN_NAME}"

nginx -g 'daemon off;'