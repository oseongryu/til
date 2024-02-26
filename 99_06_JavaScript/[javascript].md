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

#### 정규식
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/test

#### map using
https://yuddomack.tistory.com/entry/%EC%9E%90%EB%B0%94%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8-Array-map

```js
g_navigtaion_list.map(element => console.log(element.index));

g_navigtaion_list.map(function (idx, item) {console.log(idx);});
```
#### table td access

https://ngee.tistory.com/2377

```js
const table = document.getElementById('analysisTable');
console.log($table.rows.length); // 3, 행 갯수 출력
document.getElementById('analysisTable').rows[1]

$("#analysisTable").attr('rows')

$("#analysisTable").prop('rows')[1].cells[0]

$('tr:nth-child(1) td').each(function () {
    if ($(this).attr('colspan')) {
        colCount += +$(this).attr('colspan');
    } else {
        colCount++;
    }
});

$("#analysisTable").prop('rows')[1].cells[3].innerText
$("#analysisTable").prop('rows')[1].cells[3].innerHTML
```

#### How can I convert a DOM element to a jQuery element?

```js
var elm = document.createElement("div");
var jelm = $(elm);//convert to jQuery Element
var htmlElm = jelm[0];//convert to HTML Element

function convertHtmlToJQueryObject(html){
var htmlDOMObject = new DOMParser().parseFromString(html, "text/html");
return $(htmlDOMObject.documentElement);
```


#### js key event

https://www.daleseo.com/js-key-events/

#### js scorll to

https://mine-it-record.tistory.com/399

#### js mouse event

https://hianna.tistory.com/492

#### js jquery click

https://creativestudio.kr/1832

#### js cookie

https://ko.javascript.info/cookie


### references
https://haenny.tistory.com/267
https://iamaman.tistory.com/3928
