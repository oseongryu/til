## docker-1_setup.md

## Docker 설치

### (1) Windows Docker 설치

1. `cmd > taskmgr` > 성능탭 > 가상화 사용함인지 확인 (안되어 있을 경우 BIOS에서 사용으로 설정 변경)

2. `cmd > appwiz.cpl` > Windows 기능 켜기/끄기 > Hyper-V 체크 > Windows 재부팅

3. [Docker사이트](https://hub.docker.com/editions/community/docker-ce-desktop-windows/) > 설치파일 다운로드(Get Docker 클릭)

4. 설치파일 > Configuration OK 클릭 > 설치 완료 후 Close and Restart > Windows 재부팅

5. [커널업데이트 패키지 사이트](https://aka.ms/wsl2kernel) > x64 머신용 최신 WSL2 Linux 커널 업데이트 패키지 클릭 > 설치파일 설치

6. trayIcon > Docker 오른쪽 마우스 클릭 > Restart Docker 클릭

7. `cmd > docker -v`로 설정 확인

### (2) Docker 회원가입

1. [Docker 사이트](https://hub.docker.com/) > Sign Up > 가입완료

2. Choose a Plan 에서 Continue with/Free > 이메일인증 완료

### (3) Docker Tutorial

1. Downloads

2. Clone

   ```bash
   git clone https://github.com/docker/doodle.git
   ```

3. Build

   ```bash
   cd doodle\cheers2019 ; docker build -t f5074/cheers2019 .
   ```

4. Run

   ```bash
   docker run -it --rm f5074/cheers2019
   ```

5. Ship

   ```bash
   docker login ; docker push f5074/cheers2019
   ```

### (4) My Repositories

<https://hub.docker.com/repositories>

### (5) GUI용 Docker (Kitematic)

<https://www.github.com/docker/kitematic/releases>

### Reference

- [갓대희의 작은공간](https://goddaehee.tistory.com/251)

## docker-2_using.md

## docker Using in Windows

### 오라클 사용법

```bash
# docker version
docker version

#이미지 검색하기
docker search oracle-xe

# 이미지 가져오기
docker pull oracleinanutshell/oracle-xe-11g

# 당겨온 이미지로 컨테이너 실행하기
docker run --name oracle11g -d -p 1521:1521 oracleinanutshell/oracle-xe-11g

docker ps

# 실행
docker run -d --rm --name oracle-xe --shm-size=1g -p 1521:1521 -e ORACLE_PWD=password daggerok/oracle
```

docker 재시작 후 oracle 접속

```
127.0.0.1:1521
SID: XE
user: sys
password: password
Role SYSDBA
```

```sql
CREATE USER drawing IDENTIFIED BY drawing;
--ALTER USER drawing IDENTIFIED BY test;
grant connect, resource to drawing;

GRANT CREATE SESSION TO drawing;
GRANT CREATE ANY TABLE TO drawing;
```

### Oracle 초기화 방지 사용법

```bash
# 1. 컨테이너 실행
docker run --name oracle11g --shm-size=1g -d -p 1521:1521 -v /oracle11g-data/:/u01/app/oracle/oradata/oracle11g-data/ -e ORACLE_ALLOW_REMOTE=true -e ORACLE_PWD=password --restart=always daggerok/oracle

# 2. 재시작 시 실행명령어
docker run --shm-size=1g -d daggerok/oracle
```

### Oracle

```bash
# 오라클의 경우 테이블 생성시 30자 제한이 있어서 12.1 버전이 아닌 12.2 버전에서 30자 제한이 없음
docker pull ashimjk/oracle-ee-12c
# docker run -d -p 1521:1521 ashimjk/oracle-ee-12c
docker run --name oracle12c --shm-size=1g -d -p 1521:1521  --restart=always ashimjk/oracle-ee-12c
docker run --name oracle12c --shm-size=1g -d -p 1521:1521 -v /oracle12c-data/:/u01/app/oracle/oradata/oracle12c-data/ --restart=always ashimjk/oracle-ee-12c

docker ps -a
docker logs oracle12c
docker exec -it oracle12c bash

netstat -nlpt
su oracle
cd $ORACLE_HOME
bin/sqlplus / as sysdba
SELECT status FROM v$instance;


create user user1 identified by password;
grant dba to user1 with admin option;
```

설정확인:

```
Host: localhost
Database(Service Name): ee.oracle.docker
User Name: user1
Password: password
```

### docker Volume

```bash
# 1. docker volume 생성
docker volume create vol-mysql
docker volume ls
docker volume inspect vol-mysql
```

### docker Execute

```bash
# 1. container 리스트 확인
docker ps -a

# 2. 해당 컨테이너 실행
docker exec -it [CONTAINER ID] bash
docker exec -it [NAMES] bash

docker exec -it 1174feb7c6f4 bash
```

### References

- <https://subicura.com/2017/01/19/docker-guide-for-beginners-2.html>
- 오라클 관련: <https://github.com/daggerok/oracle/releases>
- docker oracle11g 재시작시 데이터 저장시키기: <https://sangmoo.tistory.com/225>

## docker-centos.md

### docker

```bash
docker pull centos
docker image list
docker run -i -t centos /bin/bash
```

### centos Setting

```bash
yum install wget nano
yum -y install glibc-locale-source glibc-langpack-en
```

### nodejs in centos

```bash
sudo yum install -y gcc-c++ make
curl -sL https://rpm.nodesource.com/setup_12.x | sudo bash -
curl -sL https://rpm.nodesource.com/setup_12.x | bash -

yum install -y nodejs
node -v
npm -v
```

### git in centos

```bash
yum install git
```

### init

```bash
cd /home
mkdir web

/home/web
git clone ~
```

### pm2

```bash
npm install -g pm2

pm2 start server.js
```

### 포트 확인

```bash
yum install lsof
lsof -i -nP | grep LISTEN | awk '{print $(NF-1)" "$1}' | sort -u

yum install net-tools
netstat -tnlp

docker run -d --dns 8.8.8.8 --name centos-my centos /sbin/init
```

### docker 실행

```bash
docker exec -it centos-my /bin/bash
```

### 권한 포트 문제가 있을 경우

```bash
--cap-add=NET_ADMIN
-p 3013:3013

ps -ef|grep docker
```

### CentOS

```bash
yum install iptables
iptables -L -n -v
iptables -P INPUT ACCEPT

docker run --cap-add=NET_ADMIN -it --name centos-my -p 3013:3013 centos
```

### docker에 추가 컨테이너에 포트 추가

```bash
docker stop centos-my
docker commit centos-my centos-my2
docker run -p 80:80 -d centos-my2
```

### CentOS 7.9 버전

```bash
docker pull centos:7.9.2009
docker run -it --name centos-my -p 8080:8080 -p 8081:8081 centos:7.9.2009
```

- the input device is not a TTY

  ```bash
  winpty docker run -it --name centos-my -p 8080:8080 -p 8081:8081 centos:7.9.2009
  docker run -t --name centos-my -p 8080:8080 -p 8081:8081 centos:7.9.2009
  ```

### References

- <https://firework-ham.tistory.com/78>
- <https://help.iwinv.kr/manual/read.html?idx=548>
- 포트 추가: <https://medium.com/sjk5766/%EC%8B%A4%ED%96%89%EC%A4%91%EC%9D%B8-container%EC%97%90-port-or-volume-%EC%B6%94%EA%B0%80-ae8889344c68>

## docker-env.md

### docker

```bash
#!/bin/sh
docker cp ~/git/hy-fredit-web centos-env-vue:/root
docker exec -it centos-env-vue bash

docker commit centos-env-vue oseongryu/centos-env-vue:0.0.3
docker push oseongryu/centos-env-vue:0.0.3

docker pull oseongryu/centos-env-vue:0.0.1
docker run -it -d --name centos-env-vue -p 9551:9551 -p 9552:9552 oseongryu/centos-env-vue:0.0.3 /sbin/init
docker run -it -d -p 9551:9551 -p 9552:9552 --privileged --restart=always --name centos-env-vue oseongryu/centos-env-vue:0.0.1 /sbin/init

docker exec -it centos-env-vue bash
```

### centos 설정

```bash
yum update

# Error: Failed to download metadata for repo 'appstream': Cannot prepare internal mirrorlist: No URLs in mirrorlist
cd /etc/yum.repos.d/
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# node 설치
## node 16.17.1
yum install -y wget
cd /home
wget https://nodejs.org/dist/v16.17.1/node-v16.17.1-linux-x64.tar.gz
tar xvzf node-v16.17.1-linux-x64.tar.gz
mv node-v16.17.1-linux-x64 nodejs

## 실행파일 PATH 지정하기
vi /etc/profile
# pathmunge 윗 줄에 아래 2행 추가
export NODE_HOME=/home/nodejs
export PATH=$PATH:$NODE_HOME/bin
:wq

## 작성한 PATH 적용 시키기
source /etc/profile


## nodejs 버전 확인
node -v
npm -v

## yarn 설치
# https://gist.github.com/teocci/5ac7c3b59e255f414185b677717e620b
curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash -
sudo yum install nodejs
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
sudo rpm --import https://dl.yarnpkg.com/rpm/pubkey.gpg
sudo yum install yarn
yarn --version

## nvm 설치
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
nvm -v
nvm use system
vi ~/.bash_profile

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

source ~/.bash_profile
nvm install 16.17.1
nvm use 16.17.1
nvm alias default 16.17.1

# yarn 설치
npm i -g yarn
```

### docker offline image

```bash
docker save -o centos-env-vue-0.0.2.tar oseongryu/centos-env-vue:0.0.2
docker load -i centos-env-vue-0.0.2.tar
```

### References

- <https://imksh.com/93>

## docker-jekyll.md

### CentOS 설치

```bash
docker pull centos:7.9.2009
docker run -it --name centos-jekyll -p 8088:8088 centos:7.9.2009

docker exec -it centos-jekyll /bin/bash
```

### ruby

```bash
yum install ruby
ruby -v

```

### rbenv

```bash
yum install -y git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel


cd ~
git clone https://github.com/sstephenson/rbenv.git .rbenvcd
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
exec $SHELL

git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile
exec $SHELL
```

### rvm

```bash
yum install which
curl -L https://get.rvm.io | bash -s stable --ruby
curl -L https://get.rvm.io | bash -s stable --ruby=2.6.10

curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -

source /etc/profile.d/rvm.sh
rvm reload
rvm install 2.6.10
ruby -v
```

### jekyll setup

```bash
gem install jekyll
gem install minima
gem install bundler
gem install jekyll-feed
gem install tzinfo-data
```

### jekyll init

```bash
jekyll new my-awesome-site
cd my-awesome-site
```

### jekyll exec

```bash
bundle exec jekyll serve
bundle add webrick

#!/bin/sh
bundle exec jekyll serve --host localhost --port 8088
bundle exec jekyll serve --skip-initial-build --host 0.0.0.0 --port 8088 > /dev/null 2>&1 &

#!/bin/sh
kill $(ps aux | grep '[j]ekyll' | awk '{print $2}')

yum install net-tools
netstat -tnlp
```

### docker-cp

```bash
docker cp centos-jekyll:/my-awesome-site ~/git/test
docker cp ~/git/guide centos-jekyll:/
```

## docker-mac-m1.md

### racher Desktop

```
~/Library/rancher-desktop
~/Library/Logs/rancher-desktop
~/Library/Preferences/rancher-desktop
~/Library/Application Support/Caches/rancher-desktop-updater
~/Library/Application Support/rancher-desktop

sudo rm -rf ~/Library/rancher-desktop
sudo rm -rf ~/Library/Logs/rancher-desktop
sudo rm -rf ~/Library/Preferences/rancher-desktop
sudo rm -rf ~/Library/Application Support/Caches/rancher-desktop-updater
sudo rm -rf ~/Library/Application Support/rancher-desktop
```

## docker-mariadb.md

### Version Check

```
docker version
```

### MariaDB 사용법 (Mysql의 경우 mysql로 변경해서 사용)

1. 도커이미지 다운로드

```bash
docker pull mariadb
```

2. 컨테이너 실행

```bash
docker container run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=1234 --name mariadb_local mariadb

* Windows
docker container run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=1234 -v d:\docker\maria:/var/mariadb --restart=always --name mariadb_local mariadb

* Mac
docker container run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=1234 -v /Users/Shared/data/mariadb:/var/lib/mariadb --restart=always --name mariadb_local mariadb

* Mac(Docker Volume 사용)
docker volume create vol-mysql
docker volume ls
docker volume inspect vol-mysql
docker container run -d -p 13306:3306 -e MYSQL_ROOT_PASSWORD=1234 -v vol-mysql:/var/lib/mysql --restart=always --name mysql_local mysql
```

3. 컨테이너 실행 확인

```bash
docker container ls -a
docker container ls -as
```

4. mariadb 접속

```bash
docker exec -i -t mariadb_local bash
mysql -uroot -p1234
```

5. database 추가

```bash
show databases;
create schema test;
```

6. 컨테이너 재시작

```bash
docker stop mariadb
docker start mariadb
```

7. mariaDB 로그 확인

```bash
docker logs -f --tail=10 mariadb
```

### DBeaver

```
localhost?allowPublicKeyRetrieval=true&useSSL=false
```

### Docker 재시작

#### 컨테이너 삭제

```bash
#1. 동작중인 컨테이너 확인
docker ps
# 2. 정지된 컨테이너 확인
docker ps -a
# 3. 컨테이너 삭제
docker rm [ContainerID]
```

#### 이미지 삭제

```
1. 현재 이미지 확인
   docker images

2. 이미지 삭제
   docker rmi [ImageID]
```

### Reference

## docker.md

### docker-desktop license

```
docker-deskop license 문제로 wsl에 도커를 설정하는 형태로 진행
https://netmarble.engineering/docker-on-wsl2-without-docker-desktop/
```

### docker setting (windows)

```bash
# vmmem 점유율
1. 파일탐색기 %USERPROFILE%
2. 파일추가 .wslconfig

------------------------ .wslconfig
[wsl2]
memory=8GB
processors=8
swap=0
localhostForwarding=true
------------------------

3. 재부팅
```

### portainer

#### docksal

```bash
# install docksal
# https://docs.docksal.io/use-cases/portainer/
# https://docs.docksal.io/getting-started/setup/#install-macos-docker-for-mac
DOCKER_NATIVE=1 bash <(curl -fsSL https://get.docksal.io)

# setting
fin config set --global DOCKSAL_VHOST_PROXY_PORT_HTTP=80
fin config set --global DOCKSAL_VHOST_PROXY_PORT_HTTPS=443
fin system reset

# uninstall
fin cleanup
fin system stop
rm -rf "$HOME/.docksal"
rm -f /usr/local/bin/fin
```

#### portainer

```bash
# install
docker volume create portainer_data

# docksal
docker run --name portainer -d -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data --label='io.docksal.virtual-host=portainer.*' --label=io.docksal.virtual-port=9000 portainer/portainer -H unix:///var/run/docker.sock
# not docksal
docker run --name portainer -itd -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data --restart=always portainer/portainer

# use
# http://portainer.docksal or localohost:9000

#uninstall
docker rm -vf portainer
docker volume rm -f portainer_data
```

### docker-compose

```bash
# 이미지 재빌드가 필요하면 --build 옵션 추가, 그렇지 않으면 이미 작성된 이미지를 사용하게 됨
docker-compose up -d
docker-compose up --build -d

docker-compose stop
docker-compose down

docker exec -it test bash

docker-compose -f docker-compose.yml -f docker-compose.a.yml config
docker-compose -f docker-compose.yml -f docker-compose.a.yml up --build -d

```

### docker multi architecture (not buildx)

```bash
# https://medium.com/@life-is-short-so-enjoy-it/docker-how-to-build-and-push-multi-arch-docker-images-to-docker-hub-64dea4931df9
docker commit oseongryu/ubuntu-desktop-flutter-amd64:0.0.1
docker push oseongryu/ubuntu-desktop-flutter-amd64:0.0.1

docker commit oseongryu/ubuntu-desktop-flutter-arm64:0.0.1
docker push oseongryu/ubuntu-desktop-flutter-arm64:0.0.1

docker manifest create oseongryu/ubuntu-desktop-flutter:0.0.1 oseongryu/ubuntu-desktop-flutter-amd64:0.0.1 oseongryu/ubuntu-desktop-flutter-arm64:0.0.1
docker manifest push oseongryu/ubuntu-desktop-flutter:0.0.1
```

### docker buildx

```bash
# https://blog.taehun.dev/docker-buildx-
# create buildx
docker buildx create --name multi-arch-builder --driver docker-container --bootstrap --use

# build
docker buildx build --platform linux/amd64,linux/arm/v7,linux/arm64 -t ubuntu-desktop:20.04 .

# load local
docker buildx build --load -t ubuntu-desktop:20.04 .
docker images
# change image name
# docker image tag ubuntu-desktop:22.04 oseongryu/ubuntu-desktop:20.04

# push
docker login
docker buildx build --platform linux/amd64,linux/arm/v7,linux/arm64 -t oseongryu/ubuntu-desktop:20.04 --push .

# remove buidlx
docker buildx ls
docker buildx rm --all-inactive
```

### osx

```bash
# https://www.lesstif.com/container/docker-osx-106856663.html
# https://github.com/sickcodes/Docker-OSX

# m1 mac brew install qemu

# 환경설정
sudo apt install qemu qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virt-manager

sudo systemctl enable libvirtd.service
sudo systemctl enable virtlogd.service

echo 1 | sudo tee /sys/module/kvm/parameters/ignore_msrs

sudo modprobe kvm
sudo systemctl reboot

# use
docker pull sickcodes/docker-osx:latest

docker run -it \
    --device /dev/kvm \
    -p 50922:10022 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e "DISPLAY=${DISPLAY:-:0.0}" \
    sickcodes/docker-osx:big-sur
```

### oracle

```bash
## docker pull
docker pull wvbirder/database-enterprise:12.2.0.1-slim
docker run --name oracle12c --shm-size=1g -d -p 1521:1521 --restart=always wvbirder/database-enterprise:12.2.0.1-slim
docker run --name oracle12c --shm-size=1g -d -p 1521:1521 -v ~/oracle12c-data/:/u01/app/oracle/oradata/oracle12c-data/ --restart=always wvbirder/database-enterprise:12.2.0.1-slim
## docker exec
docker exec -it oracle12c bash

netstat -nlpt
su oracle
cd $ORACLE_HOME
bin/sqlplus / as sysdba

ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

SELECT status FROM v$instance;
SELECT name FROM v$database;
SELECT instance FROM v$thread;
select * from v$version;

create user ptnr identified by password;
grant dba to ptnr with admin option;

# DDL, DML 생성완료
# http://guide.ustraframework.kro.kr/doc/download/ddl/create/DDL_ORACLE_2.0.51.RELEASE.txt
# http://guide.ustraframework.kro.kr/doc/download/ddl/dml/__DML_ORACLE_20210802.sql

```

### docker commit push pull

```bash
docker container ps -a
docker commit oracle12c oseongryu/ustra-oracle12c:0.01

docker images
docker push oseongryu/ustra-oracle12c:0.01
docker pull oseongryu/ustra-oracle12c:0.01

docker run --name ustra-oracle12c --shm-size=1g -d -p 1521:1521 --restart=always oseongryu/ustra-oracle12c:0.01
docker exec -it ustra-oracle12c bash
```

#### Failed to get D-Bus connection: Operation not permitted

```bash
docker run -it -d -p 80:80 --privileged --restart=always --name centos-vue oseongryu/centos-vue:0.0.4 /sbin/init
```

#### Failed to get D-Bus connection: Operation not permitted

```bash
docker run -it -d -p 10100:10100 -p 10200:10200 --privileged --restart=always --name centos-spring oseongryu/centos-spring:0.0.4 /sbin/init

docker exec -it centos-spring bash

yum install yum-utils
yum install net-tools
yum install nginx

systemctl enable nginx
systemctl nginx
systemctl start nginx
```

### docker network

```
--- default
NETWORK ID          NAME                DRIVER              SCOPE
143496b94e57        bridge              bridge              local
311d6534f79f        host                host                local
aa89f58200a6        none                null                local
---
```

```bash
docker network ls

docker network create our-net

docker network inspect our-net
docker network inspect bridge

docker network connect our-net centos-vue
docker network disconnect bridge centos-vue

docker network connect our-net centos-spring
docker network disconnect bridge centos-spring

docker exec centos-vue ping centos-spring


docker network rm our-net
docker stop centos-vue centos-spring
```

### docker commit

```bash
docker commit centos-vue oseongryu/centos-vue:0.0.5
docker push oseongryu/centos-vue:0.0.5

docker commit centos-spring oseongryu/centos-spring:0.0.5
docker push oseongryu/centos-spring:0.0.5

docker commit centos-jekyll oseongryu/centos-jekyll:0.0.3
docker push oseongryu/centos-jekyll:0.0.3

docker pull oseongryu/centos-vue:0.0.5
docker pull oseongryu/centos-spring:0.0.5
docker pull oseongryu/centos-jekyll:0.0.3
```

### centos default setting

```bash
# 필요 툴 설치
yum install net-tools
yum install vim
yum install wget
yum install glibc-locale-source glibc-langpack-en #언어팩

# 시간변경
# 사용 가능한 타임존 확인
timedatectl list-timezones | grep Seoul
# 타임존 변경
timedatectl set-timezone Asia/Seoul
# 타임존 확인
date

# system locale 설정 변경
localectl set-locale LANG=en_US.UTF-8

```

```
(주의사항 bash에서 말고 cmd에서 실행해야 함)
docker run -itd -p 80:80 -p 9911:9911 --restart=always --name centos-vue centos:7.9.2009
docker run -it -d -p 80:80 -p 9911:9911 --privileged --restart=always --name centos-vue centos:7.9.2009 /sbin/init
```

### docker using memory

```bash
docker stats --format "table {{.Name}}\t{{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}"
```

### docker memory limit

```bash
# memory
docker run -m 512m nginx
# cpu
docker run --cpus=2 nginx
$ docker run --cpus=2 --cpu-shares=2000 nginx
```

### docker on intellij

```bash
# 1. Dockerfile using

## Dockerfile
FROM openjdk:11-jdk
LABEL maintainer="maintainer"
VOLUME /tmp
EXPOSE 8089 5005
ARG JAR_FILE=drawing-app/build/libs/drawing-app.war
ADD ${JAR_FILE} drawing-app.war
# 실행 명령
ENTRYPOINT ["java","-Djava.security.egd", "-Xdebug","-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005","-jar","/drawing-app.war"]

## Dockerfile (tomcat, maven)
FROM tomcat:9.0
LABEL maintainer="maintainer"
ARG JAR_FILE=target/hyInterface-1.0.0.war
ADD ${JAR_FILE} interface-app.war
EXPOSE 8080
#ENTRYPOINT ["./bin/catalina.sh", "run"]

## build
docker build --tag war-app .
```

### docker on server(centos) setting

```bash
# Docker 설치
# https://docs.docker.com/engine/install/centos/ 사이트 자료를 참고하여 설치한다.
sudo yum -y update
sudo yum install -y yum-utils

# Docker repository 시스템에 추가
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum-config-manager --enable docker-ce-nightly

# 최신버전의 Docker 설치(Install Docker Engine)
sudo yum -y install docker-ce docker-ce-cli containerd.io

# Docker 데몬 시작 및 부팅 시 Docker 데몬 자동 시작
sudo systemctl start docker
sudo systemctl enable docker

# Docker 실행중인지 확인
sudo systemctl status docker

```

### jekyll

```bash
docker commit centos-jekyll oseongryu/centos-jekyll:0.0.1
docker push oseongryu/centos-jekyll:0.0.3
sudo docker pull oseongryu/centos-jekyll:0.0.1

sudo docker run -it -d --name centos-jekyll -p 8088:8088 oseongryu/centos-jekyll:0.0.3
sudo docker exec -it centos-jekyll /bin/bash
sudo docker restart centos-jekyll
bundle exec jekyll serve --skip-initial-build --host 0.0.0.0 --port 8088 > /dev/null 2>&1 &

sudo docker cp /home/azureadmin/guide centos-jekyll:/

sudo docker cp /home/azureadmin/.ssh/id_rsa centos-jekyll:/root/.ssh/
sudo docker cp /home/azureadmin/.ssh/id_rsa.pub centos-jekyll:/root/.ssh/
```

### vue

```bash
docker pull centos:7.9.2009
docker run -it -d -p 80:80 -p 9911:9911 --restart=always --name centos-vue centos:7.9.2009
docker exec -it centos-vue bash

systemctl enable nginx
reboot

# backup
docker cp centos-vue:/etc/nginx/conf.d/default.conf ~/git-personal/til/99_08_Docker/static/vue
docker cp centos-vue:/etc/nginx/nginx.conf ~/git-personal/til/99_08_Docker/static/vue
```

### springboot

```bash
docker pull centos:7.9.2009
docker run -it -d -p 9901:9901 --restart=always --name centos-spring centos:7.9.2009
docker run -it -d -p 9901:9901 --restart=always --name centos-spring oseongryu/centos-spring:0.0.1
```

### redis

```bash
docker pull redis
docker run -p 6379:6379 --name my-redis -d --restart=always redis
docker run -p 6379:6379 --name my-redis -d --restart=always redis --requirepass testpassword
docker exec -it my-redis /bin/bash
redis-cli
info

#password 설정
AUTH 'password'

## 패스워드 정보확인
config get requirepass
config set requirepass password
exit
AUTH 'password'
```

### ubuntu remote-desktop

```bash
# https://github.com/scottyhardy/docker-remote-desktop
docker pull scottyhardy/docker-remote-desktop
docker run -it --hostname="$(hostname)" --publish="13389:3389/tcp" --name="remote-desktop" scottyhardy/docker-remote-desktop:latest

```

### vue + spring

#### WEB

```bash
docker cp ~/git/til/docker/static/vue/default.conf centos-vue:/etc/nginx/conf.d
docker cp ~/git/back/root/bo/src/main/resources/static/static.zip centos-vue:/root/

docker cp ~/git/til/99_08_Docker/static/vue/default.conf centos-vue:/etc/nginx/conf.d
nginx -t
nginx -s stop
nginx -s reload

cd ~/git/back/root/bo/src/main/resources/static
zip -r static.zip *
docker cp ~/git/back/root/bo/src/main/resources/static/static.zip centos-vue:/root/

yum install unzip
mkdir /app /app/webapp /app/webapp/partner
unzip /root/static.zip -d /app/webapp/partner/
```

#### WAS

```bash
docker cp ~/git/til/docker/static/spring/default.conf centos-spring:/etc/nginx/conf.d
docker cp ~/git/ustraframework-sample/back/root/bo/build/libs/bo-0.0.1-SNAPSHOT.jar centos-spring:/root/
docker cp ~/jdk-8u212-ojdkbuild-linux-x64.zip centos-spring:/root/

nohup /app/java/jdk-8u212-ojdkbuild-linux-x64/bin/java -jar -Dserver.port=10100 /root/bo-0.0.1-SNAPSHOT.jar 1>/dev/null 2>&1 &

docker cp ~/git-personal/ustraframework-sample/back/root/bo/build/libs/bo-0.0.1-SNAPSHOT.jar centos-spring:/root/
nohup /app/java/jdk-8u212-ojdkbuild-linux-x64/bin/java -jar /root/bo-0.0.1-SNAPSHOT.jar 1>/dev/null 2>&1 &

mkdir /app /app/java /app/wasapp /app/nginx-conf
docker cp ~/jdk-8u212-ojdkbuild-linux-x64.zip centos-spring:/root/
unzip /root/jdk-8u212-ojdkbuild-linux-x64.zip -d /app/java
```

### windows

```bash
docker pull mcr.microsoft.com/windows:20H2
```

### docker swarm

```bash
# https://this1.tistory.com/50'
# https://medium.com/dtevangelist/docker-기본-7-8-docker-swarm의-구조와-service-배포하기-1d5c05967b0d
# docker swarm 시작
docker swarm init
docker swarm init --advertise-addr {managerIP}

# docker swarm token 확인
docker swarm join-token worker

# docker swarm node에서 실행
docker swarm join --token SWMTKN-1-36aduyc0oygzelqi15f0atklib6z31pxe2uk56f4vxjvqnr7s8-17cm5a98qu6mvphhdo05ol58w 192.168.5.15:2377

# docker swarm 상태 확인
docker info

# docker swarm 종료
docker swarm leave
docker swarm leave --force
```

### docker logs(mac)

```bash
docker logs --tail 50 myContainerName
# docker logs location (맥에서는 해당위치에 나오지 않음)
docker inspect  myContainerName --format "{{.LogPath}}"
docker inspect  vitepress-guide-api-1 --format "{{.LogPath}}"


# 
nc -U ~/Library/Containers/com.docker.docker/Data/debug-shell.sock

# Rancher Desktop의 경우
Extensions로 Logs Explorer 사용

# docker-compose를 사용해서 생성한 경우 logging을 따로 만들어서 관리해야함




```


### references

```
# docker on server(centos) setting
https://link2me.tistory.com/2088
# docker on intellij
https://ysjee141.github.io/blog/dev%20tools/intellij-springboot-docker/
```

