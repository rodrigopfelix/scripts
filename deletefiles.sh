#!/bin/bash

HASH_DATE="$(date | md5sum)"

### SCRIPT CONFIGs
DEFAULT_MV_FOLDER="/home/rodrigo.felix.ext/Downloads/TO_DEL_${HASH_DATE:0:30}"
#DEFAULT_EXT="c"
#TEMP_FILE="/tmp/FindFor_tempSearchFile.txt"
### END


echo 'Em construção...'
exit

if [ -z "$1" ]; then
	echo "Specify the pattern's files to delete"
	exit
fi
PATTERN_TO_DEL=$1


for entry in "$PATTERN_TO_DEL"
do
  echo "$entry"
done



if [ "$2" != "-f" ]; then #force do
	echo "Delete these files? (enter 'd' to delete)"
	read choose
	if [ "$choose" != "d" ]; then
		exit
	fi
fi
#so, delete


echo "$DEFAULT_MV_FOLDER"
