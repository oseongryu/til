### node request
```bash
npm i --s request
```

```js
const options = {
    uri:'http://localhost:10021/rest', 
    method: 'GET',
    qs: {
        priority:'high',
    },
}
request(options, function (err, httpResponse, body) {
    //callback
    console.log('success')
    // console.dir(httpResponse)
    // console.dir(body)
    res.status(200).send('/file/downloadImg?sFileURL=1667983894625.png')

})

  
const options = {
    uri:'http://localhost:10021/api/image/upload', 
    method: 'POST',
}
request.post(options, function (err, httpResponse, body) {
    //callback
    console.log('success')
})
```
### json to img tag
```js
    function flatten(data) {
        var result = {};
        function recurse(cur, prop) {
            if (Object(cur) !== cur) {
                result[prop] = cur;
            } else if (Array.isArray(cur)) {
                for (var i = 0, l = cur.length; i < l; i++)
                    recurse(cur[i], prop ? prop + "." + i : "" + i);
                if (l == 0)
                    result[prop] = [];
            } else {
                var isEmpty = true;
                for (var p in cur) {
                    isEmpty = false;
                    recurse(cur[p], prop ? prop + "." + p : p);
                }
                if (isEmpty)
                    result[prop] = {};
            }
        }
        recurse(data, "");
        return result;
    }

    function replacer(key, value) {
        // console.log(typeof value)
        // console.log('key -> ' + key + "| value ->" + value);
        // console.log(key +"='" + value + "'")
        if (typeof value === "string") {
            jsonToTagString += key + "='" + value + "' "
            return undefined;
        }
        if (typeof value === "number") {
            jsonToTagString += key + "=" + value + " "
            return 1;
        }
        return value;
    }
    var jsonToTagString = ''
    var imgTags = {
        width: 600,
        // height: 400,
        hint: 'hint'
    }
    JSON.stringify(imgTags, replacer, ' ')
    console.log(jsonToTagString)

    var tagString = JSON.stringify(this.imgTags);
    var tempSplit = tagString.replace("{", "").replace("}","").split(',');
    var result = ""
    for (var index = 0; index < tempSplit.length; index++){
        var tagSplit = tempSplit[index].split(':');
        result += tagSplit[0].replaceAll("\"", "") + "=" + tagSplit[1].replaceAll("\"", "\'") + " "
    }
    console.log(result)
```




### references
https://www.twilio.com/blog/2017/08/http-requests-in-node-js.html
https://velog.io/@mingtorr/node.js-%EC%97%90%EC%84%9C-api%EC%9A%94%EC%B2%AD%ED%95%98%EA%B8%B0
https://minaminaworld.tistory.com/30


