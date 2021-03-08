#!/bin/bash
#check that the csv changes when a file is written to
"csv_file"="$(dirname $(dirname $(realpath $0)))/src/database.csv"
"ctime1"="stat -c %z $csv_file"

#wait a second?
"/bin/sleep 1"

#write to a file



"ctime2"="stat -c %z $csv_file"

if [ "$ctime1"="$ctime2" ];then echo "Log did not write";else echo "OK"; fi
