## Azure Windows Server 2016

### 방화벽설정

```bash
https://azure.microsoft.com/ko-kr/free/students/
https://imagine.microsoft.com/ko-KR

default-allow-ftp-command 1010 21
default-allow-ftp-data 1020 20
default-allow-ftp-passive 1030 60000-63000

netsh advfirewall set global StatefulFtp enable

net stop ftpsvc
net start ftpsvc
```

### 서버2016 한국어 설정

```
윈도우 Settings > Time & Language > Region & language > Add a language 버튼 클릭 > 한국어 추가 > Option > Download Language Pack > Set as default > 서버 재부팅 또는 로그아웃

서버 관리자 > 관리 (오른쪽 위) > 역할 및 기능 추가
서버역할까지 다음 클릭

- 서버역할 : Web Server(IIS) 체크
  웹 서버 역할(IIS) 역할 서비스 까지 다음 클릭
- 역할 서비스 : FTP 서버 체크
  확인까지 다음 클릭 후 설치 클릭
```

### Windows Server 2016 업데이트 제외

```bash
#### 윈도우 업데이트 확인은하지만 하지않음. ( 보안업데이트가 있기에 주기적으로 해주면 좋지만, 사용자가 이용하는 시간에 서버업데이트가 되면 문제가 되기때문에)

http://dosgame.yyartsworld.pe.kr/tip/35532

#### 윈도 레지스트리 편집 방법

http://editorizer.tistory.com/239

#### 즐겨찾기와 레지스트리 내보내기 기술

HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate\AU

AUOptions
Reg_DWORD
Range = 2|3|4|5

2 = Notify before download.
3 = Automatically download and notify of installation.
4 = Automatic download and scheduled installation. (Only valid if values exist for ScheduledInstallDay and ScheduledInstallTime.)
5 = Automatic Updates is required, but end users can configure it.

NoAutoUpdate
Reg_DWORD
Range = 0|1

0 = Enable Automatic Updates.
1 = Disable Automatic Updates.
```

## Microsoft Azure- CDN

```bash
https://asecurity.so/2016/04/2%EB%85%84%EA%B0%84%EC%9D%98-azure-%EB%AC%B4%EB%A3%8C-%EC%82%AC%EC%9A%A9%EA%B8%B0-msdn-subscription-100-%ED%99%9C%EC%9A%A9%ED%95%98%EA%B8%B0/
http://mixedcode.com/Article/Index?aidx=1080

### CDN

https://docs.microsoft.com/ko-kr/azure/cdn/cdn-custom-ssl?tabs=option-1-default-enable-https-with-a-cdn-managed-certificate
https://si.mpli.st/dev/homemade-cdn-with-ns1-and-nginx.html

https://blogs.msdn.microsoft.com/eva/?p=12395

https://docs.microsoft.com/ko-kr/azure/cdn/cdn-caching-rules-tutorial
https://azure.microsoft.com/ko-kr/resources/samples/?service=cdn&sort=0&platform=dotnet

https://azure.microsoft.com/ko-kr/resources/samples/cdn-dotnet-manage-cdn/

https://code.msdn.microsoft.com/Azure-CDN-Management-1f2fba2c

https://docs.microsoft.com/ko-kr/azure/cdn/cdn-app-dev-net

### WPF-Azure Client

https://github.com/Max-E-Ivanov/WeatherAzureClient

### Azure-stream-analytics

https://github.com/Azure/azure-stream-analytics

### Microsoft SmartHotel-Azure-backend

https://github.com/Microsoft/SmartHotel360-Azure-backend
https://github.com/Microsoft/SmartHotel360-mobile-desktop-apps

### AzureWebsitesSamples

https://github.com/davidebbo/AzureWebsitesSamples
https://m.blog.naver.com/PostView.nhn?blogId=pcninc&logNo=60171809407&proxyReferer=https%3A%2F%2Fwww.google.co.kr%2F

### azure app service ruby

https://learn.microsoft.com/ko-kr/azure/app-service/quickstart-ruby?tabs=cli
```

## azure etc

### MS Imagine

```
https://namu.wiki/w/Microsoft%20Imagine
```

### 학생용Azure 설명

```
https://azure.microsoft.com/ko-kr/free/free-account-students-faq/
https://azure.microsoft.com/ko-kr/free/free-account-faq/
```

### 분실된 부팅 복구 방법 easyBCD설치

### ★Azure Node.js 활용 시 참고

```
http://fiadot.tistory.com/2003
```

### Azure 가상머신 설치

### IIS서버 설치

### Azure 가상머신 FTP 연결 (FileZila, WinSCP)

```
파일질라사용시
https://blogs.msdn.microsoft.com/eva/?p=11975
설치
https://www.youtube.com/watch?v=bHA790VbSZ0
```

### ftp채널포트

```
http://xgunheex.blogspot.com/2014/01/iis-ftp.html
```

### FTP연결오류

```
https://serverfault.com/questions/718662/server-sent-passive-reply-with-unroutable-address-using-server-address-instead
```

### 파이썬,파이참 설치

### localdb가 영어버전이어서 nvarchar 사용

```
http://hackersstudy.tistory.com/60
http://pythonstudy.xyz/python/article/208-MSSQL-%EC%82%AC%EC%9A%A9
```

### 애저 가상머신 비밀번호 변경

### MSSQL Sever 2017 Express 설치

```
http://www.uhoon.co.kr/mssql/957
https://m.blog.naver.com/PostView.nhn?blogId=jasmin7727&logNo=220548929435&proxyReferer=https%3A%2F%2Fwww.google.co.kr%2F
http://hackersstudy.tistory.com/60
```

### 애저 IP DNS 설정

### 비주얼스튜디오설치 언어팩

```
http://jackandthebeanstalk.tistory.com/23
```

### 애저 언어팩

```
http://doopsjh.tistory.com/entry/Lab-Azure-%ED%85%9C%ED%94%8C%EB%A6%BF-VM-Win-2012-R2-%ED%95%9C%EA%B8%80%EC%96%B8%EC%96%B4%ED%8C%A9-%EC%84%A4%EC%B9%98
```
