### Project Java version 변경

    Project Structure창 (단축키 : SHIFT+CTRL+ALT+S)
    * Project
    1) SDK 변경                      
    2) Language Level 변경
    * Module
    3) Language Level 변경
    * SDKs
    4) 원하는 JDK를 선택한다(JDK는 한 폴더에 모아두는것을 추천!)

    Project Setting (단축키 : CTRL+ALT+S)
    * Build,Execution,Deployment  -> Build Tools -> Gradle
    5) Gradle JVM 변경
    * Build,Execution,Deployment  -> Compiler -> Java Compiler
    6) Project bytecode version 변경  


### Java SDK 설정
    File > Project Structure 선택

    Project Settings > Project > SDK 클릭 > Add SDK


### 한글깨짐
    Console에서 한글이 깨지는 경우
    Ctrl + Shift + A 단축키 입력 후
    Edit custom VM 입력 후 선택
    -Dfile.encoding=UTF-8 입력후 저장
    IntelliJ 재실행
    * 설치시 Edit Custom VM Options 경로
    C:\Users\{user}\AppData\Roaming\JetBrains\IdeaIC2022.1\idea64.exe.vmoptions


### 한글Encoding 설정
    CTRL + ALT + S 로 IntelliJ Settings 메뉴 호출

    Editor > File Encodings 로 이동

    Global Encoding: UTF-8
    Project Encoding: UTF-8
    Default encoding for properties files: UTF-8 (.properties 파일)
    Transparent native-to-ascii conversion 체크

### Terminal (cmd to git bash)
    File > Settings > Tools > Terminal

    Application Settings > Shell path > 변경후 > OK > IntelliJ 재시작

    변경전 : powershell.exe 
    변경후 : "C:\Program Files\Git\bin\sh.exe" -login -i

### Inlay Hints
    File > Settings > Editor > Inlay Hints > Code vision 체크 해제

### Line Number, Whitespce

    File > Settings > Editor > General > Appearance
    Show line numbers(check)
    Show whitespaces(check)

### Font SizeLine Number

    File > Settings > Editor > General > Change font size with Ctrl + Mouse Wheel (Check)


### jdbc drivers location
    C:\Users\${user}\AppData\Roaming\JetBrains\IntelliJIdea2022.1\jdbc-drivers\Oracle

### plugin Database Navigator

    File > Settings > Plugins > Database Navigator


### mapper 구현체로 이동
    ctrl + alt + b

### 구현체 제외 
    검색시 ctrl + shift + n 사용 (모두를 할경우 전부 나옴)
    https://open-markethq.slack.com/archives/D046SBS6MDZ/p1671686662885729