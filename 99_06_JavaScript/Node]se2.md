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

### references
https://www.twilio.com/blog/2017/08/http-requests-in-node-js.html
https://velog.io/@mingtorr/node.js-%EC%97%90%EC%84%9C-api%EC%9A%94%EC%B2%AD%ED%95%98%EA%B8%B0

