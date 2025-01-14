FROM debian:12.8

RUN apt-get update -y && \ 
    apt-get upgrade -y && \
    apt-get install vsftpd -y && \
    rm -rf rm -rf /var/lib/apt/lists/*

RUN cp /etc/vsftpd.conf /etc/vsftpd.conf.back
COPY sc.sh .
RUN chmod +x sc.sh

COPY vsftpd.conf /etc/vsftpd.conf

# 21:21 for control port

CMD [ "./sc.sh" ]