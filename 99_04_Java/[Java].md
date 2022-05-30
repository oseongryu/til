###
```
자바프로그램 만들어서 jar파일로 배포하고 실행할떄 unable to access jarfile 오류
- java -jar Test.jar 로 실행
- 자바디컴파일러 프로그램으로 runable jar와 일반 jar 파일 비교해보기
JAR 실행 한 후 cmd를 화면 숨기기
https://code.i-harness.com/ko-kr/q/409ef
start javaw 
감사모드
```




# 톰캣 설치 에러
```
로컬 컴퓨터의 apache tomcat 7.0 tomcat7을 시작하지 못했습니다
Apache Tomcat 8.0 Tomcat8 서비스가 서비스 특정 오류
잘못된 기능입니다. 때문에 종료되었습니다.
msvcr71을 해도 안됨 아마도 32비트 톰캣을 64비트로 변경해서 된듯
```




### 전자정부프레임워크-나만의 프레임워크 만들기
```
1.개발환경 다운로드  https://www.egovframe.go.kr/EgovDevEnvRelease_300.jsp?menu=3&submenu=2&leftsub=2#
2.세미나 관련 자료  https://open.egovframe.org/oc/docs/pds.do
3.
smart sheet4(WBS용 유료 )
4.통합IDE 
```



### 자바 UI로 삭제버튼 만들때 :No enclosing instance of type ... is accessible.
```
The method actionPerformed(ActionEvent) of type DeleteButton must override a superclass method
https://jamong-icetea.tistory.com/65
```

### JAD 사용방법
```
#### jad 사용방법 https://javacpro.tistory.com/23

#### jad 다운로드 https://varaneckas.com/jad/

#### jar 로 묶인파일 수정하기
https://m.blog.naver.com/PostView.nhn?blogId=hero108&logNo=220425280196&proxyReferer=https%3A%2F%2Fwww.google.com%2F

jar -uvf test.jar ./ObjectCache.class
jar -uvf test.jar ./ObjectCache$ExtendedFieldInfo.class

jar -uvf0 test.jar ./ObjectCache.class
jar -uvf0 test.jar ./ObjectCache$ExtendedFieldInfo.class


jar cvf ac.jar -u C:\Test

jar cvf abc.jar -c C:\Users\Test

jar cvf abc.jar -C C:\Users\Test

jar xvf test.jar

jar cvfm abcd.jar META-INF/MANIFEST.MF -C foo/ .

https://priceless.tistory.com/203

1. 해당 jar파일이 있는 곳으로 도스 프롬프트를 이동

2.  jar -uvf "기존의 Jar명" 교체될 클래스

jar -uvf test-V2.1.jar /bin/com/itcomm/itsfw/core/ObjectCache.class

3. 이때 패키지내의 교체될 클래스의 위치를 지정해주고  교체될 클래스 파일은 해당 경로에 존재해야 한다.

jar -uvf test.jar 
jar -uvf test.jar .\core\database\ObjectCache.class
jar -uvf test.jar ./core/ObjectCache.class
jar -uvf test.jar ./database/ObjectCache.class

jar 파일 압축하기 풀기 옵션 http://blog.naver.com/PostView.nhn?blogId=gwang39&logNo=221007458092
jar 파일에 특정파일을 업데이트 하기 https://priceless.tistory.com/203
```

### JSP Setting
```
VMWare 설치 
https://www.vmware.com/products/workstation-player/workstation-player-evaluation.html

CentOS 설치
https://www.centos.org/download/


1.자바프로젝트
-패키지만들기
-syso 으로 출력
-클래스만들고 get,set  만듬

https://dev.mysql.com/downloads/connector/j/

톰캣설치폴더\lib에 저장해야 connectior/j의 경로를 (이클립스의) CLASSPATH 환경변수에 추가하는 것
```

### JSP
```
1. 웹서버 작동원리
-톰캣 자바환경변수설정
-톰캣실행
-포트설명,conf/server.xml 웹서버 포트 80으로 변경
-web.xml index.html 시작페이지설정

C:\Temp\tomcat\conf
-server.xml > 8080 포트 80으로 변경
-web.xml > 시작페이지를 index2.html 변경


2. 웹사이트만들기
-웹프로젝트생성
-html <a> <hr>
-배포방법 export> war파일로 만들기
-톰캣에배포 ROOT파일로 변경
```

### API, SDK
```
http://skmagic.tistory.com/220
```