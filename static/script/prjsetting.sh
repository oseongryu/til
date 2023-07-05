#!/bin/bash
# echo "1.backup web"
PATH_FREDIT_WEB=/c/Users/osryu/git/hy-fredit-web
PATH_FREDIT_WAS=/c/Users/osryu/git/hy-fredit-was
PATH_FACTORY_FO=/c/Users/osryu/git/hyfactorium
PATH_FACTORY_BO=/c/Users/osryu/git/hyfactoriumBO


SETTING_PATH=/c/DEV/tools/setting
SETTING_PATH_FREDIT_WEB=($(echo $SETTING_PATH)/hy-fredit-web)
SETTING_PATH_FREDIT_WAS=($(echo $SETTING_PATH)/hy-fredit-was)
SETTING_PATH_FACTORY_FO=($(echo $SETTING_PATH)/hyfactorium)
SETTING_PATH_FACTORY_BO=($(echo $SETTING_PATH)/hyfactoriumBO)

arraysettingpaths=($SETTING_PATH_FREDIT_WEB $SETTING_PATH_FREDIT_WAS $SETTING_PATH_FACTORY_FO $SETTING_PATH_FACTORY_BO)
for (( i = 0 ; i < ${#arraysettingpaths[@]} ; i++ ))
do
    if [ ! -d arraysettingpaths[$i] ]; then
        mkdir -p ${arraysettingpaths[$i]}
    fi
done

# 4
echo "was setting backup"
originfilename=(fo/src/main/resources/properties/local/application.yml fo/src/main/resources/properties/local/system.yml)
for (( i = 0 ; i < ${#originfilename[@]} ; i++ ))
do
    str=(${originfilename[$i]})
    str_split=($(echo $str | tr "/" "\n"))
    filename=''
    replace=''
    # 파일이름 찾기
    for (( index = 0 ; index < ${#str_split[@]} ; index++ ))
    do
        if [ $index == $(expr ${#str_split[@]} - 1) ]; then
            filename=(${str_split[$index]})
        fi
    done
    # 파일이름 제외 폴더생성
    echo $SETTING_PATH_FREDIT_WAS/${str/$filename/''}
    mkdir -p $SETTING_PATH_FREDIT_WAS/${str/$filename/''}
done


# # 3
# echo "web setting init"
# originfilename=(nuxt.config.ts)
# for (( i = 0 ; i < ${#originfilename[@]} ; i++ ))
# do
#     str=(${originfilename[$i]})
#     str_split=($(echo $str | tr "/" "\n"))
#     filename=''
#     # 파일이름 찾기
#     for (( index = 0 ; index < ${#str_split[@]} ; index++ ))
#     do
#         if [ $index == $(expr ${#str_split[@]} - 1) ]; then
#             filename=(${str_split[$index]})
#         fi
#     done
#     echo $SETTING_PATH_FREDIT_WEB/$filename $PATH_FREDIT_WEB/${originfilename[$i]}
#     # cp $SETTING_PATH_FREDIT_WEB/$filename $PATH_FREDIT_WEB/${originfilename[$i]}
# done
# echo "was setting init"
# originfilename=(fo/src/main/resources/properties/local/application.yml fo/src/main/resources/properties/local/system.yml)
# for (( i = 0 ; i < ${#originfilename[@]} ; i++ ))
# do
#     str=(${originfilename[$i]})
#     str_split=($(echo $str | tr "/" "\n"))
#     filename=''
#     # 파일이름 찾기
#     for (( index = 0 ; index < ${#str_split[@]} ; index++ ))
#     do
#         if [ $index == $(expr ${#str_split[@]} - 1) ]; then
#             filename=(${str_split[$index]})
#         fi
#     done
#     echo $SETTING_PATH_FREDIT_WAS/$filename $PATH_FREDIT_WAS/${originfilename[$i]}
#     # cp $SETTING_PATH_FREDIT_WAS/$filename $PATH_FREDIT_WAS/${originfilename[$i]}
# done




# # 1
# cp $PATH_FREDIT_WEB/nuxt.config.ts $SETTING_PATH_FREDIT_WEB
# cp $PATH_FREDIT_WAS/fo/src/main/resources/properties/local/application.yml $SETTING_PATH_FREDIT_WAS
# cp $PATH_FREDIT_WAS/fo/src/main/resources/properties/local/system.yml $SETTING_PATH_FREDIT_WAS

# # 2
# echo "web setting backup"
# originfilename=(nuxt.config.ts)
# settingfilename=(nuxt.config.ts)
# for (( i = 0 ; i < ${#originfilename[@]} ; i++ ))
# do
#     echo $PATH_FREDIT_WEB/${originfilename[$i]} $SETTING_PATH_FREDIT_WEB
#     cp $PATH_FREDIT_WEB/${originfilename[$i]} $SETTING_PATH_FREDIT_WEB
# done
# echo "was setting backup"
# originfilename=(fo/src/main/resources/properties/local/application.yml fo/src/main/resources/properties/local/system.yml)
# settingfilename=(application.yml system.yml)
# for (( i = 0 ; i < ${#originfilename[@]} ; i++ ))
# do
#     echo $PATH_FREDIT_WAS/${originfilename[$i]} $SETTING_PATH_FREDIT_WAS
#     cp $PATH_FREDIT_WAS/${originfilename[$i]} $SETTING_PATH_FREDIT_WAS
# done

# echo "web setting init"
# originfilename=(nuxt.config.ts)
# settingfilename=(nuxt.config.ts)
# for (( i = 0 ; i < ${#originfilename[@]} ; i++ ))
# do
#     echo $SETTING_PATH_FREDIT_WEB/${settingfilename[$i]} $PATH_FREDIT_WEB/${originfilename[$i]}
#     cp $SETTING_PATH_FREDIT_WEB/${settingfilename[$i]} $PATH_FREDIT_WEB/${originfilename[$i]}
# done
# echo "was setting init"
# originfilename=(fo/src/main/resources/properties/local/application.yml fo/src/main/resources/properties/local/system.yml)
# for (( i = 0 ; i < ${#originfilename[@]} ; i++ ))
# do
#     echo $SETTING_PATH_FREDIT_WAS/${settingfilename[$i]} $PATH_FREDIT_WAS/${originfilename[$i]}
#     cp $SETTING_PATH_FREDIT_WAS/${settingfilename[$i]} $PATH_FREDIT_WAS/${originfilename[$i]}
# done


# # practice
# # filepath
# arrayfilepath=(fo/src/main/resources/properties/local/ fo/src/main/resources/properties/local/)
# for i in ${arrayfilepath[@]}
# for (( i = 0 ; i < ${#originfilename[@]} ; i++ ))
# do
#     # if [ ! -d $PATH_FREDIT_WAS/$i ]; then
#     #     mkdir -p $SETTING_PATH_FREDIT_WAS/${arrayfilepath[$i]}
#     # fi
#     echo $SETTING_PATH_FREDIT_WAS/${settingfilename[$i]} $PATH_FREDIT_WAS/${originfilename[$i]}
#     cp $SETTING_PATH_FREDIT_WAS/${settingfilename[$i]} $PATH_FREDIT_WAS/${originfilename[$i]}
# done

# # extract filename
# str="fo/src/main/resources/properties/local/application.yml"
# str_split=($(echo $str | tr "/" "\n"))
# for (( i = 0 ; i < ${#str_split[@]} ; i++ ))
# do
#     if [ $i == $(expr ${#str_split[@]} - 1) ]; then
#         echo ${str_split[$i]}
#     fi
# done