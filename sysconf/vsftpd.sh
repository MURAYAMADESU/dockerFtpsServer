#!/usr/bin/bash

# Start vsftpd
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
tail -f /dev/null
