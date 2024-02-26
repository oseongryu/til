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


### spring file download
```js
$(function () {

    $("#btnTest").bind("click", function () {
        alert('7');
        searchDashboard()
    });

    var searchDashboard = function () {
        $.ajax({
            url: "<c:url value='/rest/file-attach.do'/>"
            , type: "post"
            , contentType: 'application/json;charset=utf-8'
            , dataType: "json"
            , data: JSON.stringify({
                "fileId": 'aaaa',
                "fileNo": '1',
                "attachmentFileName": '',
                "attach": '1',
                "fileGrpId": 'default-file-group'
            })
            , complete: function(response){
                let link=document.createElement('a');
                link.href= JSON.parse(response.responseText).responseText
                link.download = JSON.parse(response.responseText).fileName;
                debugger
                link.click();
                
/* 					
                let link=document.createElement('a');
                const mimeType = "application/pdf";
                link.href=`data:${mimeType};base64,${base64Str}`;
                link.download="myFileName.pdf";
                link.click(); */
            }
            , exception: function (responses) {
                alert(responses.message);
            }
        });
    };

});
```

### image preview
```js
$.ajax({
    url : "<c:url value='/rest/file-attach.do'/>"
    ,type : "post"
    , contentType: "application/json; charset=UTF-8"
    , dataType: "json"
    , async: true
    , data: JSON.stringify({
        "fileId": FILE_ID,
        "fileNo": '1',
        "attachmentFileName": '',
        "attach": '1',
        "fileGrpId": 'default-file-group'
    })
    , complete : function(response) {	
        debugger
        $(ID).append(
                $("<div class='image-item'></div>")
                        .append($("<div />").html(""))
                        .append($("<image class='product-image' />").attr("src", JSON.parse(response.responseText).responseText))
        );
    }
    ,exception : function(response) {
        alert(response.message);
    }
});
```

<security:intercept-url pattern="/rest/**" filters="none"/>        <!-- | 파트너사 첨부파일 | 2022-12-16 | -->