#!/bin/bash
#Read the argument values
while [[ "$#" -gt 0 ]]
  do
    case $1 in
      -u|--user) User="$2"; shift;;
      -p|--pass) Password="$2"; shift;;
      -h|--host) Host="$2"; shift;;
    esac
    shift
done
#Print the argument values
printf "username: $User \npassword: $Password \nhostname: $Host\n"