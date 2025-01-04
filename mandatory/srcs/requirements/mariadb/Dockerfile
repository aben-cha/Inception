FROM debian:12.8

RUN apt update && \
    apt upgrade -y && \
    apt install mariadb-server -y

CMD ["mysqld_safe"]