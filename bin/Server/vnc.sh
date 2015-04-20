#!/bin/bash

echo "Type the resulition you want? Fallowed by [Enter]:"
echo 1: "Side Desktop Monitor 	(1280x1024)"
echo 2: "Main Desktop Monitor 	(1280x720)"
echo 3: "Main Desktop Monitor 	(1360x768)"
echo 4: "iPad Monitor 		(1024x680)"
echo 5: "Bionic Lapdock		(1366x720)"
echo 6: "Lenovo Laptop 		(1366x768)"
echo 7: "Macbook Pro			(1280x800)"
echo 8: "Default"
echo "Or click enter to end VNCServer"

read x

case $x in

[1] )
vncserver -geometry 1280x1024
;;
[2] )
vncserver -geometry 1280x720
;;
[3] )
vncserver -geometry 1360x768
;;
[4] )
vncserver
;;
[5] )
vncserver -geometry 1366x720
;;
[6] )
vncserver -geometry 1366x768
;;
[7] )
vncserver -geometry 1280x800
;;
[8] )
vncserver
;;
*)
vncserver -kill :1

esac
