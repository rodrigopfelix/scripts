#!/bin/bash

declare -a file_extensions=("log" "err" "out")

for file_ext in "${file_extensions[@]}"
do 
    find . -type f -regex ".*\.$file_ext\.[0-9]+" -exec rm -v -f {} \;
    find . -type f -regex ".*\.$file_ext[0-9]+" -exec rm -v -f {} \;
done
