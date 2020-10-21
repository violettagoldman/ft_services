#!/bin/sh

echo -e "$FTPS_PASSWORD\n$FTPS_PASSWORD" | adduser -h ftp/$FTPS_USER -s /sbin/nologin $FTPS_USER
mkdir -p ftp/$FTPS_USER
chown $FTPS_USER:$FTPS_USER ftp/$FTPS_USER

exec /usr/sbin/vsftpd -opasv_min_port=2121 -opasv_max_port=2123 -opasv_address=192.168.99.124 /etc/vsftpd/vsftpd.conf
