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
  C:\Users\{User}\AppData\Local\Android\Sdk\licenses

## module clean

### package.json

"build": "npm build",
"clean": "rm -rf node_modules",
"reinstall": "npm run clean && npm install",
"rebuild": "npm run clean && npm install && npm run build",

### npm 재인스톨

```bash
npm ci
```

### npx npkill

```bash
npx npkill
```

### chocolatey 설정

```
1. PowerShell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

2. CMD
choco install -y nodejs.install
choco install -y python2
choco install -y jdk8

3. 안드로이드 설정
- 안드로이드 설치
- SDK Manager 설정에서 licenses 관련 추가
- 환경변수 ANDROID_HOME,Path에 SDK tools 설정
- AVD Manger 또는 안드로이드 기계로 연결

4. React-Native 설정
npm install -g react-native-cli

5. React-Native Init
react-native init Test
react-native run-android

6. Android Build
cd android
gradlew assembleRelease
```
