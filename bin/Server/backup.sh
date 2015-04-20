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
for (( index=${daybackup}; index>1; index=index-1 ))
do
(( tot = index - 1 ))
rsync -avrz --delete --log-file=$volume/LOGS/rsyn_log_Day_${index} $volume/Day_${tot}/ $volume/Day_${index}/
done
rsync -avrz --delete --log-file=$volume/LOGS/rsyn_log_Day_${index} /home/${USERNAME}/Documents/Sync/ $volume/Day_1/
#		<---------Process [3]------------->
#	Monthly Backup for all my other folders
if [ $DOM -eq "$backupday" ]; then
for count in ${!Folder[*]}
do
rsync -avrz --delete --log-file=$volume/LOGS/rsyn_log_${count} /home/${USERNAME}/"${Folder[$count]}"/ $volume/"${Folder[$count]}"/
done
for (( index=${monthbackup}; index>1; index=index-1 ))
do
(( tot = index - 1 ))
rsync -avrz --delete --log-file=$volume/LOGS/rsyn_log_Month_${index} $volume/Month_${tot}/ $volume/Month_${index}/
done
rsync -avrz --delete --log-file=$volume/LOGS/rsyn_log_Month_${index} $volume/Day_${daybackup}/ $volume/Month_1/
fi
#		<---------Process [4]------------->
#	Unmount the backup drive
umount $volume
fi
