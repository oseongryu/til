### SpringBoot JPA

#### SpringBoot 설정

1. spring initalizr
- https://start.spring.io/

- 설정 후 GENERATE 클릭

2. IntelliJ IDE애서 다운받은 폴더를 실행

3. Run > Edit Configurations > +버튼 > Gradle > Run에 bootRun 입력 후 OK

3. Run > Run 'spring' 실행 후 WebBrowser에서 localhost:8080/ 에 접속

#### Spring restTemplate UrlEncoding
```java

String url = CommonUtils.relayURL(apiUrl, initRequestParameters(map));
ResponseEntity<String> result = restTemplate.getForEntity(url, String.class);

// String Type으로 선언한 Url을 URI Object로 선언 시 별도의 인코딩 처리가 발생하지 않음 
String url = CommonUtils.relayURL(apiUrl, initRequestParameters(map));
ResponseEntity<String> result = restTemplate.getForEntity(new URI(url), String.class);
```