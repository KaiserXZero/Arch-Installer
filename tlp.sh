#!/bin/bash



sudo echo "CPU_SCALING_GOVERNOR_ON_AC=ondemand" > /etc/default/tlp
sudo echo "CPU_SCALING_GOVERNOR_ON_BAT=ondemand" >> /etc/default/tlp
sudo echo "CPU_BOOST_ON_AC=1" >> /etc/default/tlp
sudo echo "CPU_BOOST_ON_BAT=0" >> /etc/default/tlp
sudo echo 'DISK_APM_LEVEL_ON_AC="254 254"' >> /etc/default/tlp
sudo echo 'DISK_APM_LEVEL_ON_BAT="254 254"' >> /etc/default/tlp
sudo echo "RESTORE_DEVICE_STATE_ON_STARTUP=1" >> /etc/default/tlp
sudo echo 'DEVICES_TO_DISABLE_ON_STARTUP="bluetooth wwan"' >> /etc/default/tlp
sudo echo 'DEVICES_TO_ENABLE_ON_STARTUP="wifi"' >> /etc/default/tlp
