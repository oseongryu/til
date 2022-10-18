## API Gateway


## Lambda


{ 
    "TableName": "dev",
    "Item": {
        "date": {
            "S": "$context.requestTime.substring(0,11)"
        },
        "epoch_uuid": {
            "S": "$context.requestTimeEpoch,$context.requestId"
        },
        "details": {
            "S": "$util.base64Encode("$input.body")"
        },
        "epoch": {
            "S": "$context.requestTimeEpoch"
        }
    }
}

## CloudWatch 로그 역할 ARN


## References

https://labs.brandi.co.kr/2018/07/31/kwakjs.html