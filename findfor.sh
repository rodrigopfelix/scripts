#!/bin/bash

### SCRIPT CONFIGs
DEFAULT_SAVING_FOLDER="/home/rodrigo.felix.ext/Downloads/Searchs"
DEFAULT_EXT="js"
#TEMP_FILE="/tmp/FindFor_tempSearchFile.txt"
### ENDeee
e
e

if [ -z "$2" ]; then
	echo "Specify the pattern to find"
	exit
fi
PATTERN=$2

if [ -z "$3" ]; then
    FILE="$DEFAULT_SAVING_FOLDER/search_$PATTERN.$DEFAULT_EXT"
else
    FILE=$3
fi

echo "Finding for: '$PATTERN'"
echo "Grep parameters: '$PARS'"
echo "Output: '$FILE'"

#finding for string in $PATTERN and saving in $FILE
grep $PARS --exclude-dir=".svn" $PATTERN > $FILE
#deleting svn pristine lines
#at $TEMP_FILE | sed '/.svn.pristine..*..*.svn-base.*/d' > $FILE
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
