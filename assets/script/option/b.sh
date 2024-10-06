#!/bin/bash
# https://ko.linux-console.net/?p=13560#gsc.tab=0
#Set the options of the getopt command
format=$(getopt -n "$0" -l "email:,pass:" -- -- "$@")
if [ $# -lt 3 ]; then
   echo "Wrong number of arguments are passed."
   exit
fi
eval set -- "$format"

#Read the argument values
while [ $# -gt 0 ]
do
     case "$1" in
          --email) Email="$2"; shift;;
          --pass) Password="$2"; shift;;
          --) shift;;
     esac
     shift;
done

#Compare the argument values with the particular value
if [[ "$Email" == "admin@example.com" && "$Password" == "secretpass" ]]; then
    echo "Valid user"
else
    echo "Invalid user"
fi