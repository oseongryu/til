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

## References

https://zetawiki.com/wiki/%EB%A6%AC%EB%88%85%EC%8A%A4_%EB%A1%9C%EC%BB%AC%EC%84%9C%EB%B2%84_%EC%97%B4%EB%A6%B0_%ED%8F%AC%ED%8A%B8_%ED%99%95%EC%9D%B8


