#!/bin/bash

echo "cert=/etc/stunnel/stunnel.pem" >> /etc/stunnel/stunnel.conf
echo "pid=/var/run/stunnel.pid" >> /etc/stunnel/stunnel.conf
echo "client=yes" >> /etc/stunnel/stunnel.conf
echo "[ssh]" >> /etc/stunnel/stunnel.conf
echo "accept=443" >> /etc/stunnel/stunnel.conf
echo "connect=stephenbecht.us.to:443" >> /etc/stunnel/stunnel.conf

cp stunnel.pem /etc/stunnel/

sudo systemctl enable stunnel
