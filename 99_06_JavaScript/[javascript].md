### web에서 해당 pc의 exe 실행

regedit

1. HIKEY_CLASSES_ROOT > 우클릭 > 새로만들기 > 키 추가(selenium_start)

2. 생성한 키(selenium_start) 우클릭 > 새로만들기 > 문자열 값 추가(URL protocol)

3. 하위 키 생성 selenium_start-shell-open-command 하위 키 추가


4. 생성한 하위 키(command)의 (기본값) 문자열 값 수정 "C:\Users\osryu\fredit-selenium\1-fredit-order.exe" "%1"

5. html에서 호출 방법
```js
<a href="selenium_start://">실행</a>
```
### references
https://haenny.tistory.com/267


20230728077480
