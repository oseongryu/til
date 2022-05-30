요구사항 > 서비스 기획 > UI, UX 상세 설계 > GUI 디자인 > 퍼블리싱 > 백엔드 API 개발 > 프런트엔드 개발 > QA

night owl
material icon theme
vetur
vue vscode snippets

https://github.com/joshua1988/vue-til-server

- 버전
  Node.js 이전 릴리즈 다운로드 페이지
  https://nodejs.org/ko/download/releases/
  OS 별로 아래 파일을 다운로드 받으시면 됩니다 :)
  윈도우 64비트 : x64-msi 파일
  윈도우 32비트 : x86-msi 파일
  맥 : pkg 파일
  리눅스 : tar 파일
  NVM 설치 진행 명령어
  https://gist.github.com/falsy/8aa42ae311a9adb50e2ca7d8702c9af1

- https://github.com/nvm-sh/nvm#installing-and-updating

  \*vscode
  terminal.integrated.shell.window

bash로 변경
사용자에 폴더에서 .bash_profile 파일추가

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash

nvm -v
nvm use system
vi ~/.bash_profile

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

source ~/.bash_profile

nvm install 12.14.0
nvm install 10.16.3
