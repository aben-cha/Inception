FROM debian:12.8

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    curl \
    php-fpm php-mysql php-curl php-mbstring php-xml php-zip  && \ 
    rm -rf /var/lib/apt/lists/*
