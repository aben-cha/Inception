#!/bin/bash

useradd $FTP_USER
echo "$FTP_USER:$FTP_PWD" | chpasswd
mkdir -p $FTP_DIR
chmod -R 755 $FTP_DIR
chown -R $FTP_USER:$FTP_USER $FTP_DIR
mkdir -p /var/run/vsftpd/empty

sed -i 's|listen=NO|listen=YES|' /etc/vsftpd.conf
sed -i 's|listen_ipv6=YES|listen_ipv6=NO|' /etc/vsftpd.conf
sed -i 's|#write_enable=YES|write_enable=YES|' /etc/vsftpd.conf

echo "
pasv_enable=YES
pasv_min_port=30000
pasv_max_port=30100
" >> /etc/vsftpd.conf

vsftpd /etc/vsftpd.conf