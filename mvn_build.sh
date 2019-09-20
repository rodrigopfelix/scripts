#!/bin/bash

if [ -z "$1" ]; then
	echo "Specify the path to pom.xml or to directory that contains the pom.xml"
	exit
fi
POM=$1

#if test ! -f "$POM"; then
#	echo "'$POM' is not a file or not exists"
#	exit
#fi

### Executing the build
mvn -T 4 -U clean install -f "$POM"
