#!/bin/bash

# echo "파라미터 개수 : $#"
# echo "첫 번째 파라미터: $1"
# echo "모든 파라미터 내용 : $@"

SOURCE_PATH=/c/Users/osryu/git
SOURCE_PATH_FREDIT_WEB=($(echo $SOURCE_PATH)/hy-fredit-web)
SOURCE_PATH_FREDIT_WAS=($(echo $SOURCE_PATH)/hy-fredit-was)
SOURCE_PATH_HYP_BATCH=($(echo $SOURCE_PATH)/hyp_batch)
SOURCE_PATH_FACTORY_FO=($(echo $SOURCE_PATH)/hyfactorium)
SOURCE_PATH_FACTORY_BO=($(echo $SOURCE_PATH)/hyfactoriumBO)

SETTING_PATH=/c/DEV/tools/setting
SETTING_PATH_FREDIT_WEB=($(echo $SETTING_PATH)/hy-fredit-web)
SETTING_PATH_FREDIT_WAS=($(echo $SETTING_PATH)/hy-fredit-was)
SETTING_PATH_HYP_BATCH=($(echo $SETTING_PATH)/hyp_batch)
SETTING_PATH_FACTORY_FO=($(echo $SETTING_PATH)/hyfactorium)
SETTING_PATH_FACTORY_BO=($(echo $SETTING_PATH)/hyfactoriumBO)

FILE_NAME_LIST_FREDIT_WEB=(nuxt.config.ts)
FILE_NAME_LIST_FREDIT_WAS=(fo/src/main/resources/properties/local/application.yml fo/src/main/resources/properties/local/system.yml)
FILE_NAME_LIST_HYP_BATCH=(src/main/java/com/hy/base/quartz/MainTask.java)
FILE_NAME_LIST_FACTORY_FO=(src/main/resources-dev/db.properties src/main/resources-local/db.properties)
FILE_NAME_LIST_FACTORY_BO=(src/main/java/egovframework/application/apply/ApplyController.java src/main/resources-dev/db.properties src/main/resources-local/db.properties)

#!/bin/bash

# echo "파라미터 개수 : $#"
# echo "첫 번째 파라미터: $1"
# echo "모든 파라미터 내용 : $@"

SOURCE_PATH=/c/Users/osryu/git
SOURCE_PATH_FREDIT_WEB=($(echo $SOURCE_PATH)/hy-fredit-web)
SOURCE_PATH_FREDIT_WAS=($(echo $SOURCE_PATH)/hy-fredit-was)
SOURCE_PATH_HYP_BATCH=($(echo $SOURCE_PATH)/hyp_batch)
SOURCE_PATH_FACTORY_FO=($(echo $SOURCE_PATH)/hyfactorium)
SOURCE_PATH_FACTORY_BO=($(echo $SOURCE_PATH)/hyfactoriumBO)

SETTING_PATH=/c/DEV/tools/setting
SETTING_PATH_FREDIT_WEB=($(echo $SETTING_PATH)/hy-fredit-web)
SETTING_PATH_FREDIT_WAS=($(echo $SETTING_PATH)/hy-fredit-was)
SETTING_PATH_HYP_BATCH=($(echo $SETTING_PATH)/hyp_batch)
SETTING_PATH_FACTORY_FO=($(echo $SETTING_PATH)/hyfactorium)
SETTING_PATH_FACTORY_BO=($(echo $SETTING_PATH)/hyfactoriumBO)

FILE_NAME_LIST_FREDIT_WEB=(nuxt.config.ts)
FILE_NAME_LIST_FREDIT_WAS=(fo/src/main/resources/properties/local/application.yml fo/src/main/resources/properties/local/system.yml)
FILE_NAME_LIST_HYP_BATCH=(src/main/java/com/hy/base/quartz/MainTask.java)
FILE_NAME_LIST_FACTORY_FO=(src/main/resources-dev/db.properties src/main/resources-local/db.properties)
FILE_NAME_LIST_FACTORY_BO=(src/main/java/egovframework/application/apply/ApplyController.java src/main/resources-dev/db.properties src/main/resources-local/db.properties)

arraysourcepaths=($SOURCE_PATH_FREDIT_WEB $SOURCE_PATH_FREDIT_WAS $SOURCE_PATH_HYP_BATCH $SOURCE_PATH_FACTORY_FO $SOURCE_PATH_FACTORY_BO)
arraysettingpaths=($SETTING_PATH_FREDIT_WEB $SETTING_PATH_FREDIT_WAS $SETTING_PATH_HYP_BATCH $SETTING_PATH_FACTORY_FO $SETTING_PATH_FACTORY_BO)

for (( projectidx = 0 ; projectidx < ${#arraysettingpaths[@]} ; projectidx++ ))
do
    echo "backup"
    varsettingpath=${arraysettingpaths[$projectidx]}
    varsourcepath=${arraysourcepaths[$projectidx]}
    varfilenamelist=()
    if [ $projectidx == 0 ]; then
        echo ""
        varfilenamelist=(${FILE_NAME_LIST_FREDIT_WEB[@]})
    elif [[ $projectidx == 1 ]]; then
        echo ""
        varfilenamelist=(${FILE_NAME_LIST_FREDIT_WAS[@]})
    elif [[ $projectidx == 2 ]]; then
        echo ""
        varfilenamelist=(${FILE_NAME_LIST_HYP_BATCH[@]})
    elif [[ $projectidx == 3 ]]; then
        echo ""
        # varfilenamelist=(${FILE_NAME_LIST_FACTORY_FO[@]})
    elif [[ $projectidx == 4 ]]; then
        echo ""
        # varfilenamelist=(${FILE_NAME_LIST_FACTORY_BO[@]})
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
        if [[ $1 == "backup" ]]; then
            # 파일이름 제외 폴더생성
            echo "mkdir -p" $varsettingpath/${str/$filename/''}
            mkdir -p $varsettingpath/${str/$filename/''}
            # 파일이름 경로에 파일넣기
            echo "cp" $varsourcepath/${varfilenamelist[$filepathidx]} $varsettingpath/${str/$filename/''}
            cp $varsourcepath/${varfilenamelist[$filepathidx]} $varsettingpath/${str/$filename/''}
        else
            echo "cp" $varsettingpath/${varfilenamelist[$filepathidx]} $varsourcepath/${varfilenamelist[$filepathidx]}
            cp $varsettingpath/${varfilenamelist[$filepathidx]} $varsourcepath/${varfilenamelist[$filepathidx]}
        fi
    done
done

# arraysourcepaths=($SOURCE_PATH_FREDIT_WEB $SOURCE_PATH_FREDIT_WAS $SOURCE_PATH_HYP_BATCH $SOURCE_PATH_FACTORY_FO $SOURCE_PATH_FACTORY_BO)
# arraysettingpaths=($SETTING_PATH_FREDIT_WEB $SETTING_PATH_FREDIT_WAS $SETTING_PATH_HYP_BATCH $SETTING_PATH_FACTORY_FO $SETTING_PATH_FACTORY_BO)

# if [[ $1 == "backup" ]]; then
#     for (( projectidx = 0 ; projectidx < ${#arraysettingpaths[@]} ; projectidx++ ))
#     do
#         echo "backup"
#         varsettingpath=${arraysettingpaths[$projectidx]}
#         varsourcepath=${arraysourcepaths[$projectidx]}
#         varfilenamelist=()
#         if [ $projectidx == 0 ]; then
#             echo ""
#             # varfilenamelist=(${FILE_NAME_LIST_FREDIT_WEB[@]})
#         elif [[ $projectidx == 1 ]]; then
#             echo ""
#             # varfilenamelist=(${FILE_NAME_LIST_FREDIT_WAS[@]})
#         elif [[ $projectidx == 2 ]]; then
#             echo ""
#             varfilenamelist=(${FILE_NAME_LIST_HYP_BATCH[@]})
#         elif [[ $projectidx == 3 ]]; then
#             echo ""
#             # varfilenamelist=(${FILE_NAME_LIST_FACTORY_FO[@]})
#         elif [[ $projectidx == 4 ]]; then
#             echo ""
#             # varfilenamelist=(${FILE_NAME_LIST_FACTORY_BO[@]})
#         fi

#         for (( filepathidx = 0 ; filepathidx < ${#varfilenamelist[@]} ; filepathidx++ ))
#         do
#             str=(${varfilenamelist[$filepathidx]})
#             str_split=($(echo $str | tr "/" "\n"))
#             filename=''
#             replace=''
#             # 파일이름 찾기
#             for (( filestridx = 0 ; filestridx < ${#str_split[@]} ; filestridx++ ))
#             do
#                 if [ $filestridx == $(expr ${#str_split[@]} - 1) ]; then
#                     filename=(${str_split[$filestridx]})
#                 fi
#             done
#             # 파일이름 제외 폴더생성
#             echo "mkdir -p" $varsettingpath/${str/$filename/''}
#             mkdir -p $varsettingpath/${str/$filename/''}

#             # 파일이름 경로에 파일넣기
#             echo "cp" $varsourcepath/${varfilenamelist[$filepathidx]} $varsettingpath/${str/$filename/''}
#             cp $varsourcepath/${varfilenamelist[$filepathidx]} $varsettingpath/${str/$filename/''}
#         done
#     done

# else
#     for (( projectidx = 0 ; projectidx < ${#arraysettingpaths[@]} ; projectidx++ ))
#     do
#         echo "init"
#         varsettingpath=${arraysettingpaths[$projectidx]}
#         varsourcepath=${arraysourcepaths[$projectidx]}
#         varfilenamelist=()
#         if [ $projectidx == 0 ]; then
#             echo ""
#             # varfilenamelist=(${FILE_NAME_LIST_FREDIT_WEB[@]})
#         elif [[ $projectidx == 1 ]]; then
#             echo ""
#             # varfilenamelist=(${FILE_NAME_LIST_FREDIT_WAS[@]})
#         elif [[ $projectidx == 2 ]]; then
#             echo ""
#             varfilenamelist=(${FILE_NAME_LIST_HYP_BATCH[@]})
#         elif [[ $projectidx == 3 ]]; then
#             echo ""
#             # varfilenamelist=(${FILE_NAME_LIST_FACTORY_FO[@]})
#         elif [[ $projectidx == 4 ]]; then
#             echo ""
#             # varfilenamelist=(${FILE_NAME_LIST_FACTORY_BO[@]})
#         fi

#         for (( filepathidx = 0 ; filepathidx < ${#varfilenamelist[@]} ; filepathidx++ ))
#         do
#             str=(${varfilenamelist[$i]})
#             str_split=($(echo $str | tr "/" "\n"))
#             filename=''
#             # 파일이름 찾기
#             for (( filestridx = 0 ; filestridx < ${#str_split[@]} ; filestridx++ ))
#             do
#                 if [ $filestridx == $(expr ${#str_split[@]} - 1) ]; then
#                     filename=(${str_split[$filestridx]})
#                 fi
#             done
#             echo "cp" $varsettingpath/${varfilenamelist[$filepathidx]} $varsourcepath/${varfilenamelist[$filepathidx]}
#             cp $varsettingpath/${varfilenamelist[$filepathidx]} $varsourcepath/${varfilenamelist[$filepathidx]}
#         done
#     done
# fi

# if [[ $1 == "backup" ]]; then
#     # 4
#     echo "web setting backup"
#     originfilename=(nuxt.config.ts)
#     for (( filepathidx = 0 ; filepathidx < ${#originfilename[@]} ; filepathidx++ ))
#     do
#         str=(${originfilename[$filepathidx]})
#         str_split=($(echo $str | tr "/" "\n"))
#         filename=''
#         replace=''
#         # 파일이름 찾기
#         for (( filestridx = 0 ; filestridx < ${#str_split[@]} ; filestridx++ ))
#         do
#             if [ $filestridx == $(expr ${#str_split[@]} - 1) ]; then
#                 filename=(${str_split[$filestridx]})
#             fi
#         done
#         # 파일이름 제외 폴더생성
#         echo "mkdir -p" $SETTING_PATH_FREDIT_WEB/${str/$filename/''}
#         mkdir -p $SETTING_PATH_FREDIT_WEB/${str/$filename/''}

#         # 파일이름 경로에 파일넣기
#         echo "cp" $PATH_FREDIT_WEB/${originfilename[$filepathidx]} $SETTING_PATH_FREDIT_WEB/${str/$filename/''}
#         cp $PATH_FREDIT_WEB/${originfilename[$filepathidx]} $SETTING_PATH_FREDIT_WEB/${str/$filename/''}
#     done
#     echo "was setting backup"
#     originfilename=(fo/src/main/resources/properties/local/application.yml fo/src/main/resources/properties/local/system.yml)
#     for (( filepathidx = 0 ; filepathidx < ${#originfilename[@]} ; filepathidx++ ))
#     do
#         str=(${originfilename[$filepathidx]})
#         str_split=($(echo $str | tr "/" "\n"))
#         filename=''
#         replace=''
#         # 파일이름 찾기
#         for (( filestridx = 0 ; filestridx < ${#str_split[@]} ; filestridx++ ))
#         do
#             if [ $filestridx == $(expr ${#str_split[@]} - 1) ]; then
#                 filename=(${str_split[$filestridx]})
#             fi
#         done
#         # 파일이름 제외 폴더생성
#         echo "mkdir -p" $SETTING_PATH_FREDIT_WAS/${str/$filename/''}
#         mkdir -p $SETTING_PATH_FREDIT_WAS/${str/$filename/''}

#         # 파일이름 경로에 파일넣기
#         echo "cp" $PATH_FREDIT_WAS/${originfilename[$filepathidx]} $SETTING_PATH_FREDIT_WAS/${str/$filename/''}
#         cp $PATH_FREDIT_WAS/${originfilename[$filepathidx]} $SETTING_PATH_FREDIT_WAS/${str/$filename/''}
#     done
# else
#     echo "init"
# fi



# arraysettingpaths=($SETTING_PATH_FREDIT_WEB $SETTING_PATH_FREDIT_WAS $SETTING_PATH_FACTORY_FO $SETTING_PATH_FACTORY_BO)
# for (( projectidx = 0 ; projectidx < ${#arraysettingpaths[@]} ; projectidx++ ))
# do
#     if [ ! -d arraysettingpaths[$projectidx] ]; then
#         mkdir -p ${arraysettingpaths[$projectidx]}
#     fi
# done

# # 4
# echo "web setting backup"
# originfilename=(nuxt.config.ts)
# for (( i = 0 ; i < ${#originfilename[@]} ; i++ ))
# do
#     str=(${originfilename[$i]})
#     str_split=($(echo $str | tr "/" "\n"))
#     filename=''
#     replace=''
#     # 파일이름 찾기
#     for (( projectidx = 0 ; projectidx < ${#str_split[@]} ; projectidx++ ))
#     do
#         if [ $projectidx == $(expr ${#str_split[@]} - 1) ]; then
#             filename=(${str_split[$projectidx]})
#         fi
#     done
#     # # 파일이름 제외 폴더생성
#     # echo $SETTING_PATH_FREDIT_WEB/${str/$filename/''}
#     # mkdir -p $SETTING_PATH_FREDIT_WEB/${str/$filename/''}

#     # # 파일이름 경로에 파일넣기
#     # echo $PATH_FREDIT_WAS/${originfilename[$i]} $SETTING_PATH_FREDIT_WEB/${str/$filename/''}
#     # cp $PATH_FREDIT_WAS/${originfilename[$i]} $SETTING_PATH_FREDIT_WEB/${str/$filename/''}

#     echo $PATH_FREDIT_WEB/${originfilename[$i]} $SETTING_PATH_FREDIT_WEB
#     cp $PATH_FREDIT_WEB/${originfilename[$i]} $SETTING_PATH_FREDIT_WEB
# done
# echo "was setting backup"
# originfilename=(fo/src/main/resources/properties/local/application.yml fo/src/main/resources/properties/local/system.yml)
# for (( i = 0 ; i < ${#originfilename[@]} ; i++ ))
# do
#     str=(${originfilename[$i]})
#     str_split=($(echo $str | tr "/" "\n"))
#     filename=''
#     replace=''
#     # 파일이름 찾기
#     for (( projectidx = 0 ; projectidx < ${#str_split[@]} ; projectidx++ ))
#     do
#         if [ $projectidx == $(expr ${#str_split[@]} - 1) ]; then
#             filename=(${str_split[$projectidx]})
#         fi
#     done
#     # # 파일이름 제외 폴더생성
#     # echo $SETTING_PATH_FREDIT_WAS/${str/$filename/''}
#     # mkdir -p $SETTING_PATH_FREDIT_WAS/${str/$filename/''}

#     # # 파일이름 경로에 파일넣기
#     # echo $PATH_FREDIT_WAS/${originfilename[$i]} $SETTING_PATH_FREDIT_WAS/${str/$filename/''}
#     # cp $PATH_FREDIT_WAS/${originfilename[$i]} $SETTING_PATH_FREDIT_WAS/${str/$filename/''}

#     echo $PATH_FREDIT_WAS/${originfilename[$i]} $SETTING_PATH_FREDIT_WAS
#     cp $PATH_FREDIT_WAS/${originfilename[$i]} $SETTING_PATH_FREDIT_WAS
# done

# # 3
# echo "web setting init"
# originfilename=(nuxt.config.ts)
# for (( i = 0 ; i < ${#originfilename[@]} ; i++ ))
# do
#     str=(${originfilename[$i]})
#     str_split=($(echo $str | tr "/" "\n"))
#     filename=''
#     # 파일이름 찾기
#     for (( projectidx = 0 ; projectidx < ${#str_split[@]} ; projectidx++ ))
#     do
#         if [ $projectidx == $(expr ${#str_split[@]} - 1) ]; then
#             filename=(${str_split[$projectidx]})
#         fi
#     done
#     echo $SETTING_PATH_FREDIT_WEB/${originfilename[$i]} $PATH_FREDIT_WEB/${originfilename[$i]}
#     cp $SETTING_PATH_FREDIT_WEB/${originfilename[$i]} $PATH_FREDIT_WEB/${originfilename[$i]}
# done
# echo "was setting init"
# originfilename=(fo/src/main/resources/properties/local/application.yml fo/src/main/resources/properties/local/system.yml)
# for (( i = 0 ; i < ${#originfilename[@]} ; i++ ))
# do
#     str=(${originfilename[$i]})
#     str_split=($(echo $str | tr "/" "\n"))
#     filename=''
#     # 파일이름 찾기
#     for (( projectidx = 0 ; projectidx < ${#str_split[@]} ; projectidx++ ))
#     do
#         if [ $projectidx == $(expr ${#str_split[@]} - 1) ]; then
#             filename=(${str_split[$projectidx]})
#         fi
#     done
#     echo $SETTING_PATH_FREDIT_WAS/${originfilename[$i]} $PATH_FREDIT_WAS/${originfilename[$i]}
#     cp $SETTING_PATH_FREDIT_WAS/${originfilename[$i]} $PATH_FREDIT_WAS/${originfilename[$i]}
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