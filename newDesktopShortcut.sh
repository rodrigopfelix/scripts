#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

PATH_TO_CREATE='/usr/share/applications'
HEADER="[Desktop Entry]\nVersion=1.0\nType=Application\nTerminal=false"

if [ -z "$1" ]; then
    printf 'File name (without .desktop): '
    read file_name
else
    file_name=$1
    echo "File name (without .desktop): $file_name"
fi

if [ -z "$2" ]; then
    printf 'Property Icon='
    read icon_path
else
    icon_path=$2
    echo "Property Icon=$icon_path"
fi

if [ -z "$3" ]; then
    printf 'Property Exec='
    read exec_path
else
    exec_path=$3
    echo "Property Exec=$exec_path"
fi

if [ -z "$4" ]; then
    printf 'Property Name='
    read name
else
    name=$4
    echo "Property Name=$name"
fi

file="$HEADER\nIcon=$icon_path\nExec=$exec_path\nName=$name\n"
file_path="$PATH_TO_CREATE/$file_name.desktop"

printf "$file" > $file_path
echo "File '$file_path' created"