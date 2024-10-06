### eclipse shortcut
```
ctrl + d 한줄 삭제
ctrl shift f 전체정렬
ctrl i    한줄정렬
ctrl z 앞으로
ctrl y 뒤로
ctrl shift o 자동임포트

```

### eclipse line number, show whitespace
```

1. Windows > Preferences > General > Editors > Text Editors
Show line numbers (Check)

2. 1. Windows > Preferences > General > Editors > Text Editors
Show whitespace characters (Check)
```


### Eclipse using external Editor

```

1. Windows > Preferences > General > Workspace
Refresh using native hooks or polling (checked)

2. Windows > Preferences > General > Editor > File Associations
File types click > Add Associated editors & Default

```

### Setting 

```
1. Maven > User Settings  
   C:\DEV\m2\settings.xml

2. Server > Runtime Environment > Add
   C:\DEV\tomcat

3. Java > Installed JREs

4. General > Content Types > Text
   Default encoding: UTF-8 > Update

5. General > Workspace
   Text file encoding: UTF-8

6. Validation

- Manual / Build disabled
  HTML Syntax Validator
  JAXB Validator
  JPA Validator
  JSF Application Configuration Validator
  JSF View Validator
  JSP Content Validator
  JSP Syntax Validator

- Build disabled
  XML Schema Validator
  XML Validator
  XSL Validator

6. Java > Compiler
   Compiler compliance level 1.7
   Use default compliance settings Check

7. Team > Git > Configuration > Add Entry
   user.email
   user.name
```

### eclipse init
```
\.metadata\.plugins\org.eclipse.core.runtime\.settings 하위 파일 전체 삭제
```


### References
```
http://success206.tistory.com/entry/%EC%9D%B4%ED%81%B4%EB%A6%BD%EC%8A%A4Eclipse-%ED%95%9C%EA%B8%80-%EA%B9%A8%EC%A7%90-%ED%98%84%EC%83%81
```


### tomcat server SSL
```xml
<!-- 추가2 -->
	
   <Connector SSLEnabled="true" URIEncoding="UTF-8" clientAuth="false" keystoreFile="C:\.keystore\keyFile_Wildcard.test.co.kr.keystore"
    			   keystorePass="test1234" keystoreType="jks" 
               maxThreads="100" port="443" scheme="https" secure="true" sslProtocol="TLS"/>

   <Connector SSLEnabled="true" URIEncoding="UTF-8" clientAuth="false" keystoreFile="C:\cert\sslkeystore" 
               keystorePass="test1234" keystoreType="pkcs12" 
               maxThreads="100" port="443" scheme="https" secure="true" sslProtocol="TLS"/>
<!-- 변경1 -->

    <Connector port="8080" protocol="HTTP/1.1" 
               connectionTimeout="20000" 
               redirectPort="8443" />


    <Connector port="8080" protocol="HTTP/1.1"
               connectionTimeout="20000" 
               redirectPort="8443"
               URIEncoding="UTF-8" 
               useBodyEncoingForURI="ture" />


<!-- 추가1 (필요없을수 있음)-->
      <Host name="localhost"  appBase="webapps"
            unpackWARs="true" autoDeploy="true"
            xmlValidation="false" xmlNamespaceAware="false">
        <!-- SingleSignOn valve, share authentication between web applications
             Documentation at: /docs/config/valve.html -->
        <!--
        <Valve className="org.apache.catalina.authenticator.SingleSignOn" />
        -->

        <!-- Access log processes all example.
             Documentation at: /docs/config/valve.html -->
        <!--
        <Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs"  
               prefix="localhost_access_log." suffix=".txt" pattern="common" resolveHosts="false"/>
        -->
         <!-- <Context docBase="FrontMobile" path="/" reloadable="true" source="org.eclipse.jst.jee.server:FrontMobile"/></Host>  -->
         <Context docBase="FrontMobile" path="/FrontMobile" reloadable="false" source="org.eclipse.jst.jee.server:FrontMobile"/>
      </Host>


```