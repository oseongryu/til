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

### tomcat manager

```
The page you tried to access (/manager/loginPw) does not exist.
The Manager application has been re-structured for Tomcat 7 onwards and some of URLs have changed. All URLs used to access the Manager application should now start with one of the following options:
/manager/html for the HTML GUI
/manager/text for the text interface
/manager/jmxproxy for the JMX proxy
/manager/status for the status pages
Note that the URL for the text interface has changed from "/manager" to "/manager/text".
You probably need to adjust the URL you are using to access the Manager application. However, there is always a chance you have found a bug in the Manager application. If you are sure you have found a bug, and that the bug has not already been reported, please report it to the Apache Tomcat team.

https://stackoverflow.com/questions/36462764/accessing-tomcat-manager-throws-404
https://okky.kr/article/441163
```

### CompletableFuture
```java
CompletableFuture.runAsync -> {

CompletableFuture<Map<String, String>> future = CompletableFuture.supplyAsync(() -> {

// https://umanking.github.io/2020/10/15/java-completable-future/
```

### spring context-security.xml
```
<security:intercept-url pattern="/api/test/**" filters="none"/>

```

### eclipse tomcat build 위치
```
\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\{appName}
```

### byte to image

```java
	@SuppressWarnings("unchecked")
	private String restAPI(String url) {
		
		UriComponents uriComponents = UriComponentsBuilder.fromUriString(url).build();

		String changeString = "";
		try {
			HttpHeaders headers = new HttpHeaders();
	    	headers.setContentType(MediaType.APPLICATION_JSON);
	    	RestTemplate restTemplate = new RestTemplate();
	    	ResponseEntity<byte[]> response = restTemplate.getForEntity(url,  byte[].class);
	    	HttpHeaders httpHeaders = response.getHeaders();
	    	String fileName = httpHeaders.get("Content-Disposition").get(0);
	    	String orgFileName = fileName.replace("attachement;filename=", "");
	    	MediaType contentType = httpHeaders.getContentType();
	    	byte[] body = response.getBody();

	    	
	    	Path data = Files.write(Paths.get(orgFileName), body);
	    	

	    	
	        FileInputStream fis = new FileInputStream(data.toFile().getAbsolutePath());
	        try {
				try (ByteArrayOutputStream byteOutStream = new ByteArrayOutputStream()) {
					int len = 0;
					byte[] buf = new byte[1024];
					while ((len = fis.read(buf)) != -1) {
						byteOutStream.write(buf, 0, len);
					}
					byte[] fileArray = byteOutStream.toByteArray();
					String imageString = new String(Base64.encodeBase64(fileArray));
					changeString = "data:"+contentType+";base64," + imageString;
				}
			} catch (Exception e) {
			} finally {
				fis.close();
			}

		} catch(Exception e) {
			logger.error("Error : " + uriComponents.toString() + "Message - [" + e + "]");
		}
		return changeString;
	}
```

### spring message convert
```
메시지 컨버터를 별도로 선언하지 않으면 Spring 에서 등록하는 디폴트 메시지 컨버터는 다음과 같다.

ByteArrayHttpMessageConverter
, StringHttpMessageConverter
, FormHttpMessageConverter
, SourceHttpMessageConverter

https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=moonv11&logNo=220139179955
```

### Current request is not of type [org.springframework.web.multipart.MultipartHttpServletRequest]
```java
// 해결
MultipartHttpServletRequest => HttpServletRequest로 변경해서 처리

((HeaderWriterFilter.HeaderWriterRequest) ((HttpServlet3RequestFactory.Servlet3SecurityContextHolderAwareRequestWrapper) document).request).getHeaders("Content-Length")

// 일반적인 방법
// 1. spring 설정에서 multipartResolver가 bean으로 주입이 되었는지,
// ex)<bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver"/>
// 
// 2. form에서 enctype이 multipart/form-data 으로 되었는지,
// ex)<form id="fileupload" method="post" enctype="multipart/form-data">
// 
// 3. Controller에서 Request 를 MultipartHttpServletRequest 로 받고 있는지 확인합니다.
// 올려주신 내용만으로는 해당오류의 원인을 파악하기 힘드나, 보통 form 태그에 enctype="multipart/form-data" 지정되지 않은 경우이거나, form tag가 여러 개 있는지, post로 호출하는 부분들을 재 점검해보시기 바랍니다.
// 아니면 함수의 파라미터로 MultipartHttpServetRequest를 넣지 않고 HttpServletRequest 객체로 받아 함수 안에서 캐스팅을 하는 형태로 처리해 보시기 바랍니다.


https://www.egovframe.go.kr/home/qainfo/qainfoRead.do?menuNo=69&qaId=QA_00000000000013994
```

```js
<form
  id="editor_upimage"
  name="editor_upimage"
  method="post"
  enctype="multipart/form-data"
  onSubmit="return false;"
>
  <div id="pop_content2">
    <input type="file" class="upload" id="uploadInputBox" name="Filedata" />
    <p class="dsc" id="info">
      <strong>10MB</strong>이하의 이미지 파일만 등록할 수 있습니다.
      <br />
      (JPG, GIF, PNG, BMP)
    </p>
  </div>
</form>


https://dalili.tistory.com/168
```

### inputstream to multifile
```java
			File file; 
            InputStream input = new FileInputStream(file);
            OutputStream os = fileItem.getOutputStream();
            IOUtils.copy(input, os);

//            String defaultPath = request.getSession().getServletContext().getRealPath("/");
//            String filePath = defaultPath + "img" + File.separator + "smarteditor2" + File.separator;
//            File file = new File(filePath);
//            if (!file.exists()) file.mkdirs();
//
//            String autoFileName = UUID.randomUUID().toString() + fileName.substring(fileName.lastIndexOf("."));
//            String rFileName = filePath + autoFileName;
//            InputStream is = request.getInputStream();
//            OutputStream os = new FileOutputStream(rFileName);
//            int num;
//            byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
//            HyFileUtils.copyInputStreamToFile(is, new File(filePath + fileName));
//            if (is != null) is.close();
//            os.flush();
//            os.close();

//            byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
//            while((num = is.read(b,0,b.length)) != -1){
//                os.write(b,0,num);
//            }
//            if(is != null) is.close();
//            os.flush();
//            os.close();


https://ksabs.tistory.com/152
https://dev.umejintan.com/9
```
### autowired 에러 관련
양쪽 @Component컴포넌트에서 서로에 @Autowired를 거는 경우 오류 발생가능 주의 (빌드에서는 문제가 없을 수 도 있음. 개발자들에게 주의주기!!)
또는 lazy를 거는형태로 사용

```
 Application run failed
org.springframework.beans.factory.BeanCurrentlyInCreationException: Error creating bean with name 'returnBsl':
 Bean with name 'returnBsl' has been injected into other beans [orderBsl] in its raw version as part of a circular reference, 
 but has eventually been wrapped. This means that said other beans do not use the final version of the bean. 
 This is often the result of over-eager type matching - consider using 'getBeanNamesOfType' with the 'allowEagerInit' flag turned off, for example
```


### substring

```java
public static String splitLength(String text, int length){
	int maxLength = length;
	int textLen = text.length();
	String resultText = "";
	if(textLen > length) {
		resultText = text.substring(0, maxLength);
	} else {
		resultText = text;
	}
	return resultText;
}

public static String relaxSubString(String src, int beginIndex, int endIndex) {
	if(DataUtils.isEmpty(src)) {
		return src;
	}
	if(src.length() < beginIndex) {
		return "";
	}
	if(src.length() < endIndex) {
		return src.substring(beginIndex, src.length());
	}
	return src.substring(beginIndex, endIndex);
}
```

### 
```java
import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;

public class Temp {

    public static void main(String[] args) throws Exception {
        System.out.println("Start");
        var zpl = "\u0010CT~~CD,~CC^~CT~\n" +
                "^XA\n" +
                "~TA000\n" +
                "~JSN\n" +
                "^LT0\n" +
                "^MNW\n" +
                "^MTD\n" +
                "^PON\n" +
                "^PMN\n" +
                "^LH0,0\n" +
                "^JMA\n" +
                "^PR6,6\n" +
                "~SD15\n" +
                "^JUS\n" +
                "^LRN\n" +
                "^CI27\n" +
                "^PA0,1,1,0\n" +
                "^XZ\n" +
                "^XA\n" +
                "^MMT\n" +
                "^PW799\n" +
                "^LL799\n" +
                "^LS0\n" +
                "^BY3,3,160^FT114,255^BCN,,Y,N\n" +
                "^FH\\^FD>;123456789012^FS\n" +
                "^FT151,376^A0N,28,28^FH\\^CI28^FDtest^FS^CI27\n" +
                "^FO0,0^GFA,6113,79900,100,:Z64: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:0293\n" +
                "^PQ3,0,1,Y\n" +
                "^XZ\n";
        for (int index = 0; index < 2; index++){
            // adjust print density (8dpmm), label width (4 inches), label height (6 inches), and label index (0) as necessary
            var uri = URI.create("http://api.labelary.com/v1/printers/6dpmm/labels/10x10/0/");
            var request = HttpRequest.newBuilder(uri)
                    .header("Accept", "application/pdf") // omit this line to get PNG images back
                    .POST(HttpRequest.BodyPublishers.ofString(zpl))
                    .build();
            var client = HttpClient.newHttpClient();
            var response = client.send(request, HttpResponse.BodyHandlers.ofByteArray());
            var body = response.body();

            if (response.statusCode() == 200) {
                System.out.println("Response");
                String pathName = "label" + index + ".pdf";
                var file = new File(pathName); // change file name for PNG images
                Files.write(file.toPath(), body);
            } else {
                var errorMessage = new String(body, StandardCharsets.UTF_8);
                System.out.println(errorMessage);
            }
            System.out.println("End");
        }
    }
}

```

### Date
```java
Date date = java.sql.Timestamp.valueOf(ordDate);
ordDateFormat.format(new Date()).substring(0,4);

Calendar pCal = Calendar.getInstance();
pCal.add(Calendar.YEAR, -1);
String pDate = ordDateFormat.format(pCal.getTime()).substring(0,4);

Calendar cCal = Calendar.getInstance();
String cDate = ordDateFormat.format(cCal.getTime()).substring(0,4);

Calendar nCal = Calendar.getInstance();
pCal.add(Calendar.YEAR, 1);
String nDate = ordDateFormat.format(nCal.getTime()).substring(0,4);
String orderDate = ordDateFormat.format(date);
```


## interceptor
```java
		if(url.toString().contains("validLoginToken") || url.toString().contains("appVersionCheck")){
			Enumeration<String> headerNames = request.getHeaderNames();
			Map<String, String> headersMap = new HashMap<>();
			while (headerNames.hasMoreElements()) {
				String headerName = headerNames.nextElement();
				String headerValue = request.getHeader(headerName);
				headersMap.put(headerName, headerValue);
			}
			for (Map.Entry<String, String> entry : headersMap.entrySet()) {
				System.out.println("Header Name: " + entry.getKey() + ", Value: " + entry.getValue());
			}
		}
```