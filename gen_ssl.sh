#!/bin/bash

openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:2048 -out /etc/httpd/conf/server.key
chmod 600 /etc/httpd/conf/server.key
openssl req -new -key /etc/httpd/conf/server.key -out /etc/httpd/conf/server.csr
openssl x509 -req -days 365 -in /etc/httpd/conf/server.csr -signkey /etc/httpd/conf/server.key -out /etc/httpd/conf/server.crt
