### OS 확인

```
uname -a

cat /etc/issue
cat /etc/redhat-release
cat /etc/*release*

rpm --query centos-release
```

### OS bit 확인

```
getconf LONG_BIT
```

### 설치된 패키지 확인

```
rpm -qa
```

### 열린 포트 확인

```
netstat -tnlp
```

### list open files

```
lsof -i -nP | grep LISTEN | awk '{print $(NF-1)" "$1}' | sort -u
nmap localhost
```

### nginx 사용여부 확인

```
systemctl status ngin bx
```

### chmod chown chcon

```
ls -l 로 각 파일의 권한을 확인
```

### 파일에 권한설정

```
chmod 777 test.txt
```

### 폴더에 권한설정

```
chmode -R 777 folder
drwxrwxrwx
```

### nginx

```
cd /etc/nginx/conf.d
```

### 재시작

```
sudo service nginx stop
sudo service nginx start
sudo service nginx reload
```

### 상태확인

```
systemctl status nginx
telnet -tnlp
```

### list open files

```
lsof -i -nP | grep LISTEN | awk '{print $(NF-1)" "$1}' | sort -u
nmap localhost
```

### 디렉토리 용량확인

```
du -a directory
```

### 압축

```
zip -r test.zip ./\*
unzip test.zip
unzip test.zip -d /home/oseongryu
```

### 폴더 복제 cp

```
cp -R repo backup_repo
```

### 새로운 유저 생성 후, home에 nginx 서비스 배포시

```bash
useradd test
# 해당 홈에 대해서 접근권한을 줘야함
cd /home/
chmod 755 test

# 프로세스가 어떻게 실행되어 있는지 확인
ps -ef |grep nginx
# 포트확인
netstat -tnlp

# 접속가능한지 확인
curl http://localhost: 8086

# nginx에 문제가 있을 경우 확인
tail -f /var/log/nginx/error.log
```

### userdel

```bash
# 계정, 홈폴더 삭제
userdel -r testuser
#  계정 삭제
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
# 1. 계정 생성
useradd testuser
passwd testuser

# 2. 일반계정 SUDO 사용
* sudoers 설정 파일에 없습니다.
su
visudo -f /etc/sudoers

* Allow root to run any commands anywhere
root    ALL=(ALL)       ALL
test ALL=(ALL)     ALL

# 3. Setting

sudo yum update
sudo yum install wget -y
sudo yum install vim -y
sudo yum install java-1.8.0-openjdk-devel.x86_64 -y

sudo yum install git
sudo yum install net-tools
netstat -tnlp
sudo yum install curl


# 4. firewalld 설정
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

```bash
# 1. script

touch script_crontab_log.sh
chmod +x script_crontab_log.sh

---
#!/bin/bash
# Config Option
log_path="/home/user/logs"
expire_day=7

# Execute
find ${log_path}/* -type f -mtime +${expire_day} -exec rm -f {} \;
find /home/user/logs/* -type f -mtime +7 -exec rm -f {} \;
find /home/user/logs/* -name "filename*"
---

# 2. crontab
crontab -l
crontab -e
---
SHELL=/bin/bash
0 0 * * * /home/user/script_crontab_log.sh
---

//매분
* * * * * /home/user/script_crontab_log.sh

// 매분 + 로그
* * * * * /home/user/script_crontab_log.sh > /home/user/cron/cron.log 2>&1

3. crontab log
 /var/log/cron

```

### ssh connect

```bash
# 1. Client
ssh-keygen -t rsa
ssh-copy-id user@192.168.0.1

# 특정 ssh-copy
ssh-copy-id -i ~/.ssh/id_rsa.pub user@192.168.0.1

# ssh-copy-id 수동
ssh 연결할 서버의 .ssh 폴더에서
touch authorized_keys
chmod 600 authorized_keys
vi authorized_keys
클라이언트에서 생성한 id_rsa.pub의 텍스트 복사해서 붙여넣기후 저장

# ~/.ssh/config
---
Host rootserv
    HostName 192.168.0.1
    Port 22
    IdentityFile ~/.ssh/id_rsa_root
    User root
---

2. Server
systemctl restart sshd
chmod 0700 ~/.ssh
chmod 0600 ~/.ssh/authorized_keys
```

### ssh proxyjump

```bash
Host root-proxy
    HostName 192.168.0.99
    Port 22
    User root

Host root-was1
    HostName 192.168.0.1
    Port 22
    User root
    ProxyJump root-proxy
```

### systemd

```bash
# 0. 실행 스크립트 chmod
chmod +x start_server.sh
chmod +x stop_server.sh


# 1. systemd에 서비스 파일 생성

sudo vi /usr/lib/systemd/system/api_service.service

---
[Unit]
// systemctl status 명령어에 표시되는 상세 설명
Description=api_service
// 유닛이 시작되는 순서를 조정하여 After에 지정된 유닛이 실행된 이후 시작된다.
After=network.target

[Service]
// ExecStart에 영향을 주는 유닛 프로세스가 시작되며, simple, forking, oeshot, idle 등이 있다.
Type=forking
User=serviceadmin
Group=serviceadmin
// syslog에서 구분하기 위한 이름
SyslogIdentifier=api_service
// 실행된 프로세스의 작업 디렉토리를 설정
WorkingDirectory=/home/serviceadmin
// systemctl 명령어로 인한 중지를 제외하고 프로세스가 종료된 후 재시작한다.
Restart=always
// Restart 옵션과 연결되어 몇 초에 실행할지 결정
RestartSec=0s
// 서비스가 시작될 때 실행할 명령어 또는 스크립트 작성
ExecStart=/home/serviceadmin/start_server.sh start
// 서비스가 정지될 때 실행할 명령어 또는 스크립트 작성
ExecStop=/home/serviceadmin/stop_server.sh stop

[Install]
// 서비스가 실행될 타겟 설정
WantedBy=multi-user.target
---

# 2. systemd 적용을 위해 재시작
sudo systemctl daemon-reload

# 3. use
sudo systemctl start api_service.service
sudo systemctl stop api_service.service
sudo systemctl restart api_service.service
sudo systemctl status api_service.service

# * 에러발생시
sudo systemctl reset-failed api_service.service
sudo systemd-analyze verify api_service.service

# 4. 서버 재부팅시 서비스 실행
sudo systemctl enable api_service.service
systemctl status api_service.service
```

### connect: Network is unreachable

```bash
ping 8.8.8.8
```

### 내부망 설치

```bash
# YUM이용시 다운로드만 받을 수 있는 프로그램 설치 (이미 설치되어있었음)
yum -y install yum-plugin-downloadonly
# 레포데이터 만들어주는 프로그램 설치
yum -y install createrepo
# repository 디렉토리 생성
mkdir /test
# 필요한 RPM을 다운로드
vi /etc/yum.repos.d/MariaDB.repo
---
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.1/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
---

# yum downloadonly의 경우 다운로드받을 프로그램이 설치되어있으면 다운로드 받아지지않음
# 다운로드 받으려는 프로그램을 삭제하고나 다른환경에서 다운로드 받아야함
yum -y install [설치할 프로그램명] --downloadonly --downloaddir=/test
yum -y install MariaDB-server --downloadonly --downloaddir=/test

# Repo MetaData를 생성한다
createrepo /test
---
[mariadb]
name = MariaDB
baseurl = file:///test/
enabled=1
gpgcheck=0
---

# 외부망에서 진행한 /test 디렉토리를 내부망 서버 /test에 복사
vi /etc/yum.repo.d/MaraiDB.repo
# yum 저장소를 잘 읽어오는지 확인
yum repolist
# MariaDB YUM설치 실행
yum -y install MariaDB

```

### SFTP 설정

```bash
# 1. SFTP를 위한 SSH설치
rpm -qa|grep ssh

# 2. SFTP 구성하기 (SFTP 권한을 얻을 user와 group만들기)
sudo mkdir -p /data/sftp
sudo chmod 701 /data

# 3. 그룹 및 유저 생성
3-1. 그룹명 sftpgroup 생성
sudo groupadd sftpgroup

3-2. 유저 생성
-g : 그룹 sftpgroup 포함시킴
-d : 유저가  /upload 디렉터리에 있도록 설정, (/data/sftpgroup/upload)
-s : 유저(sftpuser01)가 ssh 프로토콜이 아니고, sftp 프로토콜만 사용하도록 제한
 
useradd -g sftpgroup -s /sbin/nologin sftpuser01
passwd sftpuser01

# 4. upload 디렉터리 만들고, 권한 설정하기
mkdir -P : 경로에 디렉터리를 없으면 만들고 있으면 냅둠
chown -R : 경로 하위 파일을 모두 권한 변경

mkdir -p /data/sftpuser01/upload
chown -R root:sftpgroup /data/sftpuser01
chown -R sftpuser01:sftpgroup /data/sftpuser01/upload

# 5. SSH Configure파일 수정하기
vi /etc/ssh/sshd_config

---
Match Group sftpgroup
    ChrootDirectory /data/%u
    ForceCommand internal-sftp
---
# 6. SSH 서비스 상태 확인 및 재시작
service sshd status
service sshd restart

# 7. SFTP 작동 테스트
yum list nmap
yum install nmap -y
nmap -n 192.168.0.1

# 8. 원격에서 접속 테스트
ssh sftpdev01@192.168.0.1
sftp -oPort=22 -i ~/.ssh/id_rsa_sftpdev01 sftpdev01@192.168.0.1
```

### 서버 재시작, 서버 종료

```bash
# 10분 뒤 종료 (halt)
shutdown -h +10
# 13시 재가동 (reboot)
shutdown -r 13:00
# 즉시 재가동
shutdown -r now

# 재부팅
reboot

```

### CentOS 서버 설정 확인

```bash
#
ip addr show

#
echo > /dev/tcp/127.0.0.1/22
echo $?

ping 127.0.0.1
curl 127.0.0.1:80

telnet 127.0.0.1 80
traceroute 127.0.0.1 -p 80

```

### oracle 과 Locale 맞추기

```bash
SELECT * FROM nls_session_parameters WHERE PARAMETER LIKE '%DATE%' OR PARAMETER LIKE '%LANG%';

# 현재 언어셋확인
locale
cat /etc/locale.conf
sudo vi /etc/locale.conf
# centos6
sudo vi /etc/sysconfig/i18n

# 사용가능 언어셋확인
localectl list-locales | grep -i ko_kr
# localectl list-locales | grep -i en_us

# 언어셋변경
sudo localectl set-locale LANG=ko_KR.utf8
# sudo localectl set-locale LANG=en_US.utf8
cat /etc/locale.conf

# 변경완료 후 reboot
sudo reboot

# reboot 후 확인
locale
date

# timezone 변경
sudo rm /etc/localtime
sudo ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime

```

### sshfs

```bash
sudo yum install -y epel-release
sudo yum install -y fuse-sshfs

mkdir /upload
sudo chmod -R 777 /upload
sudo sshfs devuser@192.168.0.1:/data/upload /upload -o allow_other
```

### nfs

```bash
https://it-serial.tistory.com/entry/Linux-NFS-%EC%84%9C%EB%B2%84-%EA%B0%9C%EB%85%90-%EA%B5%AC%EC%B6%95%EC%84%A4%EC%B9%98
```

### font error

```bash
# https://logical-code.tistory.com/191
# https://www.lesstif.com/lpt/linux-font-font-config-93127497.html
sudo yum install fontconfig -y
sudo yum install freetype fontconfig -y
```

### mem check

```bash
cat /proc/meminfo | grep Mem
```

### 톰캣 구동중 catalina.out 삭제

```bash
# 톰캣 구동중 catalina.out 삭제 시 톰캣 재기동 전까지 생성되지 않음
cd tomcatsetupfolder/logs

#!/bin/bash
curr_date=$(date +%Y%m%d)
# 오늘날짜로 백업
cp catalina.out catalina.out-$curr_date
# 복제후 로그 초기화
cat /dev/null > catalina.out
```

### find

```bash
# 7일 전 파일 목록 확인
find /home/user/logs/* -type f -mtime +7
# 7일 전 파일 목록 확인 후 삭제
find /home/user/logs/* -type f -mtime +7 -exec rm -f {} \;
# 특정이름 들어간 파일 목록 확인
find /home/user/logs/* -name "filename*"
```

### centos GUI

```bash
systemctl get-default
systemctl set-default graphical.target
systemctl get-default

# GUI package setting
yum groupinstall "GNOME Desktop" "Graphical Administration Tools"


yum -y groupinstall "GNOME Desktop" && systemctl set-default graphical.target && shutdown -r now
sudo yum install xrdp tigervnc-server

#https://medium.com/tech-guides/google-cloud-platform-gcp-access-linux-server-using-gui-running-in-gcp-instance-using-windows-201e315925a6
sudo su
passwd
systemctl start xrdp
systemctl enable xrdpCreated symlink from /etc/systemd/system/multi-user.target.wants/xrdp.service to /usr/lib/systemd/system/xrdp.service.

```

### logrotate

```bash
# 로그의 비대화를 막기 위한 방법으로 로그 로테이션


# /etc/logrotate.conf
weekly
rotate 4
create
dateext
compress
include /etc/logrotate.d
/var/log/wtmp {
    monthly
    create 0664 root utmp
        minsize 1M
    rotate 1
}

/var/log/btmp {
    missingok
    monthly
    create 0600 root utmp
    rotate 1
}

# /etc/logrotate.d
/app/logs/shorts.log {
    daily
    missingok
    dateext
    dateformat -%Y-%m-%d_%s
    size 100M
    rotate 30
    notifempty
    create 644 tomcat tomcat
    copytruncate
}
```

### References

```
https://zetawiki.com/wiki/%EB%A6%AC%EB%88%85%EC%8A%A4_%EB%A1%9C%EC%BB%AC%EC%84%9C%EB%B2%84_%EC%97%B4%EB%A6%B0_%ED%8F%AC%ED%8A%B8_%ED%99%95%EC%9D%B8
https://woonizzooni.tistory.com/entry/tcping-%EC%84%A4%EC%B9%98-%EB%B0%8F-%EC%82%AC%EC%9A%A9%EB%B2%95
https://bkjeon1614.tistory.com/658
https://unix.stackexchange.com/questions/242782/centos-7-systemd-active-failed-result-start-limit
https://unix.stackexchange.com/questions/484431/allowing-non-root-users-to-manage-systemd-service-is-not-working
https://askubuntu.com/questions/692701/allowing-user-to-run-systemctl-systemd-services-without-password
https://sleeplessbeastie.eu/2021/03/03/how-to-manage-systemd-services-remotely/
https://serverfault.com/questions/841306/authentication-is-required-to-manage-system-services-or-units
sshfs: https://blog.sonim1.com/226
nfs: https://it-serial.tistory.com/entry/Linux-NFS-%EC%84%9C%EB%B2%84-%EA%B0%9C%EB%85%90-%EA%B5%AC%EC%B6%95%EC%84%A4%EC%B9%98
```
