#!/bin/bash

# echo "파라미터 개수 : $#"
# echo "첫 번째 파라미터: $1"
# echo "모든 파라미터 내용 : $@"

SOURCE_PATH=~/git
SETTING_PATH=~/setting_files

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
else

    source_str=$PWD
    source_str_split=($(echo $source_str | tr "/" "\n"))
    source_filename=''
    # SOURCE 파일이름 찾기
    for (( filestridx = 0 ; filestridx < ${#source_str_split[@]} ; filestridx++ ))
    do
        if [ $filestridx == $(expr ${#source_str_split[@]} - 1) ]; then
            source_filename=(${source_str_split[$filestridx]})
        fi
    done
    today=`date +%Y%m%d_%H%M%S`
    varsettingpath=$varsettingpath/$today"_"$source_filename
fi

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
    echo "mkdir -p" $varsettingpath/${str/$filename/''}
    mkdir -p $varsettingpath/${str/$filename/''}
    # 파일이름 경로에 파일넣기
    echo "cp" $varsourcepath/${varfilenamelist[$filepathidx]} $varsettingpath/${str/$filename/''}
    cp $varsourcepath/${varfilenamelist[$filepathidx]} $varsettingpath/${str/$filename/''}
done
