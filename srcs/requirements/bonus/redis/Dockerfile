FROM debian:12

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install redis-server -y && \
    rm -rf /var/lib/apt/lists/*


COPY redis.conf /etc/redis/redis.conf

CMD ["redis-server", "--protected-mode", "no"]
