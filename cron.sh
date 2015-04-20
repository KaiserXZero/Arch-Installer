#!/bin/bash

sudo echo 'SHELL=/bin/bash' > /etc/cron.d/mycron
sudo echo 'PATH=/sbin:/bin:/usr/sbin:/usr/bin' > /etc/cron.d/mycron
sudo echo 'MAILTO=root' > /etc/cron.d/mycron
sudo echo '0 12 * * * root /bin/bash /bin/available_updates.sh' > /etc/cron.d/mycron
sudo echo '0 0 * * * root /bin/bash /bin/backup.sh' > /etc/cron.d/mycron
