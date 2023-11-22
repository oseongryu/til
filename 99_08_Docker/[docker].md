### docker setting (windows)
```
# vmmem 점유율
1. 파일탐색기 %USERPROFILE%
2. 파일추가 .wslconfig

------------------------ .wslconfig
[wsl2]
memory=4GB
swap=0
localhostForwarding=true

3. 재부팅

```

### docker setting
```
## docker pull
docker pull wvbirder/database-enterprise:12.2.0.1-slim
docker run --name oracle12c --shm-size=1g -d -p 1521:1521 --restart=always wvbirder/database-enterprise:12.2.0.1-slim

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

DDL, DML 생성완료
http://guide.ustraframework.kro.kr/doc/download/ddl/create/DDL_ORACLE_2.0.51.RELEASE.txt
http://guide.ustraframework.kro.kr/doc/download/ddl/dml/__DML_ORACLE_20210802.sql


## docker commit push

docker container ps -a
docker commit 5d9d1cedd8f9 temp:0.1
docker image ls
docker run --name ustra-oracle12c --shm-size=1g -d -p 1521:1521 --restart=always temp:0.1


docker commit oracle12c oseongryu/ustra-oracle12c:0.01
docker push oseongryu/ustra-oracle12c:0.01


docker pull oseongryu/ustra-oracle12c:0.01
docker run --name ustra-oracle12c --shm-size=1g -d -p 1521:1521 --restart=always oseongryu/ustra-oracle12c:0.01
docker exec -it ustra-oracle12c bash
```
### 2번째
```
## docker pull
docker pull wvbirder/database-enterprise:12.2.0.1-slim
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

DDL, DML 생성완료
http://guide.ustraframework.kro.kr/doc/download/ddl/create/DDL_ORACLE_2.0.51.RELEASE.txt
http://guide.ustraframework.kro.kr/doc/download/ddl/dml/__DML_ORACLE_20210802.sql


## docker commit push

docker commit oracle12c oseongryu/ustra-oracle12c:0.01
docker push oseongryu/ustra-oracle12c:0.01


docker pull oseongryu/ustra-oracle12c:0.01
docker run --name ustra-oracle12c --shm-size=1g -d -p 1521:1521 -v ~/oracle12c-data/:/u01/app/oracle/oradata/oracle12c-data/ --restart=always oseongryu/ustra-oracle12c:0.01
docker run --name ustra-oracle12c --shm-size=1g -d -p 1521:1521 - --restart=always oseongryu/ustra-oracle12c:0.01

docker run --name ustra-oracle12c --shm-size=1g -d -p 1521:1521 --volumes-from oracle12c --restart=always oseongryu/ustra-oracle12c:0.01

>docker exec -it local_db bash -c "source /home/oracle/.bashrc; sqlplus sys/Oradoc_db1@ORCLCDB as sysdba"

docker exec -it ustra-oracle12c bash


```

docker pull store/oracle/database-enterprise:12.2.0.1



docker run -i -t --name A -v /ContainerData:/HostData ubuntu /bin/bash
docker run -i -t --name B --volumes-from A ubuntu /bin/bash
docker run -d -p 1521:1521 -v ~/ContainerData/:/HostData --name oracle12c --shm-size=1g --restart=always wvbirder/database-enterprise:12.2.0.1-slim


### 3번째
docker pull wvbirder/database-enterprise:12.2.0.1-slim
docker run -d -p 1521:1521 -v ~/ContainerData/:/HostData --name oracle12c --shm-size=1g --restart=always wvbirder/database-enterprise:12.2.0.1-slim

docker commit oracle12c oseongryu/ustra-oracle12c:0.01

docker run -d -p 1521:1521 --volumes-from oracle12c --name oracle12c-2 --shm-size=1g --restart=always oseongryu/ustra-oracle12c:0.01


docker-backup store my-server.tar oracle12c


docker exec -it oracle12c bash -c "cat /home/oracle/.bashrc"


### jekyll


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


### vue
docker pull centos:7.9.2009
docker run -it -d -p 80:80 -p 9911:9911 --restart=always --name centos-vue centos:7.9.2009
docker exec -it centos-vue bash

systemctl enable nginx
reboot


#### Failed to get D-Bus connection: Operation not permitted
docker run -it -d -p 80:80 --privileged --restart=always --name centos-vue oseongryu/centos-vue:0.0.4 /sbin/init


### springboot
docker pull centos:7.9.2009
docker run -it -d -p 9901:9901 --restart=always --name centos-spring centos:7.9.2009

docker run -it -d -p 9901:9901 --restart=always --name centos-spring oseongryu/centos-spring:0.0.1

#### Failed to get D-Bus connection: Operation not permitted
docker run -it -d -p 10100:10100 -p 10200:10200 --privileged --restart=always --name centos-spring oseongryu/centos-spring:0.0.4 /sbin/init

docker exec -it centos-spring bash

yum install yum-utils
yum install net-tools
yum install nginx

systemctl enable nginx
systemctl nginx
systemctl start nginx


### docker network

```
--- default
NETWORK ID          NAME                DRIVER              SCOPE
143496b94e57        bridge              bridge              local
311d6534f79f        host                host                local
aa89f58200a6        none                null                local
---
```
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

### docker commit
docker commit centos-vue oseongryu/centos-vue:0.0.5
docker push oseongryu/centos-vue:0.0.5

docker commit centos-spring oseongryu/centos-spring:0.0.5
docker push oseongryu/centos-spring:0.0.5

docker commit centos-jekyll oseongryu/centos-jekyll:0.0.3
docker push oseongryu/centos-jekyll:0.0.3

docker pull oseongryu/centos-vue:0.0.5
docker pull oseongryu/centos-spring:0.0.5
docker pull oseongryu/centos-jekyll:0.0.3

### upload
#### WEB
docker cp ~/git-personal/til/99_08_Docker/static/vue/default.conf centos-vue:/etc/nginx/conf.d
docker cp ~/git-personal/back/root/bo/src/main/resources/static/static.zip centos-vue:/root/


docker cp ~/git-personal/til/99_08_Docker/static/vue/default.conf centos-vue:/etc/nginx/conf.d
nginx -t
nginx -s stop
nginx -s reload


cd ~/git-personal/back/root/bo/src/main/resources/static
zip -r static.zip *
docker cp ~/git-personal/back/root/bo/src/main/resources/static/static.zip centos-vue:/root/

yum install unzip
mkdir /app /app/webapp /app/webapp/partner
unzip /root/static.zip -d /app/webapp/partner/

#### WAS
docker cp ~/git-personal/til/99_08_Docker/static/spring/default.conf centos-spring:/etc/nginx/conf.d
docker cp ~/git-personal/ustraframework-sample/back/root/bo/build/libs/bo-0.0.1-SNAPSHOT.jar centos-spring:/root/
docker cp ~/jdk-8u212-ojdkbuild-linux-x64.zip centos-spring:/root/

nohup /app/java/jdk-8u212-ojdkbuild-linux-x64/bin/java -jar -Dserver.port=10100 /root/bo-0.0.1-SNAPSHOT.jar 1>/dev/null 2>&1 &



docker cp ~/git-personal/ustraframework-sample/back/root/bo/build/libs/bo-0.0.1-SNAPSHOT.jar centos-spring:/root/
nohup /app/java/jdk-8u212-ojdkbuild-linux-x64/bin/java -jar /root/bo-0.0.1-SNAPSHOT.jar 1>/dev/null 2>&1 &

mkdir /app /app/java /app/wasapp /app/nginx-conf
docker cp ~/jdk-8u212-ojdkbuild-linux-x64.zip centos-spring:/root/
unzip /root/jdk-8u212-ojdkbuild-linux-x64.zip -d /app/java

### backup
docker cp centos-vue:/etc/nginx/conf.d/default.conf ~/git-personal/til/99_08_Docker/static/vue
docker cp centos-vue:/etc/nginx/nginx.conf ~/git-personal/til/99_08_Docker/static/vue


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

(주의사항 bash에서 말고 cmd에서 실행해야 함)
docker run -itd -p 80:80 -p 9911:9911 --restart=always --name centos-vue centos:7.9.2009
docker run -it -d -p 80:80 -p 9911:9911 --privileged --restart=always --name centos-vue centos:7.9.2009 /sbin/init

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



### references
https://ysjee141.github.io/blog/dev%20tools/intellij-springboot-docker/