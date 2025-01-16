#!/bin/bash

# # Create the FTP user
# useradd ${FTP_USER}
adduser ${FTP_USER} --disabled-password --gecos ""

# Set the user's password
echo "$FTP_USER:$FTP_PWD" | chpasswd

# add user to vstpd user list
echo "${FTP_USER}" | tee -a /etc/vsftpd.userlist

# Create the directory for the FTP user
mkdir -p ${FTP_DIR}
# Set the correct permissions for the directory
chmod -R 755 ${FTP_DIR}

# Set the ownership of the directory to the FTP user
chown -R ${FTP_USER}:${FTP_USER} /home/${FTP_USER}

# Creates a complete vsftpd.conf file instead of modifying existing one
# Configure VSFTPD
cat > /etc/vsftpd.conf << EOF
listen=YES
anonymous_enable=NO
local_enable=YES
write_enable=YES
local_umask=022
chroot_local_user=YES
allow_writeable_chroot=YES
pasv_enable=YES
pasv_min_port=30000
pasv_max_port=30100
userlist_enable=YES
userlist_file=/etc/vsftpd.userlist
userlist_deny=NO
pasv_address=10.12.100.87
EOF

mkdir -p /var/run/vsftpd/empty
chmod 755 /var/run/vsftpd/empty
# OR chroot_local_user=NO

/usr/sbin/vsftpd