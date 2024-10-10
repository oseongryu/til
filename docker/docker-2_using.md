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


docker 재시작
oracle 접속

---
127.0.0.1:1521
SID: XE
user: sys
password: password
Role SYSDBA

CREATE USER drawing IDENTIFIED BY drawing;
--ALTER USER drawing IDENTIFIED BY test;
grant connect, resource to drawing;

GRANT CREATE SESSION TO drawing;
GRANT CREATE ANY TABLE TO drawing;
---
```

### Oracle 초기화 방지 사용법

```bash
1. docker run --name oracle11g --shm-size=1g -d -p 1521:1521 -v /oracle11g-data/:/u01/app/oracle/oradata/oracle11g-data/ -e ORACLE_ALLOW_REMOTE=true -e ORACLE_PWD=password --restart=always daggerok/oracle

2. 재시작 시 실행명령어 docker run --shm-size=1g -d daggerok/oracle
```

### Oracle

```bash
##### 오라클의 경우 테이블 생성시 30자 제한이 있어서 12.1 버전이 아닌 12.2 버전에서 30자 제한이 없음
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

# 설정확인
Host: localhost
Database(Service Name): ee.oracle.docker
User Name: user1
Password: password

```

### docker Volume

```bash
1. docker volume 생성
docker volume create vol-mysql
docker volume ls
docker volume inspect vol-mysql
```

### docker Excute

```bash
### 1. container 리스트 확인
docker ps -a

### 2. 해당 컨테이너 실행
docker exec -it [CONTAINER ID] bash
docker exec -it [NAMES] bash

docker exec -it 1174feb7c6f4 bash
```

### references

```
https://subicura.com/2017/01/19/docker-guide-for-beginners-2.html
오라클 관련 https://github.com/daggerok/oracle/releases
docker oracle11g 재시작시 데이터 저장시키기 https://sangmoo.tistory.com/225
```
