::::::::::::::::::::::::::::::::::::::::::::::::::
:: @echo off - 불필요한 출력문 비활성화
:: color 3 - 배경화면 검은색, 글자색 파란색
:: title Change Auto IP to Static IP - 프로그램 이름
:: mode con cols=50 lines=15 - 콘솔창 크기 변경
::::::::::::::::::::::::::::::::::::::::::::::::::
@echo off
color 3
title Change Auto IP to Static IP
mode con cols=50 lines=15

::::::::::::::::::::::::::::::::::::::::::::::::::
:: :Main - Main 함수
:: cls - 출력화면 클리어
:: echo - 출력문 
:: set /p no=Select Auto or Static IP - no 변수에 키입력
:: if "%no%"=="1" goto SetAutoIp - 1번 선택 시, SetAutoIp 함수 실행
:: if "%no%"=="2" goto SetStaticIp - 2번 선택 시, SetStaticIp 함수 실행
::::::::::::::::::::::::::::::::::::::::::::::::::
:Main
cls
echo.
echo ********************
echo *                  *
echo *   1. Auto IP     *
echo *                  *
echo *   2. Static IP   *
echo *                  *
echo ********************
echo.
set /p no=Select Auto or Static IP - 
if "%no%"=="1" goto SetAutoIp
if "%no%"=="2" goto SetStaticIp

::::::::::::::::::::::::::::::::::::::::::::::::::
:: :SetAutoIp - SetAutoIp 함수
:: netsh -c int ip set address name="Wi-Fi" source=dhcp - Wi-Fi 속성, 자동으로 IP 주소 받기 선택
:: netsh -c int ip set dns name="Wi-Fi" source=dhcp - Wi-Fi 속성, 자동으로 DNS 서버 주소 받기 선택
::::::::::::::::::::::::::::::::::::::::::::::::::
:SetAutoIp
netsh -c int ip set address name="Wi-Fi" source=dhcp
netsh -c int ip set dns name="Wi-Fi" source=dhcp
goto Result

::::::::::::::::::::::::::::::::::::::::::::::::::
:: :SetStaticIp - SetStaticIp 함수
:: netsh -c int ip set address name="Wi-Fi" source=static addr=192.168.0.1 mask=255.255.255.0 gateway=192.168.0.2 gwmetric=0
:: - Wi-Fi 속성, 수동으로 IP 주소 받기 선택, IP주소, 서브넷 마스크, 기본게이트웨이 설정
::
:: netsh -c int ip set dns name="Wi-Fi" source=static addr=192.168.0.3 register=PRIMARY
:: - Wi-Fi 속성, 수동으로 DNS 주소 받기 선택, 기본 설정 DNS 서버
::
:: netsh -c int ip add dns name="Wi-Fi" addr=192.168.0.4 index=2
:: - Wi-Fi 속성, 수동으로 DNS 주소 받기 선택, 보조 DNS 서버
::::::::::::::::::::::::::::::::::::::::::::::::::
:SetStaticIp
netsh -c int ip set address name="Wi-Fi" source=static addr=192.168.0.1 mask=255.255.255.0 gateway=192.168.0.254 gwmetric=0
netsh -c int ip set dns name="Wi-Fi" source=static addr=192.168.0.1 register=PRIMARY
goto Result

::::::::::::::::::::::::::::::::::::::::::::::::::
:: :Result - Result 함수
:: pause > nul - 프로그램 흐름 멈춤, 키 입력 시 해제
::::::::::::::::::::::::::::::::::::::::::::::::::
:Result
cls
echo.
echo **********************************************
echo *                                            *
echo *   Setting is Completed.                    *
echo *                                            *
echo *   If you want to go mian, press any key.   *
echo *                                            *
echo **********************************************
echo.
pause > nul
goto Main
