#!/bin/bash

echo 'LoadModule php5_module modules/libphp5.so' >> /etc/httpd/conf/httpd.conf
echo 'Include conf/extra/php5_module.conf' >> /etc/httpd/conf/httpd.conf
sed -i /mod_mpm_event.so/d /etc/httpd/conf/httpd.conf
echo 'date.timezone = America/New_York' >> /etc/php/php.ini
sed -i /display_errors=Off/d /etc/php/php.ini
sed -i /Listen 80/d /etc/httpd/conf/httpd.conf
echo 'extension=mcrypt.so' >> /etc/php/php.ini
echo 'LoadModule mpm_prefork_module modules/mod_mpm_prefork.so' >> /etc/httpd/conf/httpd.conf
echo 'display_errors=On' >> /etc/php/php.ini
echo 'extension=soap.so' >> /etc/php/php.ini

systemctl restart httpd
