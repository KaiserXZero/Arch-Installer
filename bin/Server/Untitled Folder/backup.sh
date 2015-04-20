#!/bin/bash

source back_rest.var

#		<---------Process [1]------------->
#	Mount the backup drive
mount $drive $volume
#	Test if it is mounted
if mount|grep $volume; then
#		<---------Process [2]------------->
#	Every day backup for all my documents and have
rm $volume/LOGS/*

source dailybackup.src

#		<---------Process [3]------------->
#	Monthly Backup for all my other folders
if [ $DOM -eq "$backupday" ]; then

source monthlybackup.src

fi

#		<---------Process [4]------------->
#	Home Backup for all my other folders

source homebackup.src

#		<---------Process [5]------------->
#	Unmount the backup drive
umount $volume
fi
