FROM debian:12.8

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install mariadb-server -y && \
    rm -rf /var/lib/apt/lists/*

COPY my.cnf /etc/mysql/mariadb.conf.d/
COPY script.sh .
RUN chmod +x script.sh
# RUN mkdir /run/mysqld

# CMD ["mysqld"]

CMD ["./script.sh"]