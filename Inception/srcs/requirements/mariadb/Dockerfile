FROM debian:12

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install mariadb-server -y && \
    rm -rf /var/lib/apt/lists/*

COPY my.cnf /etc/mysql/mariadb.conf.d/
COPY init.sql /etc/mysql/

RUN mkdir /run/mysqld

CMD ["mysqld"]