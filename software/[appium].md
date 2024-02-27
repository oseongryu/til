## Setup
```
1) JDK(Java Development Kit)
2) Android SDK
3) Node.js
4) Appium
5) Appium-Client
```

## Init
```bash
npm install -g appium
npm install appium-doctor -g

appium --version
appium driver install uiautomator2
appium driver list --installed


# appium --version 에서 2.0.0 이상이 아닌경우
npm install -g appium@2.0.0
```

## Appium 설치
```
http://appium.io/docs/en/2.1/
https://github.com/appium/appium-desktop/releases/tag/v1.22.3-4

```

```
npm ls -g
npm list -global --depth=0
```

## Appium Desktop
```
https://github.com/appium/appium-desktop/releases/tag/v1.22.0
```

## Appium 
```bash
adb list
adb tcpip 5555
adb connect 192.168.0.1:5555

# adb devices
# adb tcpip 5555
# adb connect 192.168.92.132:5555


@echo off
title adb connect without usb
set port=5555
echo.
echo   adb connect without usb by Mir(whdghks913)
echo.
echo   Connect your Android device and adb host computer to a common Wi-Fi network accessible to both.
echo   Waiting for device, Connect the device to the host computer with a usb
echo.
adb kill-server
adb wait-for-device
adb tcpip %port%
echo.
echo   Disconnect the USB cable from the target device.
echo   Find the IP address of the Android device, and Enter the IP address
echo.
set /P ip=  Your IP : 
adb connect %ip%:%port%
timeout /t 1
echo.
adb devices
pause

```

### 
```
appium-doctor --android
cd C:\Users\osryu\AppData\Local\Android\Sdk\tools\bin
sdkmanager --list
cd C:\Users\osryu\AppData\Local\Android\Sdk\emulator
emulator -avd Pixel_6_API_30 -netdelay none -netspeed full

cd C:\Users\osryu\.android\avd
```

### appium server cli 

```
appium -p 4723
appium -p 4723 --allow-insecure chromedriver_autodownload

self.appium_service = AppiumService()
self.appium_service.start(args=['--address', '0.0.0.0', '-p', '4724', '--base-path', '/wd/hub'])
```

## references
https://life-with-coding.tistory.com/474
https://m.blog.naver.com/centerho/222662010896
