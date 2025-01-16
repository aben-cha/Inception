#!/bin/bash

mkdir -p /etc/nginx/ssl/
chmod 700 /etc/nginx/ssl/

# Generate self-signed certificate and key
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=MO/ST=KHOURIBGA/L=YOUSSOUFIA/O=1337/CN=${DOMAIN_NAME}"

chmod 600 /etc/nginx/ssl/nginx.key  # Private key should be very restrictive
chmod 644 /etc/nginx/ssl/nginx.crt  # Certificate can be readable by others

nginx -g 'daemon off;'