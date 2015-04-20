#!/bin/bash

source back_rest.var

mount $drive $volume
#	Test if it is mounted
if mount|grep $volume; then
echo "How far back would you like to go for your documents?"
for (( x=1; x<10; x=x+2 ))
do
echo "$x: Day_$x				$(($x+1)): Day_$(($x+1))"
done
echo "M1: One Month Ago  M2: Two Months Ago  M3: Three Months Ago"
read DAY

if [ "$DAY" == "M1" ]; then
TimeFrame="Month_1"
elif [ "$DAY" == "M2" ]; then
TimeFrame="Month_2"
elif [ "$extra" == "M3" ]; then
TimeFrame="Month_3"
elif [ "$DAY" -gt 0 ]; then
TimeFrame="Day_$DAY"
else
echo "Not a proper var"
exit
fi

#### ~/Documents/Sync ##########################
rsync -avrz --delete $volume/$TimeFrame/ /home/${USERNAME}/Documents/Sync/
################################################

#### Everything else ###########################
if [ $RestAll = 'yes' ] then
for count in ${!Folder[*]}
do
rsync -avrz --delete $volume/"${Folder[$count]}"/ /home/${USERNAME}/"${Folder[$count]}"/
done
if
################################################
umount $volume
fi
