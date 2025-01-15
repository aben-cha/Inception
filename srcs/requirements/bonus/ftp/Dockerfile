FROM debian:12.8

RUN apt-get update -y && \ 
    apt-get upgrade -y && \
    apt-get install vsftpd -y && \
    rm -rf rm -rf /var/lib/apt/lists/*

COPY script.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/script.sh

EXPOSE 21
EXPOSE 30000-30100

CMD [ "/usr/local/bin/script.sh" ]

