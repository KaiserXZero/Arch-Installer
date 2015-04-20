#!/bin/bash

pacman -Syyu
mkdir /etc/pacman.d/BACKUP
cp /etc/pacman.d/mirrorlist /etc/pacman.d/BACKUP
yes | pacman -S reflector rsync
