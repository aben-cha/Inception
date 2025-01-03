FROM debian:12.8

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /var/run/mysqld && \
    chown mysql:mysql /var/run/mysqld

CMD ["mysqld"]
