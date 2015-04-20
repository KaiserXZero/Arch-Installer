#!/bin/bash

source var.var

sudo echo "Description='Ethernet setup'" > /etc/netctl/eth0
sudo echo "Interface=$networkdev" >> /etc/netctl/eth0
sudo echo "Connection=ethernet" >> /etc/netctl/eth0
sudo echo "IP=static" >> /etc/netctl/eth0
sudo echo "Address=('$ssh_ip/24' '$stunnel/24' '$http_ip/24')" >> /etc/netctl/eth0
sudo echo "Gateway='$gateway'" >> /etc/netctl/eth0
sudo echo "DNS=('$dns')" >> /etc/netctl/eth0

netctl enable eth0
netctl start eth0

#ping google.com
