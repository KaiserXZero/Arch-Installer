#!/bin/bash

source var.var

vncserver
vncserver -kill :1
mkdir /home/$user/.vnc/BACKUP
cp /home/$user/.vnc/xstartup /home/stephenbecht/.vnc/BACKUP

echo '#!/bin/sh' > /home/$user/.vnc/xstartup
echo '' >> /home/$user/.vnc/xstartup
echo 'unset SESSION_MANAGER' >> /home/$user/.vnc/xstartup
echo 'unset DBUS_SESSION_BUS_ADDRESS' >> /home/$user/.vnc/xstartup
echo '[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources' >> /home/$user/.vnc/xstartup
echo 'xsetroot -solid grey' >> /home/$user/.vnc/xstartup
echo 'startxfce4 &' >> /home/$user/.vnc/xstartup
