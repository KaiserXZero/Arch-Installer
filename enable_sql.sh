#!/bin/bash

echo "extension=pdo_mysql.so" >> /etc/php/php.ini
echo "extension=mysqli.so" >> /etc/php/php.ini
echo "extension=bz2.so" >> /etc/php/php.ini
echo "extension=zip.so" >> /etc/php/php.ini
systemctl enable mysqld.service
systemctl start mysqld.service
mysql_secure_installation
systemctl restart mysqld.service




