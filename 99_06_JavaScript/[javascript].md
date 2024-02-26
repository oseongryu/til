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

### json parsing
#### json depth level
https://stackoverflow.com/questions/16075664/how-to-get-the-total-depth-of-an-unknown-json-hierarchy

#### json parse
https://lakelouise.tistory.com/52

#### json data 파싱이 가능하지만 {}의 값까지 들어가야지 나옴
```js
var data = JSON.parse(result);
console.log(data.view)
console.log(JSON.stringify(data.view.user, [,'gaId']))
```

#### json data를 text값으로 parsing 하는 간단한 방법
```js
var data = JSON.parse(result);
console.log(data["request"]["location"])

var data = JSON.parse(result);
console.log(data["request"]["location"])

var text = "request."

const obj = JSON.parse(result, (key, value) => {console.log(key + ':' + value);});

console.log($(this).find('td:last').html())
```
### references
https://haenny.tistory.com/267
https://iamaman.tistory.com/3928
