# 맥 사용법
## 1. 프로그램 종료
      - 프로그램 종료 Cmd + q
      - 한탭만 종료 Cmd + w

## 2. 복사 붙여넣기   
      - 한영 Caps lock   
      - 복사 cmd + c   
      - 붙여넣기 cmd + V   
      - 경로복사 cmd + option + c   
      - 잘라내기 cmd + C >>> cmd + option + V   
      - 프로그램 종료 Cmd + q   
      - 한탭만 종료   cmd + w

## 3. 스크린샷   
      - Shift + Command + 3 : 화면 그림을 파일로 저장   
      - Control + Shift + Command + 3 : 화면 그림을 클립보드에 복사   
      - Shift + Command + 4 : 선택한 영역 그림을 파일로 저장   
      - Control + Shift + Command + 4 : 선택한 영역 그림을 클립보드에 복사

## 4. 맥 터미널(bash) 사용
      (Finder > 이동 > Utilities > 터미널)   
      - ls : 디렉토리 파일, 폴더 보여주기      
      - ls -la :         
      - cd : change directory      
      - clear :  clear screen.  화면 글씨 비워줌      
      - cp : 지정된 디렉토리로 파일 복사      
      - rm : 파일 삭제   

## 5. 추가설정 
      - 캡쳐시 옵션에서 미리보기썸네일제거
      - 폴더선택후 터미널로 열기
      - 오토마타 사용으로 VSCode로 열기 서비스 만들기

# vscode
cmd + d
cmd shift + l
code .

# Shell
open .

## 포트확인 tcping
brew install tcping
tcping 127.0.0.1 80

## 아이피확인 ifconfig
ifconfig |grep inet


# 개발세팅
## 1. Homebrew
      Homebrew란 ... 
      Apple/Linus 시스템에서 제공하지 않는 유용한 패키지 관리자 설치

      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

      brew --version

## 2. Git setting
      bash git 사용
      1. bash 창 열기(바탕화면 클릭 > 이동 > 유틸리티 > 터미널 선택. 자주 사용하므로 Docker에 고정해놓기 )
      2. git --version 깃 설치 여부 확인
      3. brew install git 깃 설치

## 3. Git 사용
      cd /   
      ls -la   
      cd users   
      cd ${USER}   
      cd desktop   
      cd dev   
      cd     

      cd /users/${USER}/desktop/dev/workspace   
      cd /users/${USER}/desktop/dev/downloads/apache-tomcat-9.0.50

## 4. Dbeaver 
      database tool로 Dbeaver 사용

      shell
      brew install --cask dbeaver-community or dmg 파일 다운로드    
      https://dbeaver.io/


## 5. Visual Studio Code 
      https://code.visualstudio.com/download


## 6. Intellij 
      Community version으로 설치   
      https://www.jetbrains.com/ko-kr/idea/download/#section=mac

## 7. Tomcat
      shell
      1. brew update 
      2. brew list
      3. brew install tomcat@9
      4. 설치후 brew list로 설치 확인

      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

      * 직접 파일 다운후 설치 방법
      shell 
      1. sudo mv /users/${USER}/desktop/dev/downloads/apache-tomcat-9.0.50 /usr/local
      2. sudo chown -R ${USER} /Library/Tomcat 
      3. sudo chmod +x /Library/Tomcat/bin/*.sh

## 8. SSH 연결
      * 터미널 > 셀 >    
      cd /home/${USER}    
      cat init-server.sh   
      ssh root@localhost -p 22

## war 배포용 만들기
      경로로 이동
      ./gradlew clean
      
## 9. RESTful API    
      * Building a RESTful Web Service   
      https://spring.io/guides/gs/rest-service/   
      * Consuming a RESTful Web Service   
      https://spring.io/guides/gs/consuming-rest/   
      * Social Service Tutorial   
      https://www.kindsonthegenius.com/spring-boot16-spring-boot-crud-operation-with-jpa-repository/
      * Spring boot
      https://start.spring.io/

## 10. SQL
      SELECT ... FROM   
      WHERE ... LIKE

      ERD(Entity Relationship Diagram)

      ANSI 쿼리 사용

      * 항상 먼저 WHERE문으로 선택된 데이터 확인하고 update하기
      * 데이터 임의로 입력한 경우 
      alter table lesson auto_increment=66; 


## 11. Swagger
      Tutorial :
      https://memostack.tistory.com/17

      * 2.9.2버전으로 dependency설정    
      implementation 'io.springfox:springfox-swagger-ui:2.9.2'   
      implementation 'io.springfox:springfox-swagger2:2.9.2'

## 12. React Native

      brew --version
      brew install node
      node --version
      npm --version
      brew install watchman
      watchman -version
      npm install -g react-native-cli
      react-native --version

      xcode 설치
      sudo gem install cocoapods
      pod --version

      brew tab AdoptOpenJDK/openjdk
      brew cask install adptopenjdk8
      java -version

      javac -version

## 13. brew node 설정

      brew install node
      node & npm version 확인
      node -v
      npm -v

## 14. Next.JS 설정
      node 설치 후 
      npx create-next-app 폴더명
      First, run the development server:
      ```bash
      npm run dev
      # or
      yarn dev
      ```

## 15. React-Native 
      brew install watchman
      npm install -g react-native-cli
      brew tap AdoptOpenJDK/openjdk
      brew install --cask adoptopenjdk8

      * 예전 brew 설치로 에러 발생
      rm -rf $(brew --repo homebrew/core)

      npm install --legacy-peer-deps

## 16. Android Studio
      https://developer.android.com/studio?hl=ko

      sdk 설정
      cd ~
      touch .bash_profile 

      export ANDROID_PATH=/Users/${USER}/Library/Android
      export PATH=$PATH:$ANDROID_PATH/sdk/platform-tools

      export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
      export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
      export PATH=$PATH:$ANDROID_SDK_ROOT/tools
      export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin
      export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

      source ~/.bash_profile
      source ~/.zshrc

      adb --version

      git clone
      cd android
      touch local.properties
      ./gradlew clean assembleRelease

      /Users/${USER}/DEV/workspace/happytoseeyou-app-v2/android/app/build

      cd /users/${USER}/desktop/dev/workspace
      #### local.properties
      sdk.dir = /users/${USER}/Library/Android/sdk


## 17. scrcpy
      https://github.com/Genymobile/scrcpy

      brew install scrcpy
      sudo port install scrcpy

      vi ~/.zshrc
      
      --- 
      scpy(){
      scrcpy -m 1024 -b 2M --max-fps 30 --always-on-top --disable-screensaver $@
      }
      ---

## 18. codepush 
      npm run codepush-all-prod
      npm i -g actbase-cli
      npm i -g appcenter-cli
      appcenter apps list
      appcenter login

## 18. React-Native (IOS)
      https://apps.apple.com/us/app/xcode/id497799835?mt=12

      Xcode 설치
      XCode => preferences => Location => Command Line Tools

      sudo gem install cocoapods
      pod --version

## 19. React-Native (Firebase Debug)
      adb shell setprop debug.firebase.analytics.app kr.co.test.app
      adb shell setprop debug.firebase.analytics.app kr.co.test.app.dev

# 기타 참고하면 좋은 페이지
## 마크다운
https://gist.github.com/ihoneymon/652be052a0727ad59601#this-is-a-h5


## poor sql
https://poorsql.com/ sql query문 열정리
