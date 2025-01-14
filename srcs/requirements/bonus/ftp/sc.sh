#!/bin/bash

adduser ${FTP_USER} --disable-password

echo "$FTP_USER:$FTP_PWD" | chpasswd
echo "$FTP_USER" | tee -a /etc/vsftpd.userlist  

# &> /dev/null again suppresses all output
# redirects both standard output and errors to /dev/null (suppressing all output)

#creating FTP directory 
mkdir -p /home/${FTP_USER}/ftp
chown nobody:nogroup /home/${FTP_USER}/ftp
chmod a-w /home/${FTP_USER}/ftp


# create upload directory
mkdir -p /home/${FTP_USER}/ftp/files
chown ${FTP_USER}:${FTP_USER} /home/${FTP_USER}/ftp/files

/usr/sbin/vsftpd