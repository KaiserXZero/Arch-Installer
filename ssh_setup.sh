#!/bin/bash

source var.var

echo "GatewayPorts yes" >> /etc/ssh/ssh_config
echo "ForwardAgent yes" >> /etc/ssh/ssh_config
echo "ForwardX11 yes" >> /etc/ssh/ssh_config
echo "ForwardX11Trusted yes" >> /etc/ssh/ssh_config
echo "RhostsRSAAuthentication no" >> /etc/ssh/ssh_config
echo "RSAAuthentication yes" >> /etc/ssh/ssh_config
echo "PasswordAuthentication no" >> /etc/ssh/ssh_config
echo "IdentityFile ~/.ssh/identity" >> /etc/ssh/ssh_config
echo "IdentityFile ~/.ssh/id_rsa" >> /etc/ssh/ssh_config
echo "IdentityFile ~/.ssh/id_dsa" >> /etc/ssh/ssh_config
echo "Port $PORT" >> /etc/ssh/ssh_config
echo "Protocol 2" >> /etc/ssh/ssh_config
echo "Cipher 3des" >> /etc/ssh/ssh_config
echo "Ciphers aes128-ctr,aes192-ctr,aes256-ctr,arcfour256,arcfour128,aes128-cbc,3des-cbc" >> /etc/ssh/ssh_config
echo "EscapeChar ~" >> /etc/ssh/ssh_config
echo "Tunnel no" >> /etc/ssh/ssh_config
echo "TunnelDevice any:any" >> /etc/ssh/ssh_config
echo "SendEnv LANG LC_*" >> /etc/ssh/ssh_config
echo "HashKnownHosts yes" >> /etc/ssh/ssh_config
echo "GSSAPIAuthentication yes" >> /etc/ssh/ssh_config
echo "GSSAPIDelegateCredentials no" >> /etc/ssh/ssh_config

echo "Port $PORT" >> /etc/ssh/sshd_config
echo "Protocol 2" >> /etc/ssh/sshd_config
echo "HostKey /etc/ssh/ssh_host_ed25519_key" >> /etc/ssh/sshd_config
echo "KeyRegenerationInterval 1h" >> /etc/ssh/sshd_config
echo "ServerKeyBits 1024" >> /etc/ssh/sshd_config
echo "SyslogFacility AUTH" >> /etc/ssh/sshd_config
echo "LogLevel INFO" >> /etc/ssh/sshd_config
echo "LoginGraceTime 60" >> /etc/ssh/sshd_config
echo "PermitRootLogin no" >> /etc/ssh/sshd_config
echo "StrictModes yes" >> /etc/ssh/sshd_config
echo "AllowUsers $user" >> /etc/ssh/sshd_config
echo "AllowTcpForwarding yes" >> /etc/ssh/sshd_config
echo "ClientAliveInterval 60" >> /etc/ssh/sshd_config
echo "ClientAliveCountMax 600000000000000000000000000000000" >> /etc/ssh/sshd_config
echo "MaxAuthTries 3" >> /etc/ssh/sshd_config
echo "RSAAuthentication yes" >> /etc/ssh/sshd_config
echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config
echo "IgnoreRhosts yes" >> /etc/ssh/sshd_config
echo "RhostsRSAAuthentication no" >> /etc/ssh/sshd_config
echo "HostbasedAuthentication no" >> /etc/ssh/sshd_config
echo "PermitEmptyPasswords no" >> /etc/ssh/sshd_config
echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
echo "X11Forwarding yes" >> /etc/ssh/sshd_config
echo "X11DisplayOffset 10" >> /etc/ssh/sshd_config
echo "PrintMotd no" >> /etc/ssh/sshd_config
echo "PrintLastLog yes" >> /etc/ssh/sshd_config
echo "TCPKeepAlive yes" >> /etc/ssh/sshd_config
echo "AcceptEnv LANG LC_*" >> /etc/ssh/sshd_config

systemctl restart sshd
