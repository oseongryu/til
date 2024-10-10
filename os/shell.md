### 리눅스와 쉘

```bash
JSLinux (Fedora29)
- 자바 스크립트로 만든 리눅스 에뮬레이터
- 장점 : 리눅스를 설치하지 않고 웹으로 대부분의 기능을 사용가능
- 단점
: 느림
(첫 로딩이 느리고 명령어 실행 후 결과가 나오기까지도 느리다)

- 로컬 리눅스를 설치 또는 클라우드의 리눅스 서비스에서 bash를 사용
- codeonweb
```

### 리눅스와 쉘(Bash)

```bash
# 명령어
cd # Change Directory
pwd # Print Working Directory

num=0;while true;do ((num+=1));echo ${num};sleep 1;done
```

### cd, ls, df

```
- cd (Change Directory)
  : 현재 작업 디렉토리를 지정한 디렉토리로 변경
- ls (LiSt)
  : 현 디렉토리의 파일 목록을 출력
- df (Disk Free)
  : 마운트된 모든 장치에 대한 현재의 디스크 공간 통계를 출력
```

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

```
- mkdir (MaKe DIRectory)
  : 디렉토리를 생성
- rmdir (ReMove DIRectory)
  : 디렉토리를 삭제
- pwd (Print Working Directory)
  : 현재 위치한 디렉토리의 절대경로를 출력
- mount
  70비극 자취로 표시하거나 가사 파일 시스템으로 지정한 디렉토리를 연결(마운트)
  디렉토리를
- stat
  : 지정한 파일의 파 일 통계를 출력
```

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

```
- touch
- 지정한 이름의 비어있는 파일을 생성하거나 파일이 있는 경우 타임스탬프를 업데이트
- cat (catenate)
  : 지정한파일의 내 용 을 출력
- head
  : 지정 한파일의 1라인 부 터 지정한라인 까 지출력(기본 지정 값10)
```

```bash
touch test

head -n 2 filename
```

### tail, cp, mv, rename

```
- tail
  : 지정한 파일의 마지막 라인부터 지정한 수 만큼의 라인을 출력
- ср (CoPy)
  : 지정한 파일을 지정한 위치와 이름으로 복사

- mv (MoVe)
  : 지 정 한 파일을 지정한 위치와 이름으로 이동
- rename
  : 지정한 규칙에
  • 따라 여러 개의 파일 이름을 변경
```

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

```
- rm (ReMove)
  : 지정한 파일을 삭 제
- less
  : 상하로 커서 이동이 가능한 파일보기
- In (LiNk)
  : 지정한 파일에 대 한 심볼릭링크나 하드링크를 생성
```

```bash
# 하드링크
ln 옵션 패스/원본 패스/링크파일

# 심볼릭링크
ls -s
```

### paste, dd, tar

```
- paste
  : 지정한 파일들의 행을 읽어 탭으로 구분하여 병 합
- dd (Dataset Dafinition)
  : 블록 단위로 데이터셋을 정의하여 파일을 쓰고 읽음
- tar (Tape ARchive)
  : 지정 한 데이터및 디렉토리를 하나의 파일로 만 듬
```

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
