FROM debian:12-slim

RUN apt-get update -y && \ 
    apt-get upgrade -y && \
    apt-get install vsftpd -y

COPY tools/script.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/script.sh

EXPOSE 21
EXPOSE 30000-30100

CMD [ "/usr/local/bin/script.sh" ]

