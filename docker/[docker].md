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

## docker commit push pull

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
docker exec -it my-redis /bin/bash
redis-cli
info
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

### references

```
# docker on server(centos) setting
https://link2me.tistory.com/2088
# docker on intellij
https://ysjee141.github.io/blog/dev%20tools/intellij-springboot-docker/
```

### docker buildx

```bash

# create buildx
docker buildx create \
--name multi-arch-builder \
--driver docker-container \
--bootstrap --use

# build
docker buildx build --platform linux/arm64,linux/amd64 -t buildx-test .

# load local
docker buildx build --load -t buildx-test .
docker images
docker image tag buildx-test:latest oseongryu/ubuntu-desktop:20.04

# push
docker login
docker buildx build --platform linux/arm64,linux/amd64 -t oseongryu/ubuntu-desktop:20.04 --push .
```
