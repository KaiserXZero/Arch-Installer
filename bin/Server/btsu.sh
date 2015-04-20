#!/bin/bash

killall btsync
mkdir ~/Downloads/btsync
cd ~/Downloads/btsync
wget http://download-lb.utorrent.com/endpoint/btsync/os/linux-x64/track/stable/btsync_x64.tar.gz
tar -xvf btsync_x64.tar.gz
cp ~/Downloads/btsync/btsync ~/Documents
rm -rf ~/Downloads/btsync
bash btss.sh
