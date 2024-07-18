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

### 6. 단축키

Command + tab = 화면전환
Command + shift + 3 = 전체 화면 캡처 , 4 = 부분선택 캡처 , 5 = 창선택 캡처
Control + 위에 방향키 = Mission Control
Control + 아래 방향키  = 한 프로그램 여러창 띄웠을때 방향키로 선택 가능 (command + n = 새창 띄우기[shift 추가하면 시크릿])
Control + Command + F 하면 전체화면 되면서 넘어가는데, Control + 좌우로 이동가능
Command 방향키 = 문장 첫번째줄로 키보드커서 옮기기
Option 방향키 = 단어별 키보드 커서 옮기기
Command + Q  = 프로그램 완전 종료 하기
Command + W = 프로그램 끄기
Command + 왼쪽 = 뒤로 가기
Command + 오른쪽  = 앞으로 가기
Command+, 모든 앱에서 환경 설정 창을 열기
[command]+[A] Finder 창, 또는 바탕화면에서 모든 파일을 선택
[command]+[shift]+[A] 응용 프로그램 폴더를 열기
[command]+[C] 선택한 파일이나 텍스트를 복사
[command]+[D] 선택한 파일을 복제
[command]+[shift]+[D] [데스크탑] 폴더를 열기
[command]+[I] 선택한 항목의 정보를 가져오기
[command]+[option]+[I] 선택한 다수 항목의 속성을 보기
[command]+[J] Finder 창의 보기 옵션을 표시
[command]+[M] 활성화된 창을 Dock으로 축소
[command]+[N] 새로운 Finder 창을 생성
[command]+[shift]+[N] 새 폴더를 만들기
[command]+[O] 선택한 파일을 열기
[command]+[V] 복사된 파일이나 텍스트를 붙이기
[command]+[W] 활성화된 창을 닫기
[command]+[X] 오려두기
[command]+[Z] 방금 작업했던 내용을 취소
[command]+[1]~[4] Finder 보기 형식을 전환
[command]+[`] 열려 있는 Finder 창 순환
[command]+ [ 이전 폴더로 이동
[command]+ ] 다음 폴더로 이동
[command]+ [위쪽 화살표] 폴더를 열기
[command]+[아래쪽 화살표] 선택된 파일을 열거나 실행
[command]+[delete] 선택한 파일을 휴지통에 버리기
[command]+[shift]+[delete] 휴지통을 비우기
[space bar] 또는 [command]+[Y] 훑어보기
[command]+파일 드래그 다른 디스크로 파일을 드래그할 때 복사하지 않고 이동
[option]+파일 드래그 같은 디스크로 파일을 드래그할 때 이동하지 않고 복사
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

- Open VSCode
셀스크립트 열기
현재수신하는작업흐름:파일 또는 폴더
선택항목위치: Finder.app
통과입력: 변수
open -n -b "com.microsoft.VSCode" --args "$*"

- Open Terminal
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

- Make NewFile
Automator > 빠른 동작 > AppleScript DoubleClick
선택항목위치: Finder.app

---
tell application "Finder" to make new file at (the target of the front window) as alias
---

- Make NewFile (Application 버전)
Application 선택 > AppleScript

# 1번
---
tell application "Finder" to make new file at (the target of the front window) as alias
---

# 2번
---
tell application "Finder" to make new file at (the target of the front window) as alias with properties {name:"newfile.txt"}
---

# 2번
---
on run {input, parameters}
    tell application "Finder"
        set selection to make new file at (get insertion location) with properties {name:"newfile.txt"}
    end tell
    return input
end run
---


파일저장 > /Applications > BlankFile.app
cmd를 누른 상태에서 Finder에 Drag&drop
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

## 한글전환 Shift + space 변경

```
1. 시스템 환경설정 > 키보드 > 단축키 > 입력소스 > 입력 메뉴에서 다음 소스 선택 단축키를 fn + shift + space 로 변경
(한영 딜레이가 없으려면 입력 메뉴에서 다음 소스 선택)

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
### 맥일 경우
brew install awscli
which aws

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

## 키보드 오른쪽 한영전환키

```bash
# 활성화
mkdir -p /Users/Shared/bin
echo '''#!/bin/sh\nhidutil property --set '\'{\"UserKeyMapping\":\[\{\"HIDKeyboardModifierMappingSrc\":0x7000000e7,\"HIDKeyboardModifierMappingDst\":0x70000006d\}\]\}\''''' > /Users/Shared/bin/userkeymapping
chmod 755 /Users/Shared/bin/userkeymapping
sudo cat<<: >/Users/Shared/bin/userkeymapping.plist

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>userkeymapping</string>   <key>ProgramArguments</key>
    <array>
        <string>/Users/Shared/bin/userkeymapping</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
:

sudo mv /Users/Shared/bin/userkeymapping.plist /Library/LaunchAgents/userkeymapping.plist
sudo chown root /Library/LaunchAgents/userkeymapping.plist
sudo launchctl load /Library/LaunchAgents/userkeymapping.plist

왼쪽 상단 사과 로고 클릭
시스템 환경설정.. 클릭
키보드 클릭
단축키 탭 클릭
입력소스 클릭
이전 입력소스 선택에 오른쪽 option⌥+스페이스를 클릭하여 오른쪽 command을 누르면
F18키로 단축키가 설정됨
시스템 환경설정 창을 닫고 한영 변환이 오른쪽 command키로 잘 되는지 확인
완료


# 비활성화
sudo launchctl remove userkeymapping
sudo rm /Library/LaunchAgents/userkeymapping.plist
sudo rm /Users/Shared/bin/userkeymapping

```

### 슬립모드

```bash
# 슬립모드 비활성화
sudo pmset -c disablesleep 1
# 슬립모드 활성화
sudo pmset -c disablesleep 0
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

### vscode

```bash
xattr "/Applications/Visual Studio Code.app"
sudo xattr -r -d com.apple.quarantine "/Applications/Visual Studio Code.app"

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

arch -x86_64 pod install
```

## How to change proxy setting using Command line in Mac

```bash
# https://superuser.com/questions/316502/how-to-change-proxy-setting-using-command-line-in-mac-os
sudo networksetup -setwebproxy "Wi-Fi" 192.0.0.4 8000
sudo networksetup -setsecurewebproxy "Wi-Fi" 192.0.0.4 8000
sudo networksetup -setwebproxystate "Wi-Fi" off
sudo networksetup -setsecurewebproxystate "Wi-Fi" off
sudo networksetup -setwebproxystate "Wi-Fi" on

networksetup -getwebproxy "Wi-Fi"
networksetup -getsecurewebproxy "Wi-Fi"
```

## mac sudo 명령어 비밀번호 없이

```bash
sudo visudo
사용자명 ALL=(ALL) NOPASSWD:ALL
```

## mac change screenshot name

```bash
defaults write com.apple.screencapture name "shot"
killall SystemUIServer
defaults write com.apple.screencapture name "Screenshot"
```

## mac dock speed

```bash
# 활성화
defaults write com.apple.dock autohide -bool true && defaults write com.apple.dock autohide-delay -float 0 && defaults write com.apple.dock autohide-time-modifier -float 0 && killall Dock
defaults write com.apple.dock autohide -bool true && defaults write com.apple.dock autohide-delay -float 0 && defaults write com.apple.dock autohide-time-modifier -float 0.25 && killall Dock 
# 비활성화
defaults delete com.apple.dock autohide && defaults delete com.apple.dock autohide-delay && defaults delete com.apple.dock autohide-time-modifier && killall Dock
```

## mac xcode 정리

```bash
# 1. Xcode Archive 삭제
~/Library/Developer/Xcode/Archives
# 2. Simulator Device 삭제
~/Library/Developer/Xcode/iOS DeviceSupport/
# 3. Project Build 삭제
~/Library/Developer/Xcode/DerivedData/
# 4. Device Log 삭제
~/Library/Developer/Xcode/iOS Device Logs/
```

## [mac] mkdir Read-only file system

```bash

# SIP (Security Integrity Protection) 비활성화
## 부팅시 cmd + R
csrutil disable

## bash
sudo mount -uw /

## SIP 활성화
scrutil enable

# 심볼릭링크 (\t로 띄어쓰기)
# 설정후 재시작
sudo vi /etc/synthetic.conf
/etc/synthetic.conf

---
data    /Users/doo/data
---

```

## hosts

sudo vi /private/etc/hosts

```
127.0.0.1 local.co.kr
127.0.0.1 local.test.co.kr
```

## 루트레벨 하위 심볼릭링크 생성

sudo vi /etc/synthetic.conf
synthetic.conf 파일 추가후 재부팅

```
tomcat  /Users/oseongryu/DEV/tomcat
java    /Users/oseongryu/DEV/java
```
