FROM debian:12-slim

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install redis-server -y

COPY conf/redis.conf /etc/redis/redis.conf

CMD ["redis-server", "--protected-mode", "no"]
