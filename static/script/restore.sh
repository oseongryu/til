#!/bin/bash

# echo "파라미터 개수 : $#"
# echo "첫 번째 파라미터: $1"
# echo "모든 파라미터 내용 : $@"

SOURCE_PATH=~/git
SETTING_PATH=~/setting_files

varfilenamelist=()
# git status --porcelain | awk '{ print $2 }'
# value=$(</c/Users/osryu/git/hyinterface/test.txt)

varsourcepath=$PWD
varsettingpath=$SETTING_PATH

if [[ $1 != "" ]]; then
    varsettingpath=$varsettingpath/$1
    echo "cd" $varsettingpath
    cd $varsettingpath
    if [[ $? -eq 0 ]]; then
        echo "git init"
        git init
        echo "git add ."
        git add .
        echo "git status --porcelain | awk '{ print $2 }')"
        varfilenamelist=($(git status --porcelain | awk '{ print $2 }'))
        echo "rm -rf .git"
        rm -rf .git
        for (( filepathidx = 0 ; filepathidx < ${#varfilenamelist[@]} ; filepathidx++ ))
        do
            str=(${varfilenamelist[$filepathidx]})
            str_split=($(echo $str | tr "/" "\n"))
            filename=''
            # 파일이름 찾기
            for (( filestridx = 0 ; filestridx < ${#str_split[@]} ; filestridx++ ))
            do
                if [ $filestridx == $(expr ${#str_split[@]} - 1) ]; then
                    filename=(${str_split[$filestridx]})
                fi
            done

            # 파일이름 제외 폴더생성
            echo "mkdir -p" $varsourcepath/${str/$filename/''}
            mkdir -p $varsourcepath/${str/$filename/''}

            echo "cp" $varsettingpath/${varfilenamelist[$filepathidx]} $varsourcepath/${varfilenamelist[$filepathidx]}
            cp $varsettingpath/${varfilenamelist[$filepathidx]} $varsourcepath/${varfilenamelist[$filepathidx]}
        done
    else 
        echo "setup path is not correct"
    fi
else 
    echo "setup path is null"
fi


