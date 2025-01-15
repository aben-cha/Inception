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
chown -R ${FTP_USER}:${FTP_USER} ${FTP_DIR}


# sed -i "s/listen=NO/listen=YES/" /etc/vsftpd.conf
# echo "write_enable=YES
# chroot_local_user=YES
# pasv_enable=YES
# pasv_min_port=30000
# pasv_max_port=30100" >> /etc/vsftpd

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
EOF

/usr/sbin/vsftpd