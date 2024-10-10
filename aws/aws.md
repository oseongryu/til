### Setting(SpringBoot)

#### 1. EC2 CentOS 7 인스턴스 생성

```
chmod 400 awskey.pem
ssh -i "awskey.pem" centos@ec2-000-000-000-000.ap-northeast-2.compute.amazonaws.com
```

#### 2. pem key 없이 접속

```
sudo adduser testuser
sudo passwd testuser

sudo chmod u+w /etc/sudoers # 파일 권한 변경

sudo vi /etc/sudoers # 파일 접근

--- sudoers 설정 추가
"유저명" ALL=(ALL:ALL) ALL
---

sudo vi /etc/ssh/sshd_config

--- sshd_config 설정 변경
PasswordAuthentication yes
---

sudo service sshd restart


ssh "유저명"@"IP"
ssh testuser@000.000.000.000

```

### AWS EC2 접근 console에서 접근

원하는 인스턴스 선택 > 우측마우스 > 연결 클릭 > Session Manager에서 연결 클릭

```bash
sh-4.2$ sudo su
```

<img width="400" src="https://oseongryu.github.io/img/aws/001.png"/>
<img width="700" src="https://oseongryu.github.io/img/aws/002.png"/>

### Access Key, Secret Key 생성

```
IAM > 사용자 > S3AccessKeyOnly > 엑세스 키 만들기
```

### References

```
https://wooono.tistory.com/371

```

### AWS 인증서 변경작업중 이슈 (SSL)

```js
# 인증서 정상여부 확인
https://www.digicert.com/help/
# 비슷한 오류 이슈
http://www.kunwi.co.kr/gunwi/board.php?bo_table=os&wr_id=184

```
