FROM debian:12-slim

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y nginx

COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf

WORKDIR /var/www/html

COPY tools/app/ . 

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]