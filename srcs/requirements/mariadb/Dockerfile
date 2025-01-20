FROM debian:12

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install mariadb-server -y

COPY conf/my.cnf /etc/mysql/mariadb.conf.d/
COPY tools/script.sh .
RUN chmod +x script.sh

CMD ["/script.sh"]