## Docker Using in Windows

### 오라클 사용법
```bash
0. docker version
1. daggerok/oracle 설치
2. docker run -d --rm --name oracle-xe --shm-size=1g -p 1521:1521 -e ORACLE_PWD=password daggerok/oracle
3. docker 재시작
4. oracle 접속

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
```
### Oracle 초기화 방지 사용법
```bash
1. docker run --name oracle11g --shm-size=1g -d -p 1521:1521 -v /oracle11g-data/:/u01/app/oracle/oradata/oracle11g-data/ -e ORACLE_ALLOW_REMOTE=true -e ORACLE_PWD=password --restart=always daggerok/oracle

2. 재시작 시 실행명령어 docker run --shm-size=1g -d daggerok/oracle
```

### Oracle

docker pull truevoly/oracle-12c
docker run -d -p 1521:1521 truevoly/oracle-12c
docker ps -a
docker logs ead93e0f514e
docker exec -it ead93e0f514e bash

netstat -nlpt
su oracle
cd $ORACLE_HOME
bin/sqlplus / as sysdba
SELECT status FROM v$instance;


create user user1 identified by password;
grant dba to user1 with admin option;

## Docker Volume

```bash
1. docker volume 생성
docker volume create vol-mysql
docker volume ls
docker volume inspect vol-mysql
```

## Docker Excute

```bash
### 1. container 리스트 확인
docker ps -a

### 2. 해당 컨테이너 실행
docker exec -it [CONTAINER ID] bash
docker exec -it [NAMES] bash

docker exec -it 1174feb7c6f4 bash
```

### Reference
```
https://subicura.com/2017/01/19/docker-guide-for-beginners-2.html

오라클 관련 https://github.com/daggerok/oracle/releases

docker oracle11g 재시작시 데이터 저장시키기 https://sangmoo.tistory.com/225
```


