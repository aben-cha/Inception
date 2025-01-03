FROM debian:12.8

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install nginx -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    # cleans up the APT cache to reduce the image size

EXPOSE 80 443

CMD [ "nginx", "-g", "deamon oof;" ]