Node.js + oracle  https://m.blog.naver.com/scw0531/221169287236
https://forest71.tistory.com/94

https://brunch.co.kr/@adrenalinee31/1

## json html 파싱
http://www.nextree.co.kr/p10091/


### jquery
```js
<img id='test' width=200 height=200 />
<a href="#" id="btnTest">click</a>

$(function () {
    $("#btnTest").bind("click", function () {
        search()
    });

    var search = function () {
        $.ajax({
            url: "<c:url value='/biz/rest/image-preview.do'/>"
            , type: "post"
            , contentType: "application/json; charset=UTF-8"
            , dataType: "json"
            , async: true
            , data: JSON.stringify({
                "fileId": 'aaaaa',
                "fileGrpId": 'file-group'
            })
            , success: function (response) {
                $("#test").attr("src", response);
            }
            , exception: function (response) {
                alert(response.message);
            }
        });
    };

});

```

```java
@RequestMapping(value = { "image-preview" }, method = RequestMethod.POST)
@ResponseBody
public ResponseEntity<String> partnerImagePreview( @RequestBody Map<String, Object> paramMap) throws IOException {
    String url  = "";
    String querySring =  UriComponentsBuilder.newInstance()
                            .queryParam("fileId", paramMap.get("fileId"))
                            .queryParam("fileGrpId", paramMap.get("attach"))
                            .build()
                            .toUri()
                            .getQuery();
    String result = restAPI(url + "?" + querySring);
    return new ResponseEntity<String>(result, new HttpHeaders(), HttpStatus.OK);
}

```