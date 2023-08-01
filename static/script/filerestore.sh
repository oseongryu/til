#!/bin/bash

# echo "파라미터 개수 : $#"
# echo "첫 번째 파라미터: $1"
# echo "모든 파라미터 내용 : $@"

SOURCE_PATH=/c/Users/$(whoami)/git
SETTING_PATH=/c/Users/$(whoami)/setting_files

# setting folder 생성
mkdir -p $SETTING_PATH

varfilenamelist=()
# git status --porcelain | awk '{ print $2 }'
# value=$(</c/Users/osryu/git/hyinterface/test.txt)

varsourcepath=$PWD
varsettingpath=$SETTING_PATH
varfilenamelist=($(git status --porcelain | awk '{ print $2 }'))

if [[ $1 != "" ]]; then
    varsettingpath=$varsettingpath/$1
    for (( filepathindex = 0 ; filepathindex < ${#varfilenamelist[@]} ; filepathindex++ ))
    do
        str=(${varfilenamelist[$filepathindex]})
        str_split=($(echo $str | tr "/" "\n"))
        filename=''
        # 파일이름 찾기
        for (( filestridx = 0 ; filestridx < ${#str_split[@]} ; filestridx++ ))
        do
            if [ $filestridx == $(expr ${#str_split[@]} - 1) ]; then
                filename=(${str_split[$filestridx]})
            fi
        done

        echo "cp" $varsettingpath/${varfilenamelist[$filepathidx]} $varsourcepath/${varfilenamelist[$filepathidx]}
        cp $varsettingpath/${varfilenamelist[$filepathidx]} $varsourcepath/${varfilenamelist[$filepathidx]}
    done    
else 
    echo "setting path is null"
fi


