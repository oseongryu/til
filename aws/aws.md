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

<img width="400" src="https://raw.githubusercontent.com/oseongryu/til/refs/heads/main/public/img/aws/001.png"/>
<img width="700" src="https://raw.githubusercontent.com/oseongryu/til/refs/heads/main/public/img/aws/002.png"/>

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

### aws S3 정적웹사이트 호스팅

```
1. bucket 생성 (bucket 생성시 모든 퍼블릭 엑세스 차단을 풀기)
2. bucket 클릭 > 속성 > Amazon 리소스이름(ARN) 복사
3. 권한 > 버킷 정책 > 편집 > (정책편지기로 생성후 등록)

4. bucket > 속성 > 정적 웹 사이트 호스팅
-활성화
-정적 웹 사이트 호스팅

```

#### 버킷 정책

```
https://awspolicygen.s3.amazonaws.com/policygen.html
#정책 생성기로 생성후 Resource의 "Resource": "arn:aws:s3:::oseongryu-bucket/*" 을 추가 하기
# S3 정적페이지의 경우 DDos공격을 받을 가능성이 있으므로 필요시 CloudFlare의 서비스와 연동해야함)
# 전체 오픈은 항상 주의하기 테스트 용은 허용 아이피 설정

```

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Statement1",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::oseongryu-bucket/*",
      "Condition": {
        "IpAddress": {
          "aws:SourceIp": "210.122.0.1/32"
        }
      }
    }
  ]
}
```
