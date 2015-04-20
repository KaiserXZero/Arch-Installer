#!/bin/bash

source back_rest.var

#	Mount the backup drive
mount $drive $volume
#	Test if it is mounted
if mount|grep $volume; then
source homebackup.src
umount $volume
fi

pacman -Syyu

echo "Do you wish to reboot [y/N]"
read x
if [ $x = 'y' ]; then

echo 'SHELL=/bin/bash' > /etc/cron.d/reboot
echo 'PATH=/sbin:/bin:/usr/sbin:/usr/bin' >> /etc/cron.d/reboot
echo 'MAILTO=root' >> /etc/cron.d/reboot
echo '1 * * * * root /bin/bash /bin/restart.sh'

reboot
fi
