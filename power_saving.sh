#!/bin/bash
# all from 'https://wiki.archlinux.org/index.php/Power_saving'
# Audio
sudo echo "options snd_hda_intel power_save=1" > /etc/modprobe.d/audio_powersave.conf
# Set Backlight by default
sudo echo "##SET BACKLIGHT" > /etc/udev/rules.d/backlight.rules
sudo echo 'SUBSYSTEM=="backlight", ACTION=="add", KERNEL=="acpi_video0", ATTR{brightness}="1"' >> /etc/udev/rules.d/backlight.rules
# Disable bluetooth by default
sudo systemctl enable rfkill-block@bluetooth.service
# Disabling NMI watchdog
sudo echo "kernel.nmi_watchdog = 0" > /etc/sysctl.d/disable_watchdog.conf
# Writeback Time
sudo echo "vm.dirty_writeback_centisecs = 1500" > /etc/sysctl.d/dirty.conf
# Laptop Mode
sudo echo "vm.laptop_mode = 5" > /etc/sysctl.d/laptop.conf
# Network Interfaces
sudo echo 'ACTION=="add", SUBSYSTEM=="net", KERNEL=="eth*", RUN+="/usr/bin/ethtool -s %k wol d"' > /etc/udev/rules.d/70-disable_wol.rules
sudo echo 'ACTION=="add", SUBSYSTEM=="net", KERNEL=="wlan*", RUN+="/usr/bin/iw dev %k set power_save on"' > /etc/udev/rules.d/70-wifi-powersave.rules
# PCI Runtime Power Management
sudo echo 'ACTION=="add", SUBSYSTEM=="pci", ATTR{power/control}="auto"' > /etc/udev/rules.d/pci_pm.rules
# Hdparm - limit hard disk performance
sudo echo 'ACTION=="add", KERNEL=="[hs]d[a-z]", ATTR{queue/rotational}=="1", RUN+="/usr/bin/hdparm -B 1 -M 128 /dev/%k"' > /etc/udev/rules.d/hdparm-powersaving.rules
# USB Autosuspend
sudo echo 'SUBSYSTEM!="usb", GOTO="power_usb_rules_end"' > /etc/udev/rules.d/usb_power_save.rules
sudo echo 'ACTION!="add", GOTO="power_usb_rules_end"' >> /etc/udev/rules.d/usb_power_save.rules
sudo echo 'TEST!="power/control", GOTO="power_usb_rules_end"' >> /etc/udev/rules.d/usb_power_save.rules
sudo echo '## Whitelist. Duplicate the following line with varying usbids' >> /etc/udev/rules.d/usb_power_save.rules
sudo echo 'ATTR{power/control}="auto"' >> /etc/udev/rules.d/usb_power_save.rules
sudo echo 'LABEL="power_usb_rules_end"' >> /etc/udev/rules.d/usb_power_save.rules
# Device Power Management
sudo echo '# Various subsystems runtime power management (by bus or class)' > /etc/udev/rules.d/dev_power_save.rules
sudo echo 'ACTION=="add", SUBSYSTEMS=="*", TEST=="power/control", ATTR{power/control}="auto"' >> /etc/udev/rules.d/dev_power_save.rules
sudo echo '# Various subsystems power saving (by module)' >> /etc/udev/rules.d/dev_power_save.rules
sudo echo 'ACTION=="add", SUBSYSTEMS=="*", TEST=="parameters/power_save", ATTR{parameters/power_save}="1"' >> /etc/udev/rules.d/dev_power_save.rules
