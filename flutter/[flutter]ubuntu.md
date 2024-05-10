## flutter setting

```bash
# https://jsonobject.tistory.com/m/635
sudo snap install android-studio --classic

# https://pitching-gap.tistory.com/entry/Flutter-install-flutter-on-linuxubuntu-2004-LTS
sudo snap install flutter --classic
flutter sdk-path
# /home/ubuntu/snap/flutter/common/flutter

flutter doctor

sudo apt install openjdk-17-jdk
java --version

# https://developer.android.com/studio?hl=ko#command-tools

# /home/ubuntu/snap/android-studio
flutter config --android-sdk /home/ubuntu/Android

vi ~/.bashrc
---
export ANDROID_HOME="/home/ubuntu/Android"
export PATH="$PATH:$ANDROID_HOME/Sdk/cmdline-tools/latest/bin/"
export PATH="$PATH:$ANDROID_HOME/Sdk/emulator/"
export PATH="$PATH:$ANDROID_HOME/Sdk/platform-tools/"
---

sdkmanager --list
flutter doctor --android-licenses
```

### references

```bash
# Android device in Container: Android Device 를 Docker container 에 연결하는 세 가지 방법
# https://changjoon-baek.medium.com/android-device-in-container-b9823cd5a6a7

# Installing Flutter on WSL2 — Windows 10: https://joshkautz.medium.com/installing-flutter-2-0-on-wsl2-2fbf0a354c78
# https://addshore.com/2022/01/installing-android-studio-on-wsl2-for-flutter/
```
