@echo off
SETLOCAL enableextensions enabledelayedexpansion

set SETTING_PATH=%HOMEDRIVE%%HOMEPATH%\setting_files
@REM mkdir "%SETTING_PATH%"

SET varsourcepath=
FOR /f "tokens=*" %%g IN ('chdir') do (SET varsourcepath=%%g)

SET varsettingpath=%SETTING_PATH%\%1

SET varfilenamelist=
FOR /f %%i IN ('git diff --name-only') DO (
    SET varfilenamelist=!varfilenamelist! %%i
)

echo %varsourcepath%
echo %varsettingpath%
echo %varfilenamelist%


for %%c in (%varfilenamelist%) do (
    echo mkdir %SETTING_PATH%\%1\%%c
    echo %varsourcepath%
    @REM cd %varsettingpath%

    @REM For %%_ In (%varsourcepath%) DO (
    @REM     echo %%_
    @REM )
    @REM mkdir "%SETTING_PATH%\%1\%%c"
)

@REM set "str=C:;Users;osryu;setting_files;temp;src;main;resources-local;db.properties"
@REM set "str=C:\Users\osryu\setting_files\temp\src\main\resources-local\db.properties"

set "filefullpath=C:\Users\osryu/setting_files\temp\src\main\resources-local\db.properties"

set filefullpath=%filefullpath:\=/%
set filefullpath=%filefullpath:/=;% 
echo %filefullpath%

set beforex=0
For %%a In (%filefullpath%) DO (
    set /a beforex+=1
    set "var!beforex!=%%a"
    @REM echo %%a
    @REM FOR /f "tokens=*" %%g IN (%%a) do (SET str1=%%g)
    @REM set str1="C:\Users\osryu/setting_files\temp\src\main\resources-local\db.properties"
    @REM if not x%str1:properties=%==x%str1% echo It contains bcd
    @REM echo %beforex%
    @REM echo %%a
)
set /a beforex-=1

echo %filefullpath%
set afterx=0
set filepath=
set Arr[0]=a 
set Arr[1]=b 
set Arr[2]=c 
set Arr[3]=d 

:afterloop
For %%b In (%filefullpath%) DO (
    set /a afterx+=1
    set "var!afterx!=%%b"
    if %afterx%==0 (set Arr[0]=%%b)
    if %afterx%==1 (set Arr[1]=%%b)
    if %afterx%==2 (set Arr[2]=%%b)
    if %afterx%==3 (set Arr[3]=%%b)

    @REM set "filepath!afterx!=%%b"
    @REM echo %%b
    @REM set filepath=%filepath%%%b
    @REM echo %%filefullpath[1]%%
    @REM set "var!afterx!=%%b"
    @REM echo %%b
    @REM set /a filepath+=1
    @REM set filepath=%%a
    @REM set filepath=%filepath%%%b
    if "%beforex%"=="%afterx%" (
        echo ---
        @REM echo %%a
        @REM set /a afterx+=1
        @REM set filepath=%%a
        GOTO :stoploop
    )
    GOTO :afterloop
)
:stoploop
@REM echo %afterx%
echo %filepath%


@REM set str1=%filefullpath%
@REM if not x%str1:.properties=%==x%str1% echo It contains bcd

@REM endlocal


@REM FOR /f %%i IN ('git diff --name-only') DO (
@REM     SET varfilenamelist=!varfilenamelist! %%i
@REM )



@echo off 
@REM set Arr[0]=a 
@REM set Arr[1]=b 
@REM set Arr[2]=c 
@REM set Arr[3]=d 
set "x=0" 
:SymLoop 

if defined Arr[%x%] ( 
   call echo %%Arr[%x%]%% 
   set /a "x+=1"
   GOTO :SymLoop 
)
echo "The length of the array is" %x%



@REM set afterx=0
@REM For %%a In (%filefullpath%) DO (
@REM   set /a afterx+=1
@REM   set "var!afterx!=%%a"
  
@REM   if %afterx% == 8 (
@REM     echo %afterx%
@REM   )
@REM @REM   echo %%a
@REM )
@REM echo %afterx%



@REM varsourcepath="%SETTING_PATH%"
@REM varsettingpath=$SETTING_PATH

@REM if %1 != "" (
@REM     echo "" 
@REM     set 
@REM ) else if %score% GEQ 80 (
@REM echo "Lank:B" 
@REM ) else if %score% GEQ 70 (
@REM echo "Lank:C " 
@REM ) else if %score% GEQ 60 (
@REM echo "Lank:D" 
@REM ) else ( echo "Lank:F" 


@REM set str=test test needs
@REM echo %str% 

@REM set str=%str:needs=has% 
@REM echo %str%


ENDLOCAL



@REM @echo off
@REM setlocal enabledelayedexpansion
@REM set myvar=the list:
@REM for /r %%i In (*.properties) DO set myvar=!myvar! %%i,
@REM echo %myvar%