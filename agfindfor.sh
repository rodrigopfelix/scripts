#!/bin/bash

### SCRIPT CONFIGs
DEFAULT_SAVING_FOLDER="/home/rodrigo.felix.ext/Downloads/Searchs"
DEFAULT_EXT="js"
#TEMP_FILE="/tmp/FindFor_tempSearchFile.txt"
### END

#if [ -z "$1" ]; then
#	echo "Specify the ag parameters"
#	exit
#fi
#PARS=$1

if [ -z "$1" ]; then
	echo "Specify the pattern to find"
	exit
fi
PATTERN=$1

if [ -z "$2" ]; then
    FILE="$DEFAULT_SAVING_FOLDER/search_$PATTERN.$DEFAULT_EXT"
else
    FILE=$2
fi

echo "Finding for: '$PATTERN'"
echo "Using AG - The Silver Searcher"
#echo "AG parameters: '$PARS'"
echo "Output: '$FILE'"

#finding for string in $PATTERN and saving in $TEMP_FILE
ag $PATTERN > $FILE
#deleting temp file
#rm -rf $TEMP_FILE
#opening file
gedit $FILE &

#exit #dont ask to delete file
echo "Delete file '$FILE'? (enter 'd' to delete)"
read choose
if [ "$choose" = "d" ]; then
	rm -rf $FILE
	echo "'$FILE' was deleted"
fi
