#!/bin/bash

# Start vsftpd service
service vsftpd start

# Add the user, set password, and declare him as the owner of the wordpress folder
adduser $FTP_USER --disabled-password

# Set the user password
echo "$FTP_USER:$FTP_PWD" | chpasswd &> /dev/null

# Add user to the vsftpd userlist
echo "$FTP_USER" | tee -a /etc/vsftpd.userlist &> /dev/null

# Create the FTP home directory and set permissions
mkdir -p /home/$FTP_USER/ftp/files
chown nobody:nogroup /home/$FTP_USER/ftp
chmod a-w /home/$FTP_USER/ftp

# Set ownership of the WordPress folder (you can adjust this according to your needs)
chown $FTP_USER:$FTP_USER /home/$FTP_USER/ftp/files

# Add custom vsftpd configuration
echo "local_root=/home/$FTP_USER/ftp" >> /etc/vsftpd.conf

# Stop vsftpd and start it manually to keep the container running
service vsftpd stop

/usr/sbin/vsftpd