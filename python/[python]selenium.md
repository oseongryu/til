https://beomi.github.io/2017/02/27/HowToMakeWebCrawler-With-Selenium/



https://beomi.github.io/2017/02/27/HowToMakeWebCrawler-With-Selenium/


http://sacko.tistory.com/15?category=643535


1. 파이썬 다운로드

2. 파이참 다운로드

3. 파이참 실행 후 File > Settings > Project > Project Interpreter

+ 버튼 누르고 2개 설치
selenium 웹 자동화 도구
beautifulsoup4


4. 크롬드라이버 다운로드

https://sites.google.com/a/chromium.org/chromedriver/downloads

chromedriver_win32.zip

C:\Users\lst\Desktop\chromedriver_win32\chromedriver.exe

C:\\Users\\lst\\Desktop\\chromedriver_win32\\chromedriver.exe



https://homoefficio.github.io/2015/09/23/Selenium-%EA%BF%80%ED%8C%81/

http://docs.seleniumhq.org/download/    >  Selenium IDE


https://github.com/login



*Selenium 경고창 생성시 해결방법
https://stackoverflow.com/questions/19003003/check-if-any-alert-exists-using-selenium-with-python



* 버추얼환경설정
pip install virtualenv

virtualenv z_venv

cd C:\Python\Python37\Scripts\z_venv\Scripts

activate.bat

# requirements.txt 내에 명시된 라이브러리들을 한 번에 설치하기
pip freeze > requirements.txt

pip install --requirement requirements.txt
# 혹은
pip install -r requirements.txt


*selenium 키인벤트

http://blog.naver.com/PostView.nhn?blogId=kkrdiamond77&logNo=221172749831&parentCategoryNo=&categoryNo=68&viewDate=&isShowPopularPosts=false&from=postView


*팬텀js
https://beomi.github.io/2017/09/28/HowToMakeWebCrawler-Headless-Chrome/
http://penguingoon.tistory.com/30

http://freeprog.tistory.com/41

https://junistory.blogspot.com/2017/08/phantomjs-casperjs.html

*팬텀js사용 submit
https://stackoverflow.com/questions/9246438/how-to-submit-a-form-using-phantomjs


##
```bash
cd ~
python -m venv venv
pip install -r requirements.txt

pip uninstall -r requirements.txt -y
```

### selenium using same session
```bash
 chrome://version
C:\Program Files\Google\Chrome\Application\chrome.exe --remote-debugging-port=9222
C:\Program Files\Google\Chrome\Application

chrome.exe --remote-debugging-port=9222 --user-data-dir="C:\DEV\tools\automation\was\chrome_profile"


C:\Program Files\Google\Chrome\Application\chrome.exe --remote-debugging-port=9222 --user-data-dir="C:\DEV\tools\automation\was\chrome_profile"


C:\Users\osryu\AppData\Local\Google\Chrome\User Data\Default

C:\DEV\tools\automation\was


cd C:\DEV\tools\automation\public
chromedriver.exe --remote-debugging-port=9515 --user-data-dir="C:\DEV\tools\automation\was\chrome_profile"

```

https://developers.google.com/youtube/v3/docs/search/list?hl=ko&apix_params=%7B%22part%22%3A%5B%22id%22%2C%22snippet%22%5D%2C%22q%22%3A%22BTS%22%2C%22regionCode%22%3A%22KR%22%2C%22prettyPrint%22%3Afalse%7D