FROM debian:12
RUN apt-get update -y && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*

COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf

WORKDIR /var/www/html

COPY app/ . 

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]