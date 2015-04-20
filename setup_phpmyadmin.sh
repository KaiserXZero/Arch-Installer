#!/bin/bash

source var.var

cp -r /usr/share/webapps/phpMyAdmin /home/$user/public_html
echo 'Alias /phpmyadmin "/home/$user/public_html/phpMyAdmin"' >> /etc/httpd/conf/extra/httpd-phpmyadmin.conf
echo '<Directory "/home/$user/public_html/phpMyAdmin">
' >> /etc/httpd/conf/extra/httpd-phpmyadmin.conf
echo '	DirectoryIndex index.html index.php' >> /etc/httpd/conf/extra/httpd-phpmyadmin.conf
echo '	AllowOverride All' >> /etc/httpd/conf/extra/httpd-phpmyadmin.conf
echo '	Options FollowSymlinks' >> /etc/httpd/conf/extra/httpd-phpmyadmin.conf
echo '	Require all granted' >> /etc/httpd/conf/extra/httpd-phpmyadmin.conf
echo '	php_admin_value open_basedir "/srv/:/tmp/:/usr/share/webapps/:/etc/webapps:/usr/share/pear/"' >> /etc/httpd/conf/extra/httpd-phpmyadmin.conf
echo '</Directory>' >> /etc/httpd/conf/extra/httpd-phpmyadmin.conf
mkdir /home/$user/public_html/phpMyAdmin/config
chmod o+rw /home/$user/public_html/phpMyAdmin/config
cp /home/$user/public_html/phpMyAdmin/config.inc.php /home/$user/public_html/phpMyAdmin/config
chmod o+w /home/$user/public_html/phpMyAdmin/config/config.inc.php
systemctl restart mysqld
