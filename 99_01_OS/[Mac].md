
## 시스템 환경설정

키보드 > 단축키
디스플레이 > 정렬 
파인더 > 환경설정

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
```


## References
https://oddcode.tistory.com/126