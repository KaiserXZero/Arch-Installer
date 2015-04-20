#!/bin/bash

source var.var

sed -i /Listen 443/d /etc/httpd/conf/extra/httpd-ssl.conf
echo "Listen $http_ip:443" >> /etc/httpd/conf/extra/httpd-ssl.conf
echo "LoadModule ssl_module modules/mod_ssl.so" >> /etc/httpd/conf/httpd.conf
echo "LoadModule socache_shmcb_module modules/mod_socache_shmcb.so" >> /etc/httpd/conf/httpd.conf
echo "Include conf/extra/httpd-ssl.conf" >> /etc/httpd/conf/httpd.conf
systemctl restart httpd
