#!/bin/bash

source var.var

echo "cert=/etc/stunnel/stunnel.pem" >> /etc/stunnel/stunnel.conf
echo "pid=/var/run/stunnel.pid" >> /etc/stunnel/stunnel.conf
echo "[ssh]" >> /etc/stunnel/stunnel.conf
echo "accept = $ssh_ip:443" >> /etc/stunnel/stunnel.conf
echo "connect = 127.0.0.1:$PORT" >> /etc/stunnel/stunnel.conf

systemctl enable stunnel
systemctl start stunnel
