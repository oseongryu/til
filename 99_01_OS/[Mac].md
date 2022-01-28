## 맥 사용법

```
### 1. 프로그램 종료
- 프로그램 종료 cmd + q
- 한탭만 종료 cmd + w

### 2. 복사 붙여넣기
- 한영 Caps lock
- 복사 cmd + c
- 붙여넣기 cmd + V
- 경로복사 cmd + option + c
- 잘라내기 cmd + C >>> cmd + option + V
- 프로그램 종료 Cmd + q
- 한탭만 종료   cmd + w

### 3. 스크린샷
- Shift + Command + 3 : 화면 그림을 파일로 저장
- Control + Shift + Command + 3 : 화면 그림을 클립보드에 복사
- Shift + Command + 4 : 선택한 영역 그림을 파일로 저장
- Control + Shift + Command + 4 : 선택한 영역 그림을 클립보드에 복사

### 4. 맥 터미널(bash) 사용
(Finder > 이동 > Utilities > 터미널)
- ls : 디렉토리 파일, 폴더 보여주기
- ls -la :
- cd : change directory
- clear :  clear screen.  화면 글씨 비워줌
- cp : 지정된 디렉토리로 파일 복사
- rm : 파일 삭제

### 5. 추가설정
- 캡쳐시 옵션에서 미리보기썸네일제거
- 폴더선택후 터미널로 열기
- 오토마타 사용으로 VSCode로 열기 서비스 만들기
```

## 시스템 환경설정

```
키보드 > 단축키
디스플레이 > 정렬
파인더 > 환경설정
```

## Utilities

```
- VSCode
	View > Command Palette > Shell Command : Install 'code' command in PATH
	폴더에서 원하는 파일 찾기 cmd + p
	프로젝트에서 매서드,클래스로 이동 cmd + 마우스 왼쪽클릭

- Clean My Mac :디스크 정리용

- navicat premium:MySQL 여러개 관리
```

## 오토마타(Automator)를 사용

```
- 등록한 서비스를 확인하는 위치는 ~/Library/services

- VSCode 열기
셀스크립트 열기
현재수신하는작업흐름:파일 또는 폴더
선택항목위치: Finder.app
통과입력: 변수
open -n -b "com.microsoft.VSCode" --args "$*"

- Terminal 열기
AppleScript 실행
작업흐름수신: 입력없음
선택항목위치: 모든 응용 프로그램

on run {input, parameters}
	tell application "Terminal"
		if it is running then
			do script ""
		end if
		activate
	end tell
end run
```

## 기본 단축키

```
cmd + c 복사
```

## Mac Command Line 명령어

```
^+U to delete before Cursor
^+K to delete after Cursor
^+W to delete just a word.
^+C to cancel.
^+A to go to the beginning of the line.
^+E to go to the end of the line.
```

## 터미널에서 파인더 열기

```
open .
```

## Finder 숨김파일 보기

```
shift + cmd + .
defaults write com.apple.Finder AppleShowAllFiles YES
killall Finder
```

### 다시 숨김

```
defaults write com.apple.Finder AppleShowAllFiles NO
killall Finder
```

## macOS Sierra에서 원화(₩) 대신 백 쿼트(`) 입력하기

```
~/Library 폴더로 이동해서 KeyBindings 폴더를 추가한다.
~/Library/KeyBindings 폴더에 DefaultkeyBinding.dict 파일을 만든다.
DefaultkeyBinding.dict 파일에 아래의 코드를 추가한다

{
    "₩" = ("insertText:", "`");
}
```

## 맥 한글전환 Shift + space 변경

```
1. 시스템 환경설정 > 키보드 > 단축키 > 입력소스 > 이전 입력 소스 선택의 단축키를 fn + shift + space 로 변경

2. 1번이 안 될 경우 ~/Library/Preferences/com.apple.symbolichotkeys.plist 파일 안에서 60,61 둘 중에 하나를 선택하고 value의 값을 131072로 변경 후 재부팅
```

## Oh my zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

.zshrc에서 ZSH_THEME="robbyrussell" => ZSH_THEME="simple"
```

## Terminal alias

```bash
alias ll='ls -al'
```

## ssh를 config 사용해서 접속 ./ssh/config

ssh dev
ssh prod

```bash
### ssh dev
Host stage
    HostName 127.0.0.1
    User root
    Port 22

### ssh prod
Host prod
    HostName 127.0.0.1
    User root
    Port 22
```

## scp

```bash
### 원격파일을 로컬로 다운로드
scp -P 22 root@127.0.0.1:/home/oseongryu/test.txt ~/dev
### 로컬파일을 원격으로 업로드
scp -P 22 ~/dev/test.txt root@127.0.0.1:/home/oseongryu/

scp -o 'ProxyJump sshconfig' root@127.0.0.1:/home/oseongryu/test.txt ~/dev
```

## mac python pip ( zsh: command not found: pip)

```bash
### solution 1
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py

### solution 2
which pip
which pip3
alias pip=/usr/local/bin/pip3
source ~/.zshrc
```

## pbcopy pbpaste

```bash
ifconfig | pbcopy
pbpaste
pbpaste > test.md
```

## Naver Cloud

```bash
### python의 설치가 완료되어 있을 경우
pip install awscli==1.15.85

### aws의 configure는 Naver Cloud https://www.ncloud.com/mypage/manage/authkey 에서 확인
aws configure

### 설정 테스트
aws --endpoint-url=https://kr.object.ncloudstorage.com s3 ls s3://my-object-storage

### Object Storage의 버킷(폴더)의 모든 파일을 로컬에 동기화합니다.
aws --endpoint-url=https://kr.object.ncloudstorage.com s3 sync s3://<bucket_name>[/<object_name>] <local_directory_name>

### 로컬 디렉토리의 모든 파일을 Object Storage의 버킷(폴더)에 동기화합니다.
aws --endpoint-url=https://kr.object.ncloudstorage.com s3 sync <local_directory_name> s3://<bucket_name>[/<object_name>]
```

## Azure Cli

```bash
brew install azure-cli
az login

npx express-generator myExpressApp --view pug
cd myExpressApp
npm install

az webapp up --sku F1 --name <app-name>
az webapp up --sku F1 --name myExpressApp
npm start
```

## References

```
https://oddcode.tistory.com/126
네이버클라우드 Object Storage CLI :
https://cli.ncloud-docs.com/docs/guide-objectstorage
https://cli-fin.ncloud-docs.com/docs/guide-objectstorage
AzureCli: https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-macos
AzureCli: https://docs.microsoft.com/ko-kr/cli/azure/get-started-with-azure-cli

```
