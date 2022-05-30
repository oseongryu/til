#!/bin/sh
echo -e "site name: "
read  site
echo ${site}

cd ${site}
git init
git config --local --list
git config --local user.name "oseongryu"
git config --local user.email "oseongryu@gmail.com"
git config --local --list

# git add -A 
# git commit -m "First Commit"
