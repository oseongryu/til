### 안드로이드 단축키

```
Ctrl +  Alt + L : 코드정렬
```

### 안드로이드 테마 다크로 변경하기

```
"Theme.AppCompat.Light.DarkActionBar" -> "Theme.AppCompat.NoActionBar"
```

### 안드로이드 설치 후 세팅 (20180225일 19시)

```
File > Setting > Appearance & Behavior> System Settings
Reopen last project on startup

File > Setting > Editor > General > Auto Import

Add unabiguous imports on the fly
Optimize imports on the fly (for current project)

File > Settings > Tools > Emulator > Launch in a tool window 체크해제

```

### 안드로이드 상태바에 Notifications 보내기

```
https://mainia.tistory.com/1143
https://episode1.tistory.com/entry/6-%EC%95%88%EB%93%9C%EB%A1%9C%EC%9D%B4%EB%93%9C-Notification-%ED%99%9C%EC%9A%A9%ED%95%9C-%EC%95%8C%EB%A6%BC%EB%B0%94-%EB%9D%84%EC%9A%B0%EA%B8%B0
```

### 안드로이드 json 파싱

```
http://turtle.azurewebsites.net/users
https://dpdpwl.tistory.com/23
```

### android에서 Navigation Drawer 사용하기

```
1. https://webnautes.tistory.com/1017
https://www.sitepoint.com/material-design-android-design-support-library/
https://github.com/sitepoint-editors/Design-Demo


http://kitesoft.tistory.com/61
http://androiddeveloper.tistory.com/55
https://www.youtube.com/watch?v=iNMtT8L7E5U
http://www.kmshack.kr/2017/01/%EB%94%94%EC%9E%90%EC%9D%B4%EB%84%88-%EC%97%86%EC%9D%B4-%EC%95%88%EB%93%9C%EB%A1%9C%EC%9D%B4%EB%93%9C-%EC%95%B1-%EB%94%94%EC%9E%90%EC%9D%B8%ED%95%98%EA%B8%B0/
https://www.inflearn.com/course/%EC%95%88%EB%93%9C%EB%A1%9C%EC%9D%B4%EB%93%9C-%EC%8A%A4%ED%8A%9C%EB%94%94%EC%98%A4-%EC%95%88%EB%93%9C%EB%A1%9C%EC%9D%B4%EB%93%9C-%EC%95%B1-%EB%A7%8C%EB%93%A4%EA%B8%B0/

```

### AOS, iOS 앱 경로

```
* AOS(Android)
https://play.google.com/store/apps/details?id=com.dki.spb_android
* iOS
https://itunes.apple.com/us/app/keynote/id1037272004?mt=8
```

### 안드로이드 리팩토링 방법 (dex2jar,jd-gui,apktool)

```
http://layers7.tistory.com/7?category=724470
```

### 폰갭 설치

```
https://build.phonegap.com/
```

### Error:Could not determine the class-path for interface com.android.builder.model.AndroidProject.

```
https://stackoverflow.com/questions/42777321/could-not-determine-the-class-path-for-interface-com-android-builder-model-andro/42994035
```

### No service of type Factory available in ProjectScopeServices. Open File

```
https://www.google.co.kr/search?rlz=1C1CHZL_koKR769KR769&ei=bfWXWu2fK8ej8AWP1avQBg&q=+No+service+of+type+Factory++available+in+ProjectScopeServices.+Open+File&oq=+No+service+of+type+Factory++available+in+ProjectScopeServices.+Open+File&gs_l=psy-ab.3..0.471387.471387.0.472298.1.1.0.0.0.0.143.143.0j1.1.0....0...1c.1.64.psy-ab..0.1.141....0.qGcrThDlueA


해결 방법
1. build.gradle
dependencies {
  classpath 'com.android.tools.build:gradle:2.3.2'
// classpath 'com.github.dcendents:android-maven-plugin:1.0'
}
// Top-level build file where you can add configuration options common to all sub-projects/modules.
buildscript {
  repositories {
       mavenCentral()
  }
  dependencies {
       classpath 'com.android.tools.build:gradle:0.12.2'
      classpath 'com.github.dcendents:android-maven-plugin:1.0'
}
}
task wrapper(type: Wrapper) {
  gradleVersion = '1.12'
}
2.gradle-wrapper.properties
distributionUrl=https\://services.gradle.org/distributions/gradle-3.3-all.zip
3. build.gradle(library)
apply plugin: 'com.android.library'
//apply plugin: 'android-maven'

```

### android webview chrome debugger

```js
1. PC에 USB 연결
2. chrome://inspect/#devices
3. 연결시 USB 디버깅 등 확인
```

### [ERROR] please retry with version 2021.2.1 or newer

Unrecognized Android Studio (or Android Support plugin for IntelliJ IDEA) version , please retry with version 20XX.X.X or newer.

File > Help > Check for Updates
<img width="800" src="https://raw.githubusercontent.com/oseongryu/til/refs/heads/main/public/img/android/001.png"/>
<img width="400" src="https://raw.githubusercontent.com/oseongryu/til/refs/heads/main/public/img/android/002.png"/>
<img width="600" src="https://raw.githubusercontent.com/oseongryu/til/refs/heads/main/public/img/android/003.png"/>

### android jetpack

https://developer.android.com/jetpack/androidx/explorer?hl=ko

### Android Decompile

```
http://woowabros.github.io/experience/2017/07/17/resume.html

https://dwfox.tistory.com/43

http://gyuha.tistory.com/491

http://goodtogreate.tistory.com/entry/APK-%EB%B0%94%EC%9D%B4%EB%84%88%EB%A6%AC-%EC%88%98%EC%A0%95%ED%9B%84-%EB%A6%AC%ED%8C%A8%ED%82%A4%EC%A7%95repack

http://layers7.tistory.com/7?category=724470

https://m.blog.naver.com/PostView.nhn?blogId=coogi21c&logNo=220990437650&categoryNo=0&proxyReferer=https%3A%2F%2Fwww.google.co.kr%2F
```

## Android build

### Clean Project

<img width="400" src="https://raw.githubusercontent.com/oseongryu/til/refs/heads/main/public/img/android/build/001.png"/>

### Build Variants

<img width="400" src="https://raw.githubusercontent.com/oseongryu/til/refs/heads/main/public/img/android/build/002.png"/>

### Android icon

    1. https://www.appicon.co/
    2. android/app/src/main/res 기본 아이콘 경로로 변경

    1.  res - New - Image Asset
    2.  manifest.xml application icon과 roundIcon 변경

### Android decompile

```
1. Dex2Jar
apk이미지를 jar파일로 변환해 줍니다.

URL : http://sourceforge.net/projects/dex2jar
Download : http://sourceforge.net/projects/dex2jar/files
2. jd-gui
jar 파일의 내용(소스코드)보여 주는 툴

URL : https://github.com/pxb1988/dex2jar
Download : https://github.com/java-decompiler/jd-gui/releases
3. Apk Studio
안드로이 리소스를 쉽게 풀어 줍니다.

URL : http://www.vaibhavpandey.com/apkstudio/
Download : https://bintray.com/vaibhavpandeyvpz/generic/apkstudio/view


dex2jar.zip 파일의 압축을 풀고, cmd 에서 아래와 같이 실행하면 됩니다.

d2j-dex2jar.bat -f -o [파일명].jar [APK 파일명].apk

facebook apk를 예제로 풀어 보면, 아래와 같습니다.

d2j-dex2jar.bat -f -o sample.jar com.chbreeze.jikbang4a.apk

jar의 내용 보기 : jd-gui
jd-gui를 실행해서 파일 열기위로 위에서 변환했던 jar 선택하면, 소스를 볼 수 있습니다.

apk-studio로 실행해서 보시면 됩니다.
안드로이드 아이콘으로 apk 파일을 선택하시면, 안에 있는 파일을 풀고 조회가 가능 합니다.
```

C:\DEV\tools\dex2jar-2.0\d2j-dex2jar.bat -f -o C:\DEV\tools\dex2jar-2.0\test.jar C:\DEV\tools\dex2jar-2.0\test.apk

apktool d C:\Users\f5074\Downloads\tester.apk

C:\Users\f5074\AppData\Local\apktool\framework\

### avd 장치 실행 안됨

```bash
# 변경전
hw.gpu.enabled=yes
hw.gpu.mode=auto
# 변경후
hw.gpu.enabled=no
hw.gpu.mode=off
```

### debugging

```bash
# 1. 폰 연결, CMD 실행
# 2. 앱의 PID 확인
adb shell ps | grep 패키지명
# 3. 로그캣 실행
adb logcat --pid=패키지PID

filddler 활용해서 api 호출 확인
```
