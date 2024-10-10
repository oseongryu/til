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
