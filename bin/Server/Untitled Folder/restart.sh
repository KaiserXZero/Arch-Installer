#!/bin/bash

systemctl restart stunnel

machinectl > container

wc -l container | while IFS=' ' read num file
do
echo "val=$num" > temp
done

source temp

(( x = $val - 2 ))
y='2,'$x'p'

echo 'services=(' > temp2
sed -n $y test | while IFS=' ' read contain ign1 ign2
do
echo '"'$contain'"' >> temp2
done
echo ')' >> temp2

source temp2

for count in ${!services[*]}
do
systemctl restart ${services[$count]}
done

rm temp
rm temp2
rm /etc/cron.d/reboot
