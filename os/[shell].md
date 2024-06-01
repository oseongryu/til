
## 리눅스와 쉘

### 리눅스와 쉘



### 리눅스와 쉘(Bash)

```bash
# 명령어
cd # Change Directory
pwd # Print Working Directory

num=0;while true;do ((num+=1));echo ${num};sleep 1;done
```

### cd, ls, df

```bash
# 이전에 있었던 경로로 이동
cd -

## 
ㅣs -1
ls -a1
# 용량 보기 쉽게
ls -alh
# 시간순 정렬
ls -t
# 시간 역순정렬
ls -r

ls -al | awk '{print $9}'


###
df
df -h
df -T
# Inode Iused
df -i
```

### mkdir, rmdir, pwd


### mount, stat

```bash
df -h
mount -t nfs 127.0.0.1:/nfs /mnt
df -h
# 공유 해제
unmount /mnt

stat test.md
```


### touch, cat, head

```bash
touch test

head -n 2 filename
```

### tail, cp, mv, rename

```bash
tail -n 2 filename

tail -f 
tail -F 

# r 하위폴더까지, f 강제로 p 권한
cp -rfp path/originfile copyfile

rename 변경전파일명 변경후파일명 대상파일
rename test test0 test?
```

### rm, less, ln

```bash
# 하드링크
ln 옵션 패스/원본 패스/링크파일

# 심볼릭링크
ls -s 
```

### paste, dd, tar

```bash
dd if=인풋파일이름 of=아웃풋파일이름 bs=파이트(크키) count=블럭을복사할횟수

# 10k
dd if=/dev/urandom of=ddtest bs=1024 count=10
# 1메가
dd if=/dev/urandom of=ddtest bs=1024 count=1024
dd if=/dev/zero

tar -cvzf 파일 경로/파일명
tar -xfzf
tar -xvzf

tar -cvzf work.tgz /WORK
```