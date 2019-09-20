#!/bin/bash

if [ -z "$1" ]; then
	echo "Specify the cmd server ip to request"
	exit
fi
IPCMDSV=$1

if [ -z "$2" ]; then
	echo "Specify the esn to request"
	exit
fi
ESN=$2

#echo -e '354868062763760 0 0 1 GPRS LAST 0000 " "\r\n\r\n' | nc 10.1.110.20 8500
echo -e "$ESN 0 0 1 GPRS LAST 0000 \" \"\r\n\r\n" | nc $IPCMDSV 8881
#echo -e            "$ESN 0 0 1 GPRS LAST 0000 \" \"\r\n\r\n" | nc $IPCMDSV 8500
#echo -e "354868062763760 0 0 1 GPRS M6.SET_SEGUR_ENTRADAS 0000 \"3 1 \"\r\n\r\n" | nc 10.1.110.20 8500
#echo -e "354868062763760 34635 346453 1 M6.SET_SEGUR_ENTRADAS\r\n3 1" | nc 10.1.110.20 8500


#echo -e "354868062763760 0 0000 1 0000 LAST\r\n"  | nc 10.1.110.20 8500

echo ' - Requested!'


