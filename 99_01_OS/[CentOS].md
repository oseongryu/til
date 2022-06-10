## OS 확인
uname -a 

cat /etc/issue
cat /etc/redhat-release
cat /etc/*release*

rpm --query centos-release

### OS bit 확인
getconf LONG_BIT

## 설치된 패키지 확인
rpm -qa

## 열린 포트 확인
netstat -tnlp

### list open files
lsof -i -nP | grep LISTEN | awk '{print $(NF-1)" "$1}' | sort -u
nmap localhost

## nginx 사용여부 확인
systemctl status ngin bx


## chmod chown chcon
ls -l 로 각 파일의 권한을 확인

### 파일에 권한설정
chmod 777 test.txt

### 폴더에 권한설정
chmode -R 777 folder
drwxrwxrwx

## nginx
cd /etc/nginx/conf.d

### 재시작
sudo service nginx stop
sudo service nginx start
sudo service nginx reload

### 상태확인
systemctl status nginx
telnet -tnlp

### list open files
lsof -i -nP | grep LISTEN | awk '{print $(NF-1)" "$1}' | sort -u
nmap localhost

### 디렉토리 용량확인
``` 
du -a directory
```

### 압축
zip -r test.zip ./*
unzip test.zip
unzip test.zip -d /home/oseongryu

### 폴더 복제 cp
cp -R repo backup_repo

### 새로운 유저 생성 후, home에 nginx 서비스 배포시
```bash
useradd test
#### 해당 홈에 대해서 접근권한을 줘야함
cd /home/
chmod 755 test

#### 프로세스가 어떻게 실행되어 있는지 확인
ps -ef |grep nginx
#### 포트확인
netstat -tnlp

#### 접속가능한지 확인
curl http://localhost: 8086

#### nginx에 문제가 있을 경우 확인
tail -f /var/log/nginx/error.log
```

### userdel

```bash
#### 계정, 홈폴더 삭제
userdel -r testuser
####  계정 삭제
userdel testuser

cat /etc/passwd | grep testuser
ll /home | grep testuser
```

### linux Embeded Tomcat SSL
```
keytool -genkeypair -alias tomcat-localhost -storetype jks -keyalg RSA -keysize 2048 -validity 3650 -keystore <your project path>/<your project class path>/keystore.jks

server:
  port: 8443
  ssl:
    enabled: true
    key-alias: tomcat-localhost
    key-password: <your key password>
    key-store: classpath:keystore.jks
    key-store-type: PKCS12
    key-store-password: <your store key password>
    key-store-provider: SUN
```

### CentOS Default 설정
```bash
### 1. 계정 생성
useradd testuser
passwd testuser

### 2. 일반계정 SUDO 사용 
* sudoers 설정 파일에 없습니다.
su
visudo -f /etc/sudoers

* Allow root to run any commands anywhere
root    ALL=(ALL)       ALL
test ALL=(ALL)     ALL

### 3. Setting

sudo yum update
sudo yum install wget -y
sudo yum install vim -y
sudo yum install java-1.8.0-openjdk-devel.x86_64 -y

sudo yum install git
sudo yum install net-tools
netstat -tnlp
sudo yum install curl


### 4. firewalld 설정
sudo firewall-cmd --permanent --add-port=8080/tcp
sudo firewall-cmd --reload

```

### UTC, KST
```bash
sudo ln -sf /usr/share/zoneinfo/UTC /etc/localtime
date
sudo ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
date
```

### CMD History
```
/home/.bash_history

history
history | less
history | tail
history 25
history | grep -i searchterm | less
```

### nc, nmap (Scan IP ranges)
```bash
nmap 127.0.0.1
nc -v 127.0.0.1 8080

```

### telnet
```bash
sudo yum install telnet
telnet 127.0.0.1 8080
```

### crontab

```
1. script
---
#!/bin/bash
# Config Option
log_path="/home/user/logs"
expire_day=7

# Execute
find ${log_path}/* -type f -mtime +${expire_day} -exec rm -f {} \;
find /home/user/logs/* -type f -mtime +7 -exec rm -f {} \;
---

2. crontab
crontab -l
crontab -e

0 0 * * * /home/user/script_crontab_log.sh

3. crontab log
 /var/log/cron

```

## References

https://zetawiki.com/wiki/%EB%A6%AC%EB%88%85%EC%8A%A4_%EB%A1%9C%EC%BB%AC%EC%84%9C%EB%B2%84_%EC%97%B4%EB%A6%B0_%ED%8F%AC%ED%8A%B8_%ED%99%95%EC%9D%B8
https://woonizzooni.tistory.com/entry/tcping-%EC%84%A4%EC%B9%98-%EB%B0%8F-%EC%82%AC%EC%9A%A9%EB%B2%95


