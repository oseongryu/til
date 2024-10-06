## docker
docker pull centos
docker image list
docker run -i -t centos /bin/bash

### centos Setting
yum install wget nano
yum -y install glibc-locale-source glibc-langpack-en

## nodejs in centos
sudo yum install -y gcc-c++ make
curl -sL https://rpm.nodesource.com/setup_12.x | sudo bash -
curl -sL https://rpm.nodesource.com/setup_12.x | bash -

yum install -y nodejs
node -v
npm -v

### git in centos
yum install git

### 
cd /home
mkdir web

/home/web
git clone ~


### pm2
npm install -g pm2

pm2 start server.js

### 포트 확인
yum install lsof
lsof -i -nP | grep LISTEN | awk '{print $(NF-1)" "$1}' | sort -u

yum install net-tools 
netstat -tnlp

docker run -d --dns 8.8.8.8 --name centos-my centos /sbin/init


## docker 실행
docker exec -it centos-my /bin/bash

## 권한 포트 문제가 있을 경우
--cap-add=NET_ADMIN
-p 3013:3013

##
ps -ef|grep docker


## CentOS 
yum install iptables
iptables -L -n -v
iptables -P INPUT ACCEPT

docker run --cap-add=NET_ADMIN -it --name centos-my -p 3013:3013 centos


## docker에 추가 컨테이너에 포트 추가
docker stop centos-my
docker commit centos-my centos-my2
docker run -p 80:80 -d centos-my2

## CentoOS 7.9 버전

```
docker pull centos:7.9.2009
docker run -it --name centos-my -p 8080:8080 -p 8081:8081 centos:7.9.2009
```

* the input device is not a TTY
winpty docker run -it --name centos-my -p 8080:8080 -p 8081:8081 centos:7.9.2009
docker run -t --name centos-my -p 8080:8080 -p 8081:8081 centos:7.9.2009

## References

```
https://firework-ham.tistory.com/78
https://help.iwinv.kr/manual/read.html?idx=548

포트 추가 
https://medium.com/sjk5766/%EC%8B%A4%ED%96%89%EC%A4%91%EC%9D%B8-container%EC%97%90-port-or-volume-%EC%B6%94%EA%B0%80-ae8889344c68
```