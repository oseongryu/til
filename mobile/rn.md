## rn-0.76.md

# 기존 react-native 제거

```bash
npm uninstall -g react-native-cli @react-native-community/cli
```

# 새로운 버전 설치

```bash
npx @react-native-community/cli@latest init rnshorts --version 0.76.0

cd rnshorts

npm start
```

# 라이브러리 재설치

```bash
npm install babel-plugin-module-resolver
npm install babel-plugin-root-import --save-dev
npm install @react-navigation/native
npm i react-native-worklets
npm install react-native-reanimated react-native-gesture-handler react-native-screens react-native-safe-area-context @react-native-community/masked-view
npm install @react-navigation/stack
npm i react-native-dotenv
npm i axios
npm i react-redux
npm i redux
npm i redux-thunk
npm i @types/react-redux
npm i react-native-webview
npm i iconv-lite
npm i buffer
npm i react-native-youtube
npm i react-native-webview
npm i react-native-youtube-iframe
npm i @react-native-community/hooks
npm install babel-plugin-root-import --save-dev
npm install  react-native-google-mobile-ads
npm i @react-navigation/drawer
npm i react-native-gesture-handler react-native-reanimated
npm i @react-navigation/material-top-tabs react-native-tab-view
npm i react-native-pager-view
npm i react-native-swipe-gestures
```

# 참고

https://adjh54.tistory.com/321

```
Execution failed for task ':app:createBundleReleaseJsAndAssets'.
> A problem occurred starting process 'command 'node''
```

## rn-expo.md

## npx

```bash
# https://docs.expo.dev/
npx expo -h


npx create-expo-app first-my-app
npx expo start
```

## react-native components

```bash
# https://reactnative.dev/docs/components-and-apis

```

## lecture 1~2

```bash

git clone git@github.com:fastcampus-rn-intruduction/part1-ch3-1-core-components #Part1 - Ch3 - 1 - Core Components 프로젝트입니다.
git clone git@github.com:fastcampus-rn-intruduction/part1-ch3-2-component-and-prop #Part1 - Ch3 - 2 - Component and Prop 프로젝트입니다.
git clone git@github.com:fastcampus-rn-intruduction/part1-ch3-4-hook #Part1 - Ch3 - 4 - useState hook 프로젝트입니다.

git clone git@github.com:fastcampus-rn-intruduction/part2-ch1-kakao-friend-list #Part2 - Ch1 - 까까오톡 친구목록 프로젝트입니다.
git clone git@github.com:fastcampus-rn-intruduction/part2-ch2-calculator #Part2 - Ch2 - 계산기 프로젝트입니다.
git clone git@github.com:fastcampus-rn-intruduction/part2-ch3-todo-and-calendar #Part2 - Ch3 - 투두리스트+달력 프로젝트입니다.
git clone git@github.com:fastcampus-rn-intruduction/part2-ch4-my-gallery #Part2 - Ch4 - 나만의 갤러리 프로젝트입니다.
git clone git@github.com:fastcampus-rn-intruduction/part2-ch5-kakao-bus #Part2 - Ch5 - 까까오버스 클론코딩 프로젝트입니다.
git clone git@github.com:fastcampus-rn-intruduction/part2-ch6-translation #Part2 - Ch6 - 번역앱 프로젝트입니다. (오늘의 포춘쿠키)

```

## expo icon

```
https://icons.expo.fyi/Index
```

## rn-lecture.md

### init

```bash
npx react-native init movieviewer --template react-native-template-typescript@6.12.6
```

### hermes setting (false)

```bash
nvm install 18.19.1
nvm use 18.19.1
```

ios > Podfile >
`hermes_enable => false`

```bash
cd ios
pod install
```

android > app > build.gradle >
`enableHermes: false,`

### package 변경

open a project
ios > .xcworkspace

app > Signing & capabilities > bundle Identifier > `io.github.movieviewer.app`

android > app > src > java > MainActivity
전부 일괄변경 `com.movieviewer` > `io.github.movieviewer.app`

### 실행시 split terminal

```bash
yarn run start
yarn run ios
yarn run android
```

### vscode

- eslint
- prettier

#### eslint

```js
const test = 2
test = 2
```

```bash
yarn run eslint example.js
```

=> 자동으로 확인

## rn-mac.md

## Setting

```bash
xcode-select —install
brew install git
brew install watchman
npm install -g react-native-cli

cd /users/${USERS}/desktop/dev/workspace/
git clone ~~

cd {$USERS}
npm install
brew tap AdoptOpenJDK/openjdk
brew install —-cask adoptopenjdk8

# 예전 brew 설치로 에러 발생
rm -fr $(brew --repo homebrew/core)

# /Users/${USER}/Library/Android/sdk
```

```bash
### export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_HOME=자신의 안드로이드SDK 위치/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
```

## ERESOLVE unable to resolve dependency tree

```bash
npm install react-project —save —legacy-peer-deps
```

## Error: spawn ./gradlew ACCESS

```bash
chmod 755 android/gradlew

cd /users/${USER}/desktop/dev/workspace
```

## local.properties

```
sdk.dir = /users/${USER}/Library/Android/sdk
```

## Clear

```bash
watchman watch-del-all
rm -rf $TMPDIR/react-native-packager-cache-_
rm -rf $TMPDIR/metro-bundler-cache-_
rm -rf node_modules/
npm cache clean --force
npm install
npm start -- --reset-cache

cd android
./gradlew cleanBuildCache
```

1. Clear watchman watches: `watchman watch-del-all`
2. Delete node_modules and run yarn install
3. Reset Metro's cache: `yarn start --reset-cache`
4. Remove the cache: `rm -rf /tmp/metro-\*`

```bash
rm -rf node_modules
watchman wathch-del-all
npm start --reset-cache
```

- error: Error: Unable to resolve module @babel/runtime/helpers/interopRequireDefault from ~~

```bash
npm add @babel/runtime
```

## React-Native IOS 실기계 연결

```bash
# 안되는 경우 XCode에서 설정
npm install -g ios-deploy
react-native run-ios --device 'DELL의 iPhone' --configuration Release
react-native run-ios --scheme "happytoseeyou" --device 'oseongryu의 iPhone'
```

## service kill

```bash
lsof -i :19090
kill -9 18731
```

## vscode Prettier settings.json

```
Windows Path:
./data/user-data/User (Portable)
%AppData%/Roaming/Code/User/settings.json (Excute)

Mac Path:
~/Library/Application Support/Code/User/settings.json (Excute)
```

-- default

```json
{
  "workbench.startupEditor": "none",
  "editor.minimap.enabled": false,
  "diffEditor.ignoreTrimWhitespace": false,
  "workbench.iconTheme": "material-icon-theme",
  "terminal.integrated.defaultProfile.windows": "Git Bash"
}
```

-- custom

```json
{
  "workbench.colorTheme": "Material Theme Darker",
  "editor.formatOnSave": true,
  "prettier.jsxSingleQuote": true,
  "prettier.singleQuote": true,
  "javascript.preferences.quoteStyle": "single",
  "typescript.preferences.quoteStyle": "single",
  "editor.tokenColorCustomizations": {
    "comments": "#fdc1d5"
  },
  "launch": {
    "configurations": [],
    "compounds": []
  },
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "code-runner.runInTerminal": true,
  "[json]": {
    "editor.quickSuggestions": {
      "strings": true
    },
    "editor.suggest.insertMode": "replace",
    "gitlens.codeLens.scopes": ["document"]
  },
  "code-runner.executorMap": {
    "cpp": "cd $dir && clang++ -std=c++17 $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt"
  }
}
```

###

- code-insiders-portable-data
- code-portable-data

```bash
sudo npm uninstall npm -g
sudo rm -rf /usr/local/lib/node
sudo rm -rf /usr/local/lib/node_modules
sudo rm -rf /var/db/receipts/org.nodejs.*
sudo rm -rf /usr/local/include/node
sudo rm -rf /Users/oseongryu/.npm
sudo rm /usr/local/bin/node
sudo rm /usr/local/share/man/man1/node.1

brew uninstall node
```

### 2023.11.10. 재설치

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

npm install --global yarn

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

brew install cocoapods
npx react-native init LearnReactNative

# 백업
# export NODE_OPTIONS=--openssl-legacy-provider

# export NVM_DIR=~/.nvm
# source $(brew --prefix nvm)/nvm.sh

# export ANDROID_HOME="/Users/oseongryu/Library/Android/sdk"
# export PATH="$PATH:$ANDROID_HOME/platform-tools/"

# alias python=/opt/homebrew/bin/python3

# eval "$(/opt/homebrew/bin/brew shellenv)"
# [[ -d ~/.rbenv  ]] && \
# export PATH=${HOME}/.rbenv/bin:${PATH} && \
# eval "$(rbenv init -)"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# /usr/libexec/java_home -V
```

### node_modules/react-native/scripts/find-node.sh

```bash
nvm unalias default
rm -rf ./Pods && pod install
npx react-native run-ios --simulator="iPhone 15 Pro"
cd ios && RCT_NEW_ARCH_ENABLED=1 pod install
RCT_NEW_ARCH_ENABLED=1 pod install
watchman watch-del '/Users/oseongryu/git/rn-shorts' ; watchman watch-project '/Users/oseongryu/git/rn-shorts'

# https://velog.io/@somangoi/React-Native-%EB%B9%8C%EB%93%9C-%EC%8B%9C-PhaseScriptExecution-%EC%97%90%EB%9F%AC-%ED%95%B4%EA%B2%B0
# Define NVM_DIR and source the nvm.sh setup script
[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"

if [[ -s "$HOME/.nvm/nvm.sh" ]]; then
  . "$HOME/.nvm/nvm.sh"
elif [[ -x "$(command -v brew)" && -s "$(brew --prefix nvm)/nvm.sh" ]]; then
  . "$(brew --prefix nvm)/nvm.sh"
fi
```

### mac rbenv

```bash
brew install rbenv
rbenv install 2.7.6.
rbenv versions
rbenv global 2.7.6
rbenv versions
ruby --version
gem install bundler

sudo gem install ffi
sudo gem install cocoapods
```

### 2024.03.14. error

```bash
✔ Initializing Git repository

  Run instructions for Android:
    • Have an Android emulator running (quickest way to get started), or a device connected.
    • cd "/Users/oseongryu/git/rnshorts" && npx react-native run-android

  Run instructions for iOS:
    • cd "/Users/oseongryu/git/rnshorts/ios"

    • Install Cocoapods
      • bundle install # you need to run this only once in your project.
      • bundle exec pod install
      • cd ..

    • npx react-native run-ios
    - or -
    • Open rnshorts/ios/rnshorts.xcodeproj in Xcode or run "xed -b ios"
    • Hit the Run button

  Run instructions for macOS:
    • See https://aka.ms/ReactNativeGuideMacOS for the latest up-to-date instructions.
```

```bash
nvm use --delete-prefix v16.1.0
unset PREFIX
```

```
/Users/oseongryu/git/rnshorts/node_modules/.bin/launchPackager.command ; exit;
nvm is not compatible with the "PREFIX" environment variable: currently set to "/opt/homebrew"
Run `unset PREFIX` to unset it.
~ /Users/oseongryu/git/rnshorts/node_modules/.bin/launchPackager.command ; exit;
env: node: No such file or directory
Process terminated. Press <enter> to close the window
```

```
error Failed to install the app. Looks like your Android environment is not properly set. Please go to https://reactnative.dev/docs/0.73/environment-setup?os=macos&platform=android&guide=native#jdk-studio and follow the React Native CLI QuickStart guide to install the compatible version of JDK.
```

## rn-setting.md

# vscode

```
cmd + d
cmd shift + l
code .
```

# Shell

```bash
open .
```

## 포트확인 tcping

```bash
brew install tcping
tcping 127.0.0.1 80
```

## 아이피확인 ifconfig

```bash
ifconfig |grep inet
```

# 개발세팅

## 1. Homebrew

Homebrew란 ...
Apple/Linus 시스템에서 제공하지 않는 유용한 패키지 관리자 설치

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew --version
```

### 관련 명령어

```bash
brew install git
brew remove git
brew search git
brew info git
brew list
brew search git
```

## 2. Git setting

bash git 사용

1. bash 창 열기(바탕화면 클릭 > 이동 > 유틸리티 > 터미널 선택. 자주 사용하므로 Docker에 고정해놓기 )
2. `git --version` 깃 설치 여부 확인
3. `brew install git` 깃 설치

## 3. Git 사용

```bash
cd /
ls -la
cd users
cd ${USER}
cd desktop
cd dev
cd

cd /users/${USER}/desktop/dev/workspace
cd /users/${USER}/desktop/dev/downloads/apache-tomcat-9.0.50
```

## 4. Dbeaver

database tool로 Dbeaver 사용

```bash
brew install --cask dbeaver-community # or dmg 파일 다운로드
```

https://dbeaver.io/

## 5. Visual Studio Code

https://code.visualstudio.com/download

## 6. Intellij

Community version으로 설치

https://www.jetbrains.com/ko-kr/idea/download/#section=mac

## 7. Tomcat

```bash
# 1. brew update
brew update
# 2. brew list
brew list
# 3. brew install tomcat@9
brew install tomcat@9
# 4. 설치후 brew list로 설치 확인

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

* 직접 파일 다운후 설치 방법

```bash
# 1.
sudo mv /users/${USER}/desktop/dev/downloads/apache-tomcat-9.0.50 /usr/local
# 2.
sudo chown -R ${USER} /Library/Tomcat
# 3.
sudo chmod +x /Library/Tomcat/bin/*.sh
```

## 8. SSH 연결

```bash
cd /home/${USER}
cat init-server.sh
ssh root@localhost -p 22
```

## war 배포용 만들기

경로로 이동

```bash
./gradlew clean
```

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

```sql
SELECT ... FROM
WHERE ... LIKE
```

ERD(Entity Relationship Diagram)

ANSI 쿼리 사용

* 항상 먼저 WHERE문으로 선택된 데이터 확인하고 update하기
* 데이터 임의로 입력한 경우

```sql
alter table lesson auto_increment=66;
```

## 11. Swagger

Tutorial :
https://memostack.tistory.com/17

* 2.9.2버전으로 dependency설정

```gradle
implementation 'io.springfox:springfox-swagger-ui:2.9.2'
implementation 'io.springfox:springfox-swagger2:2.9.2'
```

## 12. React Native

```bash
brew --version
brew install node
node --version
npm --version

# nvm 사용시
brew install yarn --without-node
brew install yarn


brew install watchman
watchman -version
npm install -g react-native-cli
react-native --version

# xcode 설치
sudo gem install cocoapods
pod --version

brew tap AdoptOpenJDK/openjdk
brew install cask adoptopenjdk8
java -version

javac -version
```

## 13. brew node 설정

```bash
brew install node
# node & npm version 확인
node -v
npm -v
```

## 14. Next.JS 설정

node 설치 후

```bash
npx create-next-app 폴더명
```

First, run the development server:

```bash
npm run dev
# or
yarn dev
```

## 15. React-Native

```bash
brew install watchman
npm install -g react-native-cli
brew tap AdoptOpenJDK/openjdk
brew install --cask adoptopenjdk8

# 예전 brew 설치로 에러 발생
rm -rf $(brew --repo homebrew/core)

npm install --legacy-peer-deps
```

## Android Studio 설치하지 않을경우

### android-platform-tools

```bash
brew install android-platform-tools
adb version

# 실기기연결후 USB 디버깅이 안뜨는 경우
adb kill-server
adb devices
```

### android-sdk

```bash
brew install android-sdk

export ANDROID_HOME=/usr/local/share/android-sdk
export ANDROID_SDK_ROOT=/usr/local/share/android-sdk

$ANDROID_HOME/tools/bin/sdkmanager --licenses
```

### apk 파일

```bash
react-native bundle --platform android --dev false --entry-file index.js --bundle-output android/app/src/main/assets/index.android.bundle

react-native bundle --platform android --dev false --entry-file index.js --bundle-output android/app/src/main/assets/index.android.bundle --assets-dest android/app/src/main/res/
```

### APK 생성 명령어

```bash
./gradlew assembleDebug
```

### AAB 생성 명령어

```bash
./gradlew bundleDebug
```

### Android Emulator with Homebrew

```bash
touch ~/.android/repositories.cfg
brew cask install caskroom/versions/java8
brew cask install android-sdk
brew cask install intel-haxm
brew install qt
export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"
sdkmanager "platform-tools" "platforms;android-28" "extras;intel;Hardware_Accelerated_Execution_Manager" "build-tools;28.0.0" "system-images;android-28;google_apis;x86_64" "emulator"
avdmanager create avd -n test -k "system-images;android-28;google_apis;x86_64"
emulator -avd test
sudo /usr/local/share/android-sdk/emulator/emulator -avd test
```

---

I recommend adding these lines to: `~/.android/avd/generic_10.avd/config.ini`

```
skin.name=1080x1920        # proper screen size for emulator
hw.lcd.density=480
hw.keyboard=yes            # enables keys from your laptop to be sent to the emulator
```

If you cannot do this, you can still pass `-skin 1080x1920` as an argument when starting the emulator.

https://gist.github.com/mrk-han/66ac1a724456cadf1c93f4218c6060ae

---

```bash
export ANDROID_SDK_ROOT=/usr/local/share/android-sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/tools
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
PATH=$ANDROID_SDK_ROOT/emulator:$PATH
```

* Failed to install the app. Please accept all necessary Android SDK licenses using Android SDK Manager:
  `"$ANDROID_HOME/tools/bin/sdkmanager --licenses"`.

```bash
./sdkmanager --licenses --sdk_root=#ANDROID_SDK_ROOT
```

`Caused by: java.lang.ClassNotFoundException: javax.xml.bind.annotation.XmlSchema`

* emulator start

```bash
emulator -list-avds
```

## 16. Android Studio

https://developer.android.com/studio?hl=ko

sdk 설정

```bash
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
```

`/Users/${USER}/DEV/workspace/happytoseeyou-app-v2/android/app/build`

```bash
cd /users/${USER}/desktop/dev/workspace
```

#### local.properties

```
sdk.dir = /users/${USER}/Library/Android/sdk
```

## 17. scrcpy

https://github.com/Genymobile/scrcpy

```bash
brew install scrcpy
sudo port install scrcpy
```

`vi ~/.zshrc`

```bash
scpy(){
scrcpy -m 1024 -b 2M --max-fps 30 --always-on-top --disable-screensaver $@
}
```

## 18. codepush

```bash
npm run codepush-all-prod
npm i -g actbase-cli
npm i -g appcenter-cli
appcenter apps list
appcenter login
```

* appcenter를 global로 설정 시, 앱에 package.json의 appcenter, appcenter-analytics, appcenter-crashes와 버전 문제로 충돌이 발생할 수 있으므로 주의 (2022-01-26)
* npm i 시 버전을 업데이트하는 형태로 해서 문제 해결

## 18. React-Native (IOS)

https://apps.apple.com/us/app/xcode/id497799835?mt=12

Xcode 설치
XCode => preferences => Location => Command Line Tools

```bash
sudo gem install cocoapods
pod --version
```

## 19. React-Native (Firebase Debug)

```bash
adb shell setprop debug.firebase.analytics.app kr.co.test.app
adb shell setprop debug.firebase.analytics.app kr.co.test.app.dev
```

## 20. Node 버전 관리

```bash
npm install -g n
# lst 버전 설치
n lts
# 최신 버전 설치
n latest
# 특정 버전 설치
sudo n 11

# 설치한 버전 변경
n

# 설치한 버전 확인
npm -v
npm node-sass -v
```

# 기타 참고하면 좋은 페이지

## 마크다운

https://gist.github.com/ihoneymon/652be052a0727ad59601#this-is-a-h5

https://nicebam.tistory.com/25

## poor sql

https://poorsql.com/ sql query문 열정리

## rn-windows.md

## Setting

1. [cmd] react-native-cli

```bash
# clean
yarn global remove react-native
yarn global remove react-native-cli
npm uninstall -g react-native
npm uninstall -g react-native-cli

# install
yarn global list
npm -g list

npm install -g react-native
npm install -g react-native-cli
npx react-native --version
```

2. [EnvironmentVariable] ANDROID_HOME

```bash
%USERPROFILE%\AppData\Local\Android\Sdk\
# C:\Users\{User}\AppData\Local\Android\Sdk\
```

3. [EnvironmentVariable] Path

```bash
%ANDROID_HOME%\platform-tools
%ANDROID_HOME%\emulator
%ANDROID_HOME%\tools
%ANDROID_HOME%\tools\bin

%USERPROFILE%\AppData\Local\Android\Sdk\platform-tools
# C:\Users\{User}\AppData\Local\Android\Sdk\platform-tools
```

4. [cmd]

```bash
adb
```

## Init React-Native

1. [cmd] init

```bash
# npx react-native init reactnative
npx react-native init reactnative --version 0.68.2
```

2. [cmd] Android Start

```bash
react-native run-android
npm run android
```

- [error] Failed to install the following Android SDK packages as some licences have not been accepted.
  Add to Google licenses on SDK tools(at Android Studio)
  `C:\Users\{User}\AppData\Local\Android\Sdk\licenses`

## module clean

### package.json

```json
"build": "npm build",
"clean": "rm -rf node_modules",
"reinstall": "npm run clean && npm install",
"rebuild": "npm run clean && npm install && npm run build",
```

### npm 재인스톨

```bash
npm ci
```

### npx npkill

```bash
npx npkill
```

### chocolatey 설정

1. PowerShell

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

2. CMD

```bash
choco install -y nodejs.install
choco install -y python2
choco install -y jdk8
```

3. 안드로이드 설정
   - 안드로이드 설치
   - SDK Manager 설정에서 licenses 관련 추가
   - 환경변수 ANDROID_HOME,Path에 SDK tools 설정
   - AVD Manger 또는 안드로이드 기계로 연결

4. React-Native 설정

```bash
npm install -g react-native-cli
```

5. React-Native Init

```bash
react-native init Test
react-native run-android
```

6. Android Build

```bash
cd android
gradlew assembleRelease
```

## rn.md

## flatlist inside scrollview
VirtualizedLists should never be nested inside plain ScrollViews with the same orientation because it can break windowing and other functionality - use another VirtualizedList-backed container instead. 

### before
```js

<ScrollView >
    <FlatList />
</ScrollView>

```

### after
```js
<ScrollView horizontal={false} style={{width: '100%', height: '100%'}}>
    <ScrollView horizontal={true} style={{width: '100%', height: '100%'}}>
        <FlatList />
    </ScrollView>
</ScrollView>
```
## Navigator
### Drawer
```js
function MainStackComponent() {
  const MainStack = createStackNavigator();
  return (
    <MainStack.Navigator>
      <MainStack.Screen name="HomeIndex" component={HomeIndex} options={({route}) => ({title: route.name, headerShown: false})} />
    </MainStack.Navigator>
  );
}

function YoutubeIframeStackComponent() {
  // var videoId = route?.params?.id;
  const StackNavigator = createStackNavigator();
  return (
    <StackNavigator.Navigator>
      <StackNavigator.Screen name="YoutubeIframeIndex" component={YoutubeIframeIndex} options={({route}) => ({title: route.name, headerShown: false})} />
    </StackNavigator.Navigator>
  );
}

// 드로어 네비게이터
const DrawerNav = ({navigation, route}) => {
  const DrawerNavigator = createDrawerNavigator();
  return (
    <DrawerNavigator.Navigator>
      <DrawerNavigator.Screen
        key={'HomeIndex'}
        name={'home'}
        component={MainStackComponent}
        options={{
          headerShown: false,
          unmountOnBlur: true,
        }}
      />
      <DrawerNavigator.Screen
        key={'YoutubeIframeIndex'}
        name={'youtube'}
        component={YoutubeIframeStackComponent}
        options={{
          headerShown: false,
          unmountOnBlur: true,
        }}
      />
    </DrawerNavigator.Navigator>
  );
};
```

### BottomTab
```js
const MainTabNav = ({navigation, route}) => {
  const BottomTabNavigator = createBottomTabNavigator();
  // var videoId = route?.params?.id;
  return (
    <BottomTabNavigator.Navigator>
      {bottomRoutes.map(data => (
        <BottomTabNavigator.Screen
          // initialParams={{id: videoId}}
          key={data.name}
          name={data.label}
          component={data.component}
          options={{
            tabBarShowLabel: false,
            headerShown: false,
            unmountOnBlur: true,
            tabBarIcon: ({focused}) => {
              return <Image source={focused ? data.activeMenu : route.inactiveMenu} style={{width: 15, height: 15}} />;
            },
            tabBarStyle: {height: 50},
          }}
        />
      ))}
    </BottomTabNavigator.Navigator>
  );
};

const bottomRoutes = [
  {
    name: 'home',
    label: 'home',
    component: HomeIndex,
    inactiveMenu: Images.menu_home_off,
    activeMenu: Images.menu_home_on,
  },
  {
    name: 'iframe',
    label: 'iframe',
    component: YoutubeIframeIndex,
    inactiveMenu: Images.menu_youtube_off,
    activeMenu: Images.menu_youtube_on,
  },
];
```


## we have failed to run 'bundletool build-apks' on this android app bundle



## The emulator process for AVD Pixel5API31 has terminated.
```bash
https://codingjerk-diary.tistory.com/entry/Android%EC%98%A4%EB%A5%98%ED%95%B4%EA%B2%B0-The-emulator-process-for-AVD-has-terminated
```

## custom react-native-appstate-hook
```js
// https://github.com/amrlabib/react-native-appstate-hook/issues/17
const useAppState = settings => {
  const {onChange, onForeground, onBackground} = settings || {};
  const [appState, setAppState] = useState(AppState.currentState);

  useEffect(() => {
    const handleAppStateChange = nextAppState => {
      if (nextAppState === 'active' && appState !== 'active') {
        isValidFunction(onForeground) && onForeground();
      } else if (
        appState === 'active' &&
        nextAppState.match(/inactive|background/)
      ) {
        isValidFunction(onBackground) && onBackground();
      }
      setAppState(nextAppState);
      isValidFunction(onChange) && onChange(nextAppState);
    };
    AppState.addEventListener('change', handleAppStateChange);

    return () => {
      AppState.removeEventListener('change', handleAppStateChange);
    };
  }, [onChange, onForeground, onBackground, appState]);

  return {appState};
};
```

## gesture
```js
import {useFocusEffect} from '@react-navigation/native';

  const pan = useRef(new Animated.ValueXY()).current;

  const panResponder = useRef(
    PanResponder.create({
      // onStartShouldSetPanResponder: 스와이프를 시작해야 할지 여부를 결정합니다.
      onStartShouldSetPanResponder: (evt, gestureState) => true, // 스와이프 허용

      // onStartShouldSetPanResponderCapture: 스와이프를 위한 캡처 여부를 결정합니다.
      onStartShouldSetPanResponderCapture: (evt, gestureState) => true, // 스와이프 허용

      // onMoveShouldSetPanResponder: 스와이프를 진행할지 여부를 결정합니다.
      onMoveShouldSetPanResponder: (evt, gestureState) => true, // 스와이프 허용

      // onMoveShouldSetPanResponderCapture: 스와이프를 위한 캡처 여부를 결정합니다.
      onMoveShouldSetPanResponderCapture: (evt, gestureState) => true, // 스와이프 허용

      // onPanResponderMove: 스와이프 동작에 대한 처리를 합니다.
      onPanResponderMove: (evt, gestureState) => {
        // 스와이프 동작에 따른 처리 로직

        // console.log('start', evt);
        console.log('start', gestureState);
      },

      // onPanResponderRelease: 스와이프가 끝났을 때 처리를 합니다.
      onPanResponderRelease: (evt, gestureState) => {
        // 스와이프 종료 후 처리 로직
        // console.log('end', evt);
        console.log('end', gestureState);
      },
    }),
  ).current;

              <Animated.View
                style={{
                  transform: [{translateY: pan.y}],
                }}
                {...panResponder.panHandlers}>
              </Animated.View>
```

