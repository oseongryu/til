## Setting
1. [cmd] react-native-cli
npm install -g react-native-cli
npx react-native --version

2. [EnvironmentVariable] ANDROID_HOME
C:\Users\{User}\AppData\Local\Android\Sdk\

3. [EnvironmentVariable] Path
C:\Users\{User}\AppData\Local\Android\Sdk\platform-tools

4. [cmd]
adb

## Init React-Native

1. [cmd] init
npx react-native init reactnative
2. [cmd] Android Start
-Emulator: react-native run-android
-USB Debugging: npm run android

* [error] Failed to install the following Android SDK packages as some licences have not been accepted.
SDK tools에 구글 라이센스 추가
C:\Users\{User}\AppData\Local\Android\Sdk\licenses
