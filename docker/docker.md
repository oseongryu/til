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

### references

```
# docker on server(centos) setting
https://link2me.tistory.com/2088
# docker on intellij
https://ysjee141.github.io/blog/dev%20tools/intellij-springboot-docker/
```
