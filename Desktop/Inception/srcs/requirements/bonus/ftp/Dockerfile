FROM debian:12.8

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y vsftpd && \
    rm -rf rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY script.sh /usr/local/bin/script.sh
RUN chmod +x /usr/local/bin/script.sh

COPY vsftpd.conf /etc/vsftpd.conf

EXPOSE 21
EXPOSE 10000-10100

# CMD ["vsftpd", "/etc/vsftpd.conf"]

CMD [ "/usr/local/bin/script.sh" ]