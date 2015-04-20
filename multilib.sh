#!/bin/bash

echo "[multilib]" >> /etc/pacman.conf
echo "SigLevel = PackageRequired" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
