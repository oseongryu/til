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
docker push oseongryu/centos-jekyll:0.0.1

sudo docker pull oseongryu/centos-jekyll:0.0.1

sudo docker run -it -d --name centos-jekyll -p 8088:8088 oseongryu/centos-jekyll:0.0.1
sudo docker exec -it centos-jekyll /bin/bash
sudo docker restart centos-jekyll
bundle exec jekyll serve --skip-initial-build --host 0.0.0.0 --port 8088 > /dev/null 2>&1 &



sudo docker cp /home/azureadmin/guide centos-jekyll:/

sudo docker cp /home/azureadmin/.ssh/id_rsa centos-jekyll:/root/.ssh/
sudo docker cp /home/azureadmin/.ssh/id_rsa.pub centos-jekyll:/root/.ssh/


### springboot
docker pull centos:7.9.2009
docker run -it -d -p 8089:8089 --restart=always --name centos-spring-boot centos:7.9.2009
docker exec -it centos-spring-boot bash




