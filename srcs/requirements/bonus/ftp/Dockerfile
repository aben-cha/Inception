FROM debian:12.8

RUN apt-get update -y && \ 
    apt-get upgrade -y && \
    apt-get install vsftpd -y && \
    rm -rf rm -rf /var/lib/apt/lists/*

COPY vsftpd.conf /etc/vsftpd.conf
COPY sc.sh .
RUN chmod +x sc.sh
# 21:21 for control port

CMD [ "./sc.sh" ]