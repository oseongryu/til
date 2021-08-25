
## 시스템 환경설정
키보드 > 단축키
디스플레이 > 정렬 
파인더 > 환경설정

## Utilities

### VSCode


View > Command Palette > Shell Command : Install 'code' command in PATH


### Clean My Mac
디스크 정리용

### navicat premium
MySQL 여러개 관리


## 기본 단축키

cmd + c 복사


## References
https://oddcode.tistory.com/126


## 터미널에서 파인더 열기
open .


## macOS Sierra에서 원화(₩) 대신 백 쿼트(`) 입력하기

~/Library 폴더로 이동해서 KeyBindings 폴더를 추가한다.
~/Library/KeyBindings 폴더에 DefaultkeyBinding.dict 파일을 만든다.
DefaultkeyBinding.dict 파일에 아래의 코드를 추가한다

{
    "₩" = ("insertText:", "`");
}