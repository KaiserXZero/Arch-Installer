#!/bin/bash

source var.var

usermod -a -G vboxusers $user
cp -r /usr/share/webapps/phpvirtualbox /home/$user/public_html
rm /home/$user/public_html/phpvirtualbox/config.php
cp /home/$user/public_html/phpvirtualbox/config.php-example /home/$user/public_html/phpvirtualbox/config.php
nano /home/$user/public_html/phpvirtualbox/config.php
echo "[Unit]" >> /etc/systemd/system/vboxweb_mod.service
echo "Description=VirtualBox Web Service" >> /etc/systemd/system/vboxweb_mod.service
echo "After=network.target" >> /etc/systemd/system/vboxweb_mod.service
echo "" >> /etc/systemd/system/vboxweb_mod.service
echo "[Service]" >> /etc/systemd/system/vboxweb_mod.service
echo "Type=forking" >> /etc/systemd/system/vboxweb_mod.service
echo "PIDFile=/run/vboxweb/vboxweb.pid" >> /etc/systemd/system/vboxweb_mod.service
echo "ExecStart=/usr/bin/vboxwebsrv --pidfile /run/vboxweb/vboxweb.pid  --background" >> /etc/systemd/system/vboxweb_mod.service
echo "User=$user" >> /etc/systemd/system/vboxweb_mod.service
echo "Group=vboxusers" >> /etc/systemd/system/vboxweb_mod.service
echo "" >> /etc/systemd/system/vboxweb_mod.service
echo "[Install]" >> /etc/systemd/system/vboxweb_mod.service
echo "WantedBy=multi-user.target" >> /etc/systemd/system/vboxweb_mod.service
echo "d /run/vboxweb 0755 $user vboxusers" > /etc/tmpfiles.d/vboxweb_mod.conf
mkdir /run/vboxweb
chown $user:vboxusers /run/vboxweb
sleep 1
chmod 755 /run/vboxweb
sleep 1
systemctl start vboxweb_mod
sleep 1
systemctl enable vboxweb_mod
echo "#deny from all" > /home/$user/public_html/phpvirtualbox/.htaccess
cp /etc/webapps/phpvirtualbox/apache.example.conf /etc/httpd/conf/extra/phpvirtualbox.conf
echo "Include conf/extra/phpvirtualbox.conf" >> /etc/httpd/conf/httpd.conf
systemctl restart httpd
